@interface AXMLayoutLine
+ (id)line:(id)a3;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (id)recognizedTextFeatures;
- (id)sequences;
- (void)addSequence:(id)a3;
@end

@implementation AXMLayoutLine

+ (id)line:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXMLayoutLine);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];

  sequences = v4->_sequences;
  v4->_sequences = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  id v3 = objc_opt_class();
  sequences = self->_sequences;

  [v3 boundingFrameForItems:sequences];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)normalizedFrame
{
  id v3 = objc_opt_class();
  sequences = self->_sequences;

  [v3 normalizedBoundingFrameForItems:sequences];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)recognizedTextFeatures
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_sequences;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "feature", (void)v12);
        v10 = [v9 recognizedTextFeatures];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)addSequence:(id)a3
{
}

- (id)sequences
{
  return self->_sequences;
}

- (void).cxx_destruct
{
}

@end