@interface PKPaletteToolViewFactory
- (id)makePaletteToolViewForTool:(uint64_t)a1;
@end

@implementation PKPaletteToolViewFactory

- (id)makePaletteToolViewForTool:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Tool parameter can not be nil." userInfo:0];
      objc_exception_throw(v23);
    }
    v5 = [v3 ink];
    v6 = [v5 identifier];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v4 customConfigurationCopy];
    }
    else if ([v4 _isRulerTool])
    {
      v8 = @"com.apple.tool.ruler";

      v7 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:v8];
      v6 = v8;
    }
    else
    {
      v9 = [v4 _configuration];

      if (v9)
      {
        v10 = [v4 _configuration];
        v7 = (void *)[v10 copy];
      }
      else
      {
        v10 = [v4 ink];
        v11 = [v10 identifier];
        v12 = [v4 ink];
        v7 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:inkVersion:]((uint64_t)PKToolConfiguration, v11, [v12 version]);
      }
    }
    v13 = [v4 ink];
    v14 = [v13 variant];
    v15 = +[PKPaletteToolView toolViewWithIdentifier:v6 variant:v14 configuration:v7];

    v16 = [v4 ink];
    v17 = [v16 properties];
    [v15 setToolProperties:v17];

    v18 = [v4 ink];
    LODWORD(v17) = [v18 _isHandwritingInk];

    if (v17)
    {
      v19 = [v15 tool];
      v20 = [v19 handwritingTool];
      v21 = [v4 localeIdentifier];
      [v20 setLocaleIdentifier:v21];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end