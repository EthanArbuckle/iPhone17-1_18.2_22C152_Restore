@interface NTKUltraCubeFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_needCustomSwatchImageForEditMode:(int64_t)a3;
- (BOOL)_tryLoadPhoto:(id)a3 animated:(BOOL)a4;
- (BOOL)_validateEditOption:(id)a3 forMode:(int64_t)a4;
- (CGAffineTransform)ctmForDrawingImage:(SEL)a3 uprightInRect:(id)a4;
- (CGRect)dateComplicationFrameForUnitBaseline:(double)a3;
- (NTKUltraCubeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (id)_cloneActiveContentView;
- (id)_currentOverrideDate;
- (id)_detachedComplicationDisplays;
- (id)_newContentViewWithRole:(unint64_t)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_snapshotDateComplicationLabel;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6;
- (id)_swatchKeyForTypeface:(unint64_t)a3 pigmentName:(id)a4 colorEffect:(unint64_t)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (id)dateComplicationFont;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)colorEffect;
- (void)_applyColorEffect;
- (void)_applyColorTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPause;
- (void)_clearDeprecationWarning;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_hideNoPhotoUI;
- (void)_loadActiveViewIfNeeded;
- (void)_loadLayoutRules;
- (void)_loadNextPhotoAnimated:(BOOL)a3;
- (void)_loadPhoto:(id)a3 animated:(BOOL)a4;
- (void)_loadSnapshotContentViews;
- (void)_newGradientViewsWithColor:(id)a3 timeElementUnitBaseline:(double)a4 topGradientView:(id *)a5 bottomGradientView:(id *)a6;
- (void)_prepareSwatchImagesForSelectedOptions:(id)a3;
- (void)_reloadSwatches:(id)a3;
- (void)_setDeprecationWarning;
- (void)_showNoPhotoUI;
- (void)_unloadActiveViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateContents;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKUltraCubeFaceView

- (NTKUltraCubeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NTKUltraCubeFaceView;
  v9 = [(NTKUltraCubeFaceView *)&v19 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    uint64_t v10 = +[NSMapTable strongToStrongObjectsMapTable];
    swatchRefreshHandlers = v9->_swatchRefreshHandlers;
    v9->_swatchRefreshHandlers = (NSMapTable *)v10;

    uint64_t v12 = objc_opt_new();
    contentViews = v9->_contentViews;
    v9->_contentViews = (NSMutableArray *)v12;

    v9->_typeface = 1;
    v9->_colorEffect = 0;
    v9->_isTimeLabelFront = 1;
    v9->_isPaused = 1;
    v9->_isNoPhotosViewVisible = 0;
    v14 = (NTKUltraCubeFaceViewComplicationFactory *)[[NTKUltraCubeFaceViewComplicationFactory alloc] initForDevice:v8];
    v20[0] = NTKComplicationSlotBottom;
    v20[1] = NTKComplicationSlotDate;
    v15 = +[NSArray arrayWithObjects:v20 count:2];
    [(NTKUltraCubeFaceViewComplicationFactory *)v14 setSupportedComplicationSlots:v15];

    [(NTKUltraCubeFaceViewComplicationFactory *)v14 setUsesLegibility:1 faceView:v9];
    v16 = +[UIColor whiteColor];
    [(NTKUltraCubeFaceViewComplicationFactory *)v14 setForegroundColor:v16 faceView:v9];

    [(NTKUltraCubeFaceViewComplicationFactory *)v14 setAlpha:v9 faceView:1.0];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v14;
  }
  return v9;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUltraCubeFaceView;
  [(NTKUltraCubeFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKUltraCubeFaceView *)self _loadActiveViewIfNeeded];
  self->_isContentLoaded = 1;
  [(NTKUltraCubeFaceView *)self _updateContents];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUltraCubeFaceView;
  [(NTKUltraCubeFaceView *)&v3 _unloadSnapshotContentViews];
  self->_isContentLoaded = 0;
  [(NTKUltraCubeFaceView *)self _unloadActiveViews];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUltraCubeFaceView;
  [(NTKUltraCubeFaceView *)&v3 _applyFrozen];
  [(NTKUltraCubeFaceView *)self _applyPause];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7 = (NSDate *)a3;
  if (self->_overrideDate != v7)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = self->_contentViews;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v14 = [(NTKUltraCubeFaceView *)self _currentOverrideDate];
          [v13 setOverrideDate:v14 duration:a4];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)setTimeOffset:(double)a3
{
  if (self->_timeOffset != a3)
  {
    self->_timeOffset = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_contentViews;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setTimeOffset:", self->_timeOffset, (void)v9);
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKUltraCubeFaceView;
  [(NTKUltraCubeFaceView *)&v9 _updateForResourceDirectoryChange:v4];
  id v5 = [(NTKUltraCubeFaceView *)self resourceDirectory];
  char v6 = NTKEqualStrings();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NTKUltraCubeFaceView *)self resourceDirectory];
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "_updateForResourceDirectoryChange: change resource directory from %@ to %@", buf, 0x16u);
    }
    [(NTKUltraCubeFaceView *)self _updateContents];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKUltraCubeFaceView;
  [(NTKUltraCubeFaceView *)&v19 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  switch(a4)
  {
    case 10:
      goto LABEL_13;
    case 15:
      self->_colorEffect = (unint64_t)[v8 colorEffect];
LABEL_13:
      [(NTKUltraCubeFaceView *)self _applyColorEffect];
      break;
    case 13:
      id v9 = [v8 typeface];
      self->_typeface = (unint64_t)v9;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v10 = self->_contentViews;
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setTypeface:", v9, (void)v15);
          }
          id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v12);
      }

      break;
  }
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if ((unint64_t)(a3 - 12) > 3) {
    return 0;
  }
  else {
    return off_48FE0[a3 - 12];
  }
}

- (BOOL)_validateEditOption:(id)a3 forMode:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 15 || a4 == 13 || a4 == 10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_needCustomSwatchImageForEditMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0x10) & (0xA400u >> a3);
}

- (id)_swatchKeyForTypeface:(unint64_t)a3 pigmentName:(id)a4 colorEffect:(unint64_t)a5
{
  photoSnapshotIdentifier = self->_photoSnapshotIdentifier;
  id v8 = a4;
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  long long v10 = +[NSNumber numberWithUnsignedInteger:a5];
  id v11 = +[NSString stringWithFormat:@"%@-%@-%@-%@", photoSnapshotIdentifier, v9, v8, v10];

  return v11;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(NTKUltraCubeFaceView *)self _needCustomSwatchImageForEditMode:a4])
  {
    v46.receiver = self;
    v46.super_class = (Class)NTKUltraCubeFaceView;
    [(NTKUltraCubeFaceView *)&v46 _swatchImageForEditOption:v10 mode:a4 withSelectedOptions:v11 refreshHandler:v12];
    long long v15 = LABEL_9:;
    goto LABEL_10;
  }
  if (![(NTKUltraCubeFaceView *)self _validateEditOption:v10 forMode:a4])
  {
    v45.receiver = self;
    v45.super_class = (Class)NTKUltraCubeFaceView;
    [(NTKUltraCubeFaceView *)&v45 _swatchImageForEditOption:v10 mode:a4 withSelectedOptions:v11 refreshHandler:v12];
    goto LABEL_9;
  }
  uint64_t v13 = [(NTKUltraCubeFaceView *)self resourceDirectory];

  if (!v13)
  {
    v44.receiver = self;
    v44.super_class = (Class)NTKUltraCubeFaceView;
    [(NTKUltraCubeFaceView *)&v44 _swatchImageForEditOption:v10 mode:a4 withSelectedOptions:v11 refreshHandler:v12];
    goto LABEL_9;
  }
  if (a4 == 13)
  {
    id typeface = [v10 typeface];
LABEL_15:
    id colorEffect = self->_colorEffect;
    goto LABEL_16;
  }
  id typeface = self->_typeface;
  if (a4 != 15) {
    goto LABEL_15;
  }
  id colorEffect = [v10 colorEffect];
LABEL_16:
  long long v18 = [(NTKUltraCubeFaceView *)self colorPalette];
  objc_super v19 = [v18 pigmentEditOption];
  v20 = [v19 optionName];

  v21 = [(NTKUltraCubeFaceView *)self colorPalette];
  if (a4 == 10)
  {
    v22 = [v10 pigmentEditOption];
    uint64_t v23 = [v22 optionName];

    id v24 = [v21 copyWithOption:v22];
    v21 = v24;
    v20 = (void *)v23;
  }
  id v41 = typeface;
  v25 = [(NTKUltraCubeFaceView *)self _swatchKeyForTypeface:typeface pigmentName:v20 colorEffect:colorEffect];
  if (v12)
  {
    swatchRefreshHandlers = self->_swatchRefreshHandlers;
    id v26 = [v12 copy];
    v27 = v20;
    v28 = v21;
    id v29 = colorEffect;
    id v30 = objc_retainBlock(v26);
    [(NSMapTable *)swatchRefreshHandlers setObject:v30 forKey:v25];

    id colorEffect = v29;
    v21 = v28;
    v20 = v27;
  }
  v31 = +[NTKSwatchRenderer cachedSwatchForKey:v25];
  long long v15 = v31;
  if (v31)
  {
    id v32 = v31;
  }
  else
  {
    v40 = +[NTKUltraCubeContentEffect contentEffectWithColorEffect:colorEffect colorPalette:v21];
    v33 = [(NTKUltraCubeFaceView *)self _cloneActiveContentView];
    [v33 setTypeface:v41];
    [v33 setContentEffect:v40];
    [v33 invalidateDigitalTimeLabelStyle];
    [v33 layoutIfNeeded];
    [v33 setNeedsDisplay];
    +[NTKEditOption sizeForSwatchStyle:3];
    double v35 = v34;
    double v37 = v36;
    v38 = [(NTKUltraCubeFaceView *)self device];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_F14C;
    v42[3] = &unk_48F80;
    id v43 = v12;
    +[NTKSwatchRenderer renderSwatchForView:size:device:key:using:completion:](NTKSwatchRenderer, "renderSwatchForView:size:device:key:using:completion:", v33, v38, v25, 0, v42, v35, v37);
  }
LABEL_10:

  return v15;
}

- (void)_prepareSwatchImagesForSelectedOptions:(id)a3
{
  id v4 = a3;
  id context = self->_typeface;
  id colorEffect = self->_colorEffect;
  v59 = [(NTKUltraCubeFaceView *)self colorPalette];
  v62 = self;
  char v6 = [(NTKUltraCubeFaceView *)self colorPalette];
  uint64_t v7 = [v6 pigmentEditOption];
  v63 = [v7 optionName];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v76 objects:v85 count:16];
  v58 = v8;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v77;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v77 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v14 = (char *)[v13 integerValue];
        long long v15 = [v8 objectForKeyedSubscript:v13];
        long long v16 = v15;
        if (v14 == (unsigned char *)&dword_8 + 2)
        {
          long long v17 = [v15 pigmentEditOption];
          uint64_t v18 = [v17 optionName];

          id v19 = [v59 copyWithOption:v17];
          id v8 = v58;

          v63 = (void *)v18;
          v59 = v19;
        }
        else if (v14 == (unsigned char *)&dword_C + 3)
        {
          id colorEffect = [v15 colorEffect];
        }
        else if (v14 == (unsigned char *)&dword_C + 1)
        {
          id context = [v15 typeface];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v10);
  }

  v20 = +[NSMutableDictionary dictionary];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v21 = [&off_4B5D8 countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v73;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v73 != v23) {
          objc_enumerationMutation(&off_4B5D8);
        }
        id v25 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)j) unsignedIntegerValue];
        id v26 = [(NTKUltraCubeFaceView *)v62 _swatchKeyForTypeface:v25 pigmentName:v63 colorEffect:colorEffect];
        v27 = +[NSNumber numberWithUnsignedInteger:v25];
        v83[0] = v27;
        v28 = +[NSNumber numberWithUnsignedInteger:colorEffect];
        v83[1] = v28;
        id v29 = +[NSArray arrayWithObjects:v83 count:2];
        [v20 setObject:v29 forKeyedSubscript:v26];
      }
      id v22 = [&off_4B5D8 countByEnumeratingWithState:&v72 objects:v84 count:16];
    }
    while (v22);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v30 = [&off_4B5F0 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v69;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v69 != v32) {
          objc_enumerationMutation(&off_4B5F0);
        }
        id v34 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)k) unsignedIntegerValue];
        double v35 = [(NTKUltraCubeFaceView *)v62 _swatchKeyForTypeface:context pigmentName:v63 colorEffect:v34];
        double v36 = +[NSNumber numberWithUnsignedInteger:context];
        v81[0] = v36;
        double v37 = +[NSNumber numberWithUnsignedInteger:v34];
        v81[1] = v37;
        v38 = +[NSArray arrayWithObjects:v81 count:2];
        [v20 setObject:v38 forKeyedSubscript:v35];
      }
      id v31 = [&off_4B5F0 countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v31);
  }
  +[NTKEditOption sizeForSwatchStyle:3];
  double v40 = v39;
  double v42 = v41;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v43 = v20;
  id v44 = [v43 countByEnumeratingWithState:&v64 objects:v80 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v65;
    do
    {
      for (m = 0; m != v45; m = (char *)m + 1)
      {
        if (*(void *)v65 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v64 + 1) + 8 * (void)m);
        if ((+[NTKSwatchRenderer containsSwatchForKey:v48] & 1) == 0)
        {
          v49 = [v43 objectForKeyedSubscript:v48];
          v50 = [v49 firstObject];
          id v51 = [v50 unsignedIntegerValue];

          v52 = [v49 lastObject];
          id v53 = [v52 unsignedIntegerValue];

          v54 = +[NTKUltraCubeContentEffect contentEffectWithColorEffect:v53 colorPalette:v59];
          v55 = [(NTKUltraCubeFaceView *)v62 _cloneActiveContentView];
          [v55 setTypeface:v51];
          [v55 setContentEffect:v54];
          [v55 invalidateDigitalTimeLabelStyle];
          [v55 layoutIfNeeded];
          [v55 setNeedsDisplay];
          v56 = [(NTKUltraCubeFaceView *)v62 device];
          id v57 = +[NTKSwatchRenderer renderSwatchForView:size:device:key:using:](NTKSwatchRenderer, "renderSwatchForView:size:device:key:using:", v55, v56, v48, 0, v40, v42);
        }
      }
      id v45 = [v43 countByEnumeratingWithState:&v64 objects:v80 count:16];
    }
    while (v45);
  }
}

- (void)_applyColorEffect
{
  unint64_t v3 = [(NTKUltraCubeFaceView *)self colorEffect];
  id v4 = [(NTKUltraCubeFaceView *)self colorPalette];
  id v5 = +[NTKUltraCubeContentEffect contentEffectWithColorEffect:v3 colorPalette:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v6 = self->_contentViews;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "setContentEffect:", v5, (void)v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_applyColorTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
}

- (id)colorPalette
{
  return [(NTKUltraCubeFaceView *)self faceColorPalette];
}

- (id)createFaceColorPalette
{
  v2 = [[NTKUltraCubeColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (unint64_t)colorEffect
{
  unint64_t v3 = [(NTKUltraCubeFaceView *)self device];
  unsigned int v4 = +[NTKUltraCubeFace isColorEffectFeatureEnabledForDevice:v3];

  if (v4) {
    return self->_colorEffect;
  }
  else {
    return 0;
  }
}

- (void)_newGradientViewsWithColor:(id)a3 timeElementUnitBaseline:(double)a4 topGradientView:(id *)a5 bottomGradientView:(id *)a6
{
  id v10 = a3;
  if (v10)
  {
    id v32 = v10;
    long long v11 = NTKImageNamed();
    [(NTKUltraCubeFaceView *)self bounds];
    double v13 = v12;
    double v15 = v14;
    [(NTKUltraCubeFaceView *)self dateComplicationFrameForUnitBaseline:a4];
    double v18 = v16;
    double v19 = round(v15 * 0.0307692308);
    if (a4 >= 0.5)
    {
      id v28 = v11;
      id v29 = [v28 CGImage];
      [v28 scale];
      id v24 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v29, 5);

      id v26 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, v15 - (v15 - v18 + v19), v13, v15 - v18 + v19);
      v27 = [v24 imageWithRenderingMode:2];
      [v26 setImage:v27];
      id v20 = 0;
    }
    else
    {
      id v20 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v13, v16 + v17 + v19);
      id v21 = [v11 imageWithRenderingMode:2];
      [v20 setImage:v21];

      [v20 setTintColor:v32];
      id v22 = v11;
      id v23 = [v22 CGImage];
      [v22 scale];
      id v24 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v23, 5);

      double v25 = v15 - (round(v15 * 0.91025641) - round(v15 * 0.0461538462) - v19);
      id v26 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, v15 - v25, v13, v25);
      v27 = [v24 imageWithRenderingMode:2];
      [v26 setImage:v27];
    }

    [v26 setTintColor:v32];
    id v30 = v20;
    *a5 = v30;
    id v31 = v26;
    *a6 = v31;

    id v10 = v32;
  }
}

- (id)_newContentViewWithRole:(unint64_t)a3
{
  [(NTKUltraCubeFaceView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(NTKUltraCubeFaceView *)self device];
  double v14 = -[NTKUltraCubeContentView initWithFrame:role:typeface:device:]([NTKUltraCubeContentView alloc], "initWithFrame:role:typeface:device:", a3, self->_typeface, v13, v6, v8, v10, v12);
  double v15 = [(NTKUltraCubeFaceView *)self _currentOverrideDate];
  [(NTKUltraCubeContentView *)v14 setOverrideDate:v15 duration:0.0];

  [(NTKUltraCubeContentView *)v14 setTimeOffset:self->_timeOffset];
  return v14;
}

- (id)_cloneActiveContentView
{
  unint64_t v3 = self->_contentActiveView;
  id v4 = [(NTKUltraCubeFaceView *)self _newContentViewWithRole:0];
  gradientColor = self->_gradientColor;
  [(NTKUltraCubeContentView *)v3 timeElementUnitBaseline];
  id v13 = 0;
  id v14 = 0;
  -[NTKUltraCubeFaceView _newGradientViewsWithColor:timeElementUnitBaseline:topGradientView:bottomGradientView:](self, "_newGradientViewsWithColor:timeElementUnitBaseline:topGradientView:bottomGradientView:", gradientColor, &v14, &v13);
  id v6 = v14;
  id v7 = v13;
  [(NTKUltraCubeContentView *)v3 timeElementUnitHeight];
  objc_msgSend(v4, "setTimeElementUnitHeight:");
  [(NTKUltraCubeContentView *)v3 timeElementUnitBaseline];
  objc_msgSend(v4, "setTimeElementUnitBaseline:");
  [v4 setForegroundContentScale:self->_foregroundImageScale];
  [v4 setBackgroundContentScale:self->_backgroundImageScale];
  double v8 = [(NTKUltraCubeContentView *)v3 foregroundImage];
  double v9 = [(NTKUltraCubeContentView *)v3 backgroundImage];
  double v10 = [(NTKUltraCubeContentView *)v3 timeElementShadowColor];
  objc_msgSend(v4, "updateForegroundImage:backgroundImage:timeElementShadowColor:topGradientView:bottomGradientView:isTimeElementFront:", v8, v9, v10, v6, v7, -[NTKUltraCubeContentView isTimeElementFront](v3, "isTimeElementFront"));

  [v4 copyFiltersFromContentView:v3];
  double v11 = [(NTKUltraCubeContentView *)v3 contentEffect];

  [v4 setContentEffect:v11];
  [v4 invalidateDigitalTimeLabelStyle];

  return v4;
}

- (id)_currentOverrideDate
{
  specifierDate = self->_specifierDate;
  if (specifierDate || (specifierDate = self->_overrideDate) != 0) {
    unint64_t v3 = specifierDate;
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_tryLoadPhoto:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    [(NTKUltraCubeFaceView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    id v11 = [v6 baseImageURL];
    double v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v11 fileSystemRepresentation], 4);

    id v13 = +[UIImage imageWithContentsOfFile:v12];
    if (!v13)
    {
      BOOL v18 = 0;
LABEL_47:

      goto LABEL_48;
    }
    id v14 = [v6 maskImageURL];

    if (v14)
    {
      id v15 = [v6 maskImageURL];
      double v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v15 fileSystemRepresentation], 4);

      double v17 = +[UIImage imageWithContentsOfFile:v16];
    }
    else
    {
      double v17 = 0;
    }
    double v19 = [v6 backgroundImageURL];

    v125 = self;
    if (v19)
    {
      id v20 = [v6 backgroundImageURL];
      id v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v20 fileSystemRepresentation], 4);

      uint64_t v22 = +[UIImage imageWithContentsOfFile:v21];

      v124 = (void *)v22;
      if ((v17 != 0) != (v22 == 0))
      {
        v113 = v12;
        v111 = v17;
        if (v17)
        {
          v120 = [(NTKUltraCubeFaceView *)self device];
          [v120 screenScale];
          double v24 = v23;
          int v25 = (int)(v8 * v23);
          BOOL v26 = a4;
          int v27 = (int)(v10 * v23);
          id v28 = v13;
          imagea = (CGImage *)[v28 CGImage];
          id v114 = v6;
          id v29 = (CGImage *)[v17 CGImage];
          id v30 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
          BOOL v31 = 1;
          id v32 = v13;
          v33 = CGBitmapContextCreate(0, v25, v27, 8uLL, 4 * v25, v30, 1u);
          CGColorSpaceRelease(v30);
          CGFloat v34 = (double)v27;
          a4 = v26;
          memset(&keyExistsAndHasValidFormat, 0, sizeof(keyExistsAndHasValidFormat));
          -[NTKUltraCubeFaceView ctmForDrawingImage:uprightInRect:](v125, "ctmForDrawingImage:uprightInRect:", v28, 0.0, 0.0, (double)v25, v34);
          CGAffineTransform transform = keyExistsAndHasValidFormat;
          CGContextConcatCTM(v33, &transform);
          CGAffineTransform transform = keyExistsAndHasValidFormat;
          CGAffineTransformInvert(&v134, &transform);
          v140.origin.CGFloat x = 0.0;
          v140.origin.CGFloat y = 0.0;
          v140.size.CGFloat width = (double)v25;
          v140.size.CGFloat height = v34;
          CGRect v141 = CGRectApplyAffineTransform(v140, &v134);
          CGFloat x = v141.origin.x;
          CGFloat y = v141.origin.y;
          CGFloat width = v141.size.width;
          CGFloat height = v141.size.height;
          double v39 = v29;
          id v6 = v114;
          CGContextClipToMask(v33, v141, v39);
          CGContextSetInterpolationQuality(v33, kCGInterpolationHigh);
          v142.origin.CGFloat x = x;
          v142.origin.CGFloat y = y;
          v142.size.CGFloat width = width;
          v142.size.CGFloat height = height;
          CGContextDrawImage(v33, v142, imagea);
          double v40 = CGBitmapContextCreateImage(v33);
          double v41 = v33;
          id v13 = v32;
          CGContextRelease(v41);
          CGImageRef image = +[UIImage imageWithCGImage:v40 scale:0 orientation:v24];
          CGImageRelease(v40);

          self = v125;
          goto LABEL_16;
        }
LABEL_15:
        CGImageRef image = v13;
        BOOL v31 = 0;
LABEL_16:
        unsigned int v42 = [v6 isParallaxFlat];
        self->_isParallaxFlat = v42;
        self->_isParallax3Layer = v31;
        if (v31)
        {
          [v6 maskedImageZorder];
          double v44 = v43;
          [v6 timeElementZorder];
          uint64_t v46 = v44 < v45;
        }
        else
        {
          uint64_t v46 = 1;
        }
        self->_isTimeLabelFront = v46;
        long long v132 = xmmword_442D8;
        long long v133 = unk_442E8;
        if (NTKInternalBuild())
        {
          uint64_t v47 = 0;
          CFStringRef v48 = (const __CFString *)NTKFacePreferencesDomain;
          do
          {
            LOBYTE(keyExistsAndHasValidFormat.a) = 0;
            CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(off_48FA0[v47], v48, (Boolean *)&keyExistsAndHasValidFormat);
            if (LOBYTE(keyExistsAndHasValidFormat.a)) {
              *((float *)&v132 + v47) = (float)AppIntegerValue / 10.0;
            }
            ++v47;
          }
          while (v47 != 8);
        }
        if (v42)
        {
          v50 = (double *)v125;
          v125->_foregroundMotionScale = 1.0;
          double v51 = 1.075;
          v125->_foregroundImageScale = 1.075;
          v125->_backgroundMotionScale = 1.0;
          goto LABEL_32;
        }
        v50 = (double *)v125;
        if (v46)
        {
          if (!v31)
          {
            v125->_foregroundMotionScale = 1.0;
            v125->_foregroundImageScale = 1.075;
            v125->_backgroundMotionScale = 0.0;
            double v51 = 1.0;
LABEL_32:
            v50[17] = v51;
            [v6 timeElementUnitHeight];
            double v59 = v58;
            id v115 = v6;
            [v6 timeElementUnitBaseline];
            double v61 = v60;
            objc_msgSend(v50, "dateComplicationFrameForUnitBaseline:");
            double obj = v63;
            double v118 = v62;
            double v107 = v65;
            double v108 = v64;
            double v66 = v62 / v8;
            double v67 = v63 / v10;
            double v68 = v64 / v8;
            double v69 = v65 / v10;
            id v70 = v13;
            long long v71 = (CGImage *)[v70 CGImage];
            double v72 = (double)CGImageGetWidth(v71);
            size_t v73 = CGImageGetHeight(v71);
            CGFloat v74 = round(v69 * (double)v73);
            CGFloat v106 = round((v61 - v59) * (double)v73);
            CGFloat v75 = round(v59 * (double)v73);
            double v109 = round((double)v73 * 0.864102564);
            keyExistsAndHasValidFormat.a = round(v66 * v72);
            keyExistsAndHasValidFormat.b = round(v67 * (double)v73);
            double v76 = round((double)v73 * 0.0461538462);
            keyExistsAndHasValidFormat.c = round(v68 * v72);
            keyExistsAndHasValidFormat.d = v74;
            long long v77 = +[NSValue valueWithBytes:&keyExistsAndHasValidFormat objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            v139[0] = v77;
            transform.a = round((1.0 - 0.7) * 0.5 * v72);
            transform.b = v106;
            transform.c = round(0.7 * v72);
            transform.d = v75;
            long long v78 = +[NSValue valueWithBytes:&transform objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            v139[1] = v78;
            v137[0] = round(v72 * 0.05);
            *(double *)&v137[1] = v109;
            v137[2] = round(v72 * 0.9);
            *(double *)&v137[3] = v76;
            long long v79 = +[NSValue valueWithBytes:v137 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            v139[2] = v79;
            v80 = +[NSArray arrayWithObjects:v139 count:3];

            v81 = NTKAnalyzePhoto();

            [v81 shadowHue];
            double v83 = v82;
            [v81 shadowSaturation];
            double v85 = v84;
            [v81 shadowBrightness];
            v121 = +[UIColor colorWithHue:v83 saturation:v85 brightness:v86 alpha:1.0];
            -[NTKUltraCubeFaceViewComplicationFactory setShadowColor:faceView:](v125->_complicationFactory, "setShadowColor:faceView:");
            [(NTKUltraCubeFaceViewComplicationFactory *)v125->_complicationFactory dateComplicationFrame];
            v144.origin.CGFloat x = v118;
            v144.origin.CGFloat y = obj;
            v144.size.CGFloat width = v108;
            v144.size.CGFloat height = v107;
            if (!CGRectEqualToRect(v143, v144))
            {
              -[NTKUltraCubeFaceViewComplicationFactory setDateComplicationFrame:](v125->_complicationFactory, "setDateComplicationFrame:", v118, obj, v108, v107);
              if (!a4) {
                [(NTKUltraCubeFaceView *)v125 invalidateComplicationLayout];
              }
            }
            v112 = v13;
            v110 = v81;
            if ([v81 isComplexBackground])
            {
              [v81 bgHue];
              double v88 = v87;
              [v81 bgSaturation];
              double v90 = v89;
              [v81 bgBrightness];
              uint64_t v92 = +[UIColor colorWithHue:v88 saturation:v90 brightness:v91 alpha:0.7];
              gradientColor = v125->_gradientColor;
              v125->_gradientColor = (UIColor *)v92;
            }
            else
            {
              gradientColor = v125->_gradientColor;
              v125->_gradientColor = 0;
            }

            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            obja = v125->_contentViews;
            id v94 = [(NSMutableArray *)obja countByEnumeratingWithState:&v128 objects:v138 count:16];
            if (v94)
            {
              id v95 = v94;
              uint64_t v119 = *(void *)v129;
              do
              {
                for (i = 0; i != v95; i = (char *)i + 1)
                {
                  if (*(void *)v129 != v119) {
                    objc_enumerationMutation(obja);
                  }
                  v97 = *(void **)(*((void *)&v128 + 1) + 8 * i);
                  v98 = v125->_gradientColor;
                  id v126 = 0;
                  id v127 = 0;
                  [(NTKUltraCubeFaceView *)v125 _newGradientViewsWithColor:v98 timeElementUnitBaseline:&v127 topGradientView:&v126 bottomGradientView:v61];
                  id v99 = v127;
                  id v100 = v126;
                  [v97 setForegroundContentScale:v125->_foregroundImageScale];
                  [v97 setBackgroundContentScale:v125->_backgroundImageScale];
                  [v97 setTimeElementUnitHeight:v59];
                  [v97 setTimeElementUnitBaseline:v61];
                  [v97 updateForegroundImage:image backgroundImage:v124 timeElementShadowColor:v121 topGradientView:v99 bottomGradientView:v100 isTimeElementFront:v46];
                  uint64_t v101 = v46;
                  id v102 = [(NTKUltraCubeFaceView *)v125 colorEffect];
                  v103 = [(NTKUltraCubeFaceView *)v125 colorPalette];
                  v104 = +[NTKUltraCubeContentEffect contentEffectWithColorEffect:v102 colorPalette:v103];

                  [v97 setContentEffect:v104];
                  uint64_t v46 = v101;
                }
                id v95 = [(NSMutableArray *)obja countByEnumeratingWithState:&v128 objects:v138 count:16];
              }
              while (v95);
            }

            BOOL v18 = 1;
            double v12 = v113;
            id v6 = v115;
            double v17 = v111;
            id v13 = v112;
            goto LABEL_46;
          }
          float v52 = *((float *)&v132 + 1);
          LODWORD(v125->_foregroundMotionScale) = v132;
          double v53 = 1.075 + -1.0;
          double v54 = 1.0;
          v125->_foregroundImageScale = (1.075 + -1.0) * v52 + 1.0;
          float v56 = *((float *)&v132 + 3);
          float v55 = *((float *)&v132 + 2);
        }
        else
        {
          float v57 = *((float *)&v133 + 1);
          LODWORD(v125->_foregroundMotionScale) = v133;
          double v53 = 1.075 + -1.0;
          double v54 = 1.0;
          v125->_foregroundImageScale = (1.075 + -1.0) * v57 + 1.0;
          float v56 = *((float *)&v133 + 3);
          float v55 = *((float *)&v133 + 2);
        }
        v125->_backgroundMotionScale = v55;
        double v51 = v54 + v53 * v56;
        goto LABEL_32;
      }
    }
    else
    {
      v124 = 0;
      if (!v17)
      {
        v111 = 0;
        v113 = v12;
        goto LABEL_15;
      }
    }
    BOOL v18 = 0;
LABEL_46:

    goto LABEL_47;
  }
  BOOL v18 = 0;
LABEL_48:

  return v18;
}

- (void)_loadPhoto:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 uniqueIdentifier];
  char v8 = NTKEqualObjects();
  if (![(NTKUltraCubeFaceView *)self _tryLoadPhoto:v6 animated:v4])
  {
    char v29 = v8;
    id v30 = v7;
    self->_isTimeLabelFront = 1;
    self->_isParallaxFlat = 0;
    self->_foregroundMotionScale = 1.0;
    self->_foregroundImageScale = 1.075;
    self->_backgroundMotionScale = 0.0;
    self->_backgroundImageScale = 1.0;
    double v9 = +[NTKPhotoAnalysis defaultAnalysis];
    [v9 shadowHue];
    double v11 = v10;
    [v9 shadowSaturation];
    double v13 = v12;
    id v28 = v9;
    [v9 shadowBrightness];
    id v15 = +[UIColor colorWithHue:v11 saturation:v13 brightness:v14 alpha:1.0];
    gradientColor = self->_gradientColor;
    self->_gradientColor = 0;

    [(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory setShadowColor:v15 faceView:self];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v17 = self->_contentViews;
    id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [v22 setForegroundContentScale:self->_foregroundImageScale];
          [v22 setBackgroundContentScale:self->_backgroundImageScale];
          [v22 setTimeElementUnitHeight:0.241116751];
          [v22 setTimeElementUnitBaseline:0.328125];
          [v22 updateForegroundImage:0 backgroundImage:0 timeElementShadowColor:v15 topGradientView:0 bottomGradientView:0 isTimeElementFront:1];
          [v22 setContentEffect:0];
        }
        id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v19);
    }

    double v7 = v30;
    char v8 = v29;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v23 = self->_contentViews;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) invalidateDigitalTimeLabelStyle];
      }
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }

  if ((v8 & 1) == 0) {
    [(NTKUltraCubeFaceView *)self _reloadSwatches:v7];
  }
}

- (void)_loadNextPhotoAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (self->_readerIndex + 1) % (int)[(NTKUltraCubePhotosReader *)self->_reader count];
  self->_readerIndeCGFloat x = v5;
  id v6 = [(NTKUltraCubePhotosReader *)self->_reader objectAtIndexedSubscript:v5];
  [(NTKUltraCubeFaceView *)self _loadPhoto:v6 animated:v3];
}

- (void)_reloadSwatches:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  photoSnapshotIdentifier = self->_photoSnapshotIdentifier;
  self->_photoSnapshotIdentifier = v4;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMapTable *)self->_swatchRefreshHandlers objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      float v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))();
        float v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updateContents
{
  if (!self->_isContentLoaded) {
    return;
  }
  BOOL v3 = [(NTKUltraCubeFaceView *)self resourceDirectory];
  BOOL v4 = +[NTKUltraCubePhotosReader readerForResourceDirectory:v3];
  reader = self->_reader;
  self->_reader = v4;

  id v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [(NTKUltraCubePhotosReader *)self->_reader count];
    id v8 = [(NTKUltraCubeFaceView *)self resourceDirectory];
    int v15 = 134218242;
    unint64_t v16 = v7;
    __int16 v17 = 2112;
    int64_t v18 = (int64_t)v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "_updateContents: created NTKUltraCubePhotosReader with %ld photos for %@", (uint8_t *)&v15, 0x16u);
  }
  if ([(NTKUltraCubePhotosReader *)self->_reader count])
  {
    self->_readerIndeCGFloat x = 0;
    uint64_t v9 = [(NTKUltraCubePhotosReader *)self->_reader objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  float v10 = [(NTKUltraCubePhotosReader *)self->_reader resourceDirectory];
  if (v10 && ![(NTKUltraCubePhotosReader *)self->_reader count])
  {
    unint64_t v11 = [(NTKUltraCubePhotosReader *)self->_reader version];

    if (v11 < 2)
    {
      long long v12 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [(NTKUltraCubePhotosReader *)self->_reader resourceDirectory];
        int64_t v14 = [(NTKUltraCubePhotosReader *)self->_reader version];
        int v15 = 138412546;
        unint64_t v16 = (unint64_t)v13;
        __int16 v17 = 2048;
        int64_t v18 = v14;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "resource directory %@ is outdated, version == %ld", (uint8_t *)&v15, 0x16u);
      }
      [(NTKUltraCubeFaceView *)self _setDeprecationWarning];
      goto LABEL_11;
    }
  }
  else
  {
  }
  [(NTKUltraCubeFaceView *)self _clearDeprecationWarning];
LABEL_11:
  [(NTKUltraCubeFaceView *)self _loadPhoto:v9 animated:0];
  if (v9) {
    [(NTKUltraCubeFaceView *)self _hideNoPhotoUI];
  }
  else {
    [(NTKUltraCubeFaceView *)self _showNoPhotoUI];
  }
}

- (void)_applyPause
{
  int isPaused = self->_isPaused;
  unsigned int v4 = [(NTKUltraCubeFaceView *)self isFrozen];
  self->_int isPaused = v4;
  if (isPaused != v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    int v5 = self->_contentViews;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setPaused:", self->_isPaused, (void)v10);
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setDeprecationWarning
{
  if (NTKInternalBuild())
  {
    if (!self->_deprecationWarningLabel)
    {
      [(NTKUltraCubeFaceView *)self bounds];
      int v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, v3 * 0.4, v4, v3 * 0.5);
      deprecationWarningLabel = self->_deprecationWarningLabel;
      self->_deprecationWarningLabel = v5;

      [(UILabel *)self->_deprecationWarningLabel setNumberOfLines:0];
      id v7 = self->_deprecationWarningLabel;
      uint64_t v8 = +[UIColor redColor];
      [(UILabel *)v7 setTextColor:v8];

      uint64_t v9 = [(NTKUltraCubeFaceView *)self contentView];
      [v9 addSubview:self->_deprecationWarningLabel];
      [v9 bringSubviewToFront:self->_deprecationWarningLabel];
    }
    id v10 = +[NSString stringWithFormat:@"Data is v%ld and expected is v%ld. Delete this face.", [(NTKUltraCubePhotosReader *)self->_reader version], 2];
    [(UILabel *)self->_deprecationWarningLabel setText:v10];
  }
}

- (void)_clearDeprecationWarning
{
  deprecationWarningLabel = self->_deprecationWarningLabel;
  if (deprecationWarningLabel)
  {
    [(UILabel *)deprecationWarningLabel removeFromSuperview];
    double v4 = self->_deprecationWarningLabel;
    self->_deprecationWarningLabel = 0;
  }
}

- (void)_showNoPhotoUI
{
  if (!self->_isNoPhotosViewVisible && (!NTKInternalBuild() || !self->_deprecationWarningLabel))
  {
    id v3 = objc_alloc((Class)NTKAlbumEmptyView);
    double v4 = [(NTKUltraCubeFaceView *)self device];
    int v5 = (NTKAlbumEmptyView *)[v3 initForDevice:v4];
    noPhotosView = self->_noPhotosView;
    self->_noPhotosView = v5;

    id v7 = self->_noPhotosView;
    [(NTKUltraCubeFaceView *)self bounds];
    -[NTKAlbumEmptyView setFrame:](v7, "setFrame:");
    uint64_t v8 = self->_noPhotosView;
    uint64_t v9 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"NO_PORTRAIT_PHOTOS" comment:&stru_49630];
    [(NTKAlbumEmptyView *)v8 setBodyLabelText:v9];

    id v10 = [(NTKUltraCubeFaceView *)self contentView];
    [v10 addSubview:self->_noPhotosView];

    long long v11 = [(NTKUltraCubeFaceView *)self complicationContainerView];
    [v11 setHidden:1];

    self->_isNoPhotosViewVisible = 1;
  }
}

- (void)_hideNoPhotoUI
{
  if (self->_isNoPhotosViewVisible)
  {
    id v3 = [(NTKUltraCubeFaceView *)self complicationContainerView];
    [v3 setHidden:0];

    [(NTKAlbumEmptyView *)self->_noPhotosView removeFromSuperview];
    noPhotosView = self->_noPhotosView;
    self->_noPhotosView = 0;

    self->_isNoPhotosViewVisible = 0;
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
}

- (id)_detachedComplicationDisplays
{
  return [(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory detachedComplicationDisplaysForFaceView:self];
}

- (void)_loadLayoutRules
{
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  [(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory keylineCornerRadiusForComplicationSlot:a3 faceView:self];
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)(uint64_t)[(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return [(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory fadesComplicationSlot:a3 inEditMode:a4 faceView:self];
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  [(NTKUltraCubeFaceViewComplicationFactory *)self->_complicationFactory minimumBreathingScaleForComplicationSlot:a3 faceView:self];
  return result;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)dateComplicationFont
{
  v2 = [(NTKUltraCubeFaceView *)self device];
  id v3 = (char *)[v2 sizeClass];
  double v4 = 16.0;
  if ((unint64_t)(v3 - 3) <= 5) {
    double v4 = dbl_442F8[(void)(v3 - 3)];
  }

  return +[CLKFont systemFontOfSize:v4 weight:UIFontWeightMedium];
}

- (CGRect)dateComplicationFrameForUnitBaseline:(double)a3
{
  [(NTKUltraCubeFaceView *)self bounds];
  double v4 = [(NTKUltraCubeFaceView *)self device];
  [v4 sizeClass];
  int v5 = [(NTKUltraCubeFaceView *)self dateComplicationFont];
  [v5 ascender];
  [v5 descender];
  CLKRoundForDevice();
  double v7 = v6;
  CLKRoundForDevice();
  double v9 = v8;
  CLKRoundForDevice();
  double v11 = v10;
  CLKRoundForDevice();
  double v13 = v12;

  double v14 = v13;
  double v15 = v11;
  double v16 = v9;
  double v17 = v7;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)_snapshotDateComplicationLabel
{
  id v3 = objc_alloc((Class)UIView);
  [(NTKUltraCubeFaceView *)self bounds];
  id v4 = objc_msgSend(v3, "initWithFrame:");
  int v5 = [(NTKUltraCubeFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  double v6 = [v5 snapshotViewAfterScreenUpdates:0];
  [v5 frame];
  objc_msgSend(v6, "setFrame:");
  [v4 addSubview:v6];

  return v4;
}

- (void)_loadActiveViewIfNeeded
{
  if (!self->_contentActiveView)
  {
    id v3 = [(NTKUltraCubeFaceView *)self _newContentViewWithRole:0];
    contentActiveView = self->_contentActiveView;
    self->_contentActiveView = v3;

    [(NSMutableArray *)self->_contentViews addObject:self->_contentActiveView];
    id v5 = [(NTKUltraCubeFaceView *)self contentView];
    [v5 addSubview:self->_contentActiveView];
    [v5 bringSubviewToFront:self->_contentActiveView];
  }
}

- (void)_unloadActiveViews
{
  [(NSMutableArray *)self->_contentViews removeObject:self->_contentActiveView];
  [(NTKUltraCubeContentView *)self->_contentActiveView removeFromSuperview];
  contentActiveView = self->_contentActiveView;
  self->_contentActiveView = 0;
}

- (CGAffineTransform)ctmForDrawingImage:(SEL)a3 uprightInRect:(id)a4
{
  CGFloat height = a5.size.height;
  objc_msgSend(a4, "imageOrientation", a5.origin.x, a5.origin.y);
  sub_1B274();
  memset(&v18, 0, sizeof(v18));
  NTKImagePresentationTransform();
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v8;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tCGFloat x = v9;
  *(_OWORD *)&t1.a = v7;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tCGFloat x = v9;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.a = 1.0;
  *(_OWORD *)&t2.d = xmmword_44270;
  t2.tCGFloat y = height;
  CGAffineTransformConcat(retstr, &t1, &t2);
  long long v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransform v15 = v18;
  CGAffineTransformConcat(&t1, &t2, &v15);
  long long v11 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v12;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
  v15.b = 0.0;
  v15.c = 0.0;
  v15.a = 1.0;
  *(_OWORD *)&v15.d = xmmword_44270;
  v15.tCGFloat y = height;
  CGRect result = CGAffineTransformConcat(&t1, &t2, &v15);
  long long v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchRefreshHandlers, 0);
  objc_storeStrong((id *)&self->_photoSnapshotIdentifier, 0);
  objc_storeStrong((id *)&self->_contentViews, 0);
  objc_storeStrong((id *)&self->_deprecationWarningLabel, 0);
  objc_storeStrong((id *)&self->_gradientColor, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_noPhotosView, 0);
  objc_storeStrong((id *)&self->_specifierDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_contentActiveView, 0);

  objc_storeStrong((id *)&self->_tapGesture, 0);
}

@end