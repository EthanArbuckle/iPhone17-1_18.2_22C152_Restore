@interface JavaUtilEventObject
+ (const)__metadata;
- (JavaUtilEventObject)initWithId:(id)a3;
- (NSString)description;
- (id)getSource;
- (void)dealloc;
@end

@implementation JavaUtilEventObject

- (JavaUtilEventObject)initWithId:(id)a3
{
  return self;
}

- (id)getSource
{
  return self->source_;
}

- (NSString)description
{
  id v2 = objc_msgSend(-[JavaUtilEventObject getClass](self, "getClass"), "getName");
  return (NSString *)JreStrcat("$$@C", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilEventObject;
  [(JavaUtilEventObject *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042D350;
}

@end