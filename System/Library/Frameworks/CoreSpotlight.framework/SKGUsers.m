@interface SKGUsers
+ (Class)edgeClass;
+ (Class)nodeClass;
+ (id)labels;
+ (id)usersInGraph:(id)a3;
- (SKGUsers)initWithUserNode:(id)a3 inGraph:(id)a4;
- (void)enumerateUsersInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation SKGUsers

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)labels
{
  p_cache = &OBJC_METACLASS___SKGEmbedding.cache;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000F8848, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000F8848))
  {
    v6 = off_1000F8350[0];
    v5 = +[NSArray arrayWithObjects:&v6 count:1];
    qword_1000F8840 = +[NSSet setWithArray:v5];

    __cxa_guard_release(&qword_1000F8848);
    p_cache = (void **)(&OBJC_METACLASS___SKGEmbedding + 16);
  }
  v3 = p_cache[264];

  return v3;
}

+ (id)usersInGraph:(id)a3
{
  id v3 = a3;
  v4 = [SKGUsers alloc];
  v5 = +[SKGUserNode user];
  v6 = [(SKGUsers *)v4 initWithUserNode:v5 inGraph:v3];

  return v6;
}

- (SKGUsers)initWithUserNode:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 graph];
  v9 = [v7 graph];
  v10 = [v6 filter];
  v11 = [v9 nodeIdentifiersMatchingFilter:v10];
  v14.receiver = self;
  v14.super_class = (Class)SKGUsers;
  v12 = [(SKGUsers *)&v14 initWithGraph:v8 elementIdentifiers:v11];

  return v12;
}

- (void)enumerateUsersInGraph:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A74C;
  v11[3] = &unk_1000D9C28;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(SKGUsers *)self enumerateNodesUsingBlock:v11];
}

@end