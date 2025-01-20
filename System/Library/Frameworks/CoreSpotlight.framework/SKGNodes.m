@interface SKGNodes
+ (Class)edgeClass;
+ (Class)nodeClass;
+ (MANodeFilter)filter;
+ (id)labels;
+ (id)nodesInGraph:(id)a3;
+ (id)nodesWithIdentifier:(unint64_t)a3 inGraph:(id)a4;
+ (id)nodesWithNode:(id)a3 inGraph:(id)a4;
+ (id)subsetInCollection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNodes:(id)a3;
- (SKGNodes)initWithNode:(id)a3 inGraph:(id)a4;
- (id)contacts;
- (id)displayNames;
- (id)domains;
- (id)emails;
- (id)entities;
- (id)nameKeys;
- (id)names;
- (id)personas;
- (id)personasWithPersona:(id)a3 inGraph:(id)a4;
- (id)persons;
- (id)phones;
- (id)photos;
- (id)references;
- (id)users;
- (unint64_t)nodeIdentifier;
- (void)enumerateNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setNodeIdentifier:(unint64_t)a3;
@end

@implementation SKGNodes

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)labels
{
  p_cache = &OBJC_METACLASS___SKGEmbedding.cache;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000F8838, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000F8838))
  {
    v6[0] = off_1000F8350[0];
    v6[1] = off_1000F8358[0];
    v6[2] = off_1000F8360[0];
    v6[3] = off_1000F8368[0];
    v6[4] = off_1000F8370[0];
    v6[5] = off_1000F8378[0];
    v6[6] = off_1000F8380[0];
    v6[7] = off_1000F8388[0];
    v6[8] = off_1000F8390[0];
    v6[9] = off_1000F8398[0];
    v6[10] = off_1000F83A0[0];
    v6[11] = off_1000F83A8[0];
    v6[12] = off_1000F83B0;
    v5 = +[NSArray arrayWithObjects:v6 count:13];
    qword_1000F8830 = +[NSSet setWithArray:v5];

    __cxa_guard_release(&qword_1000F8838);
    p_cache = (void **)(&OBJC_METACLASS___SKGEmbedding + 16);
  }
  v3 = p_cache[262];

  return v3;
}

+ (MANodeFilter)filter
{
  id v2 = [a1 nodeClass];

  return (MANodeFilter *)[v2 filter];
}

+ (id)nodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [a1 filter];
  v7 = [v4 graph];
  v8 = [v5 nodesMatchingFilter:v6 inGraph:v7];

  return v8;
}

+ (id)subsetInCollection:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [a1 filter];
  v7 = [v6 relation];
  v8 = [v5 nodesRelatedToNodes:v4 withRelation:v7];

  return v8;
}

+ (id)nodesWithNode:(id)a3 inGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 label];
  unsigned int v8 = [v7 isEqualToString:off_1000F8350[0]];

  if (v8)
  {
    v9 = [[SKGUsers alloc] initWithUserNode:v5 inGraph:v6];
  }
  else
  {
    v10 = [v5 label];
    unsigned int v11 = [v10 isEqualToString:off_1000F8358[0]];

    if (v11)
    {
      v9 = [[SKGPersons alloc] initWithPersonNode:v5 inGraph:v6];
    }
    else
    {
      v12 = [v5 label];
      unsigned int v13 = [v12 isEqualToString:off_1000F8360[0]];

      if (v13)
      {
        v9 = [[SKGContacts alloc] initWithContactNode:v5 inGraph:v6];
      }
      else
      {
        v14 = [v5 label];
        unsigned int v15 = [v14 isEqualToString:off_1000F8368[0]];

        if (v15)
        {
          v9 = [[SKGPhotos alloc] initWithPhotoNode:v5 inGraph:v6];
        }
        else
        {
          v16 = [v5 label];
          unsigned int v17 = [v16 isEqualToString:off_1000F8370[0]];

          if (v17)
          {
            v9 = [[SKGEntities alloc] initWithEntityNode:v5 inGraph:v6];
          }
          else
          {
            v18 = [v5 label];
            unsigned int v19 = [v18 isEqualToString:off_1000F8378[0]];

            if (v19)
            {
              v9 = [[SKGDisplayNames alloc] initWithDisplayNameNode:v5 inGraph:v6];
            }
            else
            {
              v20 = [v5 label];
              unsigned int v21 = [v20 isEqualToString:off_1000F8380[0]];

              if (v21)
              {
                v9 = [[SKGNames alloc] initWithNameNode:v5 inGraph:v6];
              }
              else
              {
                v22 = [v5 label];
                unsigned int v23 = [v22 isEqualToString:off_1000F8388[0]];

                if (v23)
                {
                  v9 = [[SKGNameKeys alloc] initWithNameKeyNode:v5 inGraph:v6];
                }
                else
                {
                  v24 = [v5 label];
                  unsigned int v25 = [v24 isEqualToString:off_1000F8390[0]];

                  if (v25)
                  {
                    v9 = [[SKGEmails alloc] initWithEmailNode:v5 inGraph:v6];
                  }
                  else
                  {
                    v26 = [v5 label];
                    unsigned int v27 = [v26 isEqualToString:off_1000F8398[0]];

                    if (v27)
                    {
                      v9 = [[SKGPhones alloc] initWithPhoneNode:v5 inGraph:v6];
                    }
                    else
                    {
                      v28 = [v5 label];
                      unsigned int v29 = [v28 isEqualToString:off_1000F83A0[0]];

                      if (v29)
                      {
                        v9 = [[SKGReferences alloc] initWithReferenceNode:v5 inGraph:v6];
                      }
                      else
                      {
                        v30 = [v5 label];
                        unsigned int v31 = [v30 isEqualToString:off_1000F83A8[0]];

                        if (v31)
                        {
                          v9 = [[SKGPersonas alloc] initWithPersonaNode:v5 inGraph:v6];
                        }
                        else
                        {
                          v32 = [v5 label];
                          unsigned int v33 = [v32 isEqualToString:off_1000F83B0];

                          if (v33) {
                            v9 = [[SKGDomains alloc] initWithDomainNode:v5 inGraph:v6];
                          }
                          else {
                            v9 = [[SKGNodes alloc] initWithNode:v5 inGraph:v6];
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v34 = v9;

  return v34;
}

- (void)enumerateNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029654;
  v8[3] = &unk_1000D9C00;
  id v7 = v5;
  id v9 = v7;
  [(SKGNodes *)self enumerateIdentifiersAsCollectionsWithBlock:v8];
}

+ (id)nodesWithIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = [v5 graph];
  unsigned int v8 = [v7 nodeForIdentifier:a3];
  unsigned int v13 = v8;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v10 = [v5 graph];
  id v11 = [v6 initWithArray:v9 graph:v10];

  return v11;
}

- (SKGNodes)initWithNode:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 graph];
  id v9 = [v7 graph];
  v10 = [v6 filter];
  id v11 = [v9 nodeIdentifiersMatchingFilter:v10];
  v14.receiver = self;
  v14.super_class = (Class)SKGNodes;
  v12 = [(SKGNodes *)&v14 initWithGraph:v8 elementIdentifiers:v11];

  [(SKGNodes *)v12 setNodeIdentifier:0];
  return v12;
}

- (BOOL)isEqualToNodes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (id v6 = [v4 nodeIdentifier], v6 == (id)-[SKGNodes nodeIdentifier](self, "nodeIdentifier")))
  {
    id v7 = [(id)objc_opt_class() labels];
    unsigned int v8 = [(id)objc_opt_class() labels];
    unsigned __int8 v9 = [v7 isEqualToSet:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SKGNodes *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(SKGNodes *)self isEqualToNodes:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)users
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)persons
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)contacts
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)photos
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)entities
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)displayNames
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)names
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)nameKeys
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)emails
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)phones
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)references
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)personas
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode inRelation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (id)personasWithPersona:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v9 = [[SKGPersonaNode alloc] initWithPersona:v6];
  v10 = +[SKGNodes nodesWithNode:v9 inGraph:v7];
  id v11 = +[SKGEdge filter];
  v12 = +[SKGPersonaEdges edgesFromNodes:v10 toNodes:self matchingFilter:v11];

  unsigned int v13 = +[SKGPersonas sourceNodesOfEdges:v12];

  return v13;
}

- (id)domains
{
  v3 = objc_opt_class();
  id v4 = +[SKGNode relation];
  BOOL v5 = [v3 nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (unint64_t)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (void)setNodeIdentifier:(unint64_t)a3
{
  self->_nodeIdentifier = a3;
}

@end