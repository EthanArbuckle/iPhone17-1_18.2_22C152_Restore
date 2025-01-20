@interface JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet
+ (const)__metadata;
- (JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet)initWithJavaUtilSet:(id)a3;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet

- (JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet)initWithJavaUtilSet:(id)a3
{
  return self;
}

- (id)iterator
{
  v3 = [JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet__1 alloc];
  c = self->super.super.c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&v3->iterator_, [(JavaUtilCollection *)c iterator]);
  return v3;
}

- (id)toArray
{
  c = self->super.super.c_;
  if (!c) {
    goto LABEL_6;
  }
  signed int v4 = [(JavaUtilCollection *)c size];
  v5 = +[IOSObjectArray arrayWithLength:v4 type:NSObject_class_()];
  id v6 = [(JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet *)self iterator];
  uint64_t v7 = (v4 - 1);
  if (v4 - 1 < 0) {
    return v5;
  }
  v8 = v6;
  if (!v6) {
LABEL_6:
  }
    JreThrowNullPointerException();
  do
  {
    IOSObjectArray_Set((uint64_t)v5, v7--, [v8 next]);
    --v4;
  }
  while (v4);
  return v5;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  c = self->super.super.c_;
  if (!c) {
    goto LABEL_15;
  }
  int v6 = [(JavaUtilCollection *)c size];
  id v7 = [(JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet *)self iterator];
  if (!a3) {
    goto LABEL_15;
  }
  v8 = v7;
  if (v6 > *((_DWORD *)a3 + 2))
  {
    a3 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), v6);
    objc_opt_class();
    if (!a3) {
      goto LABEL_15;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  if (v6 <= 0)
  {
    int v6 = 0;
    goto LABEL_12;
  }
  if (!v8) {
LABEL_15:
  }
    JreThrowNullPointerException();
  for (uint64_t i = 0; i != v6; IOSObjectArray_Set((uint64_t)a3, i++, [v8 next]))
    ;
LABEL_12:
  if (v6 < *((_DWORD *)a3 + 2)) {
    IOSObjectArray_Set((uint64_t)a3, v6, 0);
  }
  return a3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429AE0;
}

@end