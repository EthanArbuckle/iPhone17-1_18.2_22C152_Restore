@interface SKGPhoneEdges
+ (Class)edgeClass;
+ (Class)nodeClass;
+ (id)labels;
@end

@implementation SKGPhoneEdges

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
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000F89B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000F89B8))
  {
    v6 = off_1000F8398[0];
    v5 = +[NSArray arrayWithObjects:&v6 count:1];
    qword_1000F89B0 = +[NSSet setWithArray:v5];

    __cxa_guard_release(&qword_1000F89B8);
    p_cache = (void **)(&OBJC_METACLASS___SKGEmbedding + 16);
  }
  v3 = p_cache[310];

  return v3;
}

@end