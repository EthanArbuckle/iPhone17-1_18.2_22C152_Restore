@interface JavaUtilTreeMap_ValuesCollection
+ (const)__metadata;
- (JavaUtilTreeMap_ValuesCollection)initWithJavaUtilTreeMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
@end

@implementation JavaUtilTreeMap_ValuesCollection

- (int)size
{
  return *((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 10);
}

- (id)iterator
{
  v3 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 4);
  if (v3) {
    id v4 = [v3 first];
  }
  else {
    id v4 = 0;
  }
  v5 = [JavaUtilTreeMap_ValuesCollection__1 alloc];
  sub_1001EA8D4((uint64_t)v5, (uint64_t)self, v4);
  return v5;
}

- (JavaUtilTreeMap_ValuesCollection)initWithJavaUtilTreeMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractCollection_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_ValuesCollection;
  [(JavaUtilTreeMap_ValuesCollection *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  if (!a3->var0)
  {
    v10 = Weak;
    a3->var3[1] = (unint64_t)[Weak firstNode];
    a3->var3[2] = (unint64_t)[v10 lastNode];
  }
  id v11 = objc_loadWeak((id *)v8);
  return sub_1001E9AA8((uint64_t)v11, a3, (uint64_t)a4, a5, 2, 1);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100436EA8;
}

- (void).cxx_destruct
{
}

@end