@interface LibcoreReflectListOfVariables
+ (const)__metadata;
- (LibcoreReflectListOfVariables)init;
- (id)getArray;
- (void)addWithJavaLangReflectTypeVariable:(id)a3;
- (void)dealloc;
@end

@implementation LibcoreReflectListOfVariables

- (void)addWithJavaLangReflectTypeVariable:(id)a3
{
  array = self->array_;
  if (!array) {
    JreThrowNullPointerException();
  }
  [(JavaUtilArrayList *)array addWithId:a3];
}

- (id)getArray
{
  array = self->array_;
  if (!array) {
    JreThrowNullPointerException();
  }
  v4 = +[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)array size] type:JavaLangReflectTypeVariable_class_()];
  v5 = self->array_;
  return [(JavaUtilArrayList *)v5 toArrayWithNSObjectArray:v4];
}

- (LibcoreReflectListOfVariables)init
{
  p_array = &self->array_;
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_array, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreReflectListOfVariables;
  [(LibcoreReflectListOfVariables *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044A7C0;
}

@end