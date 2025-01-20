@interface NSDictionary(CATIDSAdditions)
- (id)cat_uuidForKey:()CATIDSAdditions;
@end

@implementation NSDictionary(CATIDSAdditions)

- (id)cat_uuidForKey:()CATIDSAdditions
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end