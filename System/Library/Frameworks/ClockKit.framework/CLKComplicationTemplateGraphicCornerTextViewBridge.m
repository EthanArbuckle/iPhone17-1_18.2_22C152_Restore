@interface CLKComplicationTemplateGraphicCornerTextViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKTextProvider)textProvider;
- (NSData)labelData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setLabelData:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicCornerTextViewBridge

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"textProvider", 0, 1, &v3);
}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"labelData", 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if ([a3 isEqualToString:@"label"]) {
    return @"labelData";
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
  v5 = [CLKComplicationTemplateGraphicCornerTextImage alloc];
  v6 = [(CLKComplicationTemplateGraphicCornerTextViewBridge *)self textProvider];
  v7 = [v4 objectForKeyedSubscript:@"labelData"];

  v8 = [(CLKComplicationTemplateGraphicCornerTextImage *)v5 initWithTextProvider:v6 imageProvider:v7];
  [(CLKComplicationTemplate *)v8 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v8;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (NSData)labelData
{
  return self->_labelData;
}

- (void)setLabelData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelData, 0);

  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end