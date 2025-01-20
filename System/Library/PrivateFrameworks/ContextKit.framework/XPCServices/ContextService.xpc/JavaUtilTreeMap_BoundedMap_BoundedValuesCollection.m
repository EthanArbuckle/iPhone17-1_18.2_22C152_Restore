@interface JavaUtilTreeMap_BoundedMap_BoundedValuesCollection
+ (const)__metadata;
- (BOOL)isEmpty;
- (JavaUtilTreeMap_BoundedMap_BoundedValuesCollection)initWithJavaUtilTreeMap_BoundedMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
@end

@implementation JavaUtilTreeMap_BoundedMap_BoundedValuesCollection

- (int)size
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak size];
}

- (BOOL)isEmpty
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak isEmpty];
}

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v4 = sub_1001EB060((uint64_t)Weak, 1);
  v5 = [JavaUtilTreeMap_BoundedMap_BoundedValuesCollection__1 alloc];
  sub_1001EE4A4((uint64_t)v5, (id *)&self->super.super.isa, v4);
  return v5;
}

- (JavaUtilTreeMap_BoundedMap_BoundedValuesCollection)initWithJavaUtilTreeMap_BoundedMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractCollection_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedValuesCollection;
  [(JavaUtilTreeMap_BoundedMap_BoundedValuesCollection *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  if (!a3->var0)
  {
    v10 = Weak;
    a3->var3[1] = (unint64_t)[Weak endpointWithBoolean:1];
    a3->var3[2] = (unint64_t)[v10 endpointWithBoolean:0];
  }
  uint64_t v11 = *(objc_loadWeak((id *)v8) + 3);
  int v12 = *((unsigned __int8 *)objc_loadWeak((id *)v8) + 32);
  return sub_1001E9AA8(v11, a3, (uint64_t)a4, a5, 2, v12);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100438A80;
}

- (void).cxx_destruct
{
}

@end