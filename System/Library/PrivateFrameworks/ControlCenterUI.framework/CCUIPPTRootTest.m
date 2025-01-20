@interface CCUIPPTRootTest
+ (id)testWithName:(id)a3;
@end

@implementation CCUIPPTRootTest

+ (id)testWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithName:v4 beginSignpost:0 endSignpost:0];

  return v5;
}

@end