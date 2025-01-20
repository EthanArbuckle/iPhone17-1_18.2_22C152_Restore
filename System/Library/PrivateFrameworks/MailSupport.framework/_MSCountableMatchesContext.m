@interface _MSCountableMatchesContext
- (NSMutableSet)highestMatches;
- (_MSCountableMatchesContext)init;
- (int64_t)maxCount;
- (void)countInstances:(id)a3 usingPredicate:(id)a4;
- (void)setMaxCount:(int64_t)a3;
@end

@implementation _MSCountableMatchesContext

- (_MSCountableMatchesContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MSCountableMatchesContext;
  v2 = [(_MSCountableMatchesContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    contactsCount = v2->_contactsCount;
    v2->_contactsCount = (NSMutableDictionary *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    highestMatches = v2->_highestMatches;
    v2->_highestMatches = v5;
  }
  return v2;
}

- (void)countInstances:(id)a3 usingPredicate:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v22 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = v7[2](v7, v10);
        if (v11)
        {
          contactsCount = self->_contactsCount;
          v13 = [v10 identifier];
          v14 = [(NSMutableDictionary *)contactsCount objectForKeyedSubscript:v13];
          uint64_t v15 = [v14 integerValue];

          int64_t v16 = v15 + v11;
          int64_t maxCount = self->_maxCount;
          if (v15 + v11 == maxCount)
          {
            if (v16 <= 0) {
              goto LABEL_13;
            }
          }
          else
          {
            if (v15 + v11 <= maxCount) {
              goto LABEL_13;
            }
            self->_int64_t maxCount = v16;
            [(NSMutableSet *)self->_highestMatches removeAllObjects];
            if (v16 < 1) {
              goto LABEL_13;
            }
          }
          [(NSMutableSet *)self->_highestMatches addObject:v10];
LABEL_13:
          v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v15 + v11];
          v19 = self->_contactsCount;
          v20 = [v10 identifier];
          [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

          continue;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_int64_t maxCount = a3;
}

- (NSMutableSet)highestMatches
{
  return self->_highestMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highestMatches, 0);
  objc_storeStrong((id *)&self->_contactsCount, 0);
}

@end