@interface LibcoreReflectListOfTypes
+ (const)__metadata;
+ (void)initialize;
- (LibcoreReflectListOfTypes)initWithInt:(int)a3;
- (LibcoreReflectListOfTypes)initWithJavaLangReflectTypeArray:(id)a3;
- (id)description;
- (id)getResolvedTypes;
- (id)resolveTypesWithJavaUtilList:(id)a3;
- (int)length;
- (void)addWithJavaLangReflectType:(id)a3;
- (void)dealloc;
@end

@implementation LibcoreReflectListOfTypes

- (LibcoreReflectListOfTypes)initWithInt:(int)a3
{
  p_types = &self->types_;
  v5 = new_JavaUtilArrayList_initWithInt_(*(uint64_t *)&a3);
  JreStrongAssignAndConsume((id *)p_types, v5);
  return self;
}

- (LibcoreReflectListOfTypes)initWithJavaLangReflectTypeArray:(id)a3
{
  return self;
}

- (void)addWithJavaLangReflectType:(id)a3
{
  if (!a3)
  {
    v4 = new_JavaLangNullPointerException_initWithNSString_(@"type == null");
    objc_exception_throw(v4);
  }
  types = self->types_;
  if (!types) {
    JreThrowNullPointerException();
  }
  -[JavaUtilArrayList addWithId:](types, "addWithId:");
}

- (int)length
{
  types = self->types_;
  if (!types) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilArrayList *)types size];
}

- (id)getResolvedTypes
{
  p_resolvedTypes = &self->resolvedTypes_;
  resolvedTypes = self->resolvedTypes_;
  if (!resolvedTypes)
  {
    resolvedTypes = (void *)sub_100230020(self->types_);
    JreStrongAssign((id *)p_resolvedTypes, resolvedTypes);
  }
  return resolvedTypes;
}

- (id)resolveTypesWithJavaUtilList:(id)a3
{
  return (id)sub_100230020(a3);
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  types = self->types_;
  if (!types) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t v5 = 0;
  while ((int)v5 < [(JavaUtilArrayList *)types size])
  {
    if (v5) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:@", "];
    }
    [(JavaLangStringBuilder *)v3 appendWithId:[(JavaUtilArrayList *)self->types_ getWithInt:v5]];
    uint64_t v5 = (v5 + 1);
    types = self->types_;
    if (!types) {
      goto LABEL_7;
    }
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreReflectListOfTypes;
  [(LibcoreReflectListOfTypes *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_LibcoreReflectListOfTypes_initWithInt_(0);
    JreStrongAssignAndConsume((id *)&LibcoreReflectListOfTypes_EMPTY_, v2);
    atomic_store(1u, LibcoreReflectListOfTypes__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004552E8;
}

@end