@interface JavaTextAttributedCharacterIterator_Attribute
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaTextAttributedCharacterIterator_Attribute)initWithNSString:(id)a3;
- (NSString)description;
- (id)getName;
- (id)readResolve;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaTextAttributedCharacterIterator_Attribute

- (JavaTextAttributedCharacterIterator_Attribute)initWithNSString:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)getName
{
  return self->name_;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextAttributedCharacterIterator_Attribute;
  return (int)[(JavaTextAttributedCharacterIterator_Attribute *)&v3 hash];
}

- (id)readResolve
{
  objc_super v3 = (char *)objc_msgSend(-[JavaTextAttributedCharacterIterator_Attribute getClass](self, "getClass"), "getFields");
  if (!v3) {
    JreThrowNullPointerException();
  }
  v11 = (void **)(v3 + 24);
  unint64_t v12 = (unint64_t)&v3[8 * *((int *)v3 + 2) + 24];
  if ((unint64_t)(v3 + 24) >= v12)
  {
LABEL_17:
    CFStringRef v19 = JreStrcat("$@", v4, v5, v6, v7, v8, v9, v10, @"Failed to resolve ");
    v20 = new_JavaIoInvalidObjectException_initWithNSString_((uint64_t)v19);
    objc_exception_throw(v20);
  }
  while (1)
  {
    v14 = *v11++;
    v13 = v14;
    if (!v14) {
      JreThrowNullPointerException();
    }
    id v15 = [v13 getType];
    if (v15 == [(JavaTextAttributedCharacterIterator_Attribute *)self getClass]
      && JavaLangReflectModifier_isStaticWithInt_([v13 getModifiers]))
    {
      v16 = [v13 getWithId:0];
      objc_opt_class();
      if (!v16) {
        goto LABEL_14;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      name = self->name_;
      if (!name) {
LABEL_14:
      }
        JreThrowNullPointerException();
      if ([(NSString *)name isEqual:v16[1]]) {
        return v16;
      }
    }
    if ((unint64_t)v11 >= v12) {
      goto LABEL_17;
    }
  }
}

- (NSString)description
{
  id v3 = objc_msgSend(-[JavaTextAttributedCharacterIterator_Attribute getClass](self, "getClass"), "getName");
  [(JavaTextAttributedCharacterIterator_Attribute *)self getName];
  return (NSString *)JreStrcat("$C$C", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextAttributedCharacterIterator_Attribute;
  [(JavaTextAttributedCharacterIterator_Attribute *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaTextAttributedCharacterIterator_Attribute alloc];
    JreStrongAssign((id *)&v2->name_, @"input_method_segment");
    JreStrongAssignAndConsume(&JavaTextAttributedCharacterIterator_Attribute_INPUT_METHOD_SEGMENT_, v2);
    objc_super v3 = [JavaTextAttributedCharacterIterator_Attribute alloc];
    JreStrongAssign((id *)&v3->name_, @"language");
    JreStrongAssignAndConsume(&JavaTextAttributedCharacterIterator_Attribute_LANGUAGE_, v3);
    uint64_t v4 = [JavaTextAttributedCharacterIterator_Attribute alloc];
    JreStrongAssign((id *)&v4->name_, @"reading");
    JreStrongAssignAndConsume(&JavaTextAttributedCharacterIterator_Attribute_READING_, v4);
    atomic_store(1u, JavaTextAttributedCharacterIterator_Attribute__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100453648;
}

@end