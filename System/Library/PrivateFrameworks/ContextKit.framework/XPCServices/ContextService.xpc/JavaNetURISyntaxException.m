@interface JavaNetURISyntaxException
+ (const)__metadata;
- (JavaNetURISyntaxException)initWithNSString:(id)a3 withNSString:(id)a4;
- (JavaNetURISyntaxException)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (id)getInput;
- (id)getMessage;
- (id)getReason;
- (int)getIndex;
- (void)dealloc;
@end

@implementation JavaNetURISyntaxException

- (JavaNetURISyntaxException)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
  return self;
}

- (JavaNetURISyntaxException)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (int)getIndex
{
  return self->index_;
}

- (id)getReason
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetURISyntaxException;
  return [(JavaLangThrowable *)&v3 getMessage];
}

- (id)getInput
{
  return self->input_;
}

- (id)getMessage
{
  v12.receiver = self;
  v12.super_class = (Class)JavaNetURISyntaxException;
  id v3 = [(JavaLangThrowable *)&v12 getMessage];
  if (self->index_ == -1) {
    return (id)JreStrcat("$$$", v4, v5, v6, v7, v8, v9, v10, v3);
  }
  else {
    return (id)JreStrcat("$$I$$", v4, v5, v6, v7, v8, v9, v10, v3);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetURISyntaxException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045CDE0;
}

@end