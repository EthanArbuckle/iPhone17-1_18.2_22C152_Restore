@interface _NSStatic_NSUnitInformationStorage
- (Class)_effectiveUnitClass;
- (Class)classForCoder;
- (unint64_t)retainCount;
@end

@implementation _NSStatic_NSUnitInformationStorage

- (unint64_t)retainCount
{
  return -1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)_effectiveUnitClass
{
  return (Class)objc_opt_class();
}

@end