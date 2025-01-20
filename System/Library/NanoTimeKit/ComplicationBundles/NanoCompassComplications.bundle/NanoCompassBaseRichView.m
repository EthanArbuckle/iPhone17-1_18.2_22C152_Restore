@interface NanoCompassBaseRichView
- (BOOL)supportsGossamer;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (void)_applyFilters:(id)a3 toViews:(id)a4;
- (void)setFilterProvider:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NanoCompassBaseRichView

- (id)monochromeAccentViews
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)monochromeOtherViews
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v7 = objc_msgSend_filterProvider(self, a2, v3, v4);
  objc_msgSend_filtersForView_style_fraction_(v7, v8, (uint64_t)self, 2, a3);
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_monochromeAccentViews(self, v9, v10, v11);
  objc_msgSend__applyFilters_toViews_(self, v13, (uint64_t)v25, (uint64_t)v12);

  v17 = objc_msgSend_filterProvider(self, v14, v15, v16);
  v19 = objc_msgSend_filtersForView_style_fraction_(v17, v18, (uint64_t)self, 0, a3);

  v23 = objc_msgSend_monochromeOtherViews(self, v20, v21, v22);
  objc_msgSend__applyFilters_toViews_(self, v24, (uint64_t)v19, (uint64_t)v23);
}

- (void)updateMonochromeColor
{
  v5 = objc_msgSend_filterProvider(self, a2, v2, v3);
  objc_msgSend_filtersForView_style_(v5, v6, (uint64_t)self, 2);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_msgSend_monochromeAccentViews(self, v7, v8, v9);
  objc_msgSend__applyFilters_toViews_(self, v11, (uint64_t)v23, (uint64_t)v10);

  uint64_t v15 = objc_msgSend_filterProvider(self, v12, v13, v14);
  v17 = objc_msgSend_filtersForView_style_(v15, v16, (uint64_t)self, 0);

  uint64_t v21 = objc_msgSend_monochromeOtherViews(self, v18, v19, v20);
  objc_msgSend__applyFilters_toViews_(self, v22, (uint64_t)v17, (uint64_t)v21);
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NanoCompassBaseRichView;
  v6 = [(NanoCompassBaseRichView *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v8 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v11 = objc_msgSend_initWithUUIDString_(v8, v9, @"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E", v10);
    char v14 = objc_msgSend_supportsCapability_(v5, v12, (uint64_t)v11, v13);

    v7->_supportsGossamer = v14;
  }

  return v7;
}

- (void)_applyFilters:(id)a3 toViews:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2375B20C4;
  v9[3] = &unk_264CD57F0;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(a4, v7, (uint64_t)v9, v8);
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)supportsGossamer
{
  return self->_supportsGossamer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

@end