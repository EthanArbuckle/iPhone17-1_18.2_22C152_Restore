@interface CNCardDowntimeWhitelistGroupItem
- (BOOL)canRemove;
- (BOOL)isReadonly;
@end

@implementation CNCardDowntimeWhitelistGroupItem

- (BOOL)canRemove
{
  return 0;
}

- (BOOL)isReadonly
{
  return 1;
}

@end