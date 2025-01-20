@interface JavaUtilPropertyResourceBundle_$1
+ (const)__metadata;
- (BOOL)hasMoreElements;
- (JavaUtilPropertyResourceBundle_$1)initWithJavaUtilPropertyResourceBundle:(id)a3;
- (id)nextElement;
- (void)dealloc;
@end

@implementation JavaUtilPropertyResourceBundle_$1

- (BOOL)hasMoreElements
{
  local = self->local_;
  if (!local) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilEnumeration *)local hasMoreElements]) {
    return 1;
  }
  return sub_1001E4E5C((uint64_t)self);
}

- (id)nextElement
{
  local = self->local_;
  if (!local) {
    goto LABEL_10;
  }
  if ([(JavaUtilEnumeration *)local hasMoreElements])
  {
    pEnum = self->local_;
    goto LABEL_7;
  }
  if (sub_1001E4E5C((uint64_t)self))
  {
    nextElement = self->nextElement_;
    JreStrongAssign((id *)&self->nextElement_, 0);
    return nextElement;
  }
  pEnum = self->pEnum_;
  if (!pEnum) {
LABEL_10:
  }
    JreThrowNullPointerException();
LABEL_7:
  return [(JavaUtilEnumeration *)pEnum nextElement];
}

- (JavaUtilPropertyResourceBundle_$1)initWithJavaUtilPropertyResourceBundle:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilPropertyResourceBundle__1;
  [(JavaUtilPropertyResourceBundle_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100434380;
}

@end