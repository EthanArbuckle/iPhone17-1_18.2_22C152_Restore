@interface NSMutableSet
- (void)_geo_filter:(id)a3;
@end

@implementation NSMutableSet

- (void)_geo_filter:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self count])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000283C0;
    v6[3] = &unk_100072280;
    id v7 = v4;
    v5 = +[NSPredicate predicateWithBlock:v6];
    [(NSMutableSet *)self filterUsingPredicate:v5];
  }
}

@end