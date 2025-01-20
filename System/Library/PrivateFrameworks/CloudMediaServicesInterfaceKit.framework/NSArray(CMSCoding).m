@interface NSArray(CMSCoding)
- (id)cmsCoded;
@end

@implementation NSArray(CMSCoding)

- (id)cmsCoded
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__NSArray_CMSCoding__cmsCoded__block_invoke;
  v6[3] = &unk_2648882A0;
  id v3 = v2;
  id v7 = v3;
  [a1 enumerateObjectsUsingBlock:v6];
  if ([v3 count]) {
    v4 = (void *)[v3 copy];
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end