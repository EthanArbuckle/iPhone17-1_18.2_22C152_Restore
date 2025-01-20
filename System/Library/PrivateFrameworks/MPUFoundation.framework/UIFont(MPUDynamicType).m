@interface UIFont(MPUDynamicType)
- (double)MPU_scaledValueForValue:()MPUDynamicType;
@end

@implementation UIFont(MPUDynamicType)

- (double)MPU_scaledValueForValue:()MPUDynamicType
{
  v4 = [a1 fontDescriptor];
  v5 = [v4 objectForKey:*MEMORY[0x263F1D208]];

  if (v5)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    v6 = (id *)getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr;
    uint64_t v17 = getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr;
    if (!getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr)
    {
      v7 = (void *)CoreTextLibrary();
      v15[3] = (uint64_t)dlsym(v7, "kCTFontDescriptorTextStyleRegular");
      getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr = v15[3];
      v6 = (id *)v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v6) {
      -[UIFont(MPUDynamicType) MPU_scaledValueForValue:]();
    }
    id v8 = *v6;
    if ([v5 isEqualToString:v8])
    {
    }
    else
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2020000000;
      v9 = (void *)getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr;
      uint64_t v17 = getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr)
      {
        v10 = (void *)CoreTextLibrary();
        v15[3] = (uint64_t)dlsym(v10, "kCTFontDescriptorTextStyleEmphasized");
        getkCTFontDescriptorTextStyleEmphasizedSymbolLoc_ptr = v15[3];
        v9 = (void *)v15[3];
      }
      _Block_object_dispose(&v14, 8);
      if (!v9) {
        -[UIFont(MPUDynamicType) MPU_scaledValueForValue:]();
      }
      char v11 = [v5 isEqualToString:*v9];

      if ((v11 & 1) == 0)
      {
        [a1 _scaledValueForValue:a2];
        a2 = v12;
      }
    }
  }

  return a2;
}

- (void)MPU_scaledValueForValue:()MPUDynamicType .cold.1()
{
}

@end