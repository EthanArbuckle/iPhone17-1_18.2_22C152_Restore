@interface STStorageTip
- (int64_t)sortSize;
- (void)setSortSize:(int64_t)a3;
@end

@implementation STStorageTip

- (int64_t)sortSize
{
  v2 = [(STStorageTip *)self propertyForKey:@"_stSortSize"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (void)setSortSize:(int64_t)a3
{
  id v4 = +[NSNumber numberWithLongLong:a3];
  [(STStorageTip *)self setProperty:v4 forKey:@"_stSortSize"];
}

@end