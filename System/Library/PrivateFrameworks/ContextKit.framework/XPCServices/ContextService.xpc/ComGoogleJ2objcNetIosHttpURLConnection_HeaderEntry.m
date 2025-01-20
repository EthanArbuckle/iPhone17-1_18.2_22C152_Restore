@interface ComGoogleJ2objcNetIosHttpURLConnection_HeaderEntry
+ (const)__metadata;
- (ComGoogleJ2objcNetIosHttpURLConnection_HeaderEntry)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (void)dealloc;
@end

@implementation ComGoogleJ2objcNetIosHttpURLConnection_HeaderEntry

- (ComGoogleJ2objcNetIosHttpURLConnection_HeaderEntry)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)getKey
{
  return self->key_;
}

- (id)getValue
{
  return self->value_;
}

- (id)setValueWithId:(id)a3
{
  v3 = new_JavaLangAssertionError_initWithId_(@"mutable method called on immutable class");
  objc_exception_throw(v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComGoogleJ2objcNetIosHttpURLConnection_HeaderEntry;
  [(ComGoogleJ2objcNetIosHttpURLConnection_HeaderEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100478EE8;
}

@end