@interface HSActivityRequest
- (HSActivityRequest)init;
@end

@implementation HSActivityRequest

- (HSActivityRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HSActivityRequest;
  return [(HSRequest *)&v3 initWithAction:@"activity"];
}

@end