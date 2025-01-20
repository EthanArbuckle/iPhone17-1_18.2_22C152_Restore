@interface SKGDomainEdges
+ (Class)edgeClass;
+ (Class)nodeClass;
+ (id)labels;
- (SKGDomainEdges)initWithDomainNode:(id)a3 inGraph:(id)a4;
@end

@implementation SKGDomainEdges

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
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000F89E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000F89E8))
  {
    v6 = off_1000F83B0;
    v5 = +[NSArray arrayWithObjects:&v6 count:1];
    qword_1000F89E0 = +[NSSet setWithArray:v5];

    __cxa_guard_release(&qword_1000F89E8);
    p_cache = (void **)(&OBJC_METACLASS___SKGEmbedding + 16);
  }
  v3 = p_cache[316];

  return v3;
}

- (SKGDomainEdges)initWithDomainNode:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[NSSet setWithObject:a3];
  v8 = [v6 graph];
  v11.receiver = self;
  v11.super_class = (Class)SKGDomainEdges;
  v9 = [(SKGDomainEdges *)&v11 initWithSet:v7 graph:v8];

  return v9;
}

@end