@interface JavaUtilTreeMap_EntrySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilTreeMap_EntrySet)initWithJavaUtilTreeMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilTreeMap_EntrySet

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
  v5 = [JavaUtilTreeMap_EntrySet__1 alloc];
  sub_1001E9BF8((uint64_t)v5, (uint64_t)self, v4);
  return v5;
}

- (BOOL)containsWithId:(id)a3
{
  unsigned int v5 = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    id Weak = objc_loadWeak((id *)&self->this$0_);
    v7 = (void *)JavaUtilMap_Entry_class_();
    if (a3 && ([v7 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    LOBYTE(v5) = objc_msgSend(Weak, "findByEntryWithJavaUtilMap_Entry:", a3) != 0;
  }
  return v5;
}

- (BOOL)removeWithId:(id)a3
{
  LODWORD(v5) = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = &self->this$0_;
    id Weak = objc_loadWeak((id *)v6);
    v8 = (void *)JavaUtilMap_Entry_class_();
    if (a3 && ([v8 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    id v5 = objc_msgSend(Weak, "findByEntryWithJavaUtilMap_Entry:", a3);
    if (v5)
    {
      objc_msgSend(objc_loadWeak((id *)v6), "removeInternalWithJavaUtilTreeMap_Node:", v5);
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (JavaUtilTreeMap_EntrySet)initWithJavaUtilTreeMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_EntrySet;
  [(JavaUtilTreeMap_EntrySet *)&v3 __javaClone];
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
  return sub_1001E9AA8((uint64_t)v11, a3, (uint64_t)a4, a5, 0, 1);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004365D8;
}

- (void).cxx_destruct
{
}

@end