@interface LibcoreNetUrlFileHandler
+ (const)__metadata;
- (LibcoreNetUrlFileHandler)init;
- (id)openConnectionWithJavaNetURL:(id)a3;
- (id)openConnectionWithJavaNetURL:(id)a3 withJavaNetProxy:(id)a4;
- (void)parseURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6;
@end

@implementation LibcoreNetUrlFileHandler

- (id)openConnectionWithJavaNetURL:(id)a3
{
  return [(LibcoreNetUrlFileHandler *)self openConnectionWithJavaNetURL:a3 withJavaNetProxy:0];
}

- (id)openConnectionWithJavaNetURL:(id)a3 withJavaNetProxy:(id)a4
{
  if (!a3)
  {
    v11 = new_JavaLangIllegalArgumentException_initWithNSString_(@"url == null");
    objc_exception_throw(v11);
  }
  v6 = (__CFString *)[a3 getHost];
  if (!v6
    || (v7 = v6, ([(__CFString *)v6 isEmpty] & 1) != 0)
    || [(__CFString *)v7 equalsIgnoreCase:@"localhost"])
  {
    v8 = new_LibcoreNetUrlFileURLConnection_initWithJavaNetURL_(a3);
    return v8;
  }
  else
  {
    v10 = new_JavaNetURL_initWithNSString_withNSString_withNSString_(@"ftp", v7, [a3 getFile]);
    if (a4)
    {
      return [(JavaNetURL *)v10 openConnectionWithJavaNetProxy:a4];
    }
    else
    {
      return [(JavaNetURL *)v10 openConnection];
    }
  }
}

- (void)parseURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  if (a6 >= a5)
  {
    if (a5 >= a6)
    {
      v9 = &stru_10048C1F8;
    }
    else if (!a4 {
           || (id v8 = [a4 substring:*(void *)&a5 endIndex:*(void *)&a6]) == 0
    }
           || (v9 = (__CFString *)[v8 replace:92 withChar:47]) == 0)
    {
      JreThrowNullPointerException();
    }
    v10.receiver = self;
    v10.super_class = (Class)LibcoreNetUrlFileHandler;
    [(JavaNetURLStreamHandler *)&v10 parseURLWithJavaNetURL:a3 withNSString:v9 withInt:0 withInt:[(__CFString *)v9 length]];
  }
}

- (LibcoreNetUrlFileHandler)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100451028;
}

@end