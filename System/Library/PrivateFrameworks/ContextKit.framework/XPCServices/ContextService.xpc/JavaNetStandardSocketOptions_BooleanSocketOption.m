@interface JavaNetStandardSocketOptions_BooleanSocketOption
+ (const)__metadata;
- (JavaNetStandardSocketOptions_BooleanSocketOption)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaNetStandardSocketOptions_BooleanSocketOption

- (JavaNetStandardSocketOptions_BooleanSocketOption)initWithNSString:(id)a3 withInt:(int)a4
{
  v7 = (void *)JavaLangBoolean_class_();
  JreStrongAssign((id *)&self->super.name_, a3);
  JreStrongAssign((id *)&self->super.type_, v7);
  self->super.socketOption_ = a4;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100454790;
}

@end