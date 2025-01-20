@interface GVDummyNode
- (void)computePriority;
@end

@implementation GVDummyNode

- (void)computePriority
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->super.inPriority = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  inNodes = self->super.inNodes;
  uint64_t v4 = [(NSMutableOrderedSet *)inNodes countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(inNodes);
        }
        if ([*(id *)(*((void *)&v19 + 1) + 8 * i) isMemberOfClass:objc_opt_class()]) {
          uint64_t v8 = 8;
        }
        else {
          uint64_t v8 = 2;
        }
        self->super.inPriority += v8;
      }
      uint64_t v5 = [(NSMutableOrderedSet *)inNodes countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  self->super.outPriority = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  outNodes = self->super.outNodes;
  uint64_t v10 = [(NSMutableOrderedSet *)outNodes countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(outNodes);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * j) isMemberOfClass:objc_opt_class()]) {
          uint64_t v14 = 8;
        }
        else {
          uint64_t v14 = 2;
        }
        self->super.inPriority += v14;
      }
      uint64_t v11 = [(NSMutableOrderedSet *)outNodes countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
}

@end