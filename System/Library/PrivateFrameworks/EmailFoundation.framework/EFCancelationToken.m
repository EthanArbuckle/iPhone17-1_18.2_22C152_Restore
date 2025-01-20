@interface EFCancelationToken
+ (EFCancelationToken)tokenWithCancelationBlock:(id)a3;
+ (EFCancelationToken)tokenWithLabel:(id)a3 cancelationBlock:(id)a4;
+ (id)_descriptionString;
- (void)addCancelable:(id)a3;
@end

@implementation EFCancelationToken

+ (id)_descriptionString
{
  return @"canceled";
}

+ (EFCancelationToken)tokenWithCancelationBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(EFCancelationToken);
  [(EFCancelationToken *)v4 addCancelationBlock:v3];

  return v4;
}

- (void)addCancelable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__EFCancelationToken_addCancelable___block_invoke;
  v6[3] = &unk_1E6121B40;
  id v7 = v4;
  id v5 = v4;
  [(EFCancelationToken *)self addCancelationBlock:v6];
}

uint64_t __36__EFCancelationToken_addCancelable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

+ (EFCancelationToken)tokenWithLabel:(id)a3 cancelationBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(EFInvocationToken *)[EFCancelationToken alloc] initWithLabel:v5];
  [(EFCancelationToken *)v7 addCancelationBlock:v6];

  return v7;
}

@end