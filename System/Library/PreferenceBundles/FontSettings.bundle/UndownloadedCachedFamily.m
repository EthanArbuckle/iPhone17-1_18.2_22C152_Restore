@interface UndownloadedCachedFamily
- (BOOL)isDeletable;
- (BOOL)isDownloadable;
- (UIFontDescriptor)descriptor;
- (id)init:(id)a3 withLocalizedFamilyName:(id)a4;
- (id)localizedFamilyName;
- (void)setDescriptor:(id)a3;
@end

@implementation UndownloadedCachedFamily

- (id)init:(id)a3 withLocalizedFamilyName:(id)a4
{
  id v6 = a4;
  id v7 = [(FontFamily *)self init:a3 withPostScriptNames:&__NSArray0__struct forInstallKind:4];
  if (v7)
  {
    CFStringRef v11 = kCTFontFamilyNameKey;
    id v12 = v6;
    CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    CTFontDescriptorRef v9 = CTFontDescriptorCreateWithAttributes(v8);
    [v7 setDescriptor:v9];
  }
  return v7;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isDownloadable
{
  return 1;
}

- (id)localizedFamilyName
{
  v2 = (void *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)self->_descriptor, kCTFontFamilyNameKey);

  return v2;
}

- (UIFontDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end