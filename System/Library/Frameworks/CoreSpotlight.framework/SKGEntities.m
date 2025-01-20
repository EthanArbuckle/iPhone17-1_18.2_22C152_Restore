@interface SKGEntities
+ (Class)edgeClass;
+ (Class)nodeClass;
+ (id)entityWithEntityIdentifier:(id)a3 inGraph:(id)a4;
+ (id)labels;
- (SKGEntities)initWithEntityNode:(id)a3 inGraph:(id)a4;
- (void)enumerateEntitiesInGraph:(id)a3 usingBlock:(id)a4;
@end

@implementation SKGEntities

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
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000F8888, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000F8888))
  {
    v6 = off_1000F8370[0];
    v5 = +[NSArray arrayWithObjects:&v6 count:1];
    qword_1000F8880 = +[NSSet setWithArray:v5];

    __cxa_guard_release(&qword_1000F8888);
    p_cache = (void **)(&OBJC_METACLASS___SKGEmbedding + 16);
  }
  v3 = p_cache[272];

  return v3;
}

+ (id)entityWithEntityIdentifier:(id)a3 inGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[SKGEntityNode alloc] initWithIdentifier:v5];
  v8 = [[SKGEntities alloc] initWithEntityNode:v7 inGraph:v6];

  return v8;
}

- (SKGEntities)initWithEntityNode:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 graph];
  v9 = [v7 graph];
  v10 = [v6 filter];
  v11 = [v9 nodeIdentifiersMatchingFilter:v10];
  v14.receiver = self;
  v14.super_class = (Class)SKGEntities;
  v12 = [(SKGEntities *)&v14 initWithGraph:v8 elementIdentifiers:v11];

  return v12;
}

- (void)enumerateEntitiesInGraph:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002BAAC;
  v11[3] = &unk_1000D9C28;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(SKGEntities *)self enumerateNodesUsingBlock:v11];
}

@end