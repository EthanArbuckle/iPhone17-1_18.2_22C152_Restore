@interface JavaTextNumberFormat_Field
+ (const)__metadata;
+ (void)initialize;
- (JavaTextNumberFormat_Field)initWithNSString:(id)a3;
@end

@implementation JavaTextNumberFormat_Field

- (JavaTextNumberFormat_Field)initWithNSString:(id)a3
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v2, @"sign");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_SIGN_, v2);
    v3 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v3, @"integer");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_INTEGER_, v3);
    v4 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v4, @"fraction");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_FRACTION_, v4);
    v5 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v5, @"exponent");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_EXPONENT_, v5);
    v6 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v6, @"exponent sign");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_EXPONENT_SIGN_, v6);
    v7 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v7, @"exponent symbol");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_EXPONENT_SYMBOL_, v7);
    v8 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v8, @"decimal separator");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_DECIMAL_SEPARATOR_, v8);
    v9 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v9, @"grouping separator");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_GROUPING_SEPARATOR_, v9);
    v10 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v10, @"percent");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_PERCENT_, v10);
    v11 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v11, @"per mille");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_PERMILLE_, v11);
    v12 = [JavaTextNumberFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v12, @"currency");
    JreStrongAssignAndConsume((id *)&JavaTextNumberFormat_Field_CURRENCY_, v12);
    atomic_store(1u, JavaTextNumberFormat_Field__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043D090;
}

@end