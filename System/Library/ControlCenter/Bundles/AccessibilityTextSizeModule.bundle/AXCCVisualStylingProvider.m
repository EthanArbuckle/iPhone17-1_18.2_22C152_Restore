@interface AXCCVisualStylingProvider
- (AXCCVisualStylingProvider)init;
- (AXCCVisualStylingProvider)initWithVisualStylingProvider:(id)a3;
- (BOOL)supportsVibrancy;
- (MTVisualStylingProvider)visualStylingProvider;
- (NSHashTable)observers;
- (UIColor)primaryColor;
- (UIColor)quaternaryColor;
- (UIColor)secondaryColor;
- (UIColor)separatorColor;
- (UIColor)tertiaryColor;
- (double)alphaForNowPlayingStyle:(int64_t)a3;
- (id)colorForNowPlayingStyle:(int64_t)a3;
- (int64_t)blendModeForNowPlayingStyle:(int64_t)a3;
- (int64_t)visualStyleForNowPlayingStyle:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)applyStyle:(int64_t)a3 toView:(id)a4;
- (void)applyStyle:(int64_t)a3 withBlock:(id)a4;
- (void)notifyObservers;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setQuaternaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSupportsVibrancy:(BOOL)a3;
- (void)setTertiaryColor:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
@end

@implementation AXCCVisualStylingProvider

- (AXCCVisualStylingProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXCCVisualStylingProvider;
  v5 = [(AXCCVisualStylingProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_weakObjectsHashTable(MEMORY[0x263F088B0], v2, v3, v4);
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;
  }
  return v5;
}

- (AXCCVisualStylingProvider)initWithVisualStylingProvider:(id)a3
{
  id v4 = a3;
  v8 = (AXCCVisualStylingProvider *)objc_msgSend_init(self, v5, v6, v7);
  v11 = v8;
  if (v8) {
    objc_msgSend_setVisualStylingProvider_(v8, v9, (uint64_t)v4, v10);
  }

  return v11;
}

- (UIColor)primaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    v5 = objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 0, v2);
    objc_super v9 = objc_msgSend_color(v5, v6, v7, v8);
  }
  else
  {
    objc_super v9 = objc_msgSend_colorForNowPlayingStyle_(self, a2, 0, v2);
  }

  return (UIColor *)v9;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    objc_msgSend_notifyObservers(self, v4, v5, v6);
  }
}

- (UIColor)secondaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    uint64_t v5 = objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 1, v2);
    objc_super v9 = objc_msgSend_color(v5, v6, v7, v8);
  }
  else
  {
    objc_super v9 = objc_msgSend_colorForNowPlayingStyle_(self, a2, 1, v2);
  }

  return (UIColor *)v9;
}

- (void)setSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    objc_msgSend_notifyObservers(self, v4, v5, v6);
  }
}

- (UIColor)tertiaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    uint64_t v5 = objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 2, v2);
    objc_super v9 = objc_msgSend_color(v5, v6, v7, v8);
  }
  else
  {
    objc_super v9 = objc_msgSend_colorForNowPlayingStyle_(self, a2, 2, v2);
  }

  return (UIColor *)v9;
}

- (void)setTertiaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    objc_msgSend_notifyObservers(self, v4, v5, v6);
  }
}

- (UIColor)quaternaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    uint64_t v5 = objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 3, v2);
    objc_super v9 = objc_msgSend_color(v5, v6, v7, v8);
  }
  else
  {
    objc_super v9 = objc_msgSend_colorForNowPlayingStyle_(self, a2, 3, v2);
  }

  return (UIColor *)v9;
}

- (void)setQuaternaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_quaternaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    objc_msgSend_notifyObservers(self, v4, v5, v6);
  }
}

- (UIColor)separatorColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    uint64_t v5 = objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 5, v2);
    objc_super v9 = objc_msgSend_color(v5, v6, v7, v8);
  }
  else
  {
    objc_super v9 = objc_msgSend_colorForNowPlayingStyle_(self, a2, 4, v2);
  }

  return (UIColor *)v9;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
  if (!self->_visualStylingProvider)
  {
    objc_msgSend_notifyObservers(self, v4, v5, v6);
  }
}

- (void)setSupportsVibrancy:(BOOL)a3
{
  if (self->_supportsVibrancy != a3)
  {
    self->_supportsVibrancy = a3;
    objc_msgSend_notifyObservers(self, a2, a3, v3);
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  uint64_t v5 = (const char *)a3;
  visualStylingProvider = (char *)self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v13 = v5;
    objc_msgSend__removeObserver_(visualStylingProvider, v5, (uint64_t)self, v6);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    objc_msgSend__addObserver_(self->_visualStylingProvider, v8, (uint64_t)self, v9);
    visualStylingProvider = (char *)objc_msgSend_notifyObservers(self, v10, v11, v12);
    uint64_t v5 = v13;
  }

  MEMORY[0x270F9A758](visualStylingProvider, v5);
}

- (void)applyStyle:(int64_t)a3 toView:(id)a4
{
  visualStylingProvider = self->_visualStylingProvider;
  id v9 = a4;
  if (visualStylingProvider)
  {
    uint64_t v10 = objc_msgSend_visualStyleForNowPlayingStyle_(self, v7, a3, v8);
    objc_msgSend__visualStylingForStyle_(self->_visualStylingProvider, v11, v10, v12);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mt_replaceVisualStyling_(v9, v13, (uint64_t)v23, v14);
  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, v7, a3, v8);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alphaForNowPlayingStyle_(self, v15, a3, v16);
    double v18 = v17;
    uint64_t v21 = objc_msgSend_blendModeForNowPlayingStyle_(self, v19, a3, v20);
    objc_msgSend_axcc_applyVisualStylingWithColor_alpha_blendMode_(v9, v22, (uint64_t)v23, v21, v18);
  }
}

- (void)applyStyle:(int64_t)a3 withBlock:(id)a4
{
  visualStylingProvider = self->_visualStylingProvider;
  id v9 = (void (**)(id, id))a4;
  if (visualStylingProvider)
  {
    uint64_t v10 = objc_msgSend_visualStyleForNowPlayingStyle_(self, v7, a3, v8);
    v13 = objc_msgSend__visualStylingForStyle_(self->_visualStylingProvider, v11, v10, v12);
    objc_msgSend_color(v13, v14, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, v7, a3, v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9[2](v9, v17);
}

- (void)addObserver:(id)a3
{
  objc_msgSend_addObject_(self->_observers, a2, (uint64_t)a3, v3);
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObservers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend_copy(self->_observers, a2, v2, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_visualStylingProviderDidChange_(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v8, (uint64_t)self, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (int64_t)visualStyleForNowPlayingStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_240617348[a3 - 1];
  }
}

- (id)colorForNowPlayingStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      primaryColor = self->_primaryColor;
      if (primaryColor) {
        goto LABEL_14;
      }
      goto LABEL_18;
    case 1:
      primaryColor = self->_secondaryColor;
      if (primaryColor) {
        goto LABEL_14;
      }
      objc_msgSend_secondaryLabelColor(MEMORY[0x263F825C8], a2, a3, v3);
      self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2:
      primaryColor = self->_tertiaryColor;
      if (primaryColor) {
        goto LABEL_14;
      }
      objc_msgSend_tertiaryLabelColor(MEMORY[0x263F825C8], a2, a3, v3);
      self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      primaryColor = self->_quaternaryColor;
      if (primaryColor) {
        goto LABEL_14;
      }
      objc_msgSend_quaternaryLabelColor(MEMORY[0x263F825C8], a2, a3, v3);
      self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 4:
      primaryColor = self->_separatorColor;
      if (primaryColor)
      {
LABEL_14:
        self = primaryColor;
      }
      else
      {
LABEL_18:
        objc_msgSend_labelColor(MEMORY[0x263F825C8], a2, a3, v3);
        self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      }
LABEL_15:
      break;
    default:
      break;
  }
  return self;
}

- (int64_t)blendModeForNowPlayingStyle:(int64_t)a3
{
  if (self->_supportsVibrancy && (unint64_t)(a3 - 1) <= 3) {
    return qword_240617368[a3 - 1];
  }
  else {
    return 0;
  }
}

- (double)alphaForNowPlayingStyle:(int64_t)a3
{
  double result = 1.0;
  if (self->_supportsVibrancy && (unint64_t)(a3 - 1) <= 3) {
    return dbl_240617388[a3 - 1];
  }
  return result;
}

- (BOOL)supportsVibrancy
{
  return self->_supportsVibrancy;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_quaternaryColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);

  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end