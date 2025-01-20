@interface VNFaceAnalyzerFaceObservationGrouping
- (id)addToGroupingsRequest:(id)a3 withFaceObservations:(id)a4;
@end

@implementation VNFaceAnalyzerFaceObservationGrouping

- (void).cxx_destruct
{
}

- (id)addToGroupingsRequest:(id)a3 withFaceObservations:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "uuid", (void)v18);
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v14 = [(NSMutableDictionary *)self->_observationGroupsToRequestMapping objectForKey:v8];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v16 addObject:v6];
    [(NSMutableDictionary *)self->_observationGroupsToRequestMapping setObject:v16 forKey:v8];
  }
  else
  {
    id v16 = [(NSMutableDictionary *)self->_observationGroupsToRequestMapping objectForKey:v8];
    [v16 addObject:v6];
  }

  return v8;
}

@end