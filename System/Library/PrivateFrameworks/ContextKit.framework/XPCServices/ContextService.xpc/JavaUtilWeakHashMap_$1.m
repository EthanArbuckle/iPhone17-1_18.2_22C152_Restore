@interface JavaUtilWeakHashMap_$1
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilWeakHashMap_$1)initWithJavaUtilWeakHashMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilWeakHashMap_$1

- (int)size
{
  return [(JavaUtilWeakHashMap *)self->this$0_ size];
}

- (void)clear
{
}

- (BOOL)removeWithId:(id)a3
{
  BOOL v5 = -[JavaUtilWeakHashMap_$1 containsWithId:](self, "containsWithId:");
  if (v5)
  {
    v6 = self->this$0_;
    v7 = (void *)JavaUtilMap_Entry_class_();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if (([v7 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    -[JavaUtilWeakHashMap removeWithId:](v6, "removeWithId:", [a3 getKey]);
  }
  return v5;
}

- (BOOL)containsWithId:(id)a3
{
  if (![(id)JavaUtilMap_Entry_class_() isInstance:a3]) {
    return 0;
  }
  BOOL v5 = self->this$0_;
  v6 = (void *)JavaUtilMap_Entry_class_();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (([v6 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  v7 = -[JavaUtilWeakHashMap getEntryWithId:](v5, "getEntryWithId:", [a3 getKey]);
  if (!v7) {
    return 0;
  }
  v8 = v7;
  if (![v7 get] && !v8[44]) {
    return 0;
  }
  return [a3 isEqual:v8];
}

- (id)iterator
{
  v2 = new_JavaUtilWeakHashMap_HashIterator_initWithJavaUtilWeakHashMap_withJavaUtilWeakHashMap_Entry_Type_((unsigned int *)self->this$0_, [JavaUtilWeakHashMap__1__1 alloc]);
  return v2;
}

- (JavaUtilWeakHashMap_$1)initWithJavaUtilWeakHashMap:(id)a3
{
  JreStrongAssign((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilWeakHashMap__1;
  [(JavaUtilWeakHashMap_$1 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FE2A8;
}

@end