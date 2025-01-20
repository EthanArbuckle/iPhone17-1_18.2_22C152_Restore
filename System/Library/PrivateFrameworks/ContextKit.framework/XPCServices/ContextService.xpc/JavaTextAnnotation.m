@interface JavaTextAnnotation
+ (const)__metadata;
- (JavaTextAnnotation)initWithId:(id)a3;
- (id)description;
- (id)getValue;
- (void)dealloc;
@end

@implementation JavaTextAnnotation

- (JavaTextAnnotation)initWithId:(id)a3
{
  return self;
}

- (id)getValue
{
  return self->value_;
}

- (id)description
{
  id v2 = objc_msgSend(-[JavaTextAnnotation getClass](self, "getClass"), "getName");
  return (id)JreStrcat("$$@C", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextAnnotation;
  [(JavaTextAnnotation *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100445AB8;
}

@end