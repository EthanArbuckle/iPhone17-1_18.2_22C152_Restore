@interface MKOverlayContainerView
+ (int64_t)_defaultOverlayLevel;
- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFractionOfVisible:(double)a3;
- (BOOL)_overlaySpansGlobeAndReplacesMapContent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)requiresModernMap;
- (BOOL)supportsElevation;
- (MKMapView)mapView;
- (MKOverlayContainerView)initWithFrame:(CGRect)a3;
- (MKOverlayContainerViewDelegate)delegate;
- (NSArray)allDrawables;
- (NSArray)overlays;
- (double)mapZoomScale;
- (id)_allOverlays;
- (id)_considerAddingDrawable:(id)a3 inAddRect:(id)a4 level:(int64_t)a5;
- (id)_viewContainerForLevel:(int64_t)a3;
- (id)drawableForOverlay:(id)a3;
- (id)overlaysInLevel:(int64_t)a3;
- (int64_t)_drawableIndexForDrawable:(id)a3 level:(int64_t)a4;
- (int64_t)_levelForOverlay:(id)a3 exists:(BOOL *)a4;
- (unint64_t)_overlayCount;
- (void)_configureAndAddDrawable:(id)a3 forOverlay:(id)a4 level:(int64_t)a5;
- (void)_exchangeOverlayAtIndex:(unint64_t)a3 withOverlayAtIndex:(unint64_t)a4 level:(int64_t)a5;
- (void)_flexTerrainIfNeeded;
- (void)_insertDrawable:(id)a3 forOverlay:(id)a4 atIndex:(int64_t)a5 level:(int64_t)a6;
- (void)_removeDrawable:(id)a3 forOverlay:(id)a4 level:(int64_t)a5;
- (void)_unFlexTerrainIfNeeded;
- (void)_updateContentScale:(id)a3;
- (void)_updateShowsAppleLogoIfNeeded;
- (void)addAndRemoveOverlayViews;
- (void)addInternalOverlay:(id)a3 level:(int64_t)a4 provider:(id)a5;
- (void)addOverlay:(id)a3;
- (void)addOverlay:(id)a3 level:(int64_t)a4;
- (void)addOverlays:(id)a3;
- (void)addOverlays:(id)a3 level:(int64_t)a4;
- (void)didMoveToWindow;
- (void)exchangeOverlay:(id)a3 withOverlay:(id)a4;
- (void)exchangeOverlayAtIndex:(unint64_t)a3 withOverlayAtIndex:(unint64_t)a4;
- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4;
- (void)insertOverlay:(id)a3 atIndex:(unint64_t)a4;
- (void)insertOverlay:(id)a3 atIndex:(unint64_t)a4 level:(int64_t)a5;
- (void)insertOverlay:(id)a3 belowOverlay:(id)a4;
- (void)removeOverlay:(id)a3;
- (void)removeOverlays:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setMapZoomScale:(double)a3;
@end

@implementation MKOverlayContainerView

- (MKOverlayContainerView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MKOverlayContainerView;
  v3 = -[MKOverlayContainerView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      v8 = v3->_overlays[v4];
      v3->_overlays[v4] = v7;

      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10 = v3->_drawables[v4];
      v3->_drawables[v4] = v9;

      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v12 = v3->_vkOverlays[v4];
      v3->_vkOverlays[v4] = v11;

      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
      v14 = v3->_overlayToDrawable[v4];
      v3->_overlayToDrawable[v4] = (NSMapTable *)v13;

      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)_viewContainerForLevel:(int64_t)a3
{
  viewContainers = self->_viewContainers;
  char v5 = self->_viewContainers[a3];
  if (!v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(MKOverlayContainerView *)self bounds];
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:");
    v9 = viewContainers[a3];
    viewContainers[a3] = (UIView *)v8;

    if (a3 < 1)
    {
LABEL_9:
      [(MKOverlayContainerView *)self insertSubview:viewContainers[a3] atIndex:0];
    }
    else
    {
      int64_t v10 = a3;
      while (v10 >= 1)
      {
        v11 = self->_vkOverlays[v10-- + 1];
        if (v11)
        {
          v12 = v11;
          goto LABEL_8;
        }
      }
      v12 = *(viewContainers - 1);
      if (!v12) {
        goto LABEL_9;
      }
LABEL_8:
      [(MKOverlayContainerView *)self insertSubview:viewContainers[a3] aboveSubview:v12];
    }
    char v5 = viewContainers[a3];
  }

  return v5;
}

- (int64_t)_drawableIndexForDrawable:(id)a3 level:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v6 = [a3 overlay];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_overlays[a4];
  uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v17;
    v12 = (id *)(&self->super.super.super.isa + a4);
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v7);
      }
      if (*(void **)(*((void *)&v16 + 1) + 8 * v13) == v6) {
        break;
      }
      v14 = [v12[54] objectForKey:(void)v16];

      if (v14) {
        ++v10;
      }
      if (v9 == ++v13)
      {
        uint64_t v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFractionOfVisible:(double)a3
{
  v26[4] = *(double *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained overlayContainerVisibleMapRect:self];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if (v7 + v11 > 268435456.0)
  {
    v26[0] = v7 + v11 + -268435456.0;
    v26[1] = v9 + v13;
    v26[2] = v7;
    v26[3] = v9;
    double v7 = MKMapRectBoundingMapPoints((uint64_t)v26, 2);
    double v9 = v14;
    double v11 = v15;
    double v13 = v16;
  }
  double v17 = INFINITY;
  if (v7 == INFINITY && v9 == INFINITY)
  {
    double v19 = INFINITY;
  }
  else
  {
    double v19 = v7 - v11 * a3;
    double v17 = v9 - v13 * a3;
    double v11 = v11 - -(v11 * a3) * 2.0;
    double v13 = v13 - -(v13 * a3) * 2.0;
  }
  uint64_t v20 = 0x41B0000000000000;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0x41B0000000000000;
  double v24 = v11;
  double v25 = v13;

  return ($FD2884BA735A6398BD92EEF91FE53E55)MKMapRectIntersection(*(MKMapRect *)&v21, *(MKMapRect *)(&v17 - 1));
}

- (void)_configureAndAddDrawable:(id)a3 forOverlay:(id)a4 level:(int64_t)a5
{
  id v8 = a4;
  id v19 = a3;
  [v8 boundingMapRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v19, "set_boundingMapRect:");
  double v17 = objc_msgSend(v19, "_mk_overlayLayer");
  objc_msgSend(v17, "setPosition:", v10 + v14 * 0.5, v12 + v16 * 0.5);

  long long v18 = objc_msgSend(v19, "_mk_overlayLayer");
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v14, v16);

  [(MKOverlayContainerView *)self _insertDrawable:v19 forOverlay:v8 atIndex:[(MKOverlayContainerView *)self _drawableIndexForDrawable:v19 level:a5] level:a5];
}

- (id)_considerAddingDrawable:(id)a3 inAddRect:(id)a4 level:(int64_t)a5
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v8 = a4.var0.var1;
  double v9 = a4.var0.var0;
  id v11 = a3;
  [(MKOverlayContainerView *)self _updateShowsAppleLogoIfNeeded];
  [(MKOverlayContainerView *)self _flexTerrainIfNeeded];
  double v12 = [(NSMapTable *)self->_overlayToDrawable[a5] objectForKey:v11];

  if (v12) {
    goto LABEL_2;
  }
  id v15 = v11;
  if (objc_opt_respondsToSelector())
  {
    char v16 = objc_msgSend(v15, "intersectsMapRect:", v9, v8, var0, var1);

    if (v16) {
      goto LABEL_10;
    }
LABEL_2:
    double v13 = 0;
    goto LABEL_3;
  }
  [v15 boundingMapRect];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  if (!MKMapRectIntersectsMapRectWrappingMeridian(v18, v20, v22, v24, v9, v8, var0, var1)) {
    goto LABEL_2;
  }
LABEL_10:
  double v25 = [(NSMapTable *)self->_internalOverlayToProvider objectForKey:v15];
  v26 = v25;
  if (v25) {
    id WeakRetained = v25;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  v28 = WeakRetained;

  double v13 = [v28 createDrawableForOverlay:v15];
  if (v13) {
    [(MKOverlayContainerView *)self _configureAndAddDrawable:v13 forOverlay:v15 level:a5];
  }

LABEL_3:

  return v13;
}

- (void)addAndRemoveOverlayViews
{
  v2 = self;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  [(MKOverlayContainerView *)self _mapRectWithFractionOfVisible:3.0];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MKOverlayContainerView *)v2 _mapRectWithFractionOfVisible:5.0];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v58 = 0;
  p_isa = (id *)&v2->super.super.super.isa;
  uint64_t v19 = 0;
  drawables = v2->_drawables;
  char v20 = 1;
  do
  {
    char v57 = v20;
    unint64_t v21 = [(NSMutableArray *)drawables[v19] count];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    overlays = v2->_overlays;
    double v22 = v2->_overlays[v19];
    uint64_t v23 = [(NSMutableOrderedSet *)v22 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v65;
      uint64_t v26 = v19;
      v27 = (id *)(&v2->super.super.super.isa + v19);
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(v22);
          }
          v29 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v30 = [v27[54] objectForKey:v29];
          v31 = (void *)v30;
          if (v30 && v21 >= 0x65)
          {
            [v29 boundingMapRect];
            if (!MKMapRectIntersectsMapRectWrappingMeridian(v32, v33, v34, v35, v12, v14, v16, v18))
            {
              [p_isa _removeDrawable:v31 forOverlay:v29 level:v26];
              --v21;
            }
          }
          else if (!v30)
          {
            [v29 boundingMapRect];
            if (MKMapRectIntersectsMapRectWrappingMeridian(v36, v37, v38, v39, v4, v6, v8, v10))
            {
              v40 = objc_msgSend(p_isa, "_considerAddingDrawable:inAddRect:level:", v29, v26, v4, v6, v8, v10);
              if (v40)
              {
                id v41 = v58;
                if (!v58) {
                  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                id v58 = v41;
                [v41 addObject:v40];
                ++v21;
              }
            }
          }
        }
        uint64_t v24 = [(NSMutableOrderedSet *)v22 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v24);
    }
    else
    {
      uint64_t v26 = v19;
    }

    if (v21 >= 0x65)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v42 = overlays[v26];
      uint64_t v43 = [(NSMutableOrderedSet *)v42 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v61;
LABEL_25:
        uint64_t v46 = 0;
        while (1)
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v42);
          }
          if (v21 < 0x65) {
            break;
          }
          v47 = *(void **)(*((void *)&v60 + 1) + 8 * v46);
          v48 = [p_isa[v26 + 54] objectForKey:v47];
          if (v48)
          {
            [v47 boundingMapRect];
            if (!MKMapRectIntersectsMapRectWrappingMeridian(v49, v50, v51, v52, v12, v14, v16, v18))
            {
              [p_isa _removeDrawable:v48 forOverlay:v47 level:v26];
              --v21;
            }
          }

          if (v44 == ++v46)
          {
            uint64_t v44 = [(NSMutableOrderedSet *)v42 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v44) {
              goto LABEL_25;
            }
            break;
          }
        }
      }
    }
    char v20 = 0;
    uint64_t v19 = 1;
    v2 = (MKOverlayContainerView *)p_isa;
  }
  while ((v57 & 1) != 0);
  v53 = v58;
  if (v58)
  {
    id WeakRetained = objc_loadWeakRetained(p_isa + 62);
    [WeakRetained overlayContainerAddedDrawables:v58];

    v53 = v58;
  }
}

- (void)addOverlay:(id)a3 level:(int64_t)a4
{
  id v6 = a3;
  checkLevel(a4);
  [(MKOverlayContainerView *)self removeOverlay:v6];
  [(NSMutableOrderedSet *)self->_overlays[a4] addObject:v6];
  [(MKOverlayContainerView *)self _mapRectWithFractionOfVisible:3.0];
  -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v6, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v9];
    [WeakRetained overlayContainerAddedDrawables:v8];
  }
}

- (void)addInternalOverlay:(id)a3 level:(int64_t)a4 provider:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  checkLevel(a4);
  [(MKOverlayContainerView *)self removeOverlay:v15];
  [(NSMutableOrderedSet *)self->_overlays[a4] addObject:v15];
  internalOverlayToProvider = self->_internalOverlayToProvider;
  if (!internalOverlayToProvider)
  {
    double v10 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
    double v11 = self->_internalOverlayToProvider;
    self->_internalOverlayToProvider = v10;

    internalOverlayToProvider = self->_internalOverlayToProvider;
  }
  [(NSMapTable *)internalOverlayToProvider setObject:v8 forKey:v15];
  [(MKOverlayContainerView *)self _mapRectWithFractionOfVisible:3.0];
  double v12 = -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v15, a4);
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
    [WeakRetained overlayContainerAddedDrawables:v14];
  }
}

- (void)addOverlays:(id)a3 level:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  checkLevel(a4);
  [(MKOverlayContainerView *)self _mapRectWithFractionOfVisible:3.0];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  double v17 = v15;
  if (!v16) {
    goto LABEL_14;
  }
  uint64_t v18 = v16;
  double v17 = 0;
  uint64_t v19 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v25 != v19) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * i);
      -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:", v21, (void)v24);
      [(NSMutableOrderedSet *)self->_overlays[a4] addObject:v21];
      double v22 = -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v21, a4, v8, v10, v12, v14);
      if (v22)
      {
        if (!v17)
        {
          double v17 = [MEMORY[0x1E4F1CA48] array];
        }
        [v17 addObject:v22];
      }
    }
    uint64_t v18 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v18);

  if (v17)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayContainerAddedDrawables:v17];

LABEL_14:
  }
}

+ (int64_t)_defaultOverlayLevel
{
  if (qword_1E9154060 != -1) {
    dispatch_once(&qword_1E9154060, &__block_literal_global_27);
  }
  return ~_MergedGlobals_13 & 1;
}

BOOL __46__MKOverlayContainerView__defaultOverlayLevel__block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(3338);
  if (result) {
    _MergedGlobals_13 = 1;
  }
  return result;
}

- (void)addOverlay:(id)a3
{
  id v4 = a3;
  -[MKOverlayContainerView addOverlay:level:](self, "addOverlay:level:", v4, [(id)objc_opt_class() _defaultOverlayLevel]);
}

- (void)addOverlays:(id)a3
{
  id v4 = a3;
  -[MKOverlayContainerView addOverlays:level:](self, "addOverlays:level:", v4, [(id)objc_opt_class() _defaultOverlayLevel]);
}

- (int64_t)_levelForOverlay:(id)a3 exists:(BOOL *)a4
{
  int64_t v6 = 0;
  overlays = self->_overlays;
  char v8 = 1;
  do
  {
    char v9 = v8;
    if ([(NSMutableOrderedSet *)overlays[v6] containsObject:a3])
    {
      *a4 = 1;
      return v6;
    }
    char v8 = 0;
    int64_t v6 = 1;
  }
  while ((v9 & 1) != 0);
  *a4 = 0;
  double v10 = objc_opt_class();

  return [v10 _defaultOverlayLevel];
}

- (void)removeOverlay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v8 = 0;
    int64_t v5 = [(MKOverlayContainerView *)self _levelForOverlay:v4 exists:&v8];
    if (v8)
    {
      int64_t v6 = v5;
      double v7 = [(NSMapTable *)self->_overlayToDrawable[v5] objectForKey:v4];
      if (v7) {
        [(MKOverlayContainerView *)self _removeDrawable:v7 forOverlay:v4 level:v6];
      }
      [(NSMutableOrderedSet *)self->_overlays[v6] removeObject:v4];
      [(NSMapTable *)self->_internalOverlayToProvider removeObjectForKey:v4];
      [(MKOverlayContainerView *)self _updateShowsAppleLogoIfNeeded];
      [(MKOverlayContainerView *)self _unFlexTerrainIfNeeded];
    }
  }
}

- (void)removeOverlays:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MKOverlayContainerView *)self removeOverlay:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)insertOverlay:(id)a3 atIndex:(unint64_t)a4 level:(int64_t)a5
{
  id v13 = a3;
  -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:");
  unint64_t v8 = [(NSMutableOrderedSet *)self->_overlays[a5] count];
  long long v9 = self->_overlays[a5];
  if (v8 <= a4) {
    [(NSMutableOrderedSet *)v9 addObject:v13];
  }
  else {
    [(NSMutableOrderedSet *)v9 insertObject:v13 atIndex:a4];
  }
  [(MKOverlayContainerView *)self _mapRectWithFractionOfVisible:3.0];
  long long v10 = -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v13, a5);
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v10];
    [WeakRetained overlayContainerAddedDrawables:v12];
  }
}

- (void)insertOverlay:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  -[MKOverlayContainerView insertOverlay:atIndex:level:](self, "insertOverlay:atIndex:level:", v6, a4, [(id)objc_opt_class() _defaultOverlayLevel]);
}

- (void)_exchangeOverlayAtIndex:(unint64_t)a3 withOverlayAtIndex:(unint64_t)a4 level:(int64_t)a5
{
  if (a3 != a4)
  {
    if (a3 <= a4) {
      unint64_t v8 = a4;
    }
    else {
      unint64_t v8 = a3;
    }
    if (a3 >= a4) {
      unint64_t v9 = a4;
    }
    else {
      unint64_t v9 = a3;
    }
    overlays = self->_overlays;
    id v14 = [(NSMutableOrderedSet *)self->_overlays[a5] objectAtIndex:v9];
    long long v11 = [(NSMutableOrderedSet *)overlays[a5] objectAtIndex:v8];
    long long v12 = [(NSMapTable *)self->_overlayToDrawable[a5] objectForKey:v14];
    id v13 = [(NSMapTable *)self->_overlayToDrawable[a5] objectForKey:v11];
    [(NSMutableOrderedSet *)overlays[a5] exchangeObjectAtIndex:v9 withObjectAtIndex:v8];
    if (v12) {
      [(MKOverlayContainerView *)self _removeDrawable:v12 forOverlay:v14 level:a5];
    }
    if (v13) {
      [(MKOverlayContainerView *)self _removeDrawable:v13 forOverlay:v11 level:a5];
    }
    if (v12) {
      [(MKOverlayContainerView *)self _insertDrawable:v12 forOverlay:v14 atIndex:[(MKOverlayContainerView *)self _drawableIndexForDrawable:v12 level:a5] level:a5];
    }
    if (v13) {
      [(MKOverlayContainerView *)self _insertDrawable:v13 forOverlay:v11 atIndex:[(MKOverlayContainerView *)self _drawableIndexForDrawable:v13 level:a5] level:a5];
    }
  }
}

- (void)exchangeOverlayAtIndex:(unint64_t)a3 withOverlayAtIndex:(unint64_t)a4
{
  uint64_t v7 = [(id)objc_opt_class() _defaultOverlayLevel];

  [(MKOverlayContainerView *)self _exchangeOverlayAtIndex:a3 withOverlayAtIndex:a4 level:v7];
}

- (void)exchangeOverlay:(id)a3 withOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v14 = 0;
  int64_t v8 = [(MKOverlayContainerView *)self _levelForOverlay:v6 exists:(char *)&v14 + 1];
  int64_t v9 = [(MKOverlayContainerView *)self _levelForOverlay:v7 exists:&v14];
  if (HIBYTE(v14)) {
    BOOL v10 = v14 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    int64_t v11 = v9;
    uint64_t v12 = [(NSMutableOrderedSet *)self->_overlays[v8] indexOfObject:v6];
    uint64_t v13 = [(NSMutableOrderedSet *)self->_overlays[v11] indexOfObject:v7];
    if (v8 == v11)
    {
      [(MKOverlayContainerView *)self _exchangeOverlayAtIndex:v12 withOverlayAtIndex:v13 level:v8];
    }
    else
    {
      [(MKOverlayContainerView *)self insertOverlay:v7 atIndex:v12 level:v8];
      [(MKOverlayContainerView *)self insertOverlay:v6 atIndex:v13 level:v11];
    }
  }
}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v9 = 0;
  int64_t v8 = [(MKOverlayContainerView *)self _levelForOverlay:v7 exists:&v9];
  if (v9) {
    [(MKOverlayContainerView *)self insertOverlay:v6 atIndex:[(NSMutableOrderedSet *)self->_overlays[v8] indexOfObject:v7] + 1 level:v8];
  }
  else {
    [(MKOverlayContainerView *)self addOverlay:v6];
  }
}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v9 = 0;
  int64_t v8 = [(MKOverlayContainerView *)self _levelForOverlay:v7 exists:&v9];
  if (v9) {
    [(MKOverlayContainerView *)self insertOverlay:v6 atIndex:[(NSMutableOrderedSet *)self->_overlays[v8] indexOfObject:v7] level:v8];
  }
  else {
    [(MKOverlayContainerView *)self addOverlay:v6];
  }
}

- (unint64_t)_overlayCount
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  overlays = self->_overlays;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = [(NSMutableOrderedSet *)overlays[v2] count];
    char v5 = 0;
    v3 += v7;
    uint64_t v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (NSArray)overlays
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MKOverlayContainerView _overlayCount](self, "_overlayCount"));
  overlays = self->_overlays;
  char v5 = [(NSMutableOrderedSet *)self->_overlays[0] array];
  [v3 addObjectsFromArray:v5];

  char v6 = [(NSMutableOrderedSet *)overlays[1] array];
  [v3 addObjectsFromArray:v6];

  return (NSArray *)v3;
}

- (id)overlaysInLevel:(int64_t)a3
{
  checkLevel(a3);
  char v5 = [(NSMutableOrderedSet *)self->_overlays[a3] array];
  char v6 = (void *)[v5 copy];

  return v6;
}

- (id)drawableForOverlay:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  int64_t v5 = [(MKOverlayContainerView *)self _levelForOverlay:v4 exists:&v8];
  if (v8)
  {
    char v6 = [(NSMapTable *)self->_overlayToDrawable[v5] objectForKey:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSArray)allDrawables
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  overlayToDrawable = self->_overlayToDrawable;
  int64_t v5 = [(NSMapTable *)self->_overlayToDrawable[0] objectEnumerator];
  char v6 = [v5 allObjects];

  uint64_t v7 = [(NSMapTable *)overlayToDrawable[1] objectEnumerator];
  char v8 = [v7 allObjects];

  if (v6) {
    [v3 addObjectsFromArray:v6];
  }
  if (v8) {
    [v3 addObjectsFromArray:v8];
  }

  return (NSArray *)v3;
}

- (void)_removeDrawable:(id)a3 forOverlay:(id)a4 level:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  vkOverlays = self->_vkOverlays;
  int64_t v11 = self->_vkOverlays[a5];
  id v12 = (id)[(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [v15 delegate];

        if (v16 == v8)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
LABEL_11:
    vkOverlays = self->_vkOverlays;
  }

  [v8 _setMapView:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v18 = objc_msgSend(WeakRetained, "vk_mapLayer");
  [v18 removeOverlay:v12];

  [v12 setDelegate:0];
  uint64_t v19 = objc_msgSend(v8, "_mk_overlayView");
  [v19 removeFromSuperview];

  [(NSMapTable *)self->_overlayToDrawable[a5] removeObjectForKey:v9];
  [(NSMutableArray *)self->_drawables[a5] removeObjectIdenticalTo:v8];
  if (v12) {
    [(NSMutableArray *)vkOverlays[a5] removeObjectIdenticalTo:v12];
  }
}

- (void)_updateContentScale:(id)a3
{
  id v16 = a3;
  id v4 = [(MKOverlayContainerView *)self window];
  int64_t v5 = [v4 screen];
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F42D90] mainScreen];
  }
  id v8 = v7;

  [v8 scale];
  double v10 = v9;
  [v8 nativeScale];
  double v12 = v11;
  uint64_t v13 = [MEMORY[0x1E4F42738] sharedApplication];
  if ([v13 _isClassic])
  {

LABEL_10:
    double v10 = fmin(v10, 2.0);
    double v15 = v10;
    goto LABEL_11;
  }
  BOOL v14 = _MKLinkedOnOrAfterReleaseSet(769);

  if (!v14) {
    goto LABEL_10;
  }
  if (_MKLinkedOnOrAfterReleaseSet(1540)) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
LABEL_11:
  [v16 setContentScaleFactor:v15 * (v15 / v10)];
}

- (void)_insertDrawable:(id)a3 forOverlay:(id)a4 atIndex:(int64_t)a5 level:(int64_t)a6
{
  id v26 = a3;
  double v10 = self->_overlayToDrawable[a6];
  id v11 = a4;
  [(NSMapTable *)v10 setObject:v26 forKey:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v13 = objc_msgSend(WeakRetained, "vk_mapLayer");

  BOOL v14 = [MEMORY[0x1E4FB3A50] overlayWithDrawable:v26 forOverlay:v11 atLevel:a6];

  double v15 = [(MKOverlayContainerView *)self mapView];
  [v26 _setMapView:v15];

  [(MKOverlayContainerView *)self _updateContentScale:v26];
  drawables = self->_drawables;
  unint64_t v17 = [(NSMutableArray *)self->_drawables[a6] count];
  uint64_t v18 = self->_drawables[a6];
  if (v17 <= a5)
  {
    [(NSMutableArray *)v18 addObject:v26];
    [(NSMutableArray *)self->_vkOverlays[a6] addObject:v14];
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [(NSMutableArray *)v18 insertObject:v26 atIndex:a5];
    [(NSMutableArray *)self->_vkOverlays[a6] insertObject:v14 atIndex:a5];
    if (a5)
    {
LABEL_3:
      uint64_t v19 = [(NSMutableArray *)drawables[a6] objectAtIndex:a5 - 1];
      goto LABEL_6;
    }
  }
  uint64_t v19 = 0;
LABEL_6:
  unint64_t v20 = a5 + 1;
  if (a5 + 1 >= (unint64_t)[(NSMutableArray *)drawables[a6] count])
  {
    long long v21 = 0;
  }
  else
  {
    long long v21 = [(NSMutableArray *)drawables[a6] objectAtIndex:a5 + 1];
  }
  if (a5)
  {
    a5 = [(NSMutableArray *)self->_vkOverlays[a6] objectAtIndex:a5 - 1];
  }
  if (v20 >= [(NSMutableArray *)self->_vkOverlays[a6] count])
  {
    long long v22 = 0;
  }
  else
  {
    long long v22 = [(NSMutableArray *)self->_vkOverlays[a6] objectAtIndex:v20];
  }
  long long v23 = objc_msgSend(v26, "_mk_overlayView");
  if (v23)
  {
    long long v24 = [(MKOverlayContainerView *)self _viewContainerForLevel:a6];
    if (v19)
    {
LABEL_16:
      uint64_t v25 = objc_msgSend(v19, "_mk_overlayView");
      if (v23) {
        [v24 insertSubview:v23 aboveSubview:v25];
      }
      [v13 insertOverlay:v14 aboveOverlay:a5];
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
    long long v24 = 0;
    if (v19) {
      goto LABEL_16;
    }
  }
  if (v21)
  {
    uint64_t v25 = objc_msgSend(v21, "_mk_overlayView");
    if (v23) {
      [v24 insertSubview:v23 belowSubview:v25];
    }
    [v13 insertOverlay:v14 belowOverlay:v22];
    goto LABEL_24;
  }
  if (v23) {
    [v24 addSubview:v23];
  }
  [v13 addOverlay:v14];
LABEL_25:
}

- (void)didMoveToWindow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MKOverlayContainerView;
  [(MKOverlayContainerView *)&v15 didMoveToWindow];
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v6 = self->_drawables[v3];
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [(MKOverlayContainerView *)self _updateContentScale:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }

    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
}

- (BOOL)supportsElevation
{
  BOOL v3 = _MKLinkedOnOrAfterReleaseSet(3338);
  if (v3)
  {
    char v4 = [(MKOverlayContainerView *)self _allOverlays];
    BOOL v5 = +[MKStandardMapConfiguration _overlaysSupportElevation:v4];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)requiresModernMap
{
  uint64_t v2 = [(MKOverlayContainerView *)self _allOverlays];
  BOOL v3 = +[MKStandardMapConfiguration _overlaysRequireModernMap:v2];

  return v3;
}

- (void)_flexTerrainIfNeeded
{
  id v2 = [(MKOverlayContainerView *)self mapView];
  [v2 _updateCartographicConfiguration];
}

- (void)_unFlexTerrainIfNeeded
{
  id v2 = [(MKOverlayContainerView *)self mapView];
  [v2 _updateCartographicConfiguration];
}

- (void)_updateShowsAppleLogoIfNeeded
{
  uint64_t v3 = [(MKOverlayContainerView *)self _overlaySpansGlobeAndReplacesMapContent] ^ 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  [WeakRetained _setShowsAppleLogo:v3];
}

- (BOOL)_overlaySpansGlobeAndReplacesMapContent
{
  uint64_t v2 = 0;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  overlays = self->_overlays;
  char v4 = 1;
  long long v5 = 0uLL;
  do
  {
    char v21 = v4;
    long long v24 = v5;
    long long v25 = v5;
    long long v22 = v5;
    long long v23 = v5;
    char v6 = overlays;
    uint64_t v7 = overlays[v2];
    uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            [v12 boundingMapRect];
            BOOL v17 = v14 == INFINITY && v13 == INFINITY;
            if (v13 <= 0.0 && !v17 && v13 + v15 >= 268435456.0)
            {
              double v18 = v14 + v16;
              BOOL v19 = v14 > 0.0 || v18 < 268435456.0;
              if (!v19 && (objc_msgSend(v12, "canReplaceMapContent", v18) & 1) != 0)
              {

                return 1;
              }
            }
          }
        }
        uint64_t v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    char v4 = 0;
    BOOL result = 0;
    uint64_t v2 = 1;
    overlays = v6;
    long long v5 = 0uLL;
  }
  while ((v21 & 1) != 0);
  return result;
}

- (id)_allOverlays
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  overlays = self->_overlays;
  long long v5 = [(NSMutableOrderedSet *)self->_overlays[0] array];
  [v3 addObjectsFromArray:v5];

  char v6 = [(NSMutableOrderedSet *)overlays[1] array];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (MKOverlayContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKOverlayContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)mapZoomScale
{
  return self->_mapZoomScale;
}

- (void)setMapZoomScale:(double)a3
{
  self->_mapZoomScale = a3;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_delegate);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_viewContainers[i], 0);
  for (uint64_t j = 1; j != -1; --j)
    objc_storeStrong((id *)&self->_vkOverlays[j], 0);
  for (uint64_t k = 1; k != -1; --k)
    objc_storeStrong((id *)&self->_drawables[k], 0);
  for (uint64_t m = 1; m != -1; --m)
    objc_storeStrong((id *)&self->_overlayToDrawable[m], 0);
  objc_storeStrong((id *)&self->_internalOverlayToProvider, 0);
  overlays = self->_overlays;
  for (uint64_t n = 1; n != -1; --n)
    objc_storeStrong((id *)&overlays[n], 0);
}

@end