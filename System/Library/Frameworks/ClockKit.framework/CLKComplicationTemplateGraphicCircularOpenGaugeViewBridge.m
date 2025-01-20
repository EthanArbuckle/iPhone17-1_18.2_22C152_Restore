@interface CLKComplicationTemplateGraphicCircularOpenGaugeViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKGaugeProvider)gaugeProvider;
- (CLKTextProvider)centerTextProvider;
- (NSData)bottomLabelData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBottomLabelData:(id)a3;
- (void)setCenterTextProvider:(id)a3;
- (void)setGaugeProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicCircularOpenGaugeViewBridge

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"centerTextProvider", 0, 1, &v3);
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"bottomLabelData", 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if ([a3 isEqualToString:@"bottomLabel"]) {
    return @"bottomLabelData";
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
  v5 = [CLKComplicationTemplateGraphicCircularOpenGaugeImage alloc];
  v6 = [(CLKComplicationTemplateGraphicCircularOpenGaugeViewBridge *)self gaugeProvider];
  v7 = [v4 objectForKeyedSubscript:@"bottomLabelData"];

  v8 = [(CLKComplicationTemplateGraphicCircularOpenGaugeViewBridge *)self centerTextProvider];
  v9 = [(CLKComplicationTemplateGraphicCircularOpenGaugeImage *)v5 initWithGaugeProvider:v6 bottomImageProvider:v7 centerTextProvider:v8];

  [(CLKComplicationTemplate *)v9 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v9;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(id)a3
{
}

- (NSData)bottomLabelData
{
  return self->_bottomLabelData;
}

- (void)setBottomLabelData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelData, 0);
  objc_storeStrong((id *)&self->_centerTextProvider, 0);

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end