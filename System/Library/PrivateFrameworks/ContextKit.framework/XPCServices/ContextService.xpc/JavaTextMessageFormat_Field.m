@interface JavaTextMessageFormat_Field
+ (const)__metadata;
+ (void)initialize;
- (JavaTextMessageFormat_Field)initWithNSString:(id)a3;
@end

@implementation JavaTextMessageFormat_Field

- (JavaTextMessageFormat_Field)initWithNSString:(id)a3
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaTextMessageFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v2, @"message argument field");
    JreStrongAssignAndConsume((id *)&JavaTextMessageFormat_Field_ARGUMENT_, v2);
    atomic_store(1u, (unsigned __int8 *)JavaTextMessageFormat_Field__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043A410;
}

@end