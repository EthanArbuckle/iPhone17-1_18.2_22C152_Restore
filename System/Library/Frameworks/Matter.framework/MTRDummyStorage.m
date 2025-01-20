@interface MTRDummyStorage
- (BOOL)removeStorageDataForKey:(id)a3;
- (BOOL)setStorageData:(id)a3 forKey:(id)a4;
- (id)storageDataForKey:(id)a3;
@end

@implementation MTRDummyStorage

- (id)storageDataForKey:(id)a3
{
  return 0;
}

- (BOOL)setStorageData:(id)a3 forKey:(id)a4
{
  return 0;
}

- (BOOL)removeStorageDataForKey:(id)a3
{
  return 0;
}

@end