@interface PFUbiquityPeerSnapshotCollection
- (BOOL)calculateSnapshotDiffsWithError:(uint64_t)a1;
- (PFUbiquityPeerSnapshotCollection)init;
- (uint64_t)addSnapshot:(uint64_t)result;
- (void)dealloc;
@end

@implementation PFUbiquityPeerSnapshotCollection

- (PFUbiquityPeerSnapshotCollection)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityPeerSnapshotCollection;
  v2 = [(PFUbiquityPeerSnapshotCollection *)&v4 init];
  if (v2)
  {
    v2->_peerIDToTransactionNumberToSnapshot = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_peerIDToTranasctionNumberToKnowledgeVector = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_kvToSnapshot = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_peerSnapshots = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_needSort = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_peerSnapshots = 0;
  self->_peerIDToTranasctionNumberToKnowledgeVector = 0;

  self->_peerIDToTransactionNumberToSnapshot = 0;
  self->_kvToSnapshot = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerSnapshotCollection;
  [(PFUbiquityPeerSnapshotCollection *)&v3 dealloc];
}

- (uint64_t)addSnapshot:(uint64_t)result
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    objc_super v4 = *(void **)(result + 8);
    if (a2) {
      uint64_t v5 = a2[6];
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = (id)[v4 objectForKey:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (a2) {
        uint64_t v7 = a2[6];
      }
      else {
        uint64_t v7 = 0;
      }
      [*(id *)(v3 + 8) setObject:v6 forKey:v7];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    if (a2 && (uint64_t v8 = a2[3]) != 0) {
      v9 = (void *)[*(id *)(v8 + 8) allKeys];
    }
    else {
      v9 = 0;
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
          if (a2) {
            uint64_t v15 = a2[6];
          }
          else {
            uint64_t v15 = 0;
          }
          if (([*(id *)(*((void *)&v24 + 1) + 8 * v13) isEqualToString:v15] & 1) == 0)
          {
            id v16 = (id)[*(id *)(v3 + 16) objectForKey:v14];
            if (!v16)
            {
              id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              [*(id *)(v3 + 16) setObject:v16 forKey:v14];
            }
            if (a2 && (uint64_t v17 = a2[3]) != 0) {
              uint64_t v18 = [*(id *)(v17 + 8) objectForKey:v14];
            }
            else {
              uint64_t v18 = 0;
            }
            id v19 = (id)[v16 objectForKey:v18];
            if (!v19)
            {
              id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              [v16 setObject:v19 forKey:v18];
            }
            if (a2) {
              uint64_t v20 = a2[3];
            }
            else {
              uint64_t v20 = 0;
            }
            [v19 addObject:v20];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v21 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v11 = v21;
      }
      while (v21);
    }
    if (a2) {
      uint64_t v22 = a2[4];
    }
    else {
      uint64_t v22 = 0;
    }
    [v6 setObject:a2 forKey:v22];
    if (([*(id *)(v3 + 32) containsObject:a2] & 1) == 0) {
      [*(id *)(v3 + 32) addObject:a2];
    }
    if (a2) {
      uint64_t v23 = a2[3];
    }
    else {
      uint64_t v23 = 0;
    }
    result = [*(id *)(v3 + 24) setObject:a2 forKey:v23];
    *(unsigned char *)(v3 + 40) = 1;
  }
  return result;
}

- (BOOL)calculateSnapshotDiffsWithError:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 40)) {
      [*(id *)(a1 + 32) sortUsingSelector:sel_compare_];
    }
    v2 = (void *)[*(id *)(a1 + 8) allKeys];
    uint64_t v22 = [*(id *)(a1 + 32) count];
    if (v22 >= 1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        uint64_t v4 = [*(id *)(a1 + 32) objectAtIndex:i];
        uint64_t v5 = v4;
        uint64_t v6 = i;
        if (i)
        {
          do
          {
            uint64_t v7 = [*(id *)(a1 + 32) objectAtIndex:v6 - 1];
            uint64_t v8 = v7;
            if (v7) {
              uint64_t v7 = *(void *)(v7 + 24);
            }
            if (v5) {
              uint64_t v9 = *(void *)(v5 + 24);
            }
            else {
              uint64_t v9 = 0;
            }
            unsigned __int8 v10 = -[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:]((id *)v7, v9);
            if (v6 < 2) {
              break;
            }
            --v6;
          }
          while ((v10 & 1) == 0);
          if (v8) {
            uint64_t v11 = v8;
          }
          else {
            uint64_t v11 = 0;
          }
          -[PFUbiquityPeerSnapshot computeDiffToPreviousSnapshot:](v5, v11);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v12 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v24;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v24 != v14) {
                  objc_enumerationMutation(v2);
                }
                uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * v15);
                if (v5)
                {
                  if (([*(id *)(*((void *)&v23 + 1) + 8 * v15) isEqualToString:*(void *)(v5 + 48)] & 1) == 0)
                  {
                    uint64_t v17 = *(void *)(v5 + 24);
                    if (v17)
                    {
                      uint64_t v18 = [*(id *)(v17 + 8) objectForKey:v16];
                      if (v18)
                      {
                        uint64_t v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v16), "objectForKey:", v18);
                        if (v19) {
                          -[PFUbiquityPeerSnapshot removeValuesChangedByPeerSnapshot:](v5, v19);
                        }
                      }
                    }
                  }
                }
                else
                {
                  [*(id *)(*((void *)&v23 + 1) + 8 * v15) isEqualToString:0];
                }
                ++v15;
              }
              while (v13 != v15);
              uint64_t v20 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
              uint64_t v13 = v20;
            }
            while (v20);
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Generated diff for snapshot: %@\n Previous snapshot: %@", "-[PFUbiquityPeerSnapshotCollection calculateSnapshotDiffsWithError:]", 166, v5, v8);
          }
        }
        else
        {
          -[PFUbiquityPeerSnapshot computeDiffToPreviousSnapshot:](v4, 0);
        }
      }
    }
  }
  return a1 != 0;
}

@end