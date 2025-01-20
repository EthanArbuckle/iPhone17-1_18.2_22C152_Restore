@interface MKScaleView
+ (MKScaleView)scaleViewWithMapView:(MKMapView *)mapView;
- (BOOL)useLightText;
- (BOOL)usedInternallyByMapView;
- (CGSize)intrinsicContentSize;
- (MKFeatureVisibility)scaleVisibility;
- (MKMapView)mapView;
- (MKScaleView)initWithFrame:(CGRect)a3;
- (MKScaleView)initWithMapView:(id)a3;
- (MKScaleViewAlignment)legendAlignment;
- (UIEdgeInsets)alignmentRectInsets;
- (id)_formattedStringForFloat:(double)a3;
- (id)_scaleViewFormattedStringForFloat:(double)a3;
- (id)_scaleViewFormattedStringForInteger:(int64_t)a3;
- (id)_setupOutlineView;
- (id)_setupSegmentView:(BOOL)a3;
- (unint64_t)_controlSize;
- (unint64_t)mapType;
- (void)_calculateSegments;
- (void)_localizedDistanceStringsWithMeters:(unsigned int)a3 imperial:(double)a4 useFeet:(BOOL)a5 inMetric:(BOOL)a6 displaysYardsForShortDistances:(BOOL)a7 strings:(id)a8;
- (void)_setControlSize:(unint64_t)a3;
- (void)_traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)_updateStrings;
- (void)_updateVisibility;
- (void)dealloc;
- (void)layoutSubviews;
- (void)memoryWarning:(id)a3;
- (void)setDistanceInMeters:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLegendAlignment:(MKScaleViewAlignment)legendAlignment;
- (void)setMapType:(unint64_t)a3;
- (void)setMapView:(MKMapView *)mapView;
- (void)setScaleVisibility:(MKFeatureVisibility)scaleVisibility;
- (void)setUseLightText:(BOOL)a3;
- (void)setUsedInternallyByMapView:(BOOL)a3;
- (void)updateLocale:(id)a3;
- (void)updateMetrics;
@end

@implementation MKScaleView

+ (MKScaleView)scaleViewWithMapView:(MKMapView *)mapView
{
  v4 = mapView;
  v5 = (void *)[objc_alloc((Class)a1) initWithMapView:v4];

  return (MKScaleView *)v5;
}

- (MKScaleView)initWithMapView:(id)a3
{
  id v4 = a3;
  v5 = -[MKScaleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 170.0, 20.0);
  v6 = v5;
  if (v5)
  {
    [(MKScaleView *)v5 setAlpha:0.0];
    [(MKScaleView *)v6 setHidden:1];
    v6->_isVisible = 0;
    [(MKScaleView *)v6 setMapView:v4];
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MKScaleView_intrinsicContentSize__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  if (qword_1EB315B00 != -1) {
    dispatch_once(&qword_1EB315B00, block);
  }
  unint64_t v3 = [(MKScaleView *)self _controlSize];
  id v4 = &_MergedGlobals_3_4;
  v5 = (double *)algn_1EB315AF8;
  if (v3 != 2) {
    v5 = (double *)&qword_1EB315AE8;
  }
  double v6 = *v5;
  if (v3 == 2) {
    id v4 = &qword_1EB315AF0;
  }
  double v7 = *(double *)v4;
  result.height = v6;
  result.width = v7;
  return result;
}

double __35__MKScaleView_intrinsicContentSize__block_invoke(uint64_t a1)
{
  _MergedGlobals_3_4 = 0x4065400000000000;
  qword_1EB315AE8 = 0x4034000000000000;
  BOOL v2 = _MKLinkedOnOrAfterReleaseSet(2824);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    double v4 = *(double *)(v3 + 632) + *(double *)(v3 + 632);
    *(double *)&_MergedGlobals_3_4 = *(double *)&_MergedGlobals_3_4 - v4;
    double v5 = *(double *)(v3 + 640);
    *(double *)&qword_1EB315AE8 = *(double *)&qword_1EB315AE8 - v5;
  }
  else
  {
    double v5 = *(double *)(v3 + 640);
    double v4 = *(double *)(v3 + 632) + *(double *)(v3 + 632);
  }
  double result = 212.5 - v4;
  qword_1EB315AF0 = *(void *)&result;
  *(double *)algn_1EB315AF8 = 25.0 - v5;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double legendMarginLeft = self->_legendMarginLeft;
  double legendMarginBottom = self->_legendMarginBottom;
  double v4 = 0.0;
  double v5 = legendMarginLeft;
  result.right = v5;
  result.bottom = legendMarginBottom;
  result.left = legendMarginLeft;
  result.top = v4;
  return result;
}

- (MKScaleView)initWithFrame:(CGRect)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)MKScaleView;
  uint64_t v3 = -[MKScaleView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_isVisible = 1;
    v3->_controlSize = 1;
    [(MKScaleView *)v3 updateMetrics];
    [(MKScaleView *)v4 updateLocale:0];
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v6 = MNLocaleDidChangeNotification();
    [v5 addObserver:v4 selector:sel_updateLocale_ name:v6 object:0];

    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel_memoryWarning_ name:*MEMORY[0x1E4F43670] object:0];

    *(_OWORD *)v4->_magicNumbers = xmmword_18BD1B9D0;
    v4->_magicNumbers[2] = 5.0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F428B8]) initWithWhite:0.0 alpha:0.730000019];
    borderColorRegular = v4->_borderColorRegular;
    v4->_borderColorRegular = (UIColor *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F428B8]) initWithWhite:0.0 alpha:1.0];
    borderColorSatellite = v4->_borderColorSatellite;
    v4->_borderColorSatellite = (UIColor *)v10;

    v12 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKScaleView *)v4 setBackgroundColor:v12];

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    segments = v4->_segments;
    v4->_segments = v13;

    v15 = objc_alloc_init(_MKScaleUnitsView);
    unitsView = v4->_unitsView;
    v4->_unitsView = v15;

    [(_MKScaleUnitsView *)v4->_unitsView setFontSize:v4->_fontSize];
    [(_MKScaleUnitsView *)v4->_unitsView setLegendMarginLeft:v4->_legendMarginLeft];
    [(MKScaleView *)v4 addSubview:v4->_unitsView];
    uint64_t v17 = [(MKScaleView *)v4 _setupOutlineView];
    displayedOutline = v4->_displayedOutline;
    v4->_displayedOutline = (UIView *)v17;

    [(MKScaleView *)v4 addSubview:v4->_displayedOutline];
    uint64_t v19 = [(MKScaleView *)v4 _setupOutlineView];
    displayedWhiteOutline = v4->_displayedWhiteOutline;
    v4->_displayedWhiteOutline = (UIView *)v19;

    id v21 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v22 = [v21 CGColor];
    v23 = [(UIView *)v4->_displayedWhiteOutline layer];
    [v23 setBorderColor:v22];

    [(MKScaleView *)v4 addSubview:v4->_displayedWhiteOutline];
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    formattedNumberCache = v4->_formattedNumberCache;
    v4->_formattedNumberCache = v24;

    [(MKScaleView *)v4 setUseLightText:0];
    [(MKScaleView *)v4 _updateStrings];
    v26 = [MEMORY[0x1E4F42948] currentDevice];
    v4->_grQuality = [v26 _graphicsQuality];

    v4->_layoutCounter = -1;
    v27 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    floatNumberFormatter = v4->_floatNumberFormatter;
    v4->_floatNumberFormatter = v27;

    v29 = v4->_floatNumberFormatter;
    v30 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)v29 setLocale:v30];

    [(NSNumberFormatter *)v4->_floatNumberFormatter setNumberStyle:1];
    [(NSNumberFormatter *)v4->_floatNumberFormatter setRoundingMode:6];
    [(NSNumberFormatter *)v4->_floatNumberFormatter setUsesSignificantDigits:0];
    [(NSNumberFormatter *)v4->_floatNumberFormatter setMaximumSignificantDigits:3];
    [(NSNumberFormatter *)v4->_floatNumberFormatter setMaximumFractionDigits:3];
    [(_MKScaleUnitsView *)v4->_unitsView setFloatNumberFormatter:v4->_floatNumberFormatter];
    v36[0] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v32 = (id)[(MKScaleView *)v4 registerForTraitChanges:v31 withAction:sel__traitEnvironment_didChangeTraitCollection_];

    v33 = +[MKUsageCounter sharedCounter];
    [v33 count:3];
  }
  return v4;
}

- (void)updateMetrics
{
  self->_segmentThickness = 4.0;
  self->_segmentBorderWidth = 1.0;
  self->_double legendMarginLeft = 6.0;
  self->_double legendMarginBottom = 6.0;
  self->_legendUnitsSpacing = 1.0;
  self->_fontSize = 11.0;
  self->_unitsFrameHeight = 20.0;
  if ([(MKScaleView *)self _controlSize] == 2)
  {
    self->_segmentThickness = self->_segmentThickness * 1.25;
    self->_segmentBorderWidth = self->_segmentBorderWidth * 1.25;
    self->_double legendMarginLeft = self->_legendMarginLeft * 1.25;
    self->_double legendMarginBottom = self->_legendMarginBottom * 1.25;
    self->_legendUnitsSpacing = self->_legendUnitsSpacing * 1.25;
    self->_fontSize = self->_fontSize * 1.25;
    self->_unitsFrameHeight = self->_unitsFrameHeight * 1.25;
  }
  [(_MKScaleUnitsView *)self->_unitsView setFontSize:self->_fontSize];
  double legendMarginLeft = self->_legendMarginLeft;
  unitsView = self->_unitsView;

  [(_MKScaleUnitsView *)unitsView setLegendMarginLeft:legendMarginLeft];
}

- (id)_setupOutlineView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = [v4 layer];
  [v5 setBackgroundColor:0];

  double v6 = [v4 layer];
  [v6 setBorderWidth:1.0];

  double segmentBorderWidth = self->_segmentBorderWidth;
  uint64_t v8 = [v4 layer];
  [v8 setBorderWidth:segmentBorderWidth];

  uint64_t v9 = *MEMORY[0x1E4F39EA8];
  uint64_t v10 = [v4 layer];
  [v10 setCornerCurve:v9];

  v11 = [v4 layer];
  [v11 setMaskedCorners:15];

  return v4;
}

- (void)setLegendAlignment:(MKScaleViewAlignment)legendAlignment
{
  if (self->_legendAlignment != legendAlignment)
  {
    self->_legendAlignment = legendAlignment;
    [(MKScaleView *)self setNeedsLayout];
  }
}

- (void)setMapView:(MKMapView *)mapView
{
  obj = mapView;
  WeakRetained = (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_mapView);

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_mapView);
      -[MKMapView _stopPostingScaleUpdateNotifications]((uint64_t)v6);

      double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v8 = objc_loadWeakRetained((id *)&self->_mapView);
      [v7 removeObserver:self name:0 object:v8];
    }
    id v9 = objc_storeWeak((id *)&self->_mapView, obj);

    if (obj)
    {
      uint64_t v10 = objc_loadWeakRetained((id *)&self->_mapView);
      if (v10) {
        ++v10[167];
      }

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v12 = objc_loadWeakRetained((id *)&self->_mapView);
      [v11 addObserver:self selector:sel_shouldUpdateScaleNotification_ name:@"MKMapViewShouldUpdateScaleNotification" object:v12];

      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v14 = objc_loadWeakRetained((id *)&self->_mapView);
      [v13 addObserver:self selector:sel_shouldUpdateScaleNotification_ name:0x1ED91A468 object:v14];
    }
    [(MKScaleView *)self _updateVisibility];
  }
}

- (void)setScaleVisibility:(MKFeatureVisibility)scaleVisibility
{
  if (self->_scaleVisibility != scaleVisibility)
  {
    self->_scaleVisibility = scaleVisibility;
    [(MKScaleView *)self _updateVisibility];
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  -[MKMapView _stopPostingScaleUpdateNotifications]((uint64_t)WeakRetained);

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MKScaleView;
  [(MKScaleView *)&v5 dealloc];
}

- (void)_updateVisibility
{
  id v3 = [(MKScaleView *)self mapView];
  double v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v5 = [v3 mapType];
  if (([v4 _showsNightMode] & 1) == 0 && (unint64_t)(v5 - 1) >= 4 && v5 != 107)
  {
    if (![(MKScaleView *)self useLightText]) {
      goto LABEL_8;
    }
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  if (![(MKScaleView *)self useLightText])
  {
    uint64_t v6 = 1;
LABEL_7:
    [(MKScaleView *)self setUseLightText:v6];
  }
LABEL_8:
  int64_t scaleVisibility = self->_scaleVisibility;
  if (scaleVisibility == 2
    || !scaleVisibility
    && [v4 _isZooming]
    && [v4 _shouldDisplayScaleForCurrentRegion])
  {
    [v4 bounds];
    BOOL v8 = 1;
    objc_msgSend(v4, "_distanceFromPoint:toPoint:fromView:withPrecision:", v4, 1, 1.0, 1.0, CGRectGetMaxX(v14) + -1.0, 1.0);
    -[MKScaleView setDistanceInMeters:](self, "setDistanceInMeters:");
    goto LABEL_14;
  }
LABEL_13:
  BOOL v8 = 0;
LABEL_14:
  if (self->_isVisible != v8)
  {
    self->_isVisible = v8;
    double v9 = 0.7;
    if (v8) {
      double v9 = 0.1;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__MKScaleView__updateVisibility__block_invoke;
    v12[3] = &unk_1E54B8718;
    BOOL v13 = v8;
    v12[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__MKScaleView__updateVisibility__block_invoke_2;
    v10[3] = &unk_1E54B8740;
    v10[4] = self;
    BOOL v11 = v8;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v12 options:v10 animations:v9 completion:0.0];
  }
}

uint64_t __32__MKScaleView__updateVisibility__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setHidden:0];
    LOBYTE(v2) = *(unsigned char *)(a1 + 40);
    double v3 = (double)v2;
  }
  else
  {
    double v3 = 0.0;
  }
  double v4 = *(void **)(a1 + 32);

  return [v4 setAlpha:v3];
}

uint64_t __32__MKScaleView__updateVisibility__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setHidden:*(unsigned char *)(result + 40) == 0];
  }
  return result;
}

- (void)_traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v9 = a4;
  if (![(MKScaleView *)self usedInternallyByMapView])
  {
    uint64_t v5 = [(MKScaleView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];
    uint64_t v7 = [v9 userInterfaceStyle];

    if (v6 != v7)
    {
      BOOL v8 = [(MKScaleView *)self traitCollection];
      -[MKScaleView setUseLightText:](self, "setUseLightText:", [v8 userInterfaceStyle] == 2);
    }
  }
}

- (void)_updateStrings
{
  _MKLocalizedStringFromThisBundle(@"Scale distance feet");
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  feetAbbreviation = self->_feetAbbreviation;
  self->_feetAbbreviation = v3;

  _MKLocalizedStringFromThisBundle(@"Scale distance yards");
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  yardAbbreviation = self->_yardAbbreviation;
  self->_yardAbbreviation = v5;

  _MKLocalizedStringFromThisBundle(@"Scale distance miles");
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  milesAbbreviation = self->_milesAbbreviation;
  self->_milesAbbreviation = v7;

  _MKLocalizedStringFromThisBundle(@"Scale distance meters");
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  metersAbbreviation = self->_metersAbbreviation;
  self->_metersAbbreviation = v9;

  _MKLocalizedStringFromThisBundle(@"Scale distance kilometers");
  BOOL v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  kilometersAbbreviation = self->_kilometersAbbreviation;
  self->_kilometersAbbreviation = v11;
}

- (void)updateLocale:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  id v6 = [v4 currentLocale];
  self->_useMetric = objc_msgSend(v6, "_navigation_distanceUsesMetricSystem");
  self->_useYardsForShortDistances = objc_msgSend(v6, "_navigation_useYardsForShortDistances");
  [(MKScaleView *)self _updateStrings];
  [(MKScaleView *)self memoryWarning:v5];
}

- (void)memoryWarning:(id)a3
{
  [(_MKScaleUnitsView *)self->_unitsView clearCaches:a3];
  formattedNumberCache = self->_formattedNumberCache;

  [(NSMutableDictionary *)formattedNumberCache removeAllObjects];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKScaleView;
  -[MKScaleView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MKScaleView *)self setNeedsLayout];
}

- (void)setDistanceInMeters:(double)a3
{
  if (self->_distanceInMeters != a3)
  {
    self->_distanceInMeters = a3;
    int v4 = self->_layoutCounter + 1;
    self->_layoutCounter = v4;
    if ((-1431655765 * v4 + 715827882) <= 0x55555554)
    {
      [(MKScaleView *)self setNeedsLayout];
      self->_layoutCounter = 0;
    }
  }
}

- (BOOL)useLightText
{
  return [(NSNumber *)self->_useLightText BOOLValue];
}

- (id)_setupSegmentView:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [MEMORY[0x1E4F427D8] effectWithStyle:1200];
  id v5 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v4 style:4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F43028]);
  uint64_t v7 = v6;
  if (v3)
  {
    [v6 setEffect:v5];
    BOOL v8 = [MEMORY[0x1E4F428B8] blackColor];
    id v9 = [v7 contentView];
    [v9 setBackgroundColor:v8];
  }

  return v7;
}

- (void)_setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    [(MKScaleView *)self updateMetrics];
    [(MKScaleView *)self invalidateIntrinsicContentSize];
    id v4 = [(MKScaleView *)self mapView];
    [v4 _updateScalePosition];
  }
}

- (void)setUseLightText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  useLightText = self->_useLightText;
  if (!useLightText || [(NSNumber *)useLightText BOOLValue] != a3)
  {
    id v6 = [NSNumber numberWithBool:v3];
    uint64_t v7 = self->_useLightText;
    self->_useLightText = v6;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v8 = self->_segments;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "removeFromSuperview", (void)v28);
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    [(UIVisualEffectView *)self->_blurredSegment removeFromSuperview];
    BOOL v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    segments = self->_segments;
    self->_segments = v13;

    v15 = [MEMORY[0x1E4F427D8] effectWithStyle:1200];
    v16 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v15];
    blurredSegment = self->_blurredSegment;
    self->_blurredSegment = v16;

    int v18 = 1;
    [(UIVisualEffectView *)self->_blurredSegment setHidden:1];
    [(UIVisualEffectView *)self->_blurredSegment _setCornerRadius:self->_segmentThickness * 0.5];
    [(MKScaleView *)self addSubview:self->_blurredSegment];
    uint64_t v19 = 4;
    do
    {
      v20 = -[MKScaleView _setupSegmentView:](self, "_setupSegmentView:", v18 & 1, (void)v28);
      [v20 _setGroupName:@"com.apple.MapKit.Scale.Segments"];
      [(NSMutableArray *)self->_segments addObject:v20];
      [(MKScaleView *)self addSubview:v20];
      [v20 setHidden:1];
      v18 ^= 1u;

      --v19;
    }
    while (v19);
    id v21 = [(MKScaleView *)self mapView];
    uint64_t v22 = [v21 mapType];
    if ((unint64_t)(v22 - 1) < 4
      || v22 == 107
      || (unint64_t v23 = [(MKScaleView *)self mapType], v23 - 1 < 4)
      || v23 == 107)
    {

      v24 = [(UIColor *)self->_borderColorSatellite CGColor];
      v25 = [(UIView *)self->_displayedOutline layer];
      [v25 setBorderColor:v24];
      uint64_t v26 = 0;
    }
    else
    {

      v27 = [(UIColor *)self->_borderColorRegular CGColor];
      v25 = [(UIView *)self->_displayedOutline layer];
      [v25 setBorderColor:v27];
      uint64_t v26 = 1;
    }

    [(UIView *)self->_displayedWhiteOutline setHidden:v26];
    [(MKScaleView *)self setNeedsLayout];
    [(_MKScaleUnitsView *)self->_unitsView setUseLightText:v3];
    [(_MKScaleUnitsView *)self->_unitsView setNeedsLayout];
  }
}

- (void)_calculateSegments
{
  if (self->_distanceInMeters > 0.0)
  {
    [(MKScaleView *)self bounds];
    double v4 = v3;
    id v5 = [(MKScaleView *)self mapView];
    id v6 = v5;
    if (v5)
    {
      [v5 bounds];
      double v8 = v7;
    }
    else
    {
      uint64_t v9 = [(MKScaleView *)self superview];
      [v9 bounds];
      double v8 = v10;
    }
    double v11 = self->_distanceInMeters * (v4 / v8);
    if (self->_useMetric || (double v11 = v11 * 0.000621371192, v11 >= 0.25))
    {
      uint64_t v12 = 0;
    }
    else
    {
      double v11 = v11 * 5280.0;
      uint64_t v12 = 1;
    }
    uint64_t v13 = -3;
LABEL_11:
    uint64_t v14 = 0;
    while (1)
    {
      double v15 = self->_magicNumbers[v14];
      double v16 = v15 * __exp10((double)v13);
      self->_double resultSegmentLength = v16;
      double v17 = v11 / v16;
      if (v17 >= 2.0 && v17 < 5.0) {
        break;
      }
      if (++v14 == 3)
      {
        if (++v13 != 7) {
          goto LABEL_11;
        }
        break;
      }
    }
    UIRoundToViewScale();
    self->_segmentLengthInPixels = v19;
    double resultSegmentLength = self->_resultSegmentLength;
    self->_resultSegmentLengthInMeters = resultSegmentLength;
    if (!self->_useMetric)
    {
      if (v12) {
        double resultSegmentLength = resultSegmentLength / 5280.0;
      }
      self->_resultSegmentLengthInMeters = resultSegmentLength * 1609.344;
    }
    [(_MKScaleUnitsView *)self->_unitsView setSegmentLengthInPixels:self->_segmentLengthInPixels];
    id v21 = [MEMORY[0x1E4F1CA48] array];
    [(MKScaleView *)self _localizedDistanceStringsWithMeters:self->_resultSegmentLengthInMeters imperial:v12 useFeet:self->_useMetric inMetric:self->_useYardsForShortDistances displaysYardsForShortDistances:v21 strings:self->_resultSegmentLength];
    [(_MKScaleUnitsView *)self->_unitsView setUnits:v21];
  }
}

- (void)layoutSubviews
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v81.receiver = self;
  v81.super_class = (Class)MKScaleView;
  [(MKScaleView *)&v81 layoutSubviews];
  int v3 = [(MKScaleView *)self effectiveUserInterfaceLayoutDirection] == 1;
  unsigned int v4 = self->_legendAlignment == 1;
  [(_MKScaleUnitsView *)self->_unitsView setRTL:v3 ^ v4];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v80.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v80.m33 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v80.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v80.m43 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v80.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v80.m13 = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v80.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v80.m23 = v8;
  if (v3 != v4) {
    CATransform3DMakeScale(&v80, -1.0, 1.0, 1.0);
  }
  CATransform3D v79 = v80;
  uint64_t v9 = [(MKScaleView *)self layer];
  CATransform3D v78 = v79;
  [v9 setTransform:&v78];

  CATransform3D v77 = v80;
  double v10 = [(_MKScaleUnitsView *)self->_unitsView layer];
  CATransform3D v76 = v77;
  [v10 setTransform:&v76];

  [(MKScaleView *)self _calculateSegments];
  [(MKScaleView *)self bounds];
  double v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  double unitsFrameHeight = self->_unitsFrameHeight;
  [(MKScaleView *)self bounds];
  -[_MKScaleUnitsView setFrame:](self->_unitsView, "setFrame:", v12, CGRectGetMaxY(v85)- unitsFrameHeight- self->_legendMarginBottom- self->_segmentThickness- self->_legendUnitsSpacing, v16, unitsFrameHeight);
  v86.origin.double x = v12;
  v86.origin.double y = v14;
  v86.size.double width = v16;
  v86.size.double height = v18;
  double v20 = CGRectGetMinX(v86) + self->_legendMarginLeft;
  v87.origin.double x = v12;
  v87.origin.double y = v14;
  v87.size.double width = v16;
  v87.size.double height = v18;
  double v21 = CGRectGetMaxY(v87) - self->_legendMarginBottom;
  double segmentLengthInPixels = self->_segmentLengthInPixels;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v25 = 0;
  double segmentThickness = self->_segmentThickness;
  double v27 = v20;
  while (1)
  {
    double v28 = self->_segmentThickness;
    long long v29 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v25];
    if (![(_MKScaleUnitsView *)self->_unitsView canDisplaySegment:v25]) {
      break;
    }
    objc_msgSend(v29, "setFrame:", v27, v21, segmentLengthInPixels, v28);
    if ([v29 isHidden]) {
      [v23 addObject:v29];
    }
    ++v25;
    double v27 = segmentLengthInPixels + v27;

    if (v25 == 3) {
      goto LABEL_10;
    }
  }

LABEL_10:
  -[UIVisualEffectView setFrame:](self->_blurredSegment, "setFrame:", v20, v21, segmentLengthInPixels * (double)v25, segmentThickness);
  blurredSegment = self->_blurredSegment;
  if (v25)
  {
    [v23 addObject:blurredSegment];
    if (v25 > 2) {
      goto LABEL_18;
    }
  }
  else
  {
    [v24 addObject:blurredSegment];
  }
  for (unint64_t i = v25; i != 3; ++i)
  {
    id v32 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:i];
    if (([v32 isHidden] & 1) == 0) {
      [v24 addObject:v32];
    }
  }
LABEL_18:
  v88.size.double width = v27 - v20;
  v88.size.double height = self->_segmentThickness;
  v88.origin.double x = v20;
  v88.origin.double y = v21;
  CGRect v89 = CGRectInset(v88, -self->_segmentBorderWidth, -self->_segmentBorderWidth);
  double x = v89.origin.x;
  double y = v89.origin.y;
  double width = v89.size.width;
  double height = v89.size.height;
  CGRect v90 = CGRectInset(v89, -self->_segmentBorderWidth, -self->_segmentBorderWidth);
  double v37 = v90.origin.x;
  double v38 = v90.origin.y;
  double v39 = v90.size.width;
  double v40 = v90.size.height;
  -[UIView setFrame:](self->_displayedOutline, "setFrame:", x, y, width, height);
  -[UIView setFrame:](self->_displayedWhiteOutline, "setFrame:", v37, v38, v39, v40);
  v41 = [(MKScaleView *)self mapView];
  uint64_t v42 = [v41 mapType];
  if ((unint64_t)(v42 - 1) < 4
    || v42 == 107
    || (unint64_t v46 = [(MKScaleView *)self mapType], v46 - 1 < 4)
    || v46 == 107)
  {

    [v23 addObject:self->_displayedWhiteOutline];
    v41 = [(UIView *)self->_displayedWhiteOutline layer];
    [v41 setCornerRadius:v40 * 0.5];
  }

  int64_t oldNumberOfSegments = self->_oldNumberOfSegments;
  if (!oldNumberOfSegments)
  {
    self->_int64_t oldNumberOfSegments = v25;
    int64_t oldNumberOfSegments = v25;
  }
  if (v25 != oldNumberOfSegments)
  {
    [v23 addObject:self->_displayedOutline];
    self->_int64_t oldNumberOfSegments = v25;
  }
  if (v25)
  {
    double v44 = self->_segmentThickness * 0.5;
    if (v25 == 1)
    {
      v45 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:0];
      [v45 _setCornerRadius:1 continuous:15 maskedCorners:v44];
    }
    else
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (v25 - 1 == j)
        {
          v48 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v25 - 1];
          v49 = v48;
          double v50 = v44;
          uint64_t v51 = 1;
          uint64_t v52 = 10;
        }
        else
        {
          segments = self->_segments;
          if (j)
          {
            v48 = [(NSMutableArray *)segments objectAtIndexedSubscript:j];
            v49 = v48;
            double v50 = 0.0;
            uint64_t v51 = 0;
            uint64_t v52 = 0;
          }
          else
          {
            v48 = [(NSMutableArray *)segments objectAtIndexedSubscript:0];
            v49 = v48;
            double v50 = v44;
            uint64_t v51 = 1;
            uint64_t v52 = 5;
          }
        }
        [v48 _setCornerRadius:v51 continuous:v52 maskedCorners:v50];
      }
    }
  }
  v54 = [(UIView *)self->_displayedOutline layer];
  [v54 setCornerRadius:height * 0.5];

  v55 = [(UIView *)self->_displayedWhiteOutline layer];
  [v55 setCornerRadius:v40 * 0.5];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v56 = v23;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v58; ++k)
      {
        if (*(void *)v73 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v72 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v61 setHidden:0];
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v72 objects:v83 count:16];
    }
    while (v58);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v62 = v24;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v64; ++m)
      {
        if (*(void *)v69 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v68 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v67, "setHidden:", 1, (void)v68);
        }
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v64);
  }
}

- (id)_formattedStringForFloat:(double)a3
{
  floatNumberFormatter = self->_floatNumberFormatter;
  unsigned int v4 = [NSNumber numberWithDouble:a3];
  long long v5 = [(NSNumberFormatter *)floatNumberFormatter stringFromNumber:v4];

  return v5;
}

- (id)_scaleViewFormattedStringForFloat:(double)a3
{
  long long v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  long long v6 = [(NSMutableDictionary *)self->_formattedNumberCache objectForKey:v5];
  if (!v6)
  {
    long long v6 = [(MKScaleView *)self _formattedStringForFloat:a3];
    [(NSMutableDictionary *)self->_formattedNumberCache setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (id)_scaleViewFormattedStringForInteger:(int64_t)a3
{
  long long v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  long long v6 = [(NSMutableDictionary *)self->_formattedNumberCache objectForKey:v5];
  if (!v6)
  {
    long long v6 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", a3);
    [(NSMutableDictionary *)self->_formattedNumberCache setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (void)_localizedDistanceStringsWithMeters:(unsigned int)a3 imperial:(double)a4 useFeet:(BOOL)a5 inMetric:(BOOL)a6 displaysYardsForShortDistances:(BOOL)a7 strings:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  double v14 = (double)a3;
  id v17 = a8;
  [v17 removeAllObjects];
  if (v9)
  {
    if (a3 < 0x1F5)
    {
      double v15 = [(MKScaleView *)self _scaleViewFormattedStringForInteger:a3];
      double v16 = &OBJC_IVAR___MKScaleView__metersAbbreviation;
    }
    else
    {
      double v15 = [(MKScaleView *)self _scaleViewFormattedStringForFloat:v14 / 1000.0];
      double v16 = &OBJC_IVAR___MKScaleView__kilometersAbbreviation;
    }
  }
  else if ((a4 <= 0.95 || a4 > 1.05 || a5) && (a4 < 0.1 || a5))
  {
    if (v8)
    {
      double v15 = [(MKScaleView *)self _scaleViewFormattedStringForInteger:llround(v14 * 1.0936133)];
      double v16 = &OBJC_IVAR___MKScaleView__yardAbbreviation;
    }
    else
    {
      double v15 = [(MKScaleView *)self _scaleViewFormattedStringForInteger:llround(a4)];
      double v16 = &OBJC_IVAR___MKScaleView__feetAbbreviation;
    }
  }
  else
  {
    double v15 = [(MKScaleView *)self _scaleViewFormattedStringForFloat:a4];
    double v16 = &OBJC_IVAR___MKScaleView__milesAbbreviation;
  }
  [v17 addObject:v15];

  [v17 addObject:*(Class *)((char *)&self->super.super.super.isa + *v16)];
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (MKFeatureVisibility)scaleVisibility
{
  return self->_scaleVisibility;
}

- (MKScaleViewAlignment)legendAlignment
{
  return self->_legendAlignment;
}

- (BOOL)usedInternallyByMapView
{
  return self->_usedInternallyByMapView;
}

- (void)setUsedInternallyByMapView:(BOOL)a3
{
  self->_usedInternallyByMapView = a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_useLightText, 0);
  objc_storeStrong((id *)&self->_kilometersAbbreviation, 0);
  objc_storeStrong((id *)&self->_metersAbbreviation, 0);
  objc_storeStrong((id *)&self->_milesAbbreviation, 0);
  objc_storeStrong((id *)&self->_yardAbbreviation, 0);
  objc_storeStrong((id *)&self->_feetAbbreviation, 0);
  objc_storeStrong((id *)&self->_formattedNumberCache, 0);
  objc_storeStrong((id *)&self->_displayedWhiteOutline, 0);
  objc_storeStrong((id *)&self->_displayedOutline, 0);
  objc_storeStrong((id *)&self->_unitsView, 0);
  objc_storeStrong((id *)&self->_blurredSegment, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_borderColorSatellite, 0);
  objc_storeStrong((id *)&self->_borderColorRegular, 0);

  objc_storeStrong((id *)&self->_floatNumberFormatter, 0);
}

@end