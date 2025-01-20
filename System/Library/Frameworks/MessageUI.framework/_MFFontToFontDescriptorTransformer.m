@interface _MFFontToFontDescriptorTransformer
- (id)transformValue:(id)a3 inverse:(BOOL)a4;
@end

@implementation _MFFontToFontDescriptorTransformer

- (id)transformValue:(id)a3 inverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
LABEL_7:
        v7 = (void *)v6;
        goto LABEL_9;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v5 fontDescriptor];
        goto LABEL_7;
      }
    }
  }
  v7 = 0;
LABEL_9:

  return v7;
}

@end