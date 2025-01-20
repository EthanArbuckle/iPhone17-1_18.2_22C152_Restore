@interface EFAutoCancelationToken
- (void)dealloc;
@end

@implementation EFAutoCancelationToken

- (void)dealloc
{
  [(EFCancelationToken *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)EFAutoCancelationToken;
  [(EFAutoCancelationToken *)&v3 dealloc];
}

@end