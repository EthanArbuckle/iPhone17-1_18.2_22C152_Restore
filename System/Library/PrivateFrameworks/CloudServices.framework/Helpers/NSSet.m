@interface NSSet
- (int64_t)compareMembershipOfObject:(id)a3 withSet:(id)a4;
- (unint64_t)countOfObjectsWithPrefix:(id)a3;
@end

@implementation NSSet

- (unint64_t)countOfObjectsWithPrefix:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000332D8;
  v8[3] = &unk_100071A00;
  id v9 = a3;
  id v4 = v9;
  v5 = [(NSSet *)self objectsPassingTest:v8];
  id v6 = [v5 count];

  return (unint64_t)v6;
}

- (int64_t)compareMembershipOfObject:(id)a3 withSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSSet *)self containsObject:v6]
    && ([v7 containsObject:v6] & 1) != 0)
  {
    goto LABEL_8;
  }
  if (-[NSSet containsObject:](self, "containsObject:", v6) && ![v7 containsObject:v6])
  {
    int64_t v8 = 1;
    goto LABEL_10;
  }
  if ([(NSSet *)self containsObject:v6]
    || ([v7 containsObject:v6] & 1) == 0)
  {
LABEL_8:
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = -1;
  }
LABEL_10:

  return v8;
}

@end