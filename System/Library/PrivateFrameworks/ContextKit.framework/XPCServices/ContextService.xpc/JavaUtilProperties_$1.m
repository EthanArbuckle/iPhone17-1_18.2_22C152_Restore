@interface JavaUtilProperties_$1
+ (const)__metadata;
- (JavaUtilProperties_$1)initWithJavaUtilProperties:(id)a3;
- (void)charactersWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
- (void)startElementWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withOrgXmlSaxAttributes:(id)a6;
@end

@implementation JavaUtilProperties_$1

- (void)startElementWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withOrgXmlSaxAttributes:(id)a6
{
  p_key = &self->key_;
  JreStrongAssign((id *)&self->key_, 0);
  if (!a5) {
    goto LABEL_8;
  }
  if (![a5 isEqual:@"entry"]) {
    return;
  }
  if (!a6) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id v9 = [a6 getValueWithNSString:@"key"];
  JreStrongAssign((id *)p_key, v9);
}

- (void)charactersWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  p_key = &self->key_;
  if (self->key_)
  {
    [(JavaUtilHashtable *)self->this$0_ putWithId:*p_key withId:+[NSString stringWithCharacters:a3 offset:*(void *)&a4 length:*(void *)&a5]];
    JreStrongAssign((id *)p_key, 0);
  }
}

- (JavaUtilProperties_$1)initWithJavaUtilProperties:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilProperties__1;
  [(JavaUtilProperties_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100452458;
}

@end