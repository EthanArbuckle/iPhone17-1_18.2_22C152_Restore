@interface PFUbiquityBaselineMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PFUbiquityBaselineMetadata)init;
- (PFUbiquityBaselineMetadata)initWithCoder:(id)a3;
- (PFUbiquityBaselineMetadata)initWithLocalPeerID:(id)a3 storeName:(id)a4 modelVersionHash:(id)a5 andUbiquityRootLocation:(id)a6;
- (id)_migrateToModelVersionHash:(id *)result;
- (id)createNewLocalRangeWithRangeStart:(unint64_t)a3 andRangeEnd:(unint64_t)a4 forEntityNamed:(id)a5;
- (id)createPeerRangeDictionary:(id)a3;
- (id)description;
- (id)setPreviousKnowledgeVectorFromCurrentMetadata:(id *)result;
- (uint64_t)gatherMetadataWithStore:(uint64_t)a3 andError:;
- (void)addDictionaryForPeerRange:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFUbiquityBaselineMetadata

- (PFUbiquityBaselineMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineMetadata;
  result = [(PFUbiquityBaselineMetadata *)&v3 init];
  if (result)
  {
    result->_storeName = 0;
    result->_authorPeerID = 0;
    result->_modelVersionHash = 0;
    result->_kv = 0;
    result->_peerRanges = 0;
    result->_pKV = 0;
  }
  return result;
}

- (PFUbiquityBaselineMetadata)initWithLocalPeerID:(id)a3 storeName:(id)a4 modelVersionHash:(id)a5 andUbiquityRootLocation:(id)a6
{
  v9 = [(PFUbiquityBaselineMetadata *)self init];
  if (v9)
  {
    v9->_storeName = (NSString *)a4;
    v9->_authorPeerID = (NSString *)a3;
    v9->_modelVersionHash = (NSString *)a5;
    v9->_kv = 0;
    v9->_peerRanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v9;
}

- (void)dealloc
{
  self->_storeName = 0;
  self->_authorPeerID = 0;

  self->_modelVersionHash = 0;
  self->_pKV = 0;

  self->_kv = 0;
  self->_peerRanges = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineMetadata;
  [(PFUbiquityBaselineMetadata *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PFUbiquityBaselineMetadata;
  id v4 = [(PFUbiquityBaselineMetadata *)&v11 description];
  if (self)
  {
    storeName = self->_storeName;
    authorPeerID = self->_authorPeerID;
    modelVersionHash = self->_modelVersionHash;
    kv = self->_kv;
    peerRanges = self->_peerRanges;
  }
  else
  {
    kv = 0;
    authorPeerID = 0;
    storeName = 0;
    modelVersionHash = 0;
    peerRanges = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tstoreName: %@\n\tauthorPeerID: %@\n\tmodelVersionHash: %@\n\tknowledgeVector: %@\n\tpeerRanges: %@\n", v4, storeName, authorPeerID, modelVersionHash, kv, peerRanges];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  if (a3) {
    v5 = (void *)*((void *)a3 + 1);
  }
  else {
    v5 = 0;
  }
  int v6 = [v5 isNSString];
  if (!v6) {
    return v6;
  }
  if (self)
  {
    storeName = self->_storeName;
    if (a3)
    {
LABEL_7:
      int v6 = [(NSString *)storeName isEqualToString:*((void *)a3 + 1)];
      if (!v6) {
        return v6;
      }
      v8 = (void *)*((void *)a3 + 2);
      goto LABEL_9;
    }
  }
  else
  {
    storeName = 0;
    if (a3) {
      goto LABEL_7;
    }
  }
  BOOL v18 = [(NSString *)storeName isEqualToString:0];
  v8 = 0;
  if (!v18) {
    goto LABEL_37;
  }
LABEL_9:
  int v6 = [v8 isNSString];
  if (!v6) {
    return v6;
  }
  if (self)
  {
    authorPeerID = self->_authorPeerID;
    if (a3)
    {
LABEL_12:
      int v6 = [(NSString *)authorPeerID isEqualToString:*((void *)a3 + 2)];
      if (!v6) {
        return v6;
      }
      v10 = (void *)*((void *)a3 + 3);
      goto LABEL_14;
    }
  }
  else
  {
    authorPeerID = 0;
    if (a3) {
      goto LABEL_12;
    }
  }
  BOOL v19 = [(NSString *)authorPeerID isEqualToString:0];
  v10 = 0;
  if (!v19) {
    goto LABEL_37;
  }
LABEL_14:
  int v6 = [v10 isNSString];
  if (!v6) {
    return v6;
  }
  if (self)
  {
    modelVersionHash = self->_modelVersionHash;
    if (a3)
    {
LABEL_17:
      uint64_t v12 = *((void *)a3 + 3);
      goto LABEL_18;
    }
  }
  else
  {
    modelVersionHash = 0;
    if (a3) {
      goto LABEL_17;
    }
  }
  uint64_t v12 = 0;
LABEL_18:
  int v6 = [(NSString *)modelVersionHash isEqualToString:v12];
  if (!v6) {
    return v6;
  }
  if (!self)
  {
    kv = 0;
    if (a3) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
  kv = self->_kv;
  if (!a3)
  {
LABEL_45:
    BOOL v20 = [(PFUbiquityKnowledgeVector *)kv isEqual:0];
    v14 = 0;
    if (v20) {
      goto LABEL_23;
    }
LABEL_37:
    LOBYTE(v6) = 0;
    return v6;
  }
LABEL_21:
  int v6 = [(PFUbiquityKnowledgeVector *)kv isEqual:*((void *)a3 + 6)];
  if (!v6) {
    return v6;
  }
  v14 = (void *)*((void *)a3 + 7);
LABEL_23:
  int v6 = [v14 isNSDictionary];
  if (!v6) {
    return v6;
  }
  if (!self)
  {
    peerRanges = 0;
    if (a3) {
      goto LABEL_26;
    }
LABEL_48:
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  peerRanges = self->_peerRanges;
  if (!a3) {
    goto LABEL_48;
  }
LABEL_26:
  uint64_t v16 = *((void *)a3 + 7);
LABEL_27:
  int v6 = [(NSMutableDictionary *)peerRanges isEqualToDictionary:v16];
  if (v6)
  {
    LOBYTE(v6) = 1;
    if (a3)
    {
      if (self->_pKV && *((void *)a3 + 5))
      {
        pKV = self->_pKV;
        LOBYTE(v6) = -[PFUbiquityKnowledgeVector isEqual:](pKV, "isEqual:");
      }
    }
  }
  return v6;
}

- (uint64_t)gatherMetadataWithStore:(uint64_t)a3 andError:
{
  uint64_t v43 = a3;
  uint64_t v3 = a1;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v3;
  }
  id v4 = a2;
  id v5 = (id)[a2 persistentStoreCoordinator];
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3052000000;
  v72 = __Block_byref_object_copy__48;
  v73 = __Block_byref_object_dispose__48;
  uint64_t v74 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3052000000;
  v66 = __Block_byref_object_copy__48;
  v67 = __Block_byref_object_dispose__48;
  uint64_t v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3052000000;
  v60 = __Block_byref_object_copy__48;
  v61 = __Block_byref_object_dispose__48;
  uint64_t v62 = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke;
  v56[3] = &unk_1E544DB00;
  v56[4] = v4;
  v56[5] = v3;
  v56[6] = &v63;
  v56[7] = &v57;
  v56[8] = &v69;
  id v44 = v5;
  [v5 performBlockAndWait:v56];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7 = objc_msgSend(v6, "initWithArray:", objc_msgSend((id)v58[5], "allKeys"));
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![(id)v70[5] count]) {
    goto LABEL_54;
  }
  [(id)v70[5] sortUsingComparator:&__block_literal_global_35];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  id obj = (id)v70[5];
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v76 count:16];
  if (!v9) {
    goto LABEL_54;
  }
  v45 = v4;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v53;
  do
  {
    uint64_t v12 = 0;
    uint64_t v13 = v10;
    do
    {
      if (*(void *)v53 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v52 + 1) + 8 * v12);
      if (v10) {
        uint64_t v14 = *(void *)(v10 + 16);
      }
      else {
        uint64_t v14 = 0;
      }
      [v7 removeObject:v14];
      if (v13)
      {
        if (v10) {
          v15 = *(void **)(v10 + 16);
        }
        else {
          v15 = 0;
        }
        if ([v15 isEqualToString:*(void *)(v13 + 16)])
        {
          if (v10) {
            uint64_t v16 = *(void **)(v10 + 24);
          }
          else {
            uint64_t v16 = 0;
          }
          uint64_t v17 = [v16 integerValue];
          uint64_t v18 = [*(id *)(v13 + 32) integerValue];
          if (v17 > v18)
          {
            if (v17 - v18 == 1) {
              goto LABEL_34;
            }
            uint64_t v19 = [*(id *)(v13 + 32) integerValue];
            if (v10) {
              BOOL v20 = *(void **)(v10 + 24);
            }
            else {
              BOOL v20 = 0;
            }
            uint64_t v21 = [v20 integerValue];
            if (v10) {
              uint64_t v22 = *(void *)(v10 + 16);
            }
            else {
              uint64_t v22 = 0;
            }
            v23 = (void *)[(id)v3 createNewLocalRangeWithRangeStart:v19 + 1 andRangeEnd:v21 - 1 forEntityNamed:v22];
            [v8 addObject:v23];
            goto LABEL_33;
          }
          if (v10) {
            v31 = *(void **)(v10 + 24);
          }
          else {
            v31 = 0;
          }
          if ([v31 integerValue] >= 1
            && +[PFUbiquityLogging canLogMessageAtLevel:0])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got a bad gap for range: %@\nPrevious range: %@\nStore: %@", "-[PFUbiquityBaselineMetadata gatherMetadataWithStore:andError:]", 219, v10, v13, v45, v43);
          }
          goto LABEL_34;
        }
        v24 = (void *)[(id)v58[5] objectForKey:*(void *)(v13 + 16)];
        uint64_t v25 = [v24 integerValue];
        if (v25 > [*(id *)(v13 + 32) integerValue])
        {
          v26 = objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", objc_msgSend(*(id *)(v13 + 32), "integerValue") + 1, objc_msgSend(v24, "integerValue"), *(void *)(v13 + 16));
          [v8 addObject:v26];
        }
      }
      if (v10) {
        v27 = *(void **)(v10 + 24);
      }
      else {
        v27 = 0;
      }
      if ([v27 integerValue] >= 2)
      {
        if (v10) {
          v28 = *(void **)(v10 + 24);
        }
        else {
          v28 = 0;
        }
        uint64_t v29 = [v28 integerValue];
        if (v10) {
          uint64_t v30 = *(void *)(v10 + 16);
        }
        else {
          uint64_t v30 = 0;
        }
        v23 = (void *)[(id)v3 createNewLocalRangeWithRangeStart:1 andRangeEnd:v29 - 1 forEntityNamed:v30];
        [v8 addObject:v23];
LABEL_33:
      }
LABEL_34:
      [(id)v3 addDictionaryForPeerRange:v10];
      ++v12;
      uint64_t v13 = v10;
    }
    while (v9 != v12);
    uint64_t v32 = [obj countByEnumeratingWithState:&v52 objects:v76 count:16];
    uint64_t v9 = v32;
  }
  while (v32);
  id v4 = v45;
  if (v10)
  {
    v33 = (void *)[(id)v58[5] objectForKey:*(void *)(v10 + 16)];
    uint64_t v34 = [v33 integerValue];
    if (v34 > [*(id *)(v10 + 32) integerValue])
    {
      v35 = objc_msgSend((id)v3, "createNewLocalRangeWithRangeStart:andRangeEnd:forEntityNamed:", objc_msgSend(*(id *)(v10 + 32), "integerValue") + 1, objc_msgSend(v33, "integerValue"), *(void *)(v10 + 16));
      [v8 addObject:v35];
    }
  }
LABEL_54:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v36 = [v7 countByEnumeratingWithState:&v48 objects:v75 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(v7);
        }
        uint64_t v39 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v40 = objc_msgSend((id)objc_msgSend((id)v58[5], "objectForKey:", v39), "unsignedIntegerValue");
        if (v40)
        {
          v41 = (void *)[(id)v3 createNewLocalRangeWithRangeStart:1 andRangeEnd:v40 forEntityNamed:v39];
          [v8 addObject:v41];
        }
      }
      uint64_t v36 = [v7 countByEnumeratingWithState:&v48 objects:v75 count:16];
    }
    while (v36);
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke_3;
  v47[3] = &unk_1E544BB28;
  v47[4] = v8;
  v47[5] = v4;
  v47[6] = v3;
  [v44 performBlockAndWait:v47];
  uint64_t v3 = 1;

  v58[5] = 0;
  v70[5] = 0;

  v64[5] = 0;
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  return v3;
}

void __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke(uint64_t a1)
{
  id v2 = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32));

  *(void *)(*(void *)(a1 + 40) + 48) = [[PFUbiquityKnowledgeVector alloc] initWithStoreKnowledgeVectorDictionary:v2];
  *(void *)(*(void *)(a1 + 40) + 56) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [*(id *)(a1 + 32) model];
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 32);
  }
  else {
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v3 initWithArray:v5];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) createMapOfEntityNameToPKMaxForEntities:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:-[NSSQLCore allPeerRanges](*(void **)(a1 + 32)) copyItems:0];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
}

uint64_t __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = *(void **)(a2 + 16);
    if (a3)
    {
LABEL_3:
      uint64_t v6 = *(void *)(a3 + 16);
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_4:
  uint64_t result = [v5 compare:v6];
  if (result) {
    return result;
  }
  if (!a2)
  {
    id v8 = 0;
    if (a3) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  id v8 = *(void **)(a2 + 24);
  if (!a3) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = *(void *)(a3 + 24);
LABEL_8:

  return [v8 compare:v9];
}

uint64_t __63__PFUbiquityBaselineMetadata_gatherMetadataWithStore_andError___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        -[NSSQLCore addPeerRange:](*(void *)(a1 + 40), v7);
        [*(id *)(a1 + 48) addDictionaryForPeerRange:v7];
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (PFUbiquityBaselineMetadata)initWithCoder:(id)a3
{
  uint64_t v4 = [(PFUbiquityBaselineMetadata *)self init];
  if (v4)
  {
    v4->_storeName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storeName"];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_authorPeerID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"authorPeerID");
    v4->_modelVersionHash = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"modelVersionHash"];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    long long v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), @"peerStates");
    if (v11)
    {
      uint64_t v12 = v11;
      if ([v11 isNSDictionary])
      {
        uint64_t v13 = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorDictionary:v12];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Not sure what to do with baseline metadata knowledge vector object: %@", "-[PFUbiquityBaselineMetadata initWithCoder:]", 324, v12);
          }
          goto LABEL_8;
        }
        uint64_t v13 = v12;
      }
      v4->_kv = v13;
    }
LABEL_8:
    v4->_pKV = (PFUbiquityKnowledgeVector *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"previousKnowledgeVector"];
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v4->_peerRanges = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0), @"peerRanges");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_storeName forKey:@"storeName"];
    [a3 encodeObject:self->_authorPeerID forKey:@"authorPeerID"];
    [a3 encodeObject:self->_modelVersionHash forKey:@"modelVersionHash"];
    [a3 encodeObject:self->_kv forKey:@"peerStates"];
    [a3 encodeObject:self->_pKV forKey:@"previousKnowledgeVector"];
    peerRanges = self->_peerRanges;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"storeName"];
    [a3 encodeObject:0 forKey:@"authorPeerID"];
    [a3 encodeObject:0 forKey:@"modelVersionHash"];
    [a3 encodeObject:0 forKey:@"peerStates"];
    [a3 encodeObject:0 forKey:@"previousKnowledgeVector"];
    peerRanges = 0;
  }

  [a3 encodeObject:peerRanges forKey:@"peerRanges"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)setPreviousKnowledgeVectorFromCurrentMetadata:(id *)result
{
  if (result)
  {
    id v3 = result;

    if (a2) {
      uint64_t v4 = *(void **)(a2 + 48);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t result = v4;
    v3[5] = result;
  }
  return result;
}

- (id)_migrateToModelVersionHash:(id *)result
{
  if (result)
  {
    id v3 = result;

    uint64_t result = a2;
    v3[3] = result;
  }
  return result;
}

- (id)createPeerRangeDictionary:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = v4;
  if (a3)
  {
    [v4 setValue:*((void *)a3 + 5) forKey:@"peerStart"];
    [v5 setValue:*((void *)a3 + 6) forKey:@"peerEnd"];
    [v5 setValue:*((void *)a3 + 3) forKey:@"rangeEnd"];
    [v5 setValue:*((void *)a3 + 4) forKey:@"rangeStart"];
    uint64_t v6 = *((void *)a3 + 2);
  }
  else
  {
    [v4 setValue:0 forKey:@"peerStart"];
    [v5 setValue:0 forKey:@"peerEnd"];
    [v5 setValue:0 forKey:@"rangeEnd"];
    [v5 setValue:0 forKey:@"rangeStart"];
    uint64_t v6 = 0;
  }
  [v5 setValue:v6 forKey:@"entityName"];
  return v5;
}

- (void)addDictionaryForPeerRange:(id)a3
{
  id v8 = -[PFUbiquityBaselineMetadata createPeerRangeDictionary:](self, "createPeerRangeDictionary:");
  if (a3) {
    uint64_t v5 = *((void *)a3 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)[(NSMutableDictionary *)self->_peerRanges objectForKey:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3) {
      uint64_t v7 = *((void *)a3 + 1);
    }
    else {
      uint64_t v7 = 0;
    }
    [(NSMutableDictionary *)self->_peerRanges setObject:v6 forKey:v7];
  }
  [v6 addObject:v8];
}

- (id)createNewLocalRangeWithRangeStart:(unint64_t)a3 andRangeEnd:(unint64_t)a4 forEntityNamed:(id)a5
{
  id v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  uint64_t v10 = [[PFUbiquitySQLCorePeerRange alloc] initWithOwningPeerID:self->_authorPeerID entityName:a5 rangeStart:v8 rangeEnd:v9 peerStart:v8 peerEnd:v9];

  return v10;
}

@end