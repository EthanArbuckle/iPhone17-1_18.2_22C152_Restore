@interface NSData(EFSQLBindable)
- (EFSQLBinding)ef_SQLBinding;
@end

@implementation NSData(EFSQLBindable)

- (EFSQLBinding)ef_SQLBinding
{
  return +[EFSQLBinding bindingWithData:a1];
}

@end