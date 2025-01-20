@interface NSString(EFSQLBindable)
- (EFSQLBinding)ef_SQLBinding;
@end

@implementation NSString(EFSQLBindable)

- (EFSQLBinding)ef_SQLBinding
{
  return +[EFSQLBinding bindingWithString:a1];
}

@end