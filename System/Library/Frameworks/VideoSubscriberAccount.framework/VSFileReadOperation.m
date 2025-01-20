@interface VSFileReadOperation
- (NSURL)source;
- (VSFileReadOperation)init;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setResult:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation VSFileReadOperation

- (VSFileReadOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSFileReadOperation;
  v2 = [(VSFileReadOperation *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;
  }
  return v2;
}

- (void)executionDidBegin
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v4 = [(VSFileReadOperation *)self source];
  id v10 = 0;
  v5 = (void *)[v3 initWithContentsOfURL:v4 options:0 error:&v10];
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = +[VSFailable failableWithObject:v5];
  }
  else
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The readErrorOrNil parameter must not be nil."];
    }
    uint64_t v7 = +[VSFailable failableWithError:v6];
  }
  v8 = (void *)v7;
  v9 = +[VSOptional optionalWithObject:v7];
  [(VSFileReadOperation *)self setResult:v9];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end