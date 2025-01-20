@interface _GCPhysicalInputElementCollection0
- (id)elementAtIndex:(unint64_t)a3;
- (id)elementForAlias:(id)a3;
- (unint64_t)count;
@end

@implementation _GCPhysicalInputElementCollection0

- (unint64_t)count
{
  return 0;
}

- (id)elementAtIndex:(unint64_t)a3
{
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** %s: index %lu beyond bounds for empty collection.", "-[_GCPhysicalInputElementCollection0 elementAtIndex:]", a3);
  id v3 = +[NSException exceptionWithName:NSRangeException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v3);
}

- (id)elementForAlias:(id)a3
{
  return 0;
}

@end