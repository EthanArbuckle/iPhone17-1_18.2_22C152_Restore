@interface CKMultiCache
- (BOOL)cacheEligibleForPrewarm;
- (CKMultiCache)init;
- (unint64_t)limit;
- (void)dealloc;
- (void)markCacheAsPrewarmed;
- (void)pushObject:(id)a3 forKey:(id)a4;
- (void)removeAllObjects;
- (void)setCacheEligibleForPrewarm:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation CKMultiCache

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKMultiCache;
  [(CKMultiCache *)&v4 dealloc];
}

- (CKMultiCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKMultiCache;
  v2 = [(IMMultiDict *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CKMultiCache *)v2 setCacheEligibleForPrewarm:1];
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43660] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43670] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43788] object:0];

    v3->_limit = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)pushObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IMMultiDict *)self count] > self->_limit) {
    [(CKMultiCache *)self removeAllObjects];
  }
  v8.receiver = self;
  v8.super_class = (Class)CKMultiCache;
  [(IMMultiDict *)&v8 pushObject:v6 forKey:v7];
}

- (void)removeAllObjects
{
  [(CKMultiCache *)self setCacheEligibleForPrewarm:1];
  v3.receiver = self;
  v3.super_class = (Class)CKMultiCache;
  [(IMMultiDict *)&v3 removeAllObjects];
}

- (void)markCacheAsPrewarmed
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (BOOL)cacheEligibleForPrewarm
{
  return self->_cacheEligibleForPrewarm;
}

- (void)setCacheEligibleForPrewarm:(BOOL)a3
{
  self->_cacheEligibleForPrewarm = a3;
}

@end