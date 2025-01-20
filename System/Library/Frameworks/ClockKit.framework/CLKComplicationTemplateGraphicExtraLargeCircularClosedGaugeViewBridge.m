@interface CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKGaugeProvider)gaugeProvider;
- (NSData)labelData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setLabelData:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeViewBridge

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"gaugeProvider", 0, 1, &v3);
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
  v5 = [CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage alloc];
  v6 = [(CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeViewBridge *)self gaugeProvider];
  v7 = [v4 objectForKeyedSubscript:@"labelData"];

  v8 = [(CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *)v5 initWithGaugeProvider:v6 imageProvider:v7];
  [(CLKComplicationTemplate *)v8 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v8;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
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

  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end