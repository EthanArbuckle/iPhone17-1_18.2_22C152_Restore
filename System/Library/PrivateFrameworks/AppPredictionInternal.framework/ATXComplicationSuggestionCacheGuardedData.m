@interface ATXComplicationSuggestionCacheGuardedData
@end

@implementation ATXComplicationSuggestionCacheGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->complicationInlineSetCache, 0);
  objc_storeStrong((id *)&self->complicationLandscapeModularSetCache, 0);
  objc_storeStrong((id *)&self->complicationModularSetCache, 0);
}

@end