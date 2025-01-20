@interface CHSMutableConfiguredWidgetDescriptor
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplayProperties:(id)a3;
- (void)setRefreshStrategy:(id)a3;
- (void)setShowsWidgetLabel:(BOOL)a3;
- (void)setSuggestion:(BOOL)a3;
- (void)setSupportedColorSchemes:(unint64_t)a3;
- (void)setSupportedRenderSchemes:(id)a3;
- (void)setSupportedRenderingModes:(unint64_t)a3;
- (void)setSupportsLowLuminance:(BOOL)a3;
- (void)setSupportsTinting:(BOOL)a3;
- (void)setSystemConfigured:(BOOL)a3;
@end

@implementation CHSMutableConfiguredWidgetDescriptor

- (void)setSuggestion:(BOOL)a3
{
  self->super._suggestion = a3;
}

- (void)setSystemConfigured:(BOOL)a3
{
  self->super._systemConfigured = a3;
}

- (void)setSupportedColorSchemes:(unint64_t)a3
{
  self->super._supportedColorSchemes = a3;
}

- (void)setSupportedRenderingModes:(unint64_t)a3
{
  char v3 = a3;
  id v10 = (id)objc_opt_new();
  if (v3)
  {
    v5 = [(CHSConfiguredWidgetDescriptor *)self widget];
    BOOL IsAccessory = CHSWidgetFamilyIsAccessory([v5 family]);

    v7 = [[CHSWidgetRenderScheme alloc] initWithRenderingModes:1 backgroundViewPolicy:IsAccessory];
    [v10 addObject:v7];
  }
  if ((v3 & 4) != 0)
  {
    v8 = [[CHSWidgetRenderScheme alloc] initWithRenderingModes:4 backgroundViewPolicy:1];
    [v10 addObject:v8];
  }
  if ((v3 & 2) != 0)
  {
    v9 = [[CHSWidgetRenderScheme alloc] initWithRenderingModes:2 backgroundViewPolicy:1];
    [v10 addObject:v9];
  }
  [(CHSMutableConfiguredWidgetDescriptor *)self setSupportedRenderSchemes:v10];
}

- (void)setSupportsTinting:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 1;
  }
  [(CHSMutableConfiguredWidgetDescriptor *)self setSupportedRenderingModes:v3];
}

- (void)setSupportedRenderSchemes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "_compatibilityRenderSchemesFromDeprecatedRenderingModes", (void)v14);
        if ([v11 count])
        {
          [(NSArray *)v5 addObjectsFromArray:v11];
        }
        else
        {
          v12 = (void *)[v10 copy];
          [(NSArray *)v5 addObject:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  supportedRenderSchemes = self->super._supportedRenderSchemes;
  self->super._supportedRenderSchemes = v5;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  self->super._supportsLowLuminance = a3;
}

- (void)setShowsWidgetLabel:(BOOL)a3
{
  self->super._showsWidgetLabel = a3;
}

- (void)setDisplayProperties:(id)a3
{
}

- (void)setRefreshStrategy:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHSConfiguredWidgetDescriptor alloc];
  return [(CHSConfiguredWidgetDescriptor *)v4 _initWithDescriptor:self];
}

@end