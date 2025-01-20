@interface _MFCountableMatchesContext
- (_MFCountableMatchesContext)init;
- (id)highestMatches;
- (int64_t)maxCount;
- (void)countInstances:(id)a3 usingPredicate:(id)a4;
- (void)dealloc;
- (void)setMaxCount:(int64_t)a3;
@end

@implementation _MFCountableMatchesContext

- (void).cxx_destruct
{
}

- (void)countInstances:(id)a3 usingPredicate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (uint64_t (**)(id, const void *))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(const void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = v7[2](v7, v12);
        if (v13)
        {
          int64_t v14 = (int64_t)CFDictionaryGetValue(self->_peopleCount, v12) + v13;
          int64_t maxCount = self->_maxCount;
          if (v14 == maxCount)
          {
            if (v14 <= 0) {
              goto LABEL_13;
            }
          }
          else
          {
            if (v14 <= maxCount) {
              goto LABEL_13;
            }
            self->_int64_t maxCount = v14;
            [(NSMutableSet *)self->_popularPeople removeAllObjects];
            if (v14 < 1) {
              goto LABEL_13;
            }
          }
          -[NSMutableSet addObject:](self->_popularPeople, "addObject:", v12, (void)v16);
LABEL_13:
          CFDictionarySetValue(self->_peopleCount, v12, (const void *)v14);
          continue;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (_MFCountableMatchesContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MFCountableMatchesContext;
  v2 = [(_MFCountableMatchesContext *)&v7 init];
  if (v2)
  {
    v2->_peopleCount = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    popularPeople = v2->_popularPeople;
    v2->_popularPeople = v3;

    v5 = v2;
  }

  return v2;
}

- (id)highestMatches
{
  return self->_popularPeople;
}

- (void)dealloc
{
  peopleCount = self->_peopleCount;
  if (peopleCount) {
    CFRelease(peopleCount);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MFCountableMatchesContext;
  [(_MFCountableMatchesContext *)&v4 dealloc];
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_int64_t maxCount = a3;
}

@end