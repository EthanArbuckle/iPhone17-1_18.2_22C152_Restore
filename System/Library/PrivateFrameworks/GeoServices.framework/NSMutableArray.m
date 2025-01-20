@interface NSMutableArray
- (void)_geo_filter:(id)a3;
@end

@implementation NSMutableArray

- (void)_geo_filter:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self count])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004AFE4;
    v6[3] = &unk_100072280;
    id v7 = v4;
    v5 = +[NSPredicate predicateWithBlock:v6];
    [(NSMutableArray *)self filterUsingPredicate:v5];
  }
}

@end