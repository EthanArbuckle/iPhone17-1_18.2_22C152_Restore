@interface ComGoogleJ2objcNetIosHttpHandler
+ (const)__metadata;
- (ComGoogleJ2objcNetIosHttpHandler)init;
- (id)openConnectionWithJavaNetURL:(id)a3;
- (int)getDefaultPort;
@end

@implementation ComGoogleJ2objcNetIosHttpHandler

- (id)openConnectionWithJavaNetURL:(id)a3
{
  v3 = new_ComGoogleJ2objcNetIosHttpURLConnection_initWithJavaNetURL_(a3);
  return v3;
}

- (int)getDefaultPort
{
  return 80;
}

- (ComGoogleJ2objcNetIosHttpHandler)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045AC28;
}

@end