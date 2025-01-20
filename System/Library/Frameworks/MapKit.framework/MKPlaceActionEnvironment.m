@interface MKPlaceActionEnvironment
- (BOOL)isQuickAction;
- (GEOAPPlaceCardModule)analyticsModuleMetadata;
- (MKPlaceActionEnvironment)initWithOptions:(id)a3;
- (UIView)sourceView;
- (void)setAnalyticsModuleMetadata:(id)a3;
- (void)setIsQuickAction:(BOOL)a3;
- (void)setSourceView:(id)a3;
@end

@implementation MKPlaceActionEnvironment

- (MKPlaceActionEnvironment)initWithOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceActionEnvironment;
  v5 = [(MKPlaceActionEnvironment *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"MKPlaceActionManagerIsQuickAction"];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"MKPlaceActionManagerIsQuickAction"];
      v5->_isQuickAction = [v7 BOOLValue];
    }
    v8 = [v4 objectForKeyedSubscript:@"view"];

    if (v8)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"view"];
      sourceView = v5->_sourceView;
      v5->_sourceView = (UIView *)v9;
    }
    v11 = [v4 objectForKeyedSubscript:@"MKPlaceActionManagerModuleMetadataKey"];

    if (v11)
    {
      uint64_t v12 = [v4 objectForKeyedSubscript:@"MKPlaceActionManagerModuleMetadataKey"];
      analyticsModuleMetadata = v5->_analyticsModuleMetadata;
      v5->_analyticsModuleMetadata = (GEOAPPlaceCardModule *)v12;
    }
  }

  return v5;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (GEOAPPlaceCardModule)analyticsModuleMetadata
{
  return self->_analyticsModuleMetadata;
}

- (void)setAnalyticsModuleMetadata:(id)a3
{
}

- (BOOL)isQuickAction
{
  return self->_isQuickAction;
}

- (void)setIsQuickAction:(BOOL)a3
{
  self->_isQuickAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsModuleMetadata, 0);

  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end