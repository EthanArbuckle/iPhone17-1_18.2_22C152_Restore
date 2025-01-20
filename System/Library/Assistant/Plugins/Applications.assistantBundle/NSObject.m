@interface NSObject
- (BOOL)isMetaDataItemDelete;
- (BOOL)isMetaDataItemUpdate;
@end

@implementation NSObject

- (BOOL)isMetaDataItemDelete
{
  return 0;
}

- (BOOL)isMetaDataItemUpdate
{
  return 0;
}

@end