@interface CNReadonlyPolicy
- (BOOL)isReadonly;
@end

@implementation CNReadonlyPolicy

- (BOOL)isReadonly
{
  return 1;
}

@end