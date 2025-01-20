@interface CLRegion(HMFObject)
+ (NSString)shortDescription;
- (id)shortDescription;
- (uint64_t)description;
@end

@implementation CLRegion(HMFObject)

- (id)shortDescription
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() shortDescription];
  v2 = [v0 stringWithFormat:@"<%@>", v1];

  return v2;
}

- (uint64_t)description
{
  return MEMORY[0x270F30880](a1, a2);
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end