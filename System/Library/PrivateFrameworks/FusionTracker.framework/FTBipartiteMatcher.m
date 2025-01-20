@interface FTBipartiteMatcher
- (FTBipartiteMatcher)init;
- (FTBipartiteMatcher)initWithInitialSize:(unint64_t)a3;
- (id).cxx_construct;
- (id)computeMatchingForCostMatrix:(const float *)a3 withRowCount:(unint64_t)a4 columnCount:(unint64_t)a5;
@end

@implementation FTBipartiteMatcher

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (FTBipartiteMatcher)initWithInitialSize:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FTBipartiteMatcher;
  if ([(FTBipartiteMatcher *)&v4 init]) {
    operator new();
  }

  return 0;
}

- (FTBipartiteMatcher)init
{
  return [(FTBipartiteMatcher *)self initWithInitialSize:10];
}

- (id)computeMatchingForCostMatrix:(const float *)a3 withRowCount:(unint64_t)a4 columnCount:(unint64_t)a5
{
  ft::HungarianMatcher::Match((ft::HungarianMatcher *)self->_optimizer.__ptr_.__value_, (float *)a3, a4, a5, &v12);
  v5 = v12;
  if (v12 == v13)
  {
    v7 = 0;
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  v7 = (void *)[v6 initWithCapacity:(v13 - v12) >> 3];
  v8 = v12;
  v9 = v13;
  if (v12 != v13)
  {
    do
    {
      v10 = [NSNumber numberWithLongLong:*v8];
      [v7 addObject:v10];

      ++v8;
    }
    while (v8 != v9);
  }
  v5 = v12;
  if (v12)
  {
LABEL_7:
    v13 = v5;
    operator delete(v5);
  }
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  value = self->_optimizer.__ptr_.__value_;
  self->_optimizer.__ptr_.__value_ = 0;
  if (value)
  {
    ft::HungarianMatcher::~HungarianMatcher((ft::HungarianMatcher *)value);
    JUMPOUT(0x21D449420);
  }
}

- (void)computeMatchingForCostMatrix:(uint64_t)a1 withRowCount:(NSObject *)a2 columnCount:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21762A000, a2, OS_LOG_TYPE_ERROR, "Bipartite matching exception: %s", (uint8_t *)&v4, 0xCu);
}

@end