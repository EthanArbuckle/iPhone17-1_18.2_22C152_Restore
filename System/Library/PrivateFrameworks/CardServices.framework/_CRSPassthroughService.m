@interface _CRSPassthroughService
- (BOOL)canSatisfyCardRequest:(id)a3;
- (NSString)serviceIdentifier;
- (unint64_t)servicePriorityForRequest:(id)a3;
- (void)requestCard:(id)a3 reply:(id)a4;
@end

@implementation _CRSPassthroughService

- (void)requestCard:(id)a3 reply:(id)a4
{
  v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    v5 = [a3 content];
    if ([v5 conformsToProtocol:&unk_26D927BD0]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7[2](v7, v6, 0);
  }
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  return 0;
}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  v3 = [a3 content];
  char v4 = [v3 conformsToProtocol:&unk_26D927BD0];

  return v4;
}

- (NSString)serviceIdentifier
{
  return (NSString *)@"com.apple.cardservices.PassthroughService";
}

@end