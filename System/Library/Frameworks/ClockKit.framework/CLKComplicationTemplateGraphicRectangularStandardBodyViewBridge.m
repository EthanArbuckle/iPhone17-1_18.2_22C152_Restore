@interface CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKTextProvider)body1TextProvider;
- (CLKTextProvider)body2TextProvider;
- (CLKTextProvider)headerTextProvider;
- (NSData)headerLabelData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setBody1TextProvider:(id)a3;
- (void)setBody2TextProvider:(id)a3;
- (void)setHeaderLabelData:(id)a3;
- (void)setHeaderTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  v3 = (void (**)(id, __CFString *, void, uint64_t, char *))a3;
  char v4 = 0;
  v3[2](v3, @"headerTextProvider", 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, @"body1TextProvider", 0, 1, &v4);
    if (!v4) {
      v3[2](v3, @"body2TextProvider", 1, 1, &v4);
    }
  }
}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, @"headerLabelData", 1, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if ([a3 isEqualToString:@"headerLabel"]) {
    return @"headerLabelData";
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
  v5 = [CLKComplicationTemplateGraphicRectangularStandardBody alloc];
  v6 = [v4 objectForKeyedSubscript:@"headerLabelData"];

  v7 = [(CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge *)self headerTextProvider];
  v8 = [(CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge *)self body1TextProvider];
  v9 = [(CLKComplicationTemplateGraphicRectangularStandardBodyViewBridge *)self body2TextProvider];
  v10 = [(CLKComplicationTemplateGraphicRectangularStandardBody *)v5 initWithHeaderImageProvider:v6 headerTextProvider:v7 body1TextProvider:v8 body2TextProvider:v9];

  [(CLKComplicationTemplate *)v10 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v10;
}

- (NSData)headerLabelData
{
  return self->_headerLabelData;
}

- (void)setHeaderLabelData:(id)a3
{
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(id)a3
{
}

- (CLKTextProvider)body2TextProvider
{
  return self->_body2TextProvider;
}

- (void)setBody2TextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body2TextProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);

  objc_storeStrong((id *)&self->_headerLabelData, 0);
}

@end