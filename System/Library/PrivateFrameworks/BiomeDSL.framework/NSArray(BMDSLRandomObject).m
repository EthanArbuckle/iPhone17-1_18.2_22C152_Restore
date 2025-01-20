@interface NSArray(BMDSLRandomObject)
- (id)bmdsl_randomObject;
@end

@implementation NSArray(BMDSLRandomObject)

- (id)bmdsl_randomObject
{
  v2 = (void *)[a1 count];
  if (v2)
  {
    v2 = objc_msgSend(a1, "objectAtIndex:", arc4random_uniform(objc_msgSend(a1, "count")));
  }
  return v2;
}

@end