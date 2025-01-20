@interface SpotlightGraph
- (BOOL)addItem:(id)a3 cancelBlock:(id)a4;
- (BOOL)addPerson:(id)a3 cancelBlock:(id)a4;
- (BOOL)analyzePeopleWithCancelBlock:(id)a3;
- (BOOL)available;
- (BOOL)clearWithCancelBlock:(id)a3;
- (BOOL)closeWithCancelBlock:(id)a3;
- (BOOL)commitWithCancelBlock:(id)a3;
- (BOOL)containsReference:(id)a3 personaIdentifier:(id)a4 protectionClass:(id)a5 domainIdentifier:(id)a6;
- (BOOL)deleteDomainIdentifier:(id)a3 cancelBlock:(id)a4;
- (BOOL)deleteDomainIdentifier:(id)a3 personaIdentifier:(id)a4 cancelBlock:(id)a5;
- (BOOL)deleteEntitiesWithCancelBlock:(id)a3;
- (BOOL)deletePeopleWithCancelBlock:(id)a3;
- (BOOL)deleteReferences:(id)a3 domainIdentifier:(id)a4 cancelBlock:(id)a5;
- (BOOL)deleteReferences:(id)a3 personaIdentifier:(id)a4 protectionClass:(id)a5 domainIdentifier:(id)a6 cancelBlock:(id)a7;
- (BOOL)enumeratePeopleUsingBlock:(id)a3;
- (BOOL)findAllContactInfoForNode:(id)a3 info:(id)a4 reference:(id)a5 foundUser:(BOOL *)a6;
- (BOOL)flushWithCancelBlock:(id)a3;
- (BOOL)generatePeopleUsingBlock:(id)a3;
- (BOOL)hasPeople;
- (BOOL)isLoaded;
- (BOOL)openWithCancelBlock:(id)a3;
- (BOOL)peopleAnalyzeWithCancelBlock:(id)a3;
- (BOOL)peopleScoreWithCancelBlock:(id)a3;
- (BOOL)peopleUpdateInfo:(id)a3 attributeKey:(id)a4 attribute:(id)a5 forNode:(id)a6 person:(id)a7 score:(id)a8 rank:(id)a9 bestCount:(unint64_t *)a10;
- (BOOL)peopleUpdateNetwork:(void *)a3 sourceNodeId:(unsigned int)a4 nodes:(id)a5;
- (BOOL)pruneWithCancelBlock:(id)a3;
- (BOOL)scorePeopleWithCancelBlock:(id)a3;
- (SpotlightGraph)initWithConfig:(id)a3;
- (id)cachedPeopleScoresPath;
- (id)domains;
- (id)nameNodeFromName:(id)a3 nameComponents:(id)a4 reference:(id)a5 domain:(id)a6 nodes:(id)a7 edges:(id)a8 isOwner:(BOOL)a9;
- (id)primaryNodesForPerson:(id)a3 reference:(id)a4 domain:(id)a5 nodes:(id)a6 edges:(id)a7 isOwner:(BOOL)a8;
- (id)referenceIdentifierWithReference:(id)a3 domain:(id)a4 persona:(id)a5 protectionClass:(id)a6;
- (int64_t)domainCount;
- (int64_t)edgeCount;
- (int64_t)emailCount;
- (int64_t)nameCount;
- (int64_t)nodeCount;
- (int64_t)personCount;
- (int64_t)personaCountForDomain:(id)a3;
- (int64_t)phoneCount;
- (int64_t)referenceCountForDomain:(id)a3;
- (int64_t)referenceCountForDomain:(id)a3 personaIdentifier:(id)a4;
- (void)dealloc;
- (void)peopleUpdateFromItem:(id)a3 reference:(id)a4 domain:(id)a5 nodes:(id)a6 edges:(id)a7;
@end

@implementation SpotlightGraph

- (SpotlightGraph)initWithConfig:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SpotlightGraph;
  v6 = [(SpotlightGraph *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_peopleScores = 0;
    v8 = [(SpotlightGraph *)v7 cachedPeopleScoresPath];
    v9 = +[NSFileManager defaultManager];
    v10 = [v8 path];
    unsigned int v11 = [v9 fileExistsAtPath:v10];

    if (v11) {
      v7->_peopleScores = (_SIGeneralTrie *)SIGeneralTrieCreateFromFileURL();
    }
  }
  return v7;
}

- (BOOL)available
{
  return [(SKGGraph *)self->_graph available];
}

- (int64_t)nodeCount
{
  return [(SKGGraph *)self->_graph nodeCount];
}

- (int64_t)edgeCount
{
  return [(SKGGraph *)self->_graph edgeCount];
}

- (BOOL)isLoaded
{
  return self->_graph != 0;
}

- (BOOL)openWithCancelBlock:(id)a3
{
  id v4 = a3;
  graph = self->_graph;
  self->_graph = 0;

  v6 = self->_config;
  v7 = [SKGGraph alloc];
  v8 = [(SKGConfig *)v6 resourcePath];
  v9 = [(SKGGraph *)v7 initWithResourceDirectoryPath:v8];
  v10 = self->_graph;
  self->_graph = v9;

  unsigned int v11 = self->_graph;
  if (v11)
  {
    v12 = +[SKGUserNode user];
    v15 = v12;
    objc_super v13 = +[NSArray arrayWithObjects:&v15 count:1];
    LOBYTE(v11) = [(SKGGraph *)v11 addNodes:v13 addEdges:0 cancelBlock:v4];
  }
  return (char)v11;
}

- (BOOL)closeWithCancelBlock:(id)a3
{
  graph = self->_graph;
  self->_graph = 0;

  return 1;
}

- (BOOL)flushWithCancelBlock:(id)a3
{
  return [(SKGGraph *)self->_graph flushWithCancelBlock:a3];
}

- (BOOL)commitWithCancelBlock:(id)a3
{
  return [(SKGGraph *)self->_graph commitWithCancelBlock:a3];
}

- (BOOL)clearWithCancelBlock:(id)a3
{
  return [(SKGGraph *)self->_graph clearWithCancelBlock:a3];
}

- (BOOL)pruneWithCancelBlock:(id)a3
{
  id v4 = (uint64_t (**)(id, const __CFString *))a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  id v5 = self->_graph;
  uint64_t v6 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000126F4;
  v23 = sub_100012598;
  id v24 = 0;
  do
  {
    if (v5)
    {
      unsigned int v7 = [(SKGGraph *)v5 removeNodeSet:v6 removeEdgeSet:0 cancelBlock:v4];
      if (v4) {
        char v8 = v4[2](v4, @"pruneWithCancelBlock") ^ 1;
      }
      else {
        char v8 = 1;
      }
      *((unsigned char *)v26 + 24) = v8;
      v9 = (void *)v20[5];
      v20[5] = 0;
    }
    else
    {
      unsigned int v7 = 1;
    }
    if (*((unsigned char *)v26 + 24)) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      unsigned int v11 = +[SKGNodes nodesInGraph:v5];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100070F98;
      v15[3] = &unk_1000DBC40;
      v17 = &v19;
      v18 = &v25;
      v16 = v4;
      [v11 enumerateNodesInGraph:v5 usingBlock:v15];
    }
    uint64_t v6 = v20[5];
    if (!v6) {
      break;
    }
    char v12 = *((unsigned char *)v26 + 24) ? v7 : 0;
  }
  while ((v12 & 1) != 0);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v7;
}

- (void)dealloc
{
  [(SpotlightGraph *)self closeWithCancelBlock:0];
  if (self->_peopleScores) {
    SIGeneralTrieRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)SpotlightGraph;
  [(SpotlightGraph *)&v3 dealloc];
}

- (id)domains
{
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000126F4;
  v16 = sub_100012598;
  id v17 = 0;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v4 = self->_graph;
  id v5 = +[SKGNodes nodesInGraph:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000712A8;
  v9[3] = &unk_1000DBC68;
  uint64_t v6 = v4;
  BOOL v10 = v6;
  unsigned int v11 = &v12;
  [v5 enumerateDomainsInGraph:v6 usingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (int64_t)domainCount
{
  graph = self->_graph;
  if (!graph) {
    return -1;
  }
  objc_super v3 = +[SKGDomainNode label];
  int64_t v4 = [(SKGGraph *)graph countOfNodesWithLabel:v3];

  return v4;
}

- (int64_t)personaCountForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v6 = +[SKGDomains domainsWithDomain:v4 inGraph:self->_graph];
  id v7 = [v6 personas];
  id v8 = [v7 count];

  if (v8) {
    int64_t v9 = (int64_t)v8;
  }
  else {
    int64_t v9 = -1;
  }

  return v9;
}

- (int64_t)referenceCountForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v6 = self->_graph;
  id v7 = +[SKGDomains domainsWithDomain:v4 inGraph:v6];
  id v8 = [v7 personas];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007155C;
  v11[3] = &unk_1000DBC90;
  v11[4] = &v12;
  [v8 enumeratePersonasInGraph:v6 usingBlock:v11];

  if (v13[3]) {
    int64_t v9 = v13[3];
  }
  else {
    int64_t v9 = -1;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (int64_t)referenceCountForDomain:(id)a3 personaIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v9 = self->_graph;
  BOOL v10 = +[SKGDomains domainsWithDomain:v6 inGraph:v9];
  unsigned int v11 = [v10 personasWithPersona:v7 inGraph:v9];

  uint64_t v12 = [v11 references];
  id v13 = [v12 count];

  if (v13) {
    int64_t v14 = (int64_t)v13;
  }
  else {
    int64_t v14 = -1;
  }

  return v14;
}

- (id)referenceIdentifierWithReference:(id)a3 domain:(id)a4 persona:(id)a5 protectionClass:(id)a6
{
  return +[NSString stringWithFormat:@"%@:%@", a4, a5, a6, a4, a3];
}

- (id)nameNodeFromName:(id)a3 nameComponents:(id)a4 reference:(id)a5 domain:(id)a6 nodes:(id)a7 edges:(id)a8 isOwner:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = 0;
  if (v14 && v15 && v18)
  {
    uint64_t v22 = [v15 givenName];
    if (v22)
    {
      v23 = (void *)v22;
      id v24 = [v15 familyName];

      if (v24)
      {
        uint64_t v25 = [v15 givenName];
        [v15 familyName];
        v26 = v34 = v21;
        uint64_t v27 = +[NSString stringWithFormat:@"%@_%@", v25, v26];
        id v24 = [[SKGNameKeyNode alloc] initWithNameKey:v27 firstName:v25 lastName:v26];
        [v18 addObject:v24];

        uint64_t v21 = v34;
      }
    }
    else
    {
      id v24 = 0;
    }
    v20 = [[SKGNameNode alloc] initWithName:v14];
    if (v20)
    {
      [v18 addObject:v20];
      if (v19)
      {
        if (v16)
        {
          char v28 = +[SKGReferenceEdge edgeFromReference:v16 toNode:v20];
          [v19 addObject:v28];
        }
        v35 = v21;
        if (v17)
        {
          v29 = +[SKGNameEdge edgeFromName:v20 toNode:v17];
          [v19 addObject:v29];
          v30 = +[SKGDomainEdge edgeFromDomain:v17 toNode:v20];
          [v19 addObject:v30];

          uint64_t v21 = v35;
        }
        if (v24)
        {
          v31 = +[SKGNameEdge edgeFromName:v20 toNode:v24];
          [v19 addObject:v31];
          v32 = +[SKGNameKeyEdge edgeFromNameKey:v24 toNode:v20];
          [v19 addObject:v32];

          uint64_t v21 = v35;
        }
      }
    }
  }

  return v20;
}

- (id)primaryNodesForPerson:(id)a3 reference:(id)a4 domain:(id)a5 nodes:(id)a6 edges:(id)a7 isOwner:(BOOL)a8
{
  BOOL obj = a8;
  id v13 = a3;
  id v207 = a4;
  id v209 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = 0;
  v208 = v14;
  if (!v13 || !v14) {
    goto LABEL_215;
  }
  id v191 = objc_alloc_init((Class)NSMutableSet);
  id v17 = [v13 entityIdentifier];

  if (v17)
  {
    id v18 = [SKGEntityNode alloc];
    id v19 = [v13 entityIdentifier];
    v20 = [(SKGEntityNode *)v18 initWithIdentifier:v19];

    [v208 addObject:v20];
  }
  else
  {
    v20 = 0;
  }
  v210 = v20;
  uint64_t v21 = [v13 names];
  id v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = 0;
    v194 = 0;
    id v211 = v22;
    v205 = self;
    while (1)
    {
      id v24 = [v13 names];
      uint64_t v25 = [v24 objectAtIndexedSubscript:v23];

      v26 = [v13 displayNames];
      uint64_t v27 = [v26 objectAtIndexedSubscript:v23];

      char v28 = [v13 nameComponents];
      v29 = [v28 objectAtIndexedSubscript:v23];

      if (v210)
      {
        v30 = [[SKGDisplayNameNode alloc] initWithName:v25];
        id v31 = v194;
        if (!v194) {
          id v31 = objc_alloc_init((Class)NSMutableSet);
        }
        v194 = v31;
        [v31 addObject:v30];
        [v208 addObject:v30];
        if (!v15) {
          goto LABEL_20;
        }
        v32 = +[SKGEdge edgeFromNode:v210 toNode:v30];
        [v15 addObject:v32];
        v33 = +[SKGEdge edgeFromNode:v30 toNode:v210];
        [v15 addObject:v33];
      }
      else
      {
        v30 = [[SKGDisplayNameNode alloc] initWithName:v27];
        [v208 addObject:v30];
        LOBYTE(v188) = obj;
        v32 = [(SpotlightGraph *)self nameNodeFromName:v25 nameComponents:v29 reference:v207 domain:v209 nodes:v208 edges:v15 isOwner:v188];
        if (!v32) {
          goto LABEL_19;
        }
        id v34 = v194;
        if (!v194) {
          id v34 = objc_alloc_init((Class)NSMutableSet);
        }
        v194 = v34;
        [v34 addObject:v32];
        if (!v15) {
          goto LABEL_19;
        }
        v33 = +[SKGEdge edgeFromNode:v30 toNode:v32];
        [v15 addObject:v33];
        v35 = +[SKGEdge edgeFromNode:v32 toNode:v30];
        [v15 addObject:v35];

        self = v205;
      }

      id v22 = v211;
LABEL_19:

LABEL_20:
      if (v22 == (id)++v23) {
        goto LABEL_23;
      }
    }
  }
  v194 = 0;
LABEL_23:
  v36 = [v13 contactIdentifier];

  if (v36)
  {
    v37 = [SKGContactNode alloc];
    v38 = [v13 contactIdentifier];
    v212 = [(SKGContactNode *)v37 initWithIdentifier:v38];

    [v208 addObject:v212];
    if (v15)
    {
      if (v207)
      {
        v39 = +[SKGReferenceEdge edgeFromReference:v207 toNode:v212];
        [v15 addObject:v39];
      }
      if (v209)
      {
        v40 = +[SKGEdge edgeFromNode:v212 toNode:v209];
        [v15 addObject:v40];
        v41 = +[SKGEdge edgeFromNode:v209 toNode:v212];
        [v15 addObject:v41];
      }
      if (v210)
      {
        v42 = +[SKGEdge edgeFromNode:v210 toNode:v212];
        [v15 addObject:v42];
        v43 = +[SKGEdge edgeFromNode:v212 toNode:v210];
        [v15 addObject:v43];
      }
      if (obj)
      {
        v44 = +[SKGUserNode user];
        v45 = +[SKGEdge edgeFromNode:v212 toNode:v44];

        [v15 addObject:v45];
        v46 = +[SKGUserNode user];
        v47 = +[SKGEdge edgeFromNode:v46 toNode:v212];

        [v15 addObject:v47];
      }
    }
  }
  else
  {
    v212 = 0;
  }
  v48 = [v13 photosPersonIdentifier];

  if (v48)
  {
    v49 = [SKGPhotoNode alloc];
    v50 = [v13 photosPersonIdentifier];
    v203 = [(SKGPhotoNode *)v49 initWithIdentifier:v50];

    [v208 addObject:v203];
    if (v15)
    {
      if (v207)
      {
        v51 = +[SKGReferenceEdge edgeFromReference:v207 toNode:v203];
        [v15 addObject:v51];
      }
      if (v209)
      {
        v52 = +[SKGEdge edgeFromNode:v203 toNode:v209];
        [v15 addObject:v52];
        v53 = +[SKGEdge edgeFromNode:v209 toNode:v203];
        [v15 addObject:v53];
      }
      if (v210)
      {
        v54 = +[SKGEdge edgeFromNode:v210 toNode:v203];
        [v15 addObject:v54];
        v55 = +[SKGEdge edgeFromNode:v203 toNode:v210];
        [v15 addObject:v55];
      }
      if (obj)
      {
        v56 = +[SKGUserNode user];
        v57 = +[SKGEdge edgeFromNode:v203 toNode:v56];

        [v15 addObject:v57];
        v58 = +[SKGUserNode user];
        v59 = +[SKGEdge edgeFromNode:v58 toNode:v203];

        [v15 addObject:v59];
      }
    }
  }
  else
  {
    v203 = 0;
  }
  long long v276 = 0u;
  long long v275 = 0u;
  long long v274 = 0u;
  long long v273 = 0u;
  v60 = [v13 emailAddresses];
  id v61 = [v60 countByEnumeratingWithState:&v273 objects:v292 count:16];
  if (v61)
  {
    v204 = 0;
    uint64_t v62 = *(void *)v274;
    do
    {
      for (i = 0; i != v61; i = (char *)i + 1)
      {
        if (*(void *)v274 != v62) {
          objc_enumerationMutation(v60);
        }
        v64 = [[SKGEmailNode alloc] initWithEmailAddress:*(void *)(*((void *)&v273 + 1) + 8 * i)];
        [v208 addObject:v64];
        id v65 = v204;
        if (!v204) {
          id v65 = objc_alloc_init((Class)NSMutableSet);
        }
        v204 = v65;
        [v65 addObject:v64];
        if (v15)
        {
          if (v207)
          {
            v66 = +[SKGReferenceEdge edgeFromReference:v207 toNode:v64];
            [v15 addObject:v66];
          }
          if (v209)
          {
            v67 = +[SKGEdge edgeFromNode:v64 toNode:v209];
            [v15 addObject:v67];
            v68 = +[SKGEdge edgeFromNode:v209 toNode:v64];
            [v15 addObject:v68];
          }
          if (v210)
          {
            v69 = +[SKGEdge edgeFromNode:v210 toNode:v64];
            [v15 addObject:v69];
            v70 = +[SKGEdge edgeFromNode:v64 toNode:v210];
            [v15 addObject:v70];
          }
        }
      }
      id v61 = [v60 countByEnumeratingWithState:&v273 objects:v292 count:16];
    }
    while (v61);
  }
  else
  {
    v204 = 0;
  }

  long long v272 = 0u;
  long long v271 = 0u;
  long long v270 = 0u;
  long long v269 = 0u;
  v71 = [v13 phoneNumbers];
  id v72 = [v71 countByEnumeratingWithState:&v269 objects:v291 count:16];
  if (v72)
  {
    v206 = 0;
    uint64_t v73 = *(void *)v270;
    do
    {
      for (j = 0; j != v72; j = (char *)j + 1)
      {
        if (*(void *)v270 != v73) {
          objc_enumerationMutation(v71);
        }
        v75 = [[SKGPhoneNode alloc] initWithPhoneNumber:*(void *)(*((void *)&v269 + 1) + 8 * (void)j)];
        [v208 addObject:v75];
        id v76 = v206;
        if (!v206) {
          id v76 = objc_alloc_init((Class)NSMutableSet);
        }
        v206 = v76;
        [v76 addObject:v75];
        if (v15)
        {
          if (v207)
          {
            v77 = +[SKGReferenceEdge edgeFromReference:v207 toNode:v75];
            [v15 addObject:v77];
          }
          if (v209)
          {
            v78 = +[SKGEdge edgeFromNode:v75 toNode:v209];
            [v15 addObject:v78];
            v79 = +[SKGEdge edgeFromNode:v209 toNode:v75];
            [v15 addObject:v79];
          }
          if (v210)
          {
            v80 = +[SKGEdge edgeFromNode:v210 toNode:v75];
            [v15 addObject:v80];
            v81 = +[SKGEdge edgeFromNode:v75 toNode:v210];
            [v15 addObject:v81];
          }
          if (obj)
          {
            v82 = +[SKGUserNode user];
            v83 = +[SKGEdge edgeFromNode:v75 toNode:v82];

            [v15 addObject:v83];
            v84 = +[SKGUserNode user];
            v85 = +[SKGEdge edgeFromNode:v84 toNode:v75];

            [v15 addObject:v85];
          }
        }
      }
      id v72 = [v71 countByEnumeratingWithState:&v269 objects:v291 count:16];
    }
    while (v72);
  }
  else
  {
    v206 = 0;
  }

  if (v15 && !v210)
  {
    if (v212)
    {
      if (v203)
      {
        v86 = +[SKGEdge edgeFromNode:v212 toNode:v203];
        [v15 addObject:v86];
        v87 = +[SKGEdge edgeFromNode:v203 toNode:v212];
        [v15 addObject:v87];
      }
      long long v268 = 0u;
      long long v266 = 0u;
      long long v267 = 0u;
      long long v265 = 0u;
      id v88 = v194;
      id v89 = [v88 countByEnumeratingWithState:&v265 objects:v290 count:16];
      if (v89)
      {
        uint64_t v90 = *(void *)v266;
        do
        {
          for (k = 0; k != v89; k = (char *)k + 1)
          {
            if (*(void *)v266 != v90) {
              objc_enumerationMutation(v88);
            }
            uint64_t v92 = *(void *)(*((void *)&v265 + 1) + 8 * (void)k);
            v93 = +[SKGEdge edgeFromNode:v212 toNode:v92];
            [v15 addObject:v93];
            v94 = +[SKGEdge edgeFromNode:v92 toNode:v212];
            [v15 addObject:v94];
          }
          id v89 = [v88 countByEnumeratingWithState:&v265 objects:v290 count:16];
        }
        while (v89);
      }

      long long v263 = 0u;
      long long v264 = 0u;
      long long v261 = 0u;
      long long v262 = 0u;
      id v95 = v204;
      id v96 = [v95 countByEnumeratingWithState:&v261 objects:v289 count:16];
      if (v96)
      {
        uint64_t v97 = *(void *)v262;
        do
        {
          for (m = 0; m != v96; m = (char *)m + 1)
          {
            if (*(void *)v262 != v97) {
              objc_enumerationMutation(v95);
            }
            uint64_t v99 = *(void *)(*((void *)&v261 + 1) + 8 * (void)m);
            v100 = +[SKGEdge edgeFromNode:v212 toNode:v99];
            [v15 addObject:v100];
            v101 = +[SKGEdge edgeFromNode:v99 toNode:v212];
            [v15 addObject:v101];
          }
          id v96 = [v95 countByEnumeratingWithState:&v261 objects:v289 count:16];
        }
        while (v96);
      }

      long long v259 = 0u;
      long long v260 = 0u;
      long long v257 = 0u;
      long long v258 = 0u;
      id v102 = v206;
      id v103 = [v102 countByEnumeratingWithState:&v257 objects:v288 count:16];
      if (v103)
      {
        uint64_t v104 = *(void *)v258;
        do
        {
          for (n = 0; n != v103; n = (char *)n + 1)
          {
            if (*(void *)v258 != v104) {
              objc_enumerationMutation(v102);
            }
            uint64_t v106 = *(void *)(*((void *)&v257 + 1) + 8 * (void)n);
            v107 = +[SKGEdge edgeFromNode:v212 toNode:v106];
            [v15 addObject:v107];
            v108 = +[SKGEdge edgeFromNode:v106 toNode:v212];
            [v15 addObject:v108];
          }
          id v103 = [v102 countByEnumeratingWithState:&v257 objects:v288 count:16];
        }
        while (v103);
      }

      if (v203)
      {
        v109 = +[SKGEdge edgeFromNode:v203 toNode:v212];
        [v15 addObject:v109];
        v110 = +[SKGEdge edgeFromNode:v212 toNode:v203];
        [v15 addObject:v110];

LABEL_112:
        long long v255 = 0u;
        long long v256 = 0u;
        long long v253 = 0u;
        long long v254 = 0u;
        id v111 = v194;
        id v112 = [v111 countByEnumeratingWithState:&v253 objects:v287 count:16];
        if (v112)
        {
          uint64_t v113 = *(void *)v254;
          do
          {
            for (ii = 0; ii != v112; ii = (char *)ii + 1)
            {
              if (*(void *)v254 != v113) {
                objc_enumerationMutation(v111);
              }
              uint64_t v115 = *(void *)(*((void *)&v253 + 1) + 8 * (void)ii);
              v116 = +[SKGEdge edgeFromNode:v203 toNode:v115];
              [v15 addObject:v116];
              v117 = +[SKGEdge edgeFromNode:v115 toNode:v203];
              [v15 addObject:v117];
            }
            id v112 = [v111 countByEnumeratingWithState:&v253 objects:v287 count:16];
          }
          while (v112);
        }

        long long v251 = 0u;
        long long v252 = 0u;
        long long v249 = 0u;
        long long v250 = 0u;
        id v118 = v204;
        id v119 = [v118 countByEnumeratingWithState:&v249 objects:v286 count:16];
        if (v119)
        {
          uint64_t v120 = *(void *)v250;
          do
          {
            for (jj = 0; jj != v119; jj = (char *)jj + 1)
            {
              if (*(void *)v250 != v120) {
                objc_enumerationMutation(v118);
              }
              uint64_t v122 = *(void *)(*((void *)&v249 + 1) + 8 * (void)jj);
              v123 = +[SKGEdge edgeFromNode:v203 toNode:v122];
              [v15 addObject:v123];
              v124 = +[SKGEdge edgeFromNode:v122 toNode:v203];
              [v15 addObject:v124];
            }
            id v119 = [v118 countByEnumeratingWithState:&v249 objects:v286 count:16];
          }
          while (v119);
        }

        long long v247 = 0u;
        long long v248 = 0u;
        long long v245 = 0u;
        long long v246 = 0u;
        id v125 = v206;
        id v126 = [v125 countByEnumeratingWithState:&v245 objects:v285 count:16];
        if (v126)
        {
          uint64_t v127 = *(void *)v246;
          do
          {
            for (kk = 0; kk != v126; kk = (char *)kk + 1)
            {
              if (*(void *)v246 != v127) {
                objc_enumerationMutation(v125);
              }
              uint64_t v129 = *(void *)(*((void *)&v245 + 1) + 8 * (void)kk);
              v130 = +[SKGEdge edgeFromNode:v203 toNode:v129];
              [v15 addObject:v130];
              v131 = +[SKGEdge edgeFromNode:v129 toNode:v203];
              [v15 addObject:v131];
            }
            id v126 = [v125 countByEnumeratingWithState:&v245 objects:v285 count:16];
          }
          while (v126);
        }

        char v193 = 0;
        goto LABEL_135;
      }
    }
    else if (v203)
    {
      goto LABEL_112;
    }
    char v193 = 1;
LABEL_135:
    long long v243 = 0u;
    long long v244 = 0u;
    long long v241 = 0u;
    long long v242 = 0u;
    id obja = v194;
    id v132 = [obja countByEnumeratingWithState:&v241 objects:v284 count:16];
    if (v132)
    {
      uint64_t v195 = *(void *)v242;
      do
      {
        id v198 = v132;
        for (mm = 0; mm != v198; mm = (char *)mm + 1)
        {
          if (*(void *)v242 != v195) {
            objc_enumerationMutation(obja);
          }
          v134 = *(void **)(*((void *)&v241 + 1) + 8 * (void)mm);
          long long v237 = 0u;
          long long v238 = 0u;
          long long v239 = 0u;
          long long v240 = 0u;
          id v135 = obja;
          id v136 = [v135 countByEnumeratingWithState:&v237 objects:v283 count:16];
          if (v136)
          {
            uint64_t v137 = *(void *)v238;
            do
            {
              for (nn = 0; nn != v136; nn = (char *)nn + 1)
              {
                if (*(void *)v238 != v137) {
                  objc_enumerationMutation(v135);
                }
                uint64_t v139 = *(void *)(*((void *)&v237 + 1) + 8 * (void)nn);
                if (([v134 isEqualToNode:v139] & 1) == 0)
                {
                  v140 = +[SKGEdge edgeFromNode:v134 toNode:v139];
                  [v15 addObject:v140];
                  v141 = +[SKGEdge edgeFromNode:v139 toNode:v134];
                  [v15 addObject:v141];
                }
              }
              id v136 = [v135 countByEnumeratingWithState:&v237 objects:v283 count:16];
            }
            while (v136);
          }
        }
        id v132 = [v135 countByEnumeratingWithState:&v241 objects:v284 count:16];
      }
      while (v132);
    }

    long long v235 = 0u;
    long long v236 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    id v192 = v204;
    id v142 = [v192 countByEnumeratingWithState:&v233 objects:v282 count:16];
    if (v142)
    {
      uint64_t v196 = *(void *)v234;
      do
      {
        id v199 = v142;
        for (i1 = 0; i1 != v199; i1 = (char *)i1 + 1)
        {
          if (*(void *)v234 != v196) {
            objc_enumerationMutation(v192);
          }
          uint64_t v144 = *(void *)(*((void *)&v233 + 1) + 8 * (void)i1);
          if ((v193 & 1) == 0)
          {
            v145 = +[SKGEdge edgeFromNode:v203 toNode:*(void *)(*((void *)&v233 + 1) + 8 * (void)i1)];
            [v15 addObject:v145];
            v146 = +[SKGEdge edgeFromNode:v144 toNode:v203];
            [v15 addObject:v146];
          }
          if (v212)
          {
            v147 = +[SKGEdge edgeFromNode:v212 toNode:v144];
            [v15 addObject:v147];
            v148 = +[SKGEdge edgeFromNode:v144 toNode:v212];
            [v15 addObject:v148];
          }
          long long v231 = 0u;
          long long v232 = 0u;
          long long v229 = 0u;
          long long v230 = 0u;
          id v149 = obja;
          id v150 = [v149 countByEnumeratingWithState:&v229 objects:v281 count:16];
          if (v150)
          {
            uint64_t v151 = *(void *)v230;
            do
            {
              for (i2 = 0; i2 != v150; i2 = (char *)i2 + 1)
              {
                if (*(void *)v230 != v151) {
                  objc_enumerationMutation(v149);
                }
                uint64_t v153 = *(void *)(*((void *)&v229 + 1) + 8 * (void)i2);
                v154 = +[SKGEdge edgeFromNode:v144 toNode:v153];
                [v15 addObject:v154];
                v155 = +[SKGEdge edgeFromNode:v153 toNode:v144];
                [v15 addObject:v155];
              }
              id v150 = [v149 countByEnumeratingWithState:&v229 objects:v281 count:16];
            }
            while (v150);
          }

          long long v227 = 0u;
          long long v228 = 0u;
          long long v225 = 0u;
          long long v226 = 0u;
          id v156 = v206;
          id v157 = [v156 countByEnumeratingWithState:&v225 objects:v280 count:16];
          if (v157)
          {
            uint64_t v158 = *(void *)v226;
            do
            {
              for (i3 = 0; i3 != v157; i3 = (char *)i3 + 1)
              {
                if (*(void *)v226 != v158) {
                  objc_enumerationMutation(v156);
                }
                uint64_t v160 = *(void *)(*((void *)&v225 + 1) + 8 * (void)i3);
                v161 = +[SKGEdge edgeFromNode:v144 toNode:v160];
                [v15 addObject:v161];
                v162 = +[SKGEdge edgeFromNode:v160 toNode:v144];
                [v15 addObject:v162];
              }
              id v157 = [v156 countByEnumeratingWithState:&v225 objects:v280 count:16];
            }
            while (v157);
          }
        }
        id v142 = [v192 countByEnumeratingWithState:&v233 objects:v282 count:16];
      }
      while (v142);
    }

    long long v223 = 0u;
    long long v224 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    id v190 = v206;
    id v163 = [v190 countByEnumeratingWithState:&v221 objects:v279 count:16];
    if (v163)
    {
      uint64_t v197 = *(void *)v222;
      do
      {
        id v200 = v163;
        for (i4 = 0; i4 != v200; i4 = (char *)i4 + 1)
        {
          if (*(void *)v222 != v197) {
            objc_enumerationMutation(v190);
          }
          uint64_t v165 = *(void *)(*((void *)&v221 + 1) + 8 * (void)i4);
          if ((v193 & 1) == 0)
          {
            v166 = +[SKGEdge edgeFromNode:v203 toNode:*(void *)(*((void *)&v221 + 1) + 8 * (void)i4)];
            [v15 addObject:v166];
            v167 = +[SKGEdge edgeFromNode:v165 toNode:v203];
            [v15 addObject:v167];
          }
          if (v212)
          {
            v168 = +[SKGEdge edgeFromNode:v212 toNode:v165];
            [v15 addObject:v168];
            v169 = +[SKGEdge edgeFromNode:v165 toNode:v212];
            [v15 addObject:v169];
          }
          long long v219 = 0u;
          long long v220 = 0u;
          long long v217 = 0u;
          long long v218 = 0u;
          id v170 = obja;
          id v171 = [v170 countByEnumeratingWithState:&v217 objects:v278 count:16];
          if (v171)
          {
            uint64_t v172 = *(void *)v218;
            do
            {
              for (i5 = 0; i5 != v171; i5 = (char *)i5 + 1)
              {
                if (*(void *)v218 != v172) {
                  objc_enumerationMutation(v170);
                }
                uint64_t v174 = *(void *)(*((void *)&v217 + 1) + 8 * (void)i5);
                v175 = +[SKGEdge edgeFromNode:v165 toNode:v174];
                [v15 addObject:v175];
                v176 = +[SKGEdge edgeFromNode:v174 toNode:v165];
                [v15 addObject:v176];
              }
              id v171 = [v170 countByEnumeratingWithState:&v217 objects:v278 count:16];
            }
            while (v171);
          }

          long long v215 = 0u;
          long long v216 = 0u;
          long long v213 = 0u;
          long long v214 = 0u;
          id v177 = v192;
          id v178 = [v177 countByEnumeratingWithState:&v213 objects:v277 count:16];
          if (v178)
          {
            uint64_t v179 = *(void *)v214;
            do
            {
              for (i6 = 0; i6 != v178; i6 = (char *)i6 + 1)
              {
                if (*(void *)v214 != v179) {
                  objc_enumerationMutation(v177);
                }
                v181 = +[SKGEdge edgeFromNode:v165 toNode:*(void *)(*((void *)&v213 + 1) + 8 * (void)i6)];
                [v15 addObject:v181];
                v182 = +[SKGEdge edgeFromNode:v165 toNode:v212];
                [v15 addObject:v182];
              }
              id v178 = [v177 countByEnumeratingWithState:&v213 objects:v277 count:16];
            }
            while (v178);
          }
        }
        id v163 = [v190 countByEnumeratingWithState:&v221 objects:v279 count:16];
      }
      while (v163);
    }
  }
  v183 = v206;
  if (v212) {
    [v191 addObject:v212];
  }
  if (v203) {
    [v191 addObject:v203];
  }
  if (v210) {
    [v191 addObject:v210];
  }
  if ([v204 count])
  {
    v184 = [v204 allObjects];
    [v191 addObjectsFromArray:v184];

    v183 = v206;
  }
  if ([v183 count])
  {
    v185 = [v183 allObjects];
    [v191 addObjectsFromArray:v185];

    v183 = v206;
  }
  if ([v194 count])
  {
    v186 = [v194 allObjects];
    [v191 addObjectsFromArray:v186];

    v183 = v206;
  }

  id v16 = [v191 allObjects];

LABEL_215:

  return v16;
}

- (void)peopleUpdateFromItem:(id)a3 reference:(id)a4 domain:(id)a5 nodes:(id)a6 edges:(id)a7
{
  id v12 = a3;
  id v155 = a4;
  id v154 = a5;
  id v153 = a6;
  id v230 = a7;
  long long v332 = 0u;
  long long v333 = 0u;
  long long v334 = 0u;
  long long v335 = 0u;
  long long v231 = v12;
  id obj = [v12 owners];
  id v150 = [obj countByEnumeratingWithState:&v332 objects:v366 count:16];
  if (v150)
  {
    uint64_t v148 = *(void *)v333;
    id v149 = self;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v333 != v148) {
          objc_enumerationMutation(obj);
        }
        uint64_t v152 = v13;
        uint64_t v14 = *(void *)(*((void *)&v332 + 1) + 8 * v13);
        id v15 = objc_opt_new();
        id v16 = objc_opt_new();
        id v17 = +[SKGUserNode user];
        v365 = v17;
        id v18 = +[NSArray arrayWithObjects:&v365 count:1];
        v162 = v16;
        [v16 addObject:v18];

        uint64_t v19 = [(SpotlightGraph *)self primaryNodesForPerson:v14 reference:v155 domain:v154 nodes:v153 edges:v230 isOwner:1];
        if (v19) {
          [v15 addObject:v19];
        }
        uint64_t v151 = (void *)v19;
        long long v331 = 0u;
        long long v330 = 0u;
        long long v329 = 0u;
        long long v328 = 0u;
        id v156 = v15;
        id v166 = [v156 countByEnumeratingWithState:&v328 objects:v364 count:16];
        if (v166)
        {
          uint64_t v158 = *(void *)v329;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v329 != v158) {
                objc_enumerationMutation(v156);
              }
              uint64_t v170 = v20;
              v182 = *(void **)(*((void *)&v328 + 1) + 8 * v20);
              long long v324 = 0u;
              long long v325 = 0u;
              long long v326 = 0u;
              long long v327 = 0u;
              id v174 = v162;
              id v186 = [v174 countByEnumeratingWithState:&v324 objects:v363 count:16];
              if (v186)
              {
                uint64_t v178 = *(void *)v325;
                do
                {
                  uint64_t v21 = 0;
                  do
                  {
                    if (*(void *)v325 != v178) {
                      objc_enumerationMutation(v174);
                    }
                    uint64_t v190 = v21;
                    v202 = *(void **)(*((void *)&v324 + 1) + 8 * v21);
                    long long v320 = 0u;
                    long long v321 = 0u;
                    long long v322 = 0u;
                    long long v323 = 0u;
                    id v194 = v182;
                    id v206 = [v194 countByEnumeratingWithState:&v320 objects:v362 count:16];
                    if (v206)
                    {
                      uint64_t v198 = *(void *)v321;
                      do
                      {
                        uint64_t v22 = 0;
                        do
                        {
                          if (*(void *)v321 != v198) {
                            objc_enumerationMutation(v194);
                          }
                          uint64_t v210 = v22;
                          uint64_t v23 = *(void *)(*((void *)&v320 + 1) + 8 * v22);
                          long long v316 = 0u;
                          long long v317 = 0u;
                          long long v318 = 0u;
                          long long v319 = 0u;
                          id v214 = v202;
                          id v222 = [v214 countByEnumeratingWithState:&v316 objects:v361 count:16];
                          if (v222)
                          {
                            uint64_t v218 = *(void *)v317;
                            do
                            {
                              uint64_t v24 = 0;
                              do
                              {
                                if (*(void *)v317 != v218) {
                                  objc_enumerationMutation(v214);
                                }
                                uint64_t v226 = v24;
                                uint64_t v25 = *(void *)(*((void *)&v316 + 1) + 8 * v24);
                                long long v312 = 0u;
                                long long v313 = 0u;
                                long long v314 = 0u;
                                long long v315 = 0u;
                                v26 = [v231 interactions];
                                id v27 = [v26 countByEnumeratingWithState:&v312 objects:v360 count:16];
                                if (v27)
                                {
                                  id v28 = v27;
                                  uint64_t v29 = *(void *)v313;
                                  do
                                  {
                                    for (i = 0; i != v28; i = (char *)i + 1)
                                    {
                                      if (*(void *)v313 != v29) {
                                        objc_enumerationMutation(v26);
                                      }
                                      uint64_t v31 = *(void *)(*((void *)&v312 + 1) + 8 * i);
                                      v32 = [v231 interactions];
                                      v33 = [v32 objectForKeyedSubscript:v31];

                                      id v34 = [SKGInteractionEdge alloc];
                                      v35 = [v231 bundleIdentifier];
                                      v36 = [(SKGInteractionEdge *)v34 initWithSourceNode:v23 targetNode:v25 domainIdentifier:v35 relationship:v31 score:v33];

                                      [v230 addObject:v36];
                                    }
                                    id v28 = [v26 countByEnumeratingWithState:&v312 objects:v360 count:16];
                                  }
                                  while (v28);
                                }

                                uint64_t v24 = v226 + 1;
                              }
                              while ((id)(v226 + 1) != v222);
                              id v222 = [v214 countByEnumeratingWithState:&v316 objects:v361 count:16];
                            }
                            while (v222);
                          }

                          uint64_t v22 = v210 + 1;
                        }
                        while ((id)(v210 + 1) != v206);
                        id v206 = [v194 countByEnumeratingWithState:&v320 objects:v362 count:16];
                      }
                      while (v206);
                    }

                    uint64_t v21 = v190 + 1;
                  }
                  while ((id)(v190 + 1) != v186);
                  id v186 = [v174 countByEnumeratingWithState:&v324 objects:v363 count:16];
                }
                while (v186);
              }

              uint64_t v20 = v170 + 1;
            }
            while ((id)(v170 + 1) != v166);
            id v166 = [v156 countByEnumeratingWithState:&v328 objects:v364 count:16];
          }
          while (v166);
        }

        uint64_t v13 = v152 + 1;
        self = v149;
      }
      while ((id)(v152 + 1) != v150);
      id v150 = [obj countByEnumeratingWithState:&v332 objects:v366 count:16];
    }
    while (v150);
  }

  v37 = [v231 authors];
  if ([v37 count])
  {
    v38 = [v231 recipients];
    id v39 = [v38 count];

    if (v39)
    {
      v40 = objc_opt_new();
      id v41 = (id)objc_opt_new();
      v42 = +[SKGUserNode user];
      v359 = v42;
      v43 = +[NSArray arrayWithObjects:&v359 count:1];
      [v41 addObject:v43];

      long long v311 = 0u;
      long long v310 = 0u;
      long long v309 = 0u;
      long long v308 = 0u;
      v44 = [v231 authors];
      id v45 = [v44 countByEnumeratingWithState:&v308 objects:v358 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v309;
        do
        {
          for (j = 0; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v309 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = [(SpotlightGraph *)self primaryNodesForPerson:*(void *)(*((void *)&v308 + 1) + 8 * (void)j) reference:v155 domain:v154 nodes:v153 edges:v230 isOwner:0];
            if (v49) {
              [v40 addObject:v49];
            }
          }
          id v46 = [v44 countByEnumeratingWithState:&v308 objects:v358 count:16];
        }
        while (v46);
      }

      long long v307 = 0u;
      long long v306 = 0u;
      long long v305 = 0u;
      long long v304 = 0u;
      v50 = [v231 recipients];
      id v51 = [v50 countByEnumeratingWithState:&v304 objects:v357 count:16];
      if (v51)
      {
        id v52 = v51;
        uint64_t v53 = *(void *)v305;
        do
        {
          for (k = 0; k != v52; k = (char *)k + 1)
          {
            if (*(void *)v305 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = [(SpotlightGraph *)self primaryNodesForPerson:*(void *)(*((void *)&v304 + 1) + 8 * (void)k) reference:v155 domain:v154 nodes:v153 edges:v230 isOwner:0];
            if (v55) {
              [v41 addObject:v55];
            }
          }
          id v52 = [v50 countByEnumeratingWithState:&v304 objects:v357 count:16];
        }
        while (v52);
      }

      long long v303 = 0u;
      long long v302 = 0u;
      long long v301 = 0u;
      long long v300 = 0u;
      id v157 = v40;
      id v163 = [v157 countByEnumeratingWithState:&v300 objects:v356 count:16];
      if (!v163) {
        goto LABEL_165;
      }
      uint64_t v159 = *(void *)v301;
      id v171 = v41;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v301 != v159) {
            objc_enumerationMutation(v157);
          }
          uint64_t v167 = v56;
          v183 = *(void **)(*((void *)&v300 + 1) + 8 * v56);
          long long v296 = 0u;
          long long v297 = 0u;
          long long v298 = 0u;
          long long v299 = 0u;
          id v57 = v41;
          id v187 = [v57 countByEnumeratingWithState:&v296 objects:v355 count:16];
          if (v187)
          {
            id v175 = *(id *)v297;
            uint64_t v179 = v57;
            do
            {
              uint64_t v58 = 0;
              do
              {
                if (*(id *)v297 != v175) {
                  objc_enumerationMutation(v57);
                }
                uint64_t v191 = v58;
                v203 = *(void **)(*((void *)&v296 + 1) + 8 * v58);
                long long v292 = 0u;
                long long v293 = 0u;
                long long v294 = 0u;
                long long v295 = 0u;
                id v195 = v183;
                id v207 = [v195 countByEnumeratingWithState:&v292 objects:v354 count:16];
                if (v207)
                {
                  uint64_t v199 = *(void *)v293;
                  do
                  {
                    uint64_t v59 = 0;
                    do
                    {
                      if (*(void *)v293 != v199) {
                        objc_enumerationMutation(v195);
                      }
                      uint64_t v211 = v59;
                      uint64_t v60 = *(void *)(*((void *)&v292 + 1) + 8 * v59);
                      long long v288 = 0u;
                      long long v289 = 0u;
                      long long v290 = 0u;
                      long long v291 = 0u;
                      id v215 = v203;
                      id v223 = [v215 countByEnumeratingWithState:&v288 objects:v353 count:16];
                      if (v223)
                      {
                        uint64_t v219 = *(void *)v289;
                        do
                        {
                          uint64_t v61 = 0;
                          do
                          {
                            if (*(void *)v289 != v219) {
                              objc_enumerationMutation(v215);
                            }
                            uint64_t v227 = v61;
                            uint64_t v62 = *(void *)(*((void *)&v288 + 1) + 8 * v61);
                            long long v284 = 0u;
                            long long v285 = 0u;
                            long long v286 = 0u;
                            long long v287 = 0u;
                            v63 = [v231 interactions];
                            id v64 = [v63 countByEnumeratingWithState:&v284 objects:v352 count:16];
                            if (v64)
                            {
                              id v65 = v64;
                              uint64_t v66 = *(void *)v285;
                              do
                              {
                                for (m = 0; m != v65; m = (char *)m + 1)
                                {
                                  if (*(void *)v285 != v66) {
                                    objc_enumerationMutation(v63);
                                  }
                                  uint64_t v68 = *(void *)(*((void *)&v284 + 1) + 8 * (void)m);
                                  v69 = [v231 interactions];
                                  v70 = [v69 objectForKeyedSubscript:v68];

                                  v71 = [SKGInteractionEdge alloc];
                                  id v72 = [v231 bundleIdentifier];
                                  uint64_t v73 = [(SKGInteractionEdge *)v71 initWithSourceNode:v60 targetNode:v62 domainIdentifier:v72 relationship:v68 score:v70];

                                  [v230 addObject:v73];
                                }
                                id v65 = [v63 countByEnumeratingWithState:&v284 objects:v352 count:16];
                              }
                              while (v65);
                            }

                            uint64_t v61 = v227 + 1;
                          }
                          while ((id)(v227 + 1) != v223);
                          id v223 = [v215 countByEnumeratingWithState:&v288 objects:v353 count:16];
                        }
                        while (v223);
                      }

                      uint64_t v59 = v211 + 1;
                    }
                    while ((id)(v211 + 1) != v207);
                    id v207 = [v195 countByEnumeratingWithState:&v292 objects:v354 count:16];
                  }
                  while (v207);
                }

                uint64_t v58 = v191 + 1;
                id v57 = v179;
              }
              while ((id)(v191 + 1) != v187);
              id v187 = [v179 countByEnumeratingWithState:&v296 objects:v355 count:16];
            }
            while (v187);
          }

          uint64_t v56 = v167 + 1;
          id v41 = v171;
        }
        while ((id)(v167 + 1) != v163);
        id v163 = [v157 countByEnumeratingWithState:&v300 objects:v356 count:16];
      }
      while (v163);
LABEL_164:
      id v41 = v57;
LABEL_165:
      id v77 = v157;

      goto LABEL_166;
    }
  }
  else
  {
  }
  v74 = [v231 authors];
  if ([v74 count])
  {

    goto LABEL_105;
  }
  v75 = [v231 recipients];
  id v76 = [v75 count];

  if (v76)
  {
LABEL_105:
    id v77 = (id)objc_opt_new();
    id v41 = (id)objc_opt_new();
    v78 = [v231 authors];
    id v79 = [v78 count];

    if (v79)
    {
      v80 = +[SKGUserNode user];
      v351 = v80;
      v81 = +[NSArray arrayWithObjects:&v351 count:1];
      [v41 addObject:v81];

      long long v283 = 0u;
      long long v282 = 0u;
      long long v281 = 0u;
      long long v280 = 0u;
      v82 = [v231 authors];
      id v83 = [v82 countByEnumeratingWithState:&v280 objects:v350 count:16];
      if (v83)
      {
        id v84 = v83;
        uint64_t v85 = *(void *)v281;
        do
        {
          for (n = 0; n != v84; n = (char *)n + 1)
          {
            if (*(void *)v281 != v85) {
              objc_enumerationMutation(v82);
            }
            v87 = [(SpotlightGraph *)self primaryNodesForPerson:*(void *)(*((void *)&v280 + 1) + 8 * (void)n) reference:v155 domain:v154 nodes:v153 edges:v230 isOwner:0];
            if (v87) {
              [v77 addObject:v87];
            }
          }
          id v84 = [v82 countByEnumeratingWithState:&v280 objects:v350 count:16];
        }
        while (v84);
      }
    }
    else
    {
      id v88 = [v231 recipients];
      id v89 = [v88 count];

      if (!v89) {
        goto LABEL_127;
      }
      uint64_t v90 = +[SKGUserNode user];
      v349 = v90;
      v91 = +[NSArray arrayWithObjects:&v349 count:1];
      [v77 addObject:v91];

      long long v278 = 0u;
      long long v279 = 0u;
      long long v276 = 0u;
      long long v277 = 0u;
      v82 = [v231 recipients];
      id v92 = [v82 countByEnumeratingWithState:&v276 objects:v348 count:16];
      if (v92)
      {
        id v93 = v92;
        uint64_t v94 = *(void *)v277;
        do
        {
          for (ii = 0; ii != v93; ii = (char *)ii + 1)
          {
            if (*(void *)v277 != v94) {
              objc_enumerationMutation(v82);
            }
            id v96 = [(SpotlightGraph *)self primaryNodesForPerson:*(void *)(*((void *)&v276 + 1) + 8 * (void)ii) reference:v155 domain:v154 nodes:v153 edges:v230 isOwner:0];
            if (v96) {
              [v41 addObject:v96];
            }
          }
          id v93 = [v82 countByEnumeratingWithState:&v276 objects:v348 count:16];
        }
        while (v93);
      }
    }

LABEL_127:
    if (![v77 count] || !objc_msgSend(v41, "count")) {
      goto LABEL_166;
    }
    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    id v157 = v77;
    id v164 = [v157 countByEnumeratingWithState:&v272 objects:v347 count:16];
    if (!v164) {
      goto LABEL_165;
    }
    uint64_t v160 = *(void *)v273;
    id v172 = v41;
    do
    {
      uint64_t v97 = 0;
      do
      {
        if (*(void *)v273 != v160) {
          objc_enumerationMutation(v157);
        }
        uint64_t v168 = v97;
        v184 = *(void **)(*((void *)&v272 + 1) + 8 * v97);
        long long v268 = 0u;
        long long v269 = 0u;
        long long v270 = 0u;
        long long v271 = 0u;
        id v57 = v41;
        id v188 = [v57 countByEnumeratingWithState:&v268 objects:v346 count:16];
        if (v188)
        {
          id v176 = *(id *)v269;
          v180 = v57;
          do
          {
            uint64_t v98 = 0;
            do
            {
              if (*(id *)v269 != v176) {
                objc_enumerationMutation(v57);
              }
              uint64_t v192 = v98;
              v204 = *(void **)(*((void *)&v268 + 1) + 8 * v98);
              long long v264 = 0u;
              long long v265 = 0u;
              long long v266 = 0u;
              long long v267 = 0u;
              id v196 = v184;
              id v208 = [v196 countByEnumeratingWithState:&v264 objects:v345 count:16];
              if (v208)
              {
                uint64_t v200 = *(void *)v265;
                do
                {
                  uint64_t v99 = 0;
                  do
                  {
                    if (*(void *)v265 != v200) {
                      objc_enumerationMutation(v196);
                    }
                    uint64_t v212 = v99;
                    uint64_t v100 = *(void *)(*((void *)&v264 + 1) + 8 * v99);
                    long long v260 = 0u;
                    long long v261 = 0u;
                    long long v262 = 0u;
                    long long v263 = 0u;
                    id v216 = v204;
                    id v224 = [v216 countByEnumeratingWithState:&v260 objects:v344 count:16];
                    if (v224)
                    {
                      uint64_t v220 = *(void *)v261;
                      do
                      {
                        uint64_t v101 = 0;
                        do
                        {
                          if (*(void *)v261 != v220) {
                            objc_enumerationMutation(v216);
                          }
                          uint64_t v228 = v101;
                          uint64_t v102 = *(void *)(*((void *)&v260 + 1) + 8 * v101);
                          long long v256 = 0u;
                          long long v257 = 0u;
                          long long v258 = 0u;
                          long long v259 = 0u;
                          id v103 = [v231 interactions];
                          id v104 = [v103 countByEnumeratingWithState:&v256 objects:v343 count:16];
                          if (v104)
                          {
                            id v105 = v104;
                            uint64_t v106 = *(void *)v257;
                            do
                            {
                              for (jj = 0; jj != v105; jj = (char *)jj + 1)
                              {
                                if (*(void *)v257 != v106) {
                                  objc_enumerationMutation(v103);
                                }
                                uint64_t v108 = *(void *)(*((void *)&v256 + 1) + 8 * (void)jj);
                                v109 = [v231 interactions];
                                v110 = [v109 objectForKeyedSubscript:v108];

                                id v111 = [SKGInteractionEdge alloc];
                                id v112 = [v231 bundleIdentifier];
                                uint64_t v113 = [(SKGInteractionEdge *)v111 initWithSourceNode:v100 targetNode:v102 domainIdentifier:v112 relationship:v108 score:v110];

                                [v230 addObject:v113];
                              }
                              id v105 = [v103 countByEnumeratingWithState:&v256 objects:v343 count:16];
                            }
                            while (v105);
                          }

                          uint64_t v101 = v228 + 1;
                        }
                        while ((id)(v228 + 1) != v224);
                        id v224 = [v216 countByEnumeratingWithState:&v260 objects:v344 count:16];
                      }
                      while (v224);
                    }

                    uint64_t v99 = v212 + 1;
                  }
                  while ((id)(v212 + 1) != v208);
                  id v208 = [v196 countByEnumeratingWithState:&v264 objects:v345 count:16];
                }
                while (v208);
              }

              uint64_t v98 = v192 + 1;
              id v57 = v180;
            }
            while ((id)(v192 + 1) != v188);
            id v188 = [v180 countByEnumeratingWithState:&v268 objects:v346 count:16];
          }
          while (v188);
        }

        uint64_t v97 = v168 + 1;
        id v41 = v172;
      }
      while ((id)(v168 + 1) != v164);
      id v164 = [v157 countByEnumeratingWithState:&v272 objects:v347 count:16];
    }
    while (v164);
    goto LABEL_164;
  }
  v114 = [v231 participants];

  if (!v114) {
    goto LABEL_167;
  }
  id v115 = objc_alloc_init((Class)NSMutableArray);
  v116 = +[SKGUserNode user];
  v342 = v116;
  v117 = +[NSArray arrayWithObjects:&v342 count:1];
  [v115 addObject:v117];

  long long v254 = 0u;
  long long v255 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  id v118 = [v231 participants];
  id v119 = [v118 countByEnumeratingWithState:&v252 objects:v341 count:16];
  if (v119)
  {
    id v120 = v119;
    uint64_t v121 = *(void *)v253;
    do
    {
      for (kk = 0; kk != v120; kk = (char *)kk + 1)
      {
        if (*(void *)v253 != v121) {
          objc_enumerationMutation(v118);
        }
        v123 = [(SpotlightGraph *)self primaryNodesForPerson:*(void *)(*((void *)&v252 + 1) + 8 * (void)kk) reference:v155 domain:v154 nodes:v153 edges:v230 isOwner:0];
        if (v123) {
          [v115 addObject:v123];
        }
      }
      id v120 = [v118 countByEnumeratingWithState:&v252 objects:v341 count:16];
    }
    while (v120);
  }

  long long v250 = 0u;
  long long v251 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  id v77 = v115;
  v169 = (char *)[v77 countByEnumeratingWithState:&v248 objects:v340 count:16];
  if (v169)
  {
    uint64_t v161 = *(void *)v249;
    uint64_t v165 = v77;
    do
    {
      v124 = 0;
      do
      {
        if (*(void *)v249 != v161)
        {
          id v125 = v124;
          objc_enumerationMutation(v165);
          v124 = v125;
        }
        id v177 = v124;
        id v126 = *(void **)(*((void *)&v248 + 1) + 8 * (void)v124);
        long long v244 = 0u;
        long long v245 = 0u;
        long long v246 = 0u;
        long long v247 = 0u;
        id v41 = v165;
        id v127 = [v41 countByEnumeratingWithState:&v244 objects:v339 count:16];
        if (v127)
        {
          id v128 = v127;
          uint64_t v129 = *(void *)v245;
          id v173 = v41;
          uint64_t v181 = *(void *)v245;
          v185 = v126;
          do
          {
            v130 = 0;
            id v189 = v128;
            do
            {
              if (*(void *)v245 != v129) {
                objc_enumerationMutation(v41);
              }
              v205 = *(void **)(*((void *)&v244 + 1) + 8 * (void)v130);
              if ((objc_msgSend(v126, "isEqualToArray:") & 1) == 0)
              {
                char v193 = v130;
                long long v242 = 0u;
                long long v243 = 0u;
                long long v240 = 0u;
                long long v241 = 0u;
                id v197 = v126;
                id v209 = [v197 countByEnumeratingWithState:&v240 objects:v338 count:16];
                if (v209)
                {
                  uint64_t v201 = *(void *)v241;
                  do
                  {
                    uint64_t v131 = 0;
                    do
                    {
                      if (*(void *)v241 != v201) {
                        objc_enumerationMutation(v197);
                      }
                      uint64_t v213 = v131;
                      uint64_t v132 = *(void *)(*((void *)&v240 + 1) + 8 * v131);
                      long long v236 = 0u;
                      long long v237 = 0u;
                      long long v238 = 0u;
                      long long v239 = 0u;
                      id v217 = v205;
                      id v225 = [v217 countByEnumeratingWithState:&v236 objects:v337 count:16];
                      if (v225)
                      {
                        uint64_t v221 = *(void *)v237;
                        do
                        {
                          uint64_t v133 = 0;
                          do
                          {
                            if (*(void *)v237 != v221) {
                              objc_enumerationMutation(v217);
                            }
                            uint64_t v229 = v133;
                            uint64_t v134 = *(void *)(*((void *)&v236 + 1) + 8 * v133);
                            long long v232 = 0u;
                            long long v233 = 0u;
                            long long v234 = 0u;
                            long long v235 = 0u;
                            id v135 = [v231 interactions];
                            id v136 = [v135 countByEnumeratingWithState:&v232 objects:v336 count:16];
                            if (v136)
                            {
                              id v137 = v136;
                              uint64_t v138 = *(void *)v233;
                              do
                              {
                                for (mm = 0; mm != v137; mm = (char *)mm + 1)
                                {
                                  if (*(void *)v233 != v138) {
                                    objc_enumerationMutation(v135);
                                  }
                                  uint64_t v140 = *(void *)(*((void *)&v232 + 1) + 8 * (void)mm);
                                  v141 = [v231 interactions];
                                  id v142 = [v141 objectForKeyedSubscript:v140];

                                  v143 = [SKGInteractionEdge alloc];
                                  uint64_t v144 = [v231 bundleIdentifier];
                                  v145 = [(SKGInteractionEdge *)v143 initWithSourceNode:v132 targetNode:v134 domainIdentifier:v144 relationship:v140 score:v142];

                                  [v230 addObject:v145];
                                }
                                id v137 = [v135 countByEnumeratingWithState:&v232 objects:v336 count:16];
                              }
                              while (v137);
                            }

                            uint64_t v133 = v229 + 1;
                          }
                          while ((id)(v229 + 1) != v225);
                          id v225 = [v217 countByEnumeratingWithState:&v236 objects:v337 count:16];
                        }
                        while (v225);
                      }

                      uint64_t v131 = v213 + 1;
                    }
                    while ((id)(v213 + 1) != v209);
                    id v209 = [v197 countByEnumeratingWithState:&v240 objects:v338 count:16];
                  }
                  while (v209);
                }

                id v41 = v173;
                uint64_t v129 = v181;
                id v126 = v185;
                id v128 = v189;
                v130 = v193;
              }
              v130 = (char *)v130 + 1;
            }
            while (v130 != v128);
            id v128 = [v41 countByEnumeratingWithState:&v244 objects:v339 count:16];
          }
          while (v128);
        }

        v124 = v177 + 1;
      }
      while (v177 + 1 != v169);
      id v77 = v41;
      v169 = (char *)[v41 countByEnumeratingWithState:&v248 objects:v340 count:16];
    }
    while (v169);
  }
  else
  {
    id v41 = v77;
  }
LABEL_166:

LABEL_167:
}

- (BOOL)addItem:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, const __CFString *))a4;
  if (![(SpotlightGraph *)self available])
  {
    unsigned __int8 v31 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [v6 referenceIdentifier];
  if (!v8)
  {
LABEL_12:
    unsigned __int8 v31 = 1;
    goto LABEL_13;
  }
  int64_t v9 = (void *)v8;
  uint64_t v10 = [v6 bundleIdentifier];
  if (!v10)
  {
LABEL_11:

    goto LABEL_12;
  }
  unsigned int v11 = (void *)v10;
  uint64_t v12 = [v6 personaIdentifier];
  if (!v12)
  {

    goto LABEL_11;
  }
  uint64_t v13 = (void *)v12;
  uint64_t v14 = [v6 protectionClass];

  if (!v14) {
    goto LABEL_12;
  }
  id v15 = [v6 referenceIdentifier];
  id v16 = [v6 bundleIdentifier];
  id v17 = [v6 personaIdentifier];
  id v18 = [v6 protectionClass];
  uint64_t v19 = [(SpotlightGraph *)self referenceIdentifierWithReference:v15 domain:v16 persona:v17 protectionClass:v18];

  id v20 = objc_alloc_init((Class)NSMutableSet);
  id v21 = objc_alloc_init((Class)NSMutableSet);
  id v41 = (void *)v19;
  uint64_t v22 = [[SKGReferenceNode alloc] initWithReference:v19];
  [v20 addObject:v22];
  uint64_t v23 = [SKGPersonaNode alloc];
  uint64_t v24 = [v6 personaIdentifier];
  uint64_t v25 = [(SKGPersonaNode *)v23 initWithPersona:v24];

  [v20 addObject:v25];
  v26 = [SKGDomainNode alloc];
  id v27 = [v6 bundleIdentifier];
  id v28 = [(SKGDomainNode *)v26 initWithDomain:v27];

  [v20 addObject:v28];
  id v39 = +[SKGDomainEdge edgeFromDomain:v28 toNode:v25];
  objc_msgSend(v21, "addObject:");
  v38 = +[SKGPersonaEdge edgeFromPersona:v25 toNode:v28];
  objc_msgSend(v21, "addObject:");
  v37 = +[SKGPersonaEdge edgeFromPersona:v25 toNode:v22];
  objc_msgSend(v21, "addObject:");
  uint64_t v29 = +[SKGReferenceEdge edgeFromReference:v22 toNode:v25];
  [v21 addObject:v29];
  v30 = v22;
  [(SpotlightGraph *)self peopleUpdateFromItem:v6 reference:v22 domain:v28 nodes:v20 edges:v21];
  if (v7 && (v7[2](v7, @"addItem") & 1) != 0)
  {
    unsigned __int8 v31 = 1;
  }
  else
  {
    graph = self->_graph;
    [v20 allObjects];
    id v34 = v36 = v20;
    v35 = [v21 allObjects];
    unsigned __int8 v31 = [(SKGGraph *)graph addNodes:v34 addEdges:v35 cancelBlock:v7];

    id v20 = v36;
  }

LABEL_13:

  return v31;
}

- (BOOL)addPerson:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SpotlightGraph *)self available])
  {
    id v8 = objc_alloc_init((Class)NSMutableSet);
    id v9 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v10 = [v6 person];
    id v11 = [(SpotlightGraph *)self primaryNodesForPerson:v10 reference:0 domain:0 nodes:v8 edges:v9 isOwner:0];

    graph = self->_graph;
    uint64_t v14 = [v8 allObjects];
    id v15 = [v9 allObjects];
    unsigned __int8 v16 = [(SKGGraph *)graph addNodes:v14 addEdges:v15 cancelBlock:v7];
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (BOOL)deleteDomainIdentifier:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, const __CFString *))a4;
  if (![(SpotlightGraph *)self available])
  {
    LOBYTE(v12) = 0;
    goto LABEL_8;
  }
  id v9 = self->_graph;
  uint64_t v10 = +[SKGDomains domainsWithDomain:v6 inGraph:v9];
  id v11 = [v10 personas];
  unsigned int v12 = [(SKGGraph *)v9 removeNodeSet:v11 removeEdgeSet:0 cancelBlock:v7];

  if (v7)
  {
    if (v7[2](v7, @"deleteDomainIdentifier") & 1) != 0 || ((v12 ^ 1)) {
      goto LABEL_6;
    }
  }
  else if (!v12)
  {
    goto LABEL_6;
  }
  LOBYTE(v12) = [(SKGGraph *)v9 removeNodeSet:v10 removeEdgeSet:0 cancelBlock:v7];
LABEL_6:

LABEL_8:

  return v12;
}

- (BOOL)deleteDomainIdentifier:(id)a3 personaIdentifier:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (uint64_t (**)(id, const __CFString *))a5;
  if (![(SpotlightGraph *)self available])
  {
    LOBYTE(v16) = 0;
    goto LABEL_23;
  }
  id v11 = self->_graph;
  unsigned int v12 = +[SKGDomains domainsWithDomain:v8 inGraph:v11];
  uint64_t v13 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_1000126F4;
  v37 = sub_100012598;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  do
  {
    if (v13)
    {
      unsigned int v14 = [(SKGGraph *)v11 removeNodeSet:v13 removeEdgeSet:0 cancelBlock:v10];
      id v15 = (void *)v34[5];
      v34[5] = 0;

      if (v10)
      {
        BOOL v16 = v14;
LABEL_7:
        int v17 = v10[2](v10, @"deleteDomainIdentifier");
        *((unsigned char *)v30 + 24) = v17 ^ 1;
        if ((v17 | !v16)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      LOBYTE(v16) = 1;
      *((unsigned char *)v30 + 24) = 1;
      if (!v14)
      {
        LOBYTE(v16) = 0;
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v16 = 1;
      if (v10) {
        goto LABEL_7;
      }
      *((unsigned char *)v30 + 24) = 1;
    }
LABEL_12:
    id v18 = [v12 personas];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000755D8;
    v24[3] = &unk_1000DBCB8;
    uint64_t v19 = v11;
    uint64_t v25 = v19;
    id v26 = v9;
    id v27 = &v33;
    id v28 = &v29;
    [v18 enumeratePersonasInGraph:v19 usingBlock:v24];

    if (v10) {
      char v20 = v10[2](v10, @"deleteDomainIdentifier") ^ 1;
    }
    else {
      char v20 = 1;
    }
    *((unsigned char *)v30 + 24) = v20;

LABEL_16:
    uint64_t v13 = v34[5];
    if (!v13) {
      break;
    }
  }
  while (*((unsigned char *)v30 + 24) && v16);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

LABEL_23:

  return v16;
}

- (BOOL)deleteReferences:(id)a3 domainIdentifier:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v23 = a4;
  id v9 = (uint64_t (**)(id, const __CFString *))a5;
  if ([(SpotlightGraph *)self available])
  {
    uint64_t v10 = self->_graph;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v8;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      unsigned __int8 v14 = 1;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = [(SpotlightGraph *)self referenceIdentifierWithReference:*(void *)(*((void *)&v24 + 1) + 8 * v15) domain:v23 persona:0 protectionClass:0];
        int v17 = +[SKGReferences referencesWithReference:v16 inGraph:v10];
        if ([v17 count]) {
          unsigned __int8 v14 = [(SKGGraph *)v10 removeNodeSet:v17 removeEdgeSet:0 cancelBlock:v9];
        }
        char v18 = v9 ? v9[2](v9, @"deleteReferences") : 0;

        if (v14 & 1) == 0 || (v18) {
          break;
        }
        if (v12 == (id)++v15)
        {
          id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      unsigned __int8 v14 = 1;
    }

    id v8 = v21;
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)deleteReferences:(id)a3 personaIdentifier:(id)a4 protectionClass:(id)a5 domainIdentifier:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v38 = a6;
  uint64_t v15 = (uint64_t (**)(id, const __CFString *))a7;
  if ([(SpotlightGraph *)self available])
  {
    id v35 = v14;
    v37 = self->_graph;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v12;
    id v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v16)
    {
      id v17 = v16;
      id v32 = v13;
      id v33 = v12;
      uint64_t v18 = *(void *)v40;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        char v20 = self;
        id v21 = -[SpotlightGraph referenceIdentifierWithReference:domain:persona:protectionClass:](self, "referenceIdentifierWithReference:domain:persona:protectionClass:", *(void *)(*((void *)&v39 + 1) + 8 * (void)v19), v38, 0, 0, v32, v33, context);
        uint64_t v22 = +[SKGReferences referencesWithReference:v21 inGraph:v37];
        unsigned int v23 = [(SKGGraph *)v37 removeNodeSet:v22 removeEdgeSet:0 cancelBlock:v15];
        int v24 = v15 ? v15[2](v15, @"deleteReferences") ^ 1 : 1;

        if ((v23 & v24) != 1) {
          break;
        }
        uint64_t v19 = (char *)v19 + 1;
        self = v20;
        if (v17 == v19)
        {
          id v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v17) {
            goto LABEL_4;
          }
          unsigned int v23 = 1;
          int v24 = 1;
          break;
        }
      }
      id v13 = v32;
      id v12 = v33;
    }
    else
    {
      unsigned int v23 = 1;
      int v24 = 1;
    }

    if (v13 && v24 && v23)
    {
      long long v25 = +[SKGDomains domainsWithDomain:v38 inGraph:v37];
      long long v26 = [v25 personasWithPersona:v13 inGraph:v37];
      long long v27 = [v26 references];
      id v28 = [v27 count];

      if (!v28) {
        unsigned int v23 = [(SKGGraph *)v37 removeNodeSet:v26 removeEdgeSet:0 cancelBlock:v15];
      }
      uint64_t v29 = [v25 personas];
      id v30 = [v29 count];

      if (!v30 && v23) {
        LOBYTE(v23) = [(SKGGraph *)v37 removeNodeSet:v25 removeEdgeSet:0 cancelBlock:v15];
      }
    }
    id v14 = v35;
  }
  else
  {
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (BOOL)containsReference:(id)a3 personaIdentifier:(id)a4 protectionClass:(id)a5 domainIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(SpotlightGraph *)self available])
  {
    uint64_t v15 = self->_graph;
    id v16 = [(SpotlightGraph *)self referenceIdentifierWithReference:v10 domain:v13 persona:0 protectionClass:0];
    id v17 = +[SKGReferences referencesWithReference:v16 inGraph:v15];

    BOOL v18 = [v17 count] != 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)hasPeople
{
  if (![(SpotlightGraph *)self available]) {
    return 0;
  }
  id v4 = +[SKGNodes nodesInGraph:self->_graph];
  id v5 = [v4 count];

  if (v5) {
    BOOL v6 = self->_peopleScores != 0;
  }
  else {
    BOOL v6 = 0;
  }
  return v6;
}

- (int64_t)personCount
{
  if (![(SpotlightGraph *)self available]) {
    return -1;
  }
  id v4 = +[SKGNodes nodesInGraph:self->_graph];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)nameCount
{
  if (![(SpotlightGraph *)self available]) {
    return -1;
  }
  id v4 = +[SKGNodes nodesInGraph:self->_graph];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)emailCount
{
  if (![(SpotlightGraph *)self available]) {
    return -1;
  }
  id v4 = +[SKGNodes nodesInGraph:self->_graph];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)phoneCount
{
  if (![(SpotlightGraph *)self available]) {
    return -1;
  }
  id v4 = +[SKGNodes nodesInGraph:self->_graph];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)cachedPeopleScoresPath
{
  v2 = [(SKGConfig *)self->_config resourcePath];
  objc_super v3 = +[NSString stringWithFormat:@"%@/%@", v2, @"cachedPeopleScores"];
  id v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (BOOL)peopleUpdateNetwork:(void *)a3 sourceNodeId:(unsigned int)a4 nodes:(id)a5
{
  id v8 = a5;
  id v10 = self->_graph;
  unsigned int v11 = [(SKGGraph *)v10 available];
  if (v11)
  {
    id v12 = +[SKGInteractionEdge filter];
    id v13 = +[SKGInteractionEdges edgesFromNodes:v8 matchingFilter:v12];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100076110;
    v16[3] = &unk_1000DBD08;
    unsigned int v19 = a4;
    id v17 = v10;
    BOOL v18 = a3;
    id v14 = v10;
    [v13 enumerateEdgesUsingBlock:v16];
  }
  else
  {
  }

  return v11;
}

- (BOOL)peopleScoreWithCancelBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  BOOL v6 = self->_graph;
  if ([(SKGGraph *)v6 available])
  {
    id v7 = +[SKGNodes nodesInGraph:v6];
    if ([v7 count])
    {
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x2020000000;
      v10[3] = 0;
      sub_100018E6C();
    }
    int v8 = 0;
  }
  else
  {
    LOBYTE(self) = 0;
    int v8 = 1;
  }

  if (!v8) {
    LOBYTE(self) = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return self & 1;
}

- (BOOL)findAllContactInfoForNode:(id)a3 info:(id)a4 reference:(id)a5 foundUser:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v14 = self->_graph;
  unsigned int v15 = [(SKGGraph *)v14 available];
  if (v15)
  {
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    id v16 = [v10 users];
    id v17 = [v16 count];

    if (v17) {
      *((unsigned char *)v71 + 24) = 1;
    }
    BOOL v18 = [v10 names];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100077548;
    v65[3] = &unk_1000DBE70;
    id v19 = v12;
    id v66 = v19;
    id v20 = v11;
    id v67 = v20;
    v69 = &v70;
    id v21 = v14;
    uint64_t v68 = v21;
    [v18 enumerateNamesInGraph:v21 usingBlock:v65];

    uint64_t v22 = [v10 displayNames];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100077808;
    v60[3] = &unk_1000DBE98;
    id v23 = v19;
    id v61 = v23;
    id v24 = v20;
    id v62 = v24;
    long long v25 = v21;
    v63 = v25;
    id v64 = &v70;
    [v22 enumerateDisplayNamesInGraph:v25 usingBlock:v60];

    long long v26 = [v10 contacts];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100077A98;
    v55[3] = &unk_1000DBEC0;
    id v27 = v23;
    id v56 = v27;
    id v28 = v24;
    id v57 = v28;
    uint64_t v59 = &v70;
    uint64_t v29 = v25;
    uint64_t v58 = v29;
    [v26 enumerateContactsInGraph:v29 usingBlock:v55];

    id v30 = [v10 photos];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100077D58;
    v50[3] = &unk_1000DBEE8;
    id v31 = v27;
    id v51 = v31;
    id v32 = v28;
    id v52 = v32;
    v54 = &v70;
    id v33 = v29;
    uint64_t v53 = v33;
    [v30 enumeratePhotosInGraph:v33 usingBlock:v50];

    id v34 = [v10 emails];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100078018;
    v45[3] = &unk_1000DBF10;
    id v35 = v31;
    id v46 = v35;
    id v36 = v32;
    id v47 = v36;
    v49 = &v70;
    v37 = v33;
    v48 = v37;
    [v34 enumerateEmailsInGraph:v37 usingBlock:v45];

    id v38 = [v10 phones];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000782D8;
    v40[3] = &unk_1000DBF38;
    id v41 = v35;
    id v42 = v36;
    v44 = &v70;
    char v14 = v37;
    v43 = v14;
    [v38 enumeratePhonesInGraph:v14 usingBlock:v40];

    if (a6) {
      *a6 = *((unsigned char *)v71 + 24);
    }

    _Block_object_dispose(&v70, 8);
  }

  return v15;
}

- (BOOL)peopleAnalyzeWithCancelBlock:(id)a3
{
  id v5 = (char *)a3;
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 1;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 1;
  id v7 = self->_graph;
  if ([(SKGGraph *)v7 available])
  {
    if ([(SKGGraph *)v7 nodeCount])
    {
      int v8 = +[SKGNodes nodesInGraph:v7];
      unsigned __int8 v9 = [(SKGGraph *)v7 removeNodeSet:v8 removeEdgeSet:0 cancelBlock:v5];
      id v10 = v62;
      *((unsigned char *)v62 + 24) = v9;
      if (v5)
      {
        int v11 = (*((uint64_t (**)(char *, const __CFString *))v5 + 2))(v5, @"analyzePeopleWithCancelBlock") ^ 1;
        id v10 = v62;
      }
      else
      {
        int v11 = 1;
      }
      *((unsigned char *)v58 + 24) = v11;
      int v13 = *((unsigned __int8 *)v10 + 24);
      BOOL v3 = v13 != 0;
      if (v13) {
        int v12 = v11;
      }
      else {
        int v12 = 0;
      }
      if (v12)
      {
        uint64_t Mutable = SIGeneralTrieCreateMutable();
        uint64_t v51 = 0;
        id v52 = &v51;
        uint64_t v53 = 0x3032000000;
        v54 = sub_1000126F4;
        v55 = sub_100012598;
        id v56 = 0;
        BOOL v27 = v3;
        id v28 = v8;
        uint64_t v29 = v6;
        id v56 = objc_alloc_init((Class)NSMutableSet);
        uint64_t v45 = 0;
        id v46 = &v45;
        uint64_t v47 = 0x3032000000;
        v48 = sub_1000126F4;
        v49 = sub_100012598;
        id v50 = 0;
        id v50 = objc_alloc_init((Class)NSMutableSet);
        uint64_t v41 = 0;
        id v42 = &v41;
        uint64_t v43 = 0x2020000000;
        char v14 = (uint64_t (**)(id, const __CFString *))(v5 + 16);
        char v44 = 0;
        unsigned int v15 = &v41;
        while (1)
        {
          *((unsigned char *)v15 + 24) = 0;
          id v16 = +[SKGNodes nodesInGraph:v7];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100078AD0;
          v31[3] = &unk_1000DBF60;
          id v17 = v7;
          uint64_t v40 = Mutable;
          id v32 = v17;
          id v33 = self;
          id v35 = &v61;
          id v36 = &v57;
          BOOL v18 = v5;
          id v34 = v18;
          v37 = &v51;
          id v38 = &v45;
          long long v39 = &v41;
          [v16 enumerateNamesInGraph:v17 usingBlock:v31];
          if (!*((unsigned char *)v58 + 24) || !*((unsigned char *)v62 + 24)) {
            break;
          }
          if ([(id)v46[5] count] || objc_msgSend((id)v52[5], "count"))
          {
            id v19 = [(id)v52[5] allObjects];
            id v20 = [(id)v46[5] allObjects];
            unsigned __int8 v21 = [(SKGGraph *)v17 addNodes:v19 addEdges:v20 cancelBlock:v18];
            *((unsigned char *)v62 + 24) = v21;

            if (v5) {
              int v22 = (*v14)(v18, @"analyzePeopleWithCancelBlock") ^ 1;
            }
            else {
              int v22 = 1;
            }
            *((unsigned char *)v58 + 24) = v22;
            if (*((unsigned char *)v62 + 24) && v22)
            {
              unsigned __int8 v23 = [(SKGGraph *)v17 flushWithCancelBlock:v18];
              *((unsigned char *)v62 + 24) = v23;
              if (v5) {
                char v24 = (*v14)(v18, @"analyzePeopleWithCancelBlock") ^ 1;
              }
              else {
                char v24 = 1;
              }
              *((unsigned char *)v58 + 24) = v24;
            }
            [(id)v46[5] removeAllObjects];
            [(id)v52[5] removeAllObjects];
            if (!*((unsigned char *)v58 + 24) || !*((unsigned char *)v62 + 24)) {
              break;
            }
          }

          unsigned int v15 = v42;
          if (!*((unsigned char *)v42 + 24)) {
            goto LABEL_31;
          }
        }

LABEL_31:
        SIGeneralTrieRelease();
        unsigned __int8 v25 = [(SKGGraph *)v17 commitWithCancelBlock:0];
        *((unsigned char *)v62 + 24) = v25;
        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v45, 8);

        _Block_object_dispose(&v51, 8);
        int v8 = v28;
        BOOL v6 = v29;
        BOOL v3 = v27;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
    int v12 = 0;
  }

  if (v12)
  {
    if (*((unsigned char *)v62 + 24)) {
      BOOL v3 = *((unsigned char *)v58 + 24) != 0;
    }
    else {
      BOOL v3 = 0;
    }
  }
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v3;
}

- (BOOL)peopleUpdateInfo:(id)a3 attributeKey:(id)a4 attribute:(id)a5 forNode:(id)a6 person:(id)a7 score:(id)a8 rank:(id)a9 bestCount:(unint64_t *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  char v24 = self->_graph;
  unsigned int v25 = [(SKGGraph *)v24 available];
  BOOL v26 = v25;
  if (v25)
  {
    context = v23;
    char v70 = v25;
    id v72 = v20;
    BOOL v27 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];

    if (!v27)
    {
      id v28 = +[NSMutableDictionary dictionary];
      [v16 setObject:v28 forKey:@"com.apple.spotlight"];
    }
    uint64_t v29 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
    id v30 = [v29 objectForKeyedSubscript:@"score"];

    id v31 = v17;
    if (!v30)
    {
      id v32 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
      [v32 setObject:v21 forKey:@"score"];
    }
    id v33 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
    id v34 = [v33 objectForKeyedSubscript:@"rank"];

    if (!v34)
    {
      id v35 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
      [v35 setObject:v22 forKey:@"rank"];
    }
    id v69 = v22;
    id v71 = v21;
    id v73 = v18;
    id v36 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
    v37 = [v36 objectForKeyedSubscript:v17];

    if (!v37)
    {
      id v38 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
      long long v39 = +[NSMutableArray array];
      [v38 setObject:v39 forKey:v17];
    }
    uint64_t v40 = +[SKGInteractionEdge filter];
    uint64_t v41 = +[SKGInteractionEdges edgesFromNodes:v19 matchingFilter:v40];
    id v66 = [v41 count];

    id v42 = +[SKGInteractionEdge filter];
    uint64_t v43 = +[SKGInteractionEdges edgesToNodes:v19 matchingFilter:v42];
    id v64 = [v43 count];

    char v44 = [v19 references];
    id v45 = [v44 count];

    id v46 = [v19 persons];
    id v47 = [v46 count];
    BOOL v67 = v47 != (id)1;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v48 = a10 ? *a10 : 0;
      if ((unint64_t)v45 > v48)
      {
        v49 = [v19 displayNames];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_10007988C;
        v81[3] = &unk_1000DBF88;
        v82 = v24;
        id v83 = v16;
        id v84 = a10;
        id v85 = v45;
        [v49 enumerateDisplayNamesInGraph:v82 usingBlock:v81];
      }
    }
    id v50 = +[SKGNode nodeWithElementIdentifier:inGraph:](SKGNode, "nodeWithElementIdentifier:inGraph:", objc_msgSend(v19, "nodeIdentifier", v64), v24);
    uint64_t v51 = [v50 value];

    id v52 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v53 = v52;
    if (v51) {
      [v52 setObject:v51 forKey:@"value"];
    }
    v54 = +[NSNumber numberWithUnsignedInteger:v66];
    [v53 setObject:v54 forKey:@"in"];

    v55 = +[NSNumber numberWithUnsignedInteger:v65];
    [v53 setObject:v55 forKey:@"out"];

    id v56 = +[NSNumber numberWithUnsignedInteger:v45];
    [v53 setObject:v56 forKey:@"count"];

    uint64_t v57 = +[NSNumber numberWithBool:v47 != (id)1];
    [v53 setObject:v57 forKey:@"ambiguous"];

    uint64_t v58 = [v16 objectForKeyedSubscript:@"com.apple.spotlight"];
    uint64_t v59 = [v58 objectForKeyedSubscript:v17];
    [v59 addObject:v53];

    char v60 = [v19 domains];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100079948;
    v74[3] = &unk_1000DBFB0;
    v75 = v24;
    id v76 = v16;
    id v77 = v17;
    id v78 = v19;
    id v79 = v51;
    BOOL v80 = v67;
    id v61 = v51;
    id v62 = v24;
    [v60 enumerateDomainsInGraph:v62 usingBlock:v74];

    id v20 = v72;
    id v18 = v73;
    id v21 = v71;
    BOOL v26 = v70;
    id v22 = v69;
  }
  else
  {

    id v31 = v17;
  }

  return v26;
}

- (BOOL)generatePeopleUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  BOOL v6 = self->_graph;
  unsigned int v7 = [(SKGGraph *)v6 available];
  if (v7)
  {
    peopleScores = self->_peopleScores;
    unsigned __int8 v9 = +[SKGNodes nodesInGraph:v6];
    if ([v9 count])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100079DB8;
      v12[3] = &unk_1000DC0C8;
      id v17 = peopleScores;
      id v16 = &v18;
      int v13 = v6;
      char v14 = self;
      id v15 = v4;
      [v9 enumeratePersonsInGraph:v13 usingBlock:v12];
    }
  }

  if (v7) {
    BOOL v10 = *((unsigned char *)v19 + 24) != 0;
  }
  else {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (BOOL)analyzePeopleWithCancelBlock:(id)a3
{
  id v4 = a3;
  if ([(SpotlightGraph *)self available]) {
    BOOL v5 = [(SpotlightGraph *)self peopleAnalyzeWithCancelBlock:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)scorePeopleWithCancelBlock:(id)a3
{
  id v4 = a3;
  if ([(SpotlightGraph *)self available]) {
    BOOL v5 = [(SpotlightGraph *)self peopleScoreWithCancelBlock:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)enumeratePeopleUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(SpotlightGraph *)self available]
    && [(SpotlightGraph *)self commitWithCancelBlock:0])
  {
    BOOL v5 = [(SpotlightGraph *)self generatePeopleUsingBlock:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)deletePeopleWithCancelBlock:(id)a3
{
  id v4 = a3;
  if ([(SpotlightGraph *)self available])
  {
    BOOL v6 = self->_graph;
    unsigned int v7 = +[SKGNodes nodesInGraph:v6];
    unsigned __int8 v8 = [(SKGGraph *)v6 removeNodeSet:v7 removeEdgeSet:0 cancelBlock:v4];
    if (self->_peopleScores)
    {
      SIGeneralTrieRelease();
      self->_peopleScores = 0;
      unsigned __int8 v9 = +[NSFileManager defaultManager];
      BOOL v10 = [(SpotlightGraph *)self cachedPeopleScoresPath];
      uint64_t v12 = 0;
      [v9 removeItemAtURL:v10 error:&v12];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)deleteEntitiesWithCancelBlock:(id)a3
{
  id v4 = a3;
  if ([(SpotlightGraph *)self available])
  {
    BOOL v6 = self->_graph;
    unsigned int v7 = +[SKGNodes nodesInGraph:v6];
    unsigned __int8 v8 = [(SKGGraph *)v6 removeNodeSet:v7 removeEdgeSet:0 cancelBlock:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end