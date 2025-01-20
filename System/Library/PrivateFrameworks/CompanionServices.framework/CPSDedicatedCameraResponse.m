@interface CPSDedicatedCameraResponse
+ (BOOL)supportsSecureCoding;
- (CPSDedicatedCameraResponse)initWithCoder:(id)a3;
@end

@implementation CPSDedicatedCameraResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSDedicatedCameraResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSDedicatedCameraResponse;
  return [(CPSDedicatedCameraResponse *)&v4 init];
}

@end