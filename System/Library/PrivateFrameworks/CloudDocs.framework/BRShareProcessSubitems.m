@interface BRShareProcessSubitems
- (BRShareProcessSubitems)initWithURL:(id)a3 processType:(unint64_t)a4;
- (id)processSubitemsCompletionBlock;
- (unint64_t)maxSharedSubitemsBeforeFailure;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setMaxSharedSubitemsBeforeFailure:(unint64_t)a3;
- (void)setProcessSubitemsCompletionBlock:(id)a3;
@end

@implementation BRShareProcessSubitems

- (BRShareProcessSubitems)initWithURL:(id)a3 processType:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BRShareProcessSubitems;
  result = [(BRShareOperation *)&v6 initWithURL:a3];
  if (result)
  {
    result->_processType = a4;
    result->_maxSharedSubitemsBeforeFailure = 1;
  }
  return result;
}

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] processing share subitems at '%@'%@", v5, v6, v7, v8, v9);
}

void __30__BRShareProcessSubitems_main__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSNumber;
  BOOL v4 = a2 == 0;
  id v5 = a2;
  id v6 = [v3 numberWithInt:v4];
  [v2 completedWithResult:v6 error:v5];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(BRShareProcessSubitems *)self processSubitemsCompletionBlock];
  uint8_t v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    [(BRShareProcessSubitems *)self setProcessSubitemsCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareProcessSubitems;
  [(BROperation *)&v10 finishWithResult:v7 error:v6];
}

- (id)processSubitemsCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setProcessSubitemsCompletionBlock:(id)a3
{
}

- (unint64_t)maxSharedSubitemsBeforeFailure
{
  return self->_maxSharedSubitemsBeforeFailure;
}

- (void)setMaxSharedSubitemsBeforeFailure:(unint64_t)a3
{
  self->_maxSharedSubitemsBeforeFailure = a3;
}

- (void).cxx_destruct
{
}

@end