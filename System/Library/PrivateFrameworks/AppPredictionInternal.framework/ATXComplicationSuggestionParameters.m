@interface ATXComplicationSuggestionParameters
+ (id)sharedInstance;
- (ATXComplicationSuggestionParameters)init;
- (BOOL)alwaysUseFallbackSets;
- (BOOL)showPreviewsInPosterGallery;
- (id)appsToPriorsMapping;
- (id)fallbackSetForLandscape;
- (id)fallbackSetsForSet1;
- (id)fallbackSetsForSet2;
- (id)fallbackSetsForSet3;
- (id)inlineComplicationsToPriorsMapping;
- (id)modularComplicationsToPriorsMapping;
@end

@implementation ATXComplicationSuggestionParameters

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_10 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_10, &__block_literal_global_75);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_12;
  return v2;
}

void __53__ATXComplicationSuggestionParameters_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_12;
  sharedInstance__pasExprOnceResult_12 = v1;
}

- (ATXComplicationSuggestionParameters)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXComplicationSuggestionParameters;
  v2 = [(ATXComplicationSuggestionParameters *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F4AF08];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [v3 dictionaryForResource:v5 ofType:@"plplist" specifiedABGroup:0];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v6;
  }
  return v2;
}

- (id)appsToPriorsMapping
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppsToPriors"];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  return v5;
}

- (id)modularComplicationsToPriorsMapping
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ModularComplicationsToPriors"];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  return v5;
}

- (id)inlineComplicationsToPriorsMapping
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"InlineComplicationsToPriorsMapping"];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  return v5;
}

- (id)fallbackSetsForSet1
{
  return [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FallbackSetsForSet1"];
}

- (id)fallbackSetsForSet2
{
  return [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FallbackSetsForSet2"];
}

- (id)fallbackSetsForSet3
{
  return [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FallbackSetsForSet3"];
}

- (id)fallbackSetForLandscape
{
  return [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FallbackSetForLandscape"];
}

- (BOOL)alwaysUseFallbackSets
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AlwaysUseFallbackSets"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)showPreviewsInPosterGallery
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ShowPreviewsInPosterGallery"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end