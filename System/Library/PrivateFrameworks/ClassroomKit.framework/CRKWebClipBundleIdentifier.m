@interface CRKWebClipBundleIdentifier
+ (id)bundleIdentifierByLocatingWebClipBundleIdentifierInString:(id)a3;
+ (id)specificWebClipPrefix;
+ (id)webClipBundleIdentifierInString:(id)a3;
+ (id)webClipHostApplicationBundleIdentifier;
- (BOOL)isSpecificWebClip;
- (BOOL)isWebClipHostApplication;
- (CRKWebClipBundleIdentifier)init;
- (CRKWebClipBundleIdentifier)initWithString:(id)a3;
- (NSString)stringValue;
@end

@implementation CRKWebClipBundleIdentifier

+ (id)bundleIdentifierByLocatingWebClipBundleIdentifierInString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [a1 webClipBundleIdentifierInString:v4];

  v7 = (void *)[v5 initWithString:v6];

  return v7;
}

+ (id)webClipBundleIdentifierInString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 webClipHostApplicationBundleIdentifier];
  uint64_t v6 = [v4 rangeOfString:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v4 substringFromIndex:v6];
  }

  return v7;
}

- (CRKWebClipBundleIdentifier)init
{
  return [(CRKWebClipBundleIdentifier *)self initWithString:0];
}

- (CRKWebClipBundleIdentifier)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKWebClipBundleIdentifier;
  id v5 = [(CRKWebClipBundleIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isWebClipHostApplication
{
  v2 = [(CRKWebClipBundleIdentifier *)self stringValue];
  v3 = [(id)objc_opt_class() webClipHostApplicationBundleIdentifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isSpecificWebClip
{
  v2 = [(CRKWebClipBundleIdentifier *)self stringValue];
  v3 = [(id)objc_opt_class() specificWebClipPrefix];
  char v4 = [v2 hasPrefix:v3];

  return v4;
}

+ (id)webClipHostApplicationBundleIdentifier
{
  return @"com.apple.webapp";
}

+ (id)specificWebClipPrefix
{
  v2 = [a1 webClipHostApplicationBundleIdentifier];
  v3 = [v2 stringByAppendingString:@"-"];

  return v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end