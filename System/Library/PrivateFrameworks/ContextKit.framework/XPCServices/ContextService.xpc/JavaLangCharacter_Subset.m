@interface JavaLangCharacter_Subset
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaLangCharacter_Subset)initWithNSString:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaLangCharacter_Subset

- (JavaLangCharacter_Subset)initWithNSString:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangCharacter_Subset;
  return (int)[(JavaLangCharacter_Subset *)&v3 hash];
}

- (id)description
{
  return self->name_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangCharacter_Subset;
  [(JavaLangCharacter_Subset *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046E998;
}

@end