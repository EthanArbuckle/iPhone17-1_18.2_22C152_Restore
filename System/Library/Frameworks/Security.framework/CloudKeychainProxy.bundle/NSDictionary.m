@interface NSDictionary
- (id)compactDescription;
@end

@implementation NSDictionary

- (id)compactDescription
{
  +[NSMutableArray array];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000104E8;
  v6[3] = &unk_100019040;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [(NSDictionary *)self enumerateKeysAndObjectsUsingBlock:v6];
  v4 = [v3 componentsJoinedByString:@" "];

  return v4;
}

@end