@interface JavaTextAttributedString_Range
+ (const)__metadata;
- (JavaTextAttributedString_Range)initWithInt:(int)a3 withInt:(int)a4 withId:(id)a5;
- (void)dealloc;
@end

@implementation JavaTextAttributedString_Range

- (JavaTextAttributedString_Range)initWithInt:(int)a3 withInt:(int)a4 withId:(id)a5
{
  self->start_ = a3;
  self->end_ = a4;
  JreStrongAssign(&self->value_, a5);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextAttributedString_Range;
  [(JavaTextAttributedString_Range *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100455820;
}

@end