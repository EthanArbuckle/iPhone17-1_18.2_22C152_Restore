@interface CLKComplicationTemplateGraphicExtraLargeCircularStackViewTextBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKTextProvider)textProvider;
- (NSData)contentData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setContentData:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularStackViewTextBridge

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"contentData", 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if ([a3 isEqualToString:@"content"]) {
    return @"contentData";
  }
  else {
    return 0;
  }
}

- (BOOL)usesSwiftUI
{
  return 1;
}

- (BOOL)needsSerializableCopy
{
  return 1;
}

- (id)serializableCopyWithImageProviders:(id)a3
{
  id v4 = a3;
  v5 = [CLKComplicationTemplateGraphicExtraLargeCircularStackImage alloc];
  v6 = [v4 objectForKeyedSubscript:@"contentData"];

  v7 = [(CLKComplicationTemplateGraphicExtraLargeCircularStackViewTextBridge *)self textProvider];
  v8 = [(CLKComplicationTemplateGraphicExtraLargeCircularStackImage *)v5 initWithLine1ImageProvider:v6 line2TextProvider:v7];

  [(CLKComplicationTemplate *)v8 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v8;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);

  objc_storeStrong((id *)&self->_contentData, 0);
}

@end