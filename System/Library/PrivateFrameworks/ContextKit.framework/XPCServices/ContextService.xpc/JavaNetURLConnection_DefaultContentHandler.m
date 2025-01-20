@interface JavaNetURLConnection_DefaultContentHandler
+ (const)__metadata;
- (JavaNetURLConnection_DefaultContentHandler)init;
- (id)getContentWithJavaNetURLConnection:(id)a3;
@end

@implementation JavaNetURLConnection_DefaultContentHandler

- (id)getContentWithJavaNetURLConnection:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 getInputStream];
}

- (JavaNetURLConnection_DefaultContentHandler)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044E810;
}

@end