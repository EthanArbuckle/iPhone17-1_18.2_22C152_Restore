@interface UndownloadedFontFamily
- (BOOL)isDeletable;
- (BOOL)isDownloadable;
- (UIFontDescriptor)descriptor;
- (id)init:(id)a3 withDescriptor:(id)a4;
- (id)localizedFamilyName;
- (void)setDescriptor:(id)a3;
@end

@implementation UndownloadedFontFamily

- (id)init:(id)a3 withDescriptor:(id)a4
{
  id v6 = a4;
  id v7 = [(FontFamily *)self init:a3 withPostScriptNames:&__NSArray0__struct forInstallKind:3];
  v8 = v7;
  if (v7) {
    [v7 setDescriptor:v6];
  }

  return v8;
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
  v2 = (void *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_descriptor, kCTFontFamilyNameAttribute, 0);

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