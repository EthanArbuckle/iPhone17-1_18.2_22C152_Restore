@interface EXPromise
@end

@implementation EXPromise

uint64_t __35___EXPromise_initWithPromiseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __28___EXPromise_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[_EXPromiseManager sharedInstance];
  v7 = [v6 resolveObjectOfClasses:v5 forIdentifier:*(void *)(a1 + 32) endpoint:*(void *)(a1 + 40) error:a3];

  return v7;
}

id __43___EXPromise_resolveObjectOfClasses_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __48___EXPromise_resolveObjectOfClasses_completion___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end