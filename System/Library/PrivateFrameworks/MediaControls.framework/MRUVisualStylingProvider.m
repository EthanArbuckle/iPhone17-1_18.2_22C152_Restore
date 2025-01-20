@interface MRUVisualStylingProvider
- (BOOL)supportsVibrancy;
- (MRUVisualStylingProvider)init;
- (MRUVisualStylingProvider)initWithVisualStylingProvider:(id)a3;
- (MTVisualStylingProvider)visualStylingProvider;
- (NSHashTable)observers;
- (UIColor)primaryColor;
- (UIColor)quaternaryColor;
- (UIColor)secondaryColor;
- (UIColor)separatorColor;
- (UIColor)tertiaryColor;
- (UITraitChangeObservable)traitChangeObservable;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)alphaForNowPlayingStyle:(int64_t)a3;
- (id)colorForNowPlayingStyle:(int64_t)a3;
- (id)colorForStyle:(int64_t)a3;
- (int64_t)blendModeForNowPlayingStyle:(int64_t)a3;
- (int64_t)visualStyleForNowPlayingStyle:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)applyBlendModeToView:(id)a3;
- (void)applyStyle:(int64_t)a3 toView:(id)a4;
- (void)dealloc;
- (void)notifyObservers;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setQuaternaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSupportsVibrancy:(BOOL)a3;
- (void)setTertiaryColor:(id)a3;
- (void)setTraitChangeObservable:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
@end

@implementation MRUVisualStylingProvider

- (void)applyStyle:(int64_t)a3 toView:(id)a4
{
  visualStylingProvider = self->_visualStylingProvider;
  id v7 = a4;
  if (visualStylingProvider)
  {
    id v9 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:[(MRUVisualStylingProvider *)self visualStyleForNowPlayingStyle:a3]];
    objc_msgSend(v7, "mt_replaceVisualStyling:");
  }
  else
  {
    id v9 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:a3];
    [(MRUVisualStylingProvider *)self alphaForNowPlayingStyle:a3];
    objc_msgSend(v7, "mru_applyVisualStylingWithColor:alpha:blendMode:", v9, -[MRUVisualStylingProvider blendModeForNowPlayingStyle:](self, "blendModeForNowPlayingStyle:", a3), v8);
  }
}

- (int64_t)visualStyleForNowPlayingStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1AE963CD8[a3 - 1];
  }
}

- (MRUVisualStylingProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUVisualStylingProvider;
  v2 = [(MRUVisualStylingProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (MRUVisualStylingProvider)initWithVisualStylingProvider:(id)a3
{
  id v4 = a3;
  v5 = [(MRUVisualStylingProvider *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(MRUVisualStylingProvider *)v5 setVisualStylingProvider:v4];
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitChangeObservable);
  [WeakRetained unregisterForTraitChanges:self->_traitChangeRegistration];

  v4.receiver = self;
  v4.super_class = (Class)MRUVisualStylingProvider;
  [(MRUVisualStylingProvider *)&v4 dealloc];
}

- (UIColor)primaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_super v4 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:0];
    v5 = [v4 color];
  }
  else
  {
    v5 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:0];
  }

  return (UIColor *)v5;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    [(MRUVisualStylingProvider *)self notifyObservers];
  }
}

- (UIColor)secondaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_super v4 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:1];
    v5 = [v4 color];
  }
  else
  {
    v5 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:1];
  }

  return (UIColor *)v5;
}

- (void)setSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    [(MRUVisualStylingProvider *)self notifyObservers];
  }
}

- (UIColor)tertiaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_super v4 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:2];
    v5 = [v4 color];
  }
  else
  {
    v5 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:2];
  }

  return (UIColor *)v5;
}

- (void)setTertiaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    [(MRUVisualStylingProvider *)self notifyObservers];
  }
}

- (UIColor)quaternaryColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_super v4 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:3];
    v5 = [v4 color];
  }
  else
  {
    v5 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:3];
  }

  return (UIColor *)v5;
}

- (void)setQuaternaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_quaternaryColor, a3);
  if (!self->_visualStylingProvider)
  {
    [(MRUVisualStylingProvider *)self notifyObservers];
  }
}

- (UIColor)separatorColor
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_super v4 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:5];
    v5 = [v4 color];
  }
  else
  {
    v5 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:4];
  }

  return (UIColor *)v5;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
  if (!self->_visualStylingProvider)
  {
    [(MRUVisualStylingProvider *)self notifyObservers];
  }
}

- (BOOL)supportsVibrancy
{
  return self->_supportsVibrancy || self->_visualStylingProvider != 0;
}

- (void)setSupportsVibrancy:(BOOL)a3
{
  if (self->_supportsVibrancy != a3)
  {
    self->_supportsVibrancy = a3;
    [(MRUVisualStylingProvider *)self notifyObservers];
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    id v7 = v5;
    [(MTVisualStylingProvider *)visualStylingProvider _removeObserver:self];
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(MTVisualStylingProvider *)self->_visualStylingProvider _addObserver:self];
    [(MRUVisualStylingProvider *)self notifyObservers];
    v5 = v7;
  }
}

- (void)setTraitChangeObservable:(id)a3
{
  id obj = a3;
  if (self->_traitChangeRegistration)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_traitChangeObservable);
    [WeakRetained unregisterForTraitChanges:self->_traitChangeRegistration];
  }
  objc_storeWeak((id *)&self->_traitChangeObservable, obj);
  v5 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
  objc_super v6 = [obj registerForTraitChanges:v5 withTarget:self action:sel_notifyObservers];
  traitChangeRegistration = self->_traitChangeRegistration;
  self->_traitChangeRegistration = v6;
}

- (id)colorForStyle:(int64_t)a3
{
  if (self->_visualStylingProvider)
  {
    uint64_t v3 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:[(MRUVisualStylingProvider *)self visualStyleForNowPlayingStyle:a3]];
    objc_super v4 = [v3 color];
  }
  else
  {
    objc_super v4 = [(MRUVisualStylingProvider *)self colorForNowPlayingStyle:a3];
  }

  return v4;
}

- (void)applyBlendModeToView:(id)a3
{
  id v7 = a3;
  if ([(MRUVisualStylingProvider *)self supportsVibrancy])
  {
    objc_super v4 = [v7 traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v7 _setDrawsAsBackdropOverlayWithBlendMode:v6];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) visualStylingProviderDidChange:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
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
      objc_msgSend(MEMORY[0x1E4FB1618], "secondaryLabelColor", v3);
      self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2:
      primaryColor = self->_tertiaryColor;
      if (primaryColor) {
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E4FB1618], "tertiaryLabelColor", v3);
      self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      primaryColor = self->_quaternaryColor;
      if (primaryColor) {
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E4FB1618], "quaternaryLabelColor", v3);
      self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(MEMORY[0x1E4FB1618], "labelColor", v3);
        self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
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
  if ([(MRUVisualStylingProvider *)self supportsVibrancy] && (unint64_t)(a3 - 1) <= 3) {
    return qword_1AE963CF8[a3 - 1];
  }
  else {
    return 0;
  }
}

- (double)alphaForNowPlayingStyle:(int64_t)a3
{
  BOOL v4 = [(MRUVisualStylingProvider *)self supportsVibrancy];
  double result = 1.0;
  if (v4 && (unint64_t)(a3 - 1) <= 3) {
    return dbl_1AE963D18[a3 - 1];
  }
  return result;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (UITraitChangeObservable)traitChangeObservable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitChangeObservable);

  return (UITraitChangeObservable *)WeakRetained;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_destroyWeak((id *)&self->_traitChangeObservable);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_quaternaryColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);

  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end