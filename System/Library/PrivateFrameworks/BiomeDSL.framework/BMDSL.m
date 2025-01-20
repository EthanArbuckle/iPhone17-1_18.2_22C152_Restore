@interface BMDSL
- (NSArray)upstreams;
- (id)as:(id)a3;
- (id)bpsPublisher;
- (id)collect;
- (id)combinedState;
- (id)filterWithKeyPath:(id)a3 comparison:(int64_t)a4 negation:(BOOL)a5 value:(id)a6;
- (id)filterWithKeyPath:(id)a3 comparison:(int64_t)a4 value:(id)a5;
- (id)filterWithKeyPath:(id)a3 value:(id)a4;
- (id)insertState:(id)a3 as:(id)a4;
- (id)mapWithSelector:(SEL)a3;
- (id)mapWithTransform:(id)a3;
- (id)mapWithTransform:(id)a3 keyPaths:(id)a4;
- (id)mergeWithOther:(id)a3;
- (id)orderedMergeWithOther:(id)a3 key:(id)a4 selector:(SEL)a5;
- (id)subscribeOn:(id)a3;
- (id)subscribeOn:(id)a3 with:(id)a4;
- (id)windowByKeyedPath:(id)a3 assigner:(id)a4;
- (void)allowEvaluation;
@end

@implementation BMDSL

- (id)filterWithKeyPath:(id)a3 value:(id)a4
{
  return [(BMDSL *)self filterWithKeyPath:a3 comparison:0 value:a4];
}

- (id)filterWithKeyPath:(id)a3 comparison:(int64_t)a4 value:(id)a5
{
  return [(BMDSL *)self filterWithKeyPath:a3 comparison:a4 negation:0 value:a5];
}

- (id)filterWithKeyPath:(id)a3 comparison:(int64_t)a4 negation:(BOOL)a5 value:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  LODWORD(v14) = 1;
  v12 = [[BMDSLFilter alloc] initWithUpstream:self keyPath:v11 comparison:a4 negation:v6 value:v10 name:@"filter" version:v14];

  return v12;
}

- (id)collect
{
  v2 = [[BMDSLCollect alloc] initWithUpstream:self];
  return v2;
}

- (id)subscribeOn:(id)a3
{
  id v4 = a3;
  v5 = [[BMDSLSubscribeOn alloc] initWithUpstream:self scheduler:v4];

  return v5;
}

- (id)windowByKeyedPath:(id)a3 assigner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BMDSLWindower alloc] initWithUpstream:self keyedPath:v7 assigner:v6];

  return v8;
}

- (id)mapWithTransform:(id)a3
{
  id v4 = a3;
  v5 = [[BMDSLMap alloc] initWithUpstream:self transform:v4];

  return v5;
}

- (id)mapWithTransform:(id)a3 keyPaths:(id)a4
{
  id v6 = a3;
  id v7 = +[BMDSLKeyPathSelector withKeyPaths:a4];
  v8 = +[BMDSLArgumentTransform withSelector:v7];

  v9 = [[BMDSLMap alloc] initWithUpstream:self transform:v8];
  id v10 = [(BMDSL *)v9 mapWithTransform:v6];

  return v10;
}

- (id)mapWithSelector:(SEL)a3
{
  id v4 = +[BMDSLInstanceTransform withSelector:a3];
  v5 = [[BMDSLMap alloc] initWithUpstream:self transform:v4];

  return v5;
}

- (id)insertState:(id)a3 as:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BMDSLState alloc] initWithUpstream:self key:v6 value:v7];

  return v8;
}

- (id)as:(id)a3
{
  id v4 = a3;
  v5 = [[BMDSLState alloc] initWithUpstream:self key:v4 value:0];

  return v5;
}

- (id)orderedMergeWithOther:(id)a3 key:(id)a4 selector:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[BMDSLOrderedMerge alloc] initWithA:self b:v9 key:v8 selector:a5];

  return v10;
}

- (NSArray)upstreams
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(BMDSL *)self upstreams];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) allowEvaluation];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BMDSL;
  [(BMDSLBaseCodable *)&v8 allowEvaluation];
}

- (id)combinedState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(BMDSL *)self upstreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) combinedState];
        long long v9 = v8;
        if (v5)
        {
          uint64_t v10 = [v5 reduceWithNext:v8];

          id v5 = (id)v10;
        }
        else
        {
          id v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)mergeWithOther:(id)a3
{
  id v4 = a3;
  id v5 = [[BMDSLMerge alloc] initWithA:self b:v4];

  return v5;
}

- (id)subscribeOn:(id)a3 with:(id)a4
{
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[BMDSL(BMDSLSubscribeWith) subscribeOn:with:](v4);
  }

  return 0;
}

- (id)bpsPublisher
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];

  return 0;
}

@end