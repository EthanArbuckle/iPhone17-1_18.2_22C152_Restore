@interface NSSet
- (id)_geo_filtered:(id)a3;
@end

@implementation NSSet

- (id)_geo_filtered:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000282E8;
    v8[3] = &unk_100072280;
    id v9 = v4;
    v5 = +[NSPredicate predicateWithBlock:v8];
    v6 = [(NSSet *)self filteredSetUsingPredicate:v5];
  }
  else
  {
    v6 = objc_opt_new();
  }

  return v6;
}

@end