@interface NSArray
- (void)enumerateAdamIDsUsingBlock:(id)a3;
@end

@implementation NSArray

- (void)enumerateAdamIDsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    +[BLJaliscoReadOnlyDAAPClient sharedClient];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_76D4;
    v6[3] = &unk_209B0;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v4;
    id v5 = v7;
    [(NSArray *)self enumerateObjectsUsingBlock:v6];
  }
}

@end