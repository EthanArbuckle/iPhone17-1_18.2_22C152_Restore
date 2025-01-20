@interface CLKComplicationTemplateGraphicRectangularLargeViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (CLKTextProvider)headerTextProvider;
- (NSData)contentData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setContentData:(id)a3;
- (void)setHeaderTextProvider:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicRectangularLargeViewBridge

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"headerTextProvider", 0, 1, &v3);
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
  v5 = [CLKComplicationTemplateGraphicRectangularLargeImage alloc];
  v6 = [(CLKComplicationTemplateGraphicRectangularLargeViewBridge *)self headerTextProvider];
  v7 = [v4 objectForKeyedSubscript:@"contentData"];

  v8 = [(CLKComplicationTemplateGraphicRectangularLargeImage *)v5 initWithTextProvider:v6 imageProvider:v7];
  [(CLKComplicationTemplate *)v8 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v8;
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentData, 0);

  objc_storeStrong((id *)&self->_headerTextProvider, 0);
}

@end