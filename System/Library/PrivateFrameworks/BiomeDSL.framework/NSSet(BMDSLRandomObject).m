@interface NSSet(BMDSLRandomObject)
- (id)_bmdsl_randomObjectForKey:()BMDSLRandomObject;
@end

@implementation NSSet(BMDSLRandomObject)

- (id)_bmdsl_randomObjectForKey:()BMDSLRandomObject
{
  v1 = [a1 allObjects];
  v2 = objc_msgSend(v1, "bmdsl_randomObject");

  return v2;
}

@end