@interface JavaUtilUnsafeArrayList
+ (const)__metadata;
- (BOOL)addWithId:(id)a3;
- (JavaUtilUnsafeArrayList)initWithIOSClass:(id)a3 withInt:(int)a4;
- (id)array;
- (id)getWithInt:(int)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilUnsafeArrayList

- (JavaUtilUnsafeArrayList)initWithIOSClass:(id)a3 withInt:(int)a4
{
  return self;
}

- (BOOL)addWithId:(id)a3
{
  p_array = &self->array_;
  array = self->array_;
  if (!array) {
    goto LABEL_7;
  }
  int size = self->size_;
  if (size == array->super.size_)
  {
    v8 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(self->elementType_, 2 * size);
    objc_opt_class();
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*p_array, 0, v8, 0, self->size_);
    JreStrongAssign((id *)p_array, v8);
    array = *p_array;
    if (!*p_array) {
LABEL_7:
    }
      JreThrowNullPointerException();
  }
  uint64_t v9 = self->size_;
  self->size_ = v9 + 1;
  IOSObjectArray_Set((uint64_t)array, v9, a3);
  ++self->super.modCount_;
  return 1;
}

- (id)array
{
  return self->array_;
}

- (id)getWithInt:(int)a3
{
  array = self->array_;
  if (!array) {
    JreThrowNullPointerException();
  }
  uint64_t size = array->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return (&array->elementType_)[a3];
}

- (int)size
{
  return self->size_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilUnsafeArrayList;
  [(JavaUtilUnsafeArrayList *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100440238;
}

@end