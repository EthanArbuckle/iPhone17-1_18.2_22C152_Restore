@interface CLKComplicationTemplateGraphicCornerGaugeViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)leadingTextProvider;
- (CLKTextProvider)trailingTextProvider;
- (NSData)labelData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setLabelData:(id)a3;
- (void)setLeadingTextProvider:(id)a3;
- (void)setTrailingTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicCornerGaugeViewBridge

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = (void (**)(id, __CFString *, uint64_t, uint64_t, unsigned char *))a3;
  char v4 = 0;
  v3[2](v3, @"leadingTextProvider", 1, 1, &v4);
  if (!v4) {
    v3[2](v3, @"trailingTextProvider", 1, 1, &v4);
  }
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
  v5 = [CLKComplicationTemplateGraphicCornerGaugeImage alloc];
  v6 = [(CLKComplicationTemplateGraphicCornerGaugeViewBridge *)self gaugeProvider];
  v7 = [(CLKComplicationTemplateGraphicCornerGaugeViewBridge *)self leadingTextProvider];
  v8 = [(CLKComplicationTemplateGraphicCornerGaugeViewBridge *)self trailingTextProvider];
  v9 = [v4 objectForKeyedSubscript:@"labelData"];

  v10 = [(CLKComplicationTemplateGraphicCornerGaugeImage *)v5 initWithGaugeProvider:v6 leadingTextProvider:v7 trailingTextProvider:v8 imageProvider:v9];
  [(CLKComplicationTemplate *)v10 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v10;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
}

- (CLKTextProvider)leadingTextProvider
{
  return self->_leadingTextProvider;
}

- (void)setLeadingTextProvider:(id)a3
{
}

- (CLKTextProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void)setTrailingTextProvider:(id)a3
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
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end