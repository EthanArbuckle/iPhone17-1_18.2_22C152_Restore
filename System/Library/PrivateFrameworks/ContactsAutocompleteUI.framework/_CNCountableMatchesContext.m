@interface _CNCountableMatchesContext
- (NSMutableSet)highestMatches;
- (_CNCountableMatchesContext)init;
- (int64_t)maxCount;
- (void)countInstances:(id)a3 usingPredicate:(id)a4;
- (void)setMaxCount:(int64_t)a3;
@end

@implementation _CNCountableMatchesContext

- (_CNCountableMatchesContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_CNCountableMatchesContext;
  v2 = [(_CNCountableMatchesContext *)&v8 init];
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = v7[2](v7, v11);
        if (v12)
        {
          uint64_t v13 = v12;
          contactsCount = self->_contactsCount;
          v15 = [v11 identifier];
          v16 = [(NSMutableDictionary *)contactsCount objectForKeyedSubscript:v15];
          uint64_t v17 = [v16 integerValue];

          int64_t v18 = v17 + v13;
          int64_t maxCount = self->_maxCount;
          if (v18 == maxCount)
          {
            if (v18 <= 0) {
              goto LABEL_13;
            }
          }
          else
          {
            if (v18 <= maxCount) {
              goto LABEL_13;
            }
            self->_int64_t maxCount = v18;
            [(NSMutableSet *)self->_highestMatches removeAllObjects];
            if (v18 < 1) {
              goto LABEL_13;
            }
          }
          [(NSMutableSet *)self->_highestMatches addObject:v11];
LABEL_13:
          v20 = [NSNumber numberWithInteger:v18];
          v21 = self->_contactsCount;
          v22 = [v11 identifier];
          [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];

          continue;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
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