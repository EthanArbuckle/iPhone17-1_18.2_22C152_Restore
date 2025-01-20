@interface AVCaptureSystemStylePicker
+ (void)initialize;
- (AVCaptureSystemStylePicker)initWithSession:(id)a3;
- (AVCaptureSystemStylePicker)initWithSession:(id)a3 action:(id)a4;
- (AVCaptureSystemStylePicker)initWithSession:(id)a3 styles:(id)a4 action:(id)a5;
- (id)_automaticStylesWithSystemSmartStyle:(id)a3;
- (id)actionQueue;
- (id)overlayControl;
- (id)overlayUpdate;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)installObservers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayVisibilityDidChange:(BOOL)a3;
- (void)removeObservers;
@end

@implementation AVCaptureSystemStylePicker

+ (void)initialize
{
}

- (AVCaptureSystemStylePicker)initWithSession:(id)a3
{
  id v5 = -[AVCaptureSystemStylePicker _automaticStylesWithSystemSmartStyle:](self, "_automaticStylesWithSystemSmartStyle:", [a3 systemSmartStyle]);

  return [(AVCaptureSystemStylePicker *)self initWithSession:a3 styles:v5 action:0];
}

- (AVCaptureSystemStylePicker)initWithSession:(id)a3 action:(id)a4
{
  id v7 = -[AVCaptureSystemStylePicker _automaticStylesWithSystemSmartStyle:](self, "_automaticStylesWithSystemSmartStyle:", [a3 systemSmartStyle]);

  return [(AVCaptureSystemStylePicker *)self initWithSession:a3 styles:v7 action:a4];
}

- (AVCaptureSystemStylePicker)initWithSession:(id)a3 styles:(id)a4 action:(id)a5
{
  v25[15] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)AVCaptureSystemStylePicker;
  v8 = [(AVCaptureControl *)&v22 initSubclass];
  if (v8)
  {
    id v17 = a3;
    v8->_sessionReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
    v8->_styles = (NSArray *)[a4 copy];
    v8->_action = (id)[a5 copy];
    v9 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AVFCapture"];
    v24[0] = AVSmartStyleCastTypeStandard[0];
    v24[1] = AVSmartStyleCastTypeTanWarm[0];
    v25[0] = @"SMART_STYLE_STANDARD";
    v25[1] = @"SMART_STYLE_TAN_WARM";
    v24[2] = AVSmartStyleCastTypeBlushWarm[0];
    v24[3] = AVSmartStyleCastTypeGoldWarm[0];
    v25[2] = @"SMART_STYLE_BLUSH_WARM";
    v25[3] = @"SMART_STYLE_GOLD_WARM";
    v24[4] = AVSmartStyleCastTypeCool[0];
    v24[5] = AVSmartStyleCastTypeNeutral[0];
    v25[4] = @"SMART_STYLE_COOL";
    v25[5] = @"SMART_STYLE_NEUTRAL";
    v24[6] = AVSmartStyleCastTypeNoFilter[0];
    v24[7] = AVSmartStyleCastTypeWarmAuthentic[0];
    v25[6] = @"SMART_STYLE_NO_FILTER";
    v25[7] = @"SMART_STYLE_WARM_AUTHENTIC";
    v24[8] = AVSmartStyleCastTypeStarkBW[0];
    v24[9] = AVSmartStyleCastTypeColorful[0];
    v25[8] = @"SMART_STYLE_STARK_BW";
    v25[9] = @"SMART_STYLE_KALEIDOSCOPE";
    v24[10] = AVSmartStyleCastTypeDreamyHues[0];
    v24[11] = AVSmartStyleCastTypeUrbanCool[0];
    v25[10] = @"SMART_STYLE_DREAMY_HUES";
    v25[11] = @"SMART_STYLE_URBAN_COOL";
    v24[12] = AVSmartStyleCastTypeEarthy[0];
    v24[13] = AVSmartStyleCastTypeCloudCover[0];
    v25[12] = @"SMART_STYLE_EARTHY";
    v25[13] = @"SMART_STYLE_CLOUD_COVER";
    v24[14] = AVSmartStyleCastTypeLongGray;
    v25[14] = @"SMART_STYLE_LONG_GRAY";
    v10 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:15];
    v11 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [a4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(a4);
          }
          objc_msgSend(v11, "addObject:", objc_msgSend(v9, "localizedStringForKey:value:table:", objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15++), "cast")), &stru_1EF4D21D0, @"AVCaptureSystemStylePicker"));
        }
        while (v13 != v15);
        uint64_t v13 = [a4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v13);
    }
    v8->_titles = (NSArray *)[v11 copy];
    v8->_selectedStyleLock._os_unfair_lock_opaque = 0;
    v8->_selectedStyle = (AVCaptureSmartStyle *)(id)[v17 activeSmartStyle];
    v8->_actionLock._os_unfair_lock_opaque = 0;
    v8->_changeSmartStyleInProcess = 1;
  }
  return v8;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemStylePicker;
  [(AVCaptureControl *)&v3 dealloc];
}

- (id)_automaticStylesWithSystemSmartStyle:(id)a3
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v20[0] = AVSmartStyleCastTypeStandard[0];
  v20[1] = AVSmartStyleCastTypeNeutral[0];
  v20[2] = AVSmartStyleCastTypeBlushWarm[0];
  v20[3] = AVSmartStyleCastTypeGoldWarm[0];
  v20[4] = AVSmartStyleCastTypeTanWarm[0];
  v20[5] = AVSmartStyleCastTypeCool[0];
  id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 6, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!a3
          || (char v11 = objc_msgSend(v10, "isEqualToString:", objc_msgSend(a3, "cast")),
              uint64_t v12 = (AVCaptureSmartStyle *)a3,
              (v11 & 1) == 0))
        {
          if ([v10 isEqualToString:AVSmartStyleCastTypeStandard[0]]) {
            *(float *)&double v13 = 0.0;
          }
          else {
            *(float *)&double v13 = 1.0;
          }
          uint64_t v12 = +[AVCaptureSmartStyle styleWithCast:v10 intensity:v13 toneBias:0.0 colorBias:0.0];
        }
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  return (id)[v4 copy];
}

- (id)overlayControl
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    AVCaptureBundleIdentifier();
    self->_overlayControl = (CAMOverlayServicePicker *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD0]), "initWithIdentifier:title:imageName:valueTitles:", -[AVCaptureControl identifier](self, "identifier"), AVLocalizedStringFromTableWithBundleIdentifier(), @"dot.dot.grid.app", self->_titles);
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  p_selectedStyleLock = &self->_selectedStyleLock;
  os_unfair_lock_lock(&self->_selectedStyleLock);
  styles = self->_styles;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AVCaptureSystemStylePicker_overlayUpdate__block_invoke;
  v7[3] = &unk_1E5A73358;
  v7[4] = self;
  uint64_t v5 = [(NSArray *)styles indexOfObjectPassingTest:v7];
  os_unfair_lock_unlock(p_selectedStyleLock);
  return (id)objc_msgSend(-[AVCaptureSystemStylePicker overlayControl](self, "overlayControl"), "updateWithIndexValue:", v5);
}

uint64_t __43__AVCaptureSystemStylePicker_overlayUpdate__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) cast];
  uint64_t v4 = [a2 cast];

  return [v3 isEqualToString:v4];
}

- (void)enqueueActionWithUpdate:(id)a3
{
  unint64_t v4 = [a3 indexValue];
  if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = v4;
    if (v4 < [(NSArray *)self->_styles count])
    {
      id v6 = [(NSArray *)self->_styles objectAtIndexedSubscript:v5];
      if (self->_changeSmartStyleInProcess)
      {
        uint64_t v7 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
        if (!v7) {
          return;
        }
        [v7 setSmartStyle:v6];
        self->_smartStyleHasChanged = 1;
      }
      os_unfair_lock_lock(&self->_selectedStyleLock);

      self->_selectedStyle = (AVCaptureSmartStyle *)v6;
      os_unfair_lock_unlock(&self->_selectedStyleLock);
      if (self->_action)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __54__AVCaptureSystemStylePicker_enqueueActionWithUpdate___block_invoke;
        v8[3] = &unk_1E5A72D70;
        v8[4] = self;
        v8[5] = v6;
        dispatch_async(MEMORY[0x1E4F14428], v8);
      }
    }
  }
}

uint64_t __54__AVCaptureSystemStylePicker_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
}

- (id)actionQueue
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  id v3 = MEMORY[0x1E4F14428];
  os_unfair_lock_unlock(p_actionLock);
  return v3;
}

- (void)installObservers
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (!observing) {
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "addObserver:forKeyPath:options:context:", self, @"smartStyle", 5, 0);
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observing = 1;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)removeObservers
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (observing) {
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "removeObserver:forKeyPath:", self, @"smartStyle");
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observing = 0;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)overlayVisibilityDidChange:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureSystemStylePicker;
  -[AVCaptureControl overlayVisibilityDidChange:](&v6, sel_overlayVisibilityDidChange_);
  if (!a3)
  {
    unint64_t v5 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
    if (v5)
    {
      if (self->_changeSmartStyleInProcess && self->_smartStyleHasChanged)
      {
        objc_msgSend(v5, "saveSystemStyleOverrideToDefaults:", objc_msgSend(v5, "smartStyle"));
        self->_smartStyleHasChanged = 0;
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if ([a3 isEqualToString:@"smartStyle"]
    && (id)[(AVWeakReference *)self->_sessionReference referencedObject] == a4)
  {
    uint64_t v12 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (observing && v12 != 0)
    {
      uint64_t v14 = (void *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_unfair_lock_lock(&self->_selectedStyleLock);

        self->_selectedStyle = (AVCaptureSmartStyle *)v14;
        styles = self->_styles;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __77__AVCaptureSystemStylePicker_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v17[3] = &unk_1E5A73358;
        v17[4] = self;
        uint64_t v16 = [(NSArray *)styles indexOfObjectPassingTest:v17];
        os_unfair_lock_unlock(&self->_selectedStyleLock);
        [(AVCaptureControlsOverlay *)[(AVCaptureControl *)self overlay] updateControl:[(CAMOverlayServicePicker *)self->_overlayControl updateWithIndexValue:v16]];
      }
    }
  }
}

uint64_t __77__AVCaptureSystemStylePicker_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) cast];
  uint64_t v4 = [a2 cast];

  return [v3 isEqualToString:v4];
}

@end