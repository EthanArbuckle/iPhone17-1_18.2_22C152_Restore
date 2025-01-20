@interface NSNumber(EFSQLBindable)
- (id)ef_SQLBinding;
@end

@implementation NSNumber(EFSQLBindable)

- (id)ef_SQLBinding
{
  CFNumberType Type = CFNumberGetType(a1);
  if ((unint64_t)Type > kCFNumberCGFloatType || ((1 << Type) & 0x13060) == 0)
  {
    +[EFSQLBinding bindingWithInt64:[(__CFNumber *)a1 longLongValue]];
  }
  else
  {
    [(__CFNumber *)a1 doubleValue];
    +[EFSQLBinding bindingWithDouble:](EFSQLBinding, "bindingWithDouble:");
  v4 = };
  return v4;
}

@end