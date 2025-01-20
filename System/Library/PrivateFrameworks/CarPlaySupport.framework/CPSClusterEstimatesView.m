@interface CPSClusterEstimatesView
- (id)_labelFont;
@end

@implementation CPSClusterEstimatesView

- (id)_labelFont
{
  v18[1] = *MEMORY[0x263EF8340];
  v14[2] = self;
  v14[1] = (id)a2;
  v6 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D280];
  id v7 = (id)[(CPSClusterEstimatesView *)self traitCollection];
  v14[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  uint64_t v17 = *MEMORY[0x263F1D350];
  id v8 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v18[0] = v8;
  id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, &v17);

  id v9 = v14[0];
  uint64_t v15 = *MEMORY[0x263F1D210];
  id v16 = v13;
  id v10 = (id)[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  id v3 = v14[0];
  v14[0] = v2;

  id v12 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v14[0] size:0.0];
  id v11 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);

  return v11;
}

@end