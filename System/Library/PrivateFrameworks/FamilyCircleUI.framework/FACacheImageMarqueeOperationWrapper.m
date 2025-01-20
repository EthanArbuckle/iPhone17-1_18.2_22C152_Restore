@interface FACacheImageMarqueeOperationWrapper
- (FACacheImageMarqueeOperation)cacheImageOperation;
- (FACacheImageMarqueeOperationWrapper)initWithFamilyCircle:(id)a3;
- (void)createAndCacheData;
- (void)generateMarqueeWith:(unint64_t)a3;
- (void)setCacheImageOperation:(id)a3;
@end

@implementation FACacheImageMarqueeOperationWrapper

- (FACacheImageMarqueeOperationWrapper)initWithFamilyCircle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FACacheImageMarqueeOperationWrapper;
  v5 = [(FACacheImageMarqueeOperationWrapper *)&v9 init];
  if (v5)
  {
    v6 = [[FACacheImageMarqueeOperation alloc] initWithFamilyCircle:v4];
    cacheImageOperation = v5->_cacheImageOperation;
    v5->_cacheImageOperation = v6;
  }
  return v5;
}

- (void)createAndCacheData
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "FACacheImageMarqueeOperationWrapper createAndCacheData", v4, 2u);
  }

  [(FACacheImageMarqueeOperation *)self->_cacheImageOperation createAndCacheData];
}

- (void)generateMarqueeWith:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 < 3 || a3 == 1000) {
    v5 = @"Return-Valid-Cache-Else-Load";
  }
  else {
    v5 = @"unknown";
  }
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "FACacheImageMarqueeOperationWrapper createAndCacheData with cachePolicy %@", (uint8_t *)&v7, 0xCu);
  }

  [(FACacheImageMarqueeOperation *)self->_cacheImageOperation generateMarqueeWith:a3];
}

- (FACacheImageMarqueeOperation)cacheImageOperation
{
  return self->_cacheImageOperation;
}

- (void)setCacheImageOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end