@interface CLKComplicationTemplateGraphicCornerCircularViewBridge
- (BOOL)needsSerializableCopy;
- (BOOL)usesSwiftUI;
- (NSData)contentData;
- (id)serializableCopyWithImageProviders:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)setContentData:(id)a3;
@end

@implementation CLKComplicationTemplateGraphicCornerCircularViewBridge

- (int64_t)compatibleFamily
{
  return 8;
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
  v5 = [CLKComplicationTemplateGraphicCornerCircularImage alloc];
  v6 = [v4 objectForKeyedSubscript:@"contentData"];

  v7 = [(CLKComplicationTemplateGraphicCornerCircularImage *)v5 initWithImageProvider:v6];
  [(CLKComplicationTemplate *)v7 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];

  return v7;
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
}

@end