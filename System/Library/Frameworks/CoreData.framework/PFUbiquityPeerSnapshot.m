@interface PFUbiquityPeerSnapshot
- (BOOL)isEqual:(id)a3;
- (PFUbiquityPeerSnapshot)initWithExportingPeerID:(id)a3 logSnapshot:(id)a4 transactionNumber:(id)a5 transactionDate:(id)a6 andKnowledgeVector:(id)a7;
- (PFUbiquityPeerSnapshot)initWithTranasctionEntry:(id)a3 andLogSnapshot:(id)a4;
- (id)description;
- (int64_t)compare:(id)a3;
- (uint64_t)removeValuesChangedByPeerSnapshot:(uint64_t)result;
- (void)computeDiffToPreviousSnapshot:(uint64_t)a1;
- (void)dealloc;
@end

@implementation PFUbiquityPeerSnapshot

- (PFUbiquityPeerSnapshot)initWithTranasctionEntry:(id)a3 andLogSnapshot:(id)a4
{
  if (a3) {
    uint64_t v7 = *((void *)a3 + 3);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [a3 transactionNumber];
  uint64_t v9 = [a3 transactionDate];
  if (a3) {
    uint64_t v10 = *((void *)a3 + 7);
  }
  else {
    uint64_t v10 = 0;
  }

  return [(PFUbiquityPeerSnapshot *)self initWithExportingPeerID:v7 logSnapshot:a4 transactionNumber:v8 transactionDate:v9 andKnowledgeVector:v10];
}

- (PFUbiquityPeerSnapshot)initWithExportingPeerID:(id)a3 logSnapshot:(id)a4 transactionNumber:(id)a5 transactionDate:(id)a6 andKnowledgeVector:(id)a7
{
  v12 = [(PFUbiquityPeerSnapshot *)self init];
  if (v12)
  {
    v12->_exportingPeerID = (NSString *)a3;
    v12->_logSnapshot = (NSDictionary *)a4;
    v12->_transactionNumber = (NSNumber *)a5;
    v12->_transactionDate = (NSDate *)a6;
    v13 = (PFUbiquityKnowledgeVector *)a7;
    v12->_diffFromPrevious = 0;
    v12->_kv = v13;
  }
  return v12;
}

- (void)dealloc
{
  self->_exportingPeerID = 0;
  self->_logSnapshot = 0;

  self->_transactionNumber = 0;
  self->_transactionDate = 0;

  self->_kv = 0;
  self->_diffFromPrevious = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerSnapshot;
  [(PFUbiquityPeerSnapshot *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (self)
  {
    kv = self->_kv;
    if (a3)
    {
LABEL_4:
      uint64_t v6 = *((void *)a3 + 3);
      goto LABEL_5;
    }
  }
  else
  {
    kv = 0;
    if (a3) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = 0;
LABEL_5:
  if (![(PFUbiquityKnowledgeVector *)kv isEqual:v6]) {
    return 0;
  }
  if (self)
  {
    exportingPeerID = self->_exportingPeerID;
    if (a3)
    {
LABEL_8:
      uint64_t v8 = *((void *)a3 + 6);
      goto LABEL_9;
    }
  }
  else
  {
    exportingPeerID = 0;
    if (a3) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  if (![(NSString *)exportingPeerID isEqualToString:v8]) {
    return 0;
  }
  if (self)
  {
    transactionNumber = self->_transactionNumber;
    if (a3)
    {
LABEL_12:
      uint64_t v10 = *((void *)a3 + 4);
      goto LABEL_13;
    }
  }
  else
  {
    transactionNumber = 0;
    if (a3) {
      goto LABEL_12;
    }
  }
  uint64_t v10 = 0;
LABEL_13:
  if (![(NSNumber *)transactionNumber isEqual:v10]) {
    return 0;
  }
  if (!self)
  {
    transactionDate = 0;
    if (a3) {
      goto LABEL_16;
    }
LABEL_28:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  transactionDate = self->_transactionDate;
  if (!a3) {
    goto LABEL_28;
  }
LABEL_16:
  uint64_t v12 = *((void *)a3 + 5);
LABEL_17:

  return [(NSDate *)transactionDate isEqual:v12];
}

- (id)description
{
  objc_super v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PFUbiquityPeerSnapshot;
  id v4 = [(PFUbiquityPeerSnapshot *)&v12 description];
  if (self)
  {
    kv = self->_kv;
    transactionNumber = self->_transactionNumber;
    transactionDate = self->_transactionDate;
    exportingPeerID = self->_exportingPeerID;
    logSnapshot = self->_logSnapshot;
    diffFromPrevious = self->_diffFromPrevious;
  }
  else
  {
    logSnapshot = 0;
    transactionNumber = 0;
    kv = 0;
    exportingPeerID = 0;
    transactionDate = 0;
    diffFromPrevious = 0;
  }
  return (id)[v3 stringWithFormat:@"%@: %@\n\texportingPeerID: %@, transactionNumber: %@, transactionDate: %@\nLog Snapshot: %@\nDiff: %@\n", v4, kv, exportingPeerID, transactionNumber, transactionDate, logSnapshot, diffFromPrevious];
}

- (int64_t)compare:(id)a3
{
  if (self) {
    self = (PFUbiquityPeerSnapshot *)self->_kv;
  }
  if (a3) {
    a3 = (id)*((void *)a3 + 3);
  }
  return [(PFUbiquityPeerSnapshot *)self compare:a3];
}

- (void)computeDiffToPreviousSnapshot:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    *(void *)(a1 + 16) = 0;
    if (a2)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(*(id *)(a1 + 8), "allKeys"));
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(a2 + 8), "allKeys"));
      [v4 addEntriesFromDictionary:*(void *)(a2 + 16)];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            v11 = (void *)[*(id *)(a1 + 8) objectForKey:v10];
            uint64_t v12 = [*(id *)(a2 + 16) objectForKey:v10];
            if (!v12) {
              uint64_t v12 = [*(id *)(a2 + 8) objectForKey:v10];
            }
            if (v11 != (void *)v12 && (objc_msgSend(v11, "isEqual:") & 1) == 0)
            {
              if (v11)
              {
                if ([v11 isNSSet])
                {
                  id v13 = [[PFUbiquityToManyConflictDiff alloc] initForRelationshipAtKey:v10];
                  -[PFUbiquityToManyConflictDiff diffWithLogSnapshot:andPreviousSnapshot:]((uint64_t)v13, a1, a2);
                  [v4 setObject:v13 forKey:v10];
                }
                else
                {
                  [v4 setObject:v11 forKey:v10];
                }
              }
              else
              {
                [v4 removeObjectForKey:v10];
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
      *(void *)(a1 + 16) = v4;
    }
    else
    {
      *(void *)(a1 + 16) = v4;
    }
  }
}

- (uint64_t)removeValuesChangedByPeerSnapshot:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = a2 ? *(void **)(a2 + 16) : 0;
    v5 = (void *)[v4 allKeys];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    result = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
          uint64_t v10 = (void *)[*(id *)(v3 + 16) objectForKey:v9];
          if (a2) {
            v11 = *(void **)(a2 + 16);
          }
          else {
            v11 = 0;
          }
          uint64_t v12 = [v11 objectForKey:v9];
          if (v10 == (void *)v12 || [v10 isEqual:v12]) {
            [*(id *)(v3 + 16) removeObjectForKey:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        result = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

@end