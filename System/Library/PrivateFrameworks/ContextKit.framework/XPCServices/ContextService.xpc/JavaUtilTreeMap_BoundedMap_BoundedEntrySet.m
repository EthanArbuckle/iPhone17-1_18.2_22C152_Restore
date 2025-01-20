@interface JavaUtilTreeMap_BoundedMap_BoundedEntrySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilTreeMap_BoundedMap_BoundedEntrySet)initWithJavaUtilTreeMap_BoundedMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
@end

@implementation JavaUtilTreeMap_BoundedMap_BoundedEntrySet

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
  v5 = [JavaUtilTreeMap_BoundedMap_BoundedEntrySet__1 alloc];
  sub_1001ED528((uint64_t)v5, (id *)&self->super.super.super.isa, v4);
  return v5;
}

- (BOOL)containsWithId:(id)a3
{
  unsigned int v5 = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaUtilMap_Entry_class_();
    if (!a3)
    {
      objc_loadWeak((id *)&self->this$0_);
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    v7 = &self->this$0_;
    id Weak = objc_loadWeak((id *)v7);
    unsigned int v5 = sub_1001EB5F4(Weak, (uint64_t)[a3 getKey], Weak[6], Weak[8]);
    if (v5) {
      LOBYTE(v5) = objc_msgSend(*((id *)objc_loadWeak((id *)v7) + 3), "findByEntryWithJavaUtilMap_Entry:", a3) != 0;
    }
  }
  return v5;
}

- (BOOL)removeWithId:(id)a3
{
  if (![(id)JavaUtilMap_Entry_class_() isInstance:a3]) {
    return 0;
  }
  unsigned int v5 = (void *)JavaUtilMap_Entry_class_();
  if (!a3)
  {
    objc_loadWeak((id *)&self->this$0_);
    JreThrowNullPointerException();
  }
  if (([v5 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  v6 = &self->this$0_;
  id Weak = objc_loadWeak((id *)v6);
  if (!sub_1001EB5F4(Weak, (uint64_t)[a3 getKey], Weak[6], Weak[8])) {
    return 0;
  }
  id v8 = [*((id *)objc_loadWeak((id *)v6) + 3) entrySet];
  if (!v8) {
    JreThrowNullPointerException();
  }
  return [v8 removeWithId:a3];
}

- (JavaUtilTreeMap_BoundedMap_BoundedEntrySet)initWithJavaUtilTreeMap_BoundedMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedEntrySet;
  [(JavaUtilTreeMap_BoundedMap_BoundedEntrySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  if (!a3->var0)
  {
    v10 = Weak;
    a3->var3[1] = (unint64_t)[Weak endpointWithBoolean:1];
    a3->var3[2] = (unint64_t)[v10 endpointWithBoolean:0];
  }
  uint64_t v11 = *(objc_loadWeak((id *)v8) + 3);
  int v12 = *((unsigned __int8 *)objc_loadWeak((id *)v8) + 32);
  return sub_1001E9AA8(v11, a3, (uint64_t)a4, a5, 0, v12);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004380D8;
}

- (void).cxx_destruct
{
}

@end