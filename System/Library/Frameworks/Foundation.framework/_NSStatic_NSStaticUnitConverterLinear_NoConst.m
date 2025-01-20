@interface _NSStatic_NSStaticUnitConverterLinear_NoConst
- (Class)classForCoder;
- (double)constant;
- (unint64_t)retainCount;
@end

@implementation _NSStatic_NSStaticUnitConverterLinear_NoConst

- (double)constant
{
  return 0.0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end