@interface NTKGladiusDialView
+ (double)longHourTickRadiusForDevice:(id)a3;
+ (double)minorHourAngleAtIndex:(int64_t)a3 device:(id)a4;
+ (double)minorMinuteAngleAtIndex:(int64_t)a3 device:(id)a4;
+ (double)outerEdgeInsetForDevice:(id)a3;
- (BOOL)showingStatus;
- (CGPoint)_hourTickPositionAtIndex:(unint64_t)a3 forStyle:(unint64_t)a4;
- (NTKGladiusColorPalette)palette;
- (NTKGladiusDialView)initWithDevice:(id)a3 style:(unint64_t)a4 palette:(id)a5;
- (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator)lightSpillCoordinator;
- (double)_hourTickLengthAtIndex:(unint64_t)a3 forStyle:(unint64_t)a4;
- (double)colorFraction;
- (id)_textLayerWithText:(id)a3 position:(CGPoint)a4;
- (id)_tickWithLength:(double)a3 width:(double)a4 position:(CGPoint)a5 angle:(double)a6;
- (unint64_t)style;
- (void)_applyPalette;
- (void)_createMajorHourLayers;
- (void)_createMinorHourLayers;
- (void)_createMinorMinuteLayers;
- (void)_updateMajorHourTickAtIndex:(unint64_t)a3 forStyle:(unint64_t)a4;
- (void)setColorFraction:(double)a3;
- (void)setLightSpillCoordinator:(id)a3;
- (void)setPalette:(id)a3;
- (void)setShowingStatus:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKGladiusDialView

- (NTKGladiusDialView)initWithDevice:(id)a3 style:(unint64_t)a4 palette:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [v9 screenBounds];
  v16.receiver = self;
  v16.super_class = (Class)NTKGladiusDialView;
  v11 = -[NTKGladiusDialView initWithFrame:](&v16, "initWithFrame:");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a3);
    v12->_style = a4;
    objc_storeStrong((id *)&v12->_palette, a5);
    uint64_t v13 = +[NSMutableArray array];
    minorHourLayers = v12->_minorHourLayers;
    v12->_minorHourLayers = (NSMutableArray *)v13;

    [(NTKGladiusDialView *)v12 _createMinorMinuteLayers];
    [(NTKGladiusDialView *)v12 _createMinorHourLayers];
    [(NTKGladiusDialView *)v12 _createMajorHourLayers];
  }

  return v12;
}

- (void)setStyle:(unint64_t)a3
{
  unint64_t style = self->_style;
  if (style != a3)
  {
    self->_unint64_t style = a3;
    [(NTKGladiusDialView *)self _createMinorHourLayers];
    if (!a3 || !style)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      if ([(NSArray *)self->_majorHourLayers count])
      {
        unint64_t v6 = 0;
        do
          [(NTKGladiusDialView *)self _updateMajorHourTickAtIndex:v6++ forStyle:a3];
        while (v6 < [(NSArray *)self->_majorHourLayers count]);
      }
      +[CATransaction commit];
    }
    [(NTKGladiusDialView *)self _applyPalette];
  }
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);

  [(NTKGladiusDialView *)self _applyPalette];
}

- (void)setColorFraction:(double)a3
{
  self->_colorFraction = a3;
  [(NTKGladiusDialView *)self _applyPalette];
}

- (void)setShowingStatus:(BOOL)a3
{
  if (self->_showingStatus != a3)
  {
    BOOL v3 = a3;
    self->_showingStatus = a3;
    if (self->_style)
    {
      id v4 = [(NSMutableArray *)self->_minorHourLayers firstObject];
      [v4 setHidden:v3];
    }
    else
    {
      [(NTKGladiusDialView *)self _updateMajorHourTickAtIndex:0 forStyle:a3];
    }
  }
}

+ (double)outerEdgeInsetForDevice:(id)a3
{
  sub_7524(a3, v4);
  return *(double *)&v4[327];
}

+ (double)longHourTickRadiusForDevice:(id)a3
{
  sub_7524(a3, v4);
  return *(double *)&v4[315];
}

- (void)setLightSpillCoordinator:(id)a3
{
  p_lightSpillCoordinator = &self->_lightSpillCoordinator;
  id v5 = a3;
  objc_storeWeak((id *)p_lightSpillCoordinator, v5);
  [v5 setMajorHourLayers:self->_majorHourLayers];
  [v5 setMinorHourLayers:self->_minorHourLayers];
  [v5 setMinorMinuteLayers:self->_minorMinuteLayers];
}

- (void)_createMinorMinuteLayers
{
  memset(v13, 0, 512);
  sub_7524(self->_device, v13);
  id v12 = +[NSMutableArray array];
  uint64_t v3 = 0;
  uint64_t v4 = 504;
  double v5 = *(double *)v13;
  do
  {
    if (-858993459 * v3 >= 0x33333334)
    {
      unint64_t v6 = -[NTKGladiusDialView _tickWithLength:width:position:angle:](self, "_tickWithLength:width:position:angle:", *((double *)&v13[91] + v3 + 1), v5, *(double *)((char *)v13 + v4), *(double *)((char *)v13 + v4 + 8), *((double *)&v13[1] + v3 + 1));
      [v12 addObject:v6];
      v7 = [(NTKGladiusDialView *)self layer];
      [v7 addSublayer:v6];
    }
    ++v3;
    v4 += 16;
  }
  while (v3 != 60);
  v8 = (NSArray *)[v12 copy];
  minorMinuteLayers = self->_minorMinuteLayers;
  self->_minorMinuteLayers = v8;

  id v10 = self->_minorMinuteLayers;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lightSpillCoordinator);
  [WeakRetained setMinorMinuteLayers:v10];
}

- (void)_createMinorHourLayers
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = self->_minorHourLayers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) removeFromSuperlayer];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_minorHourLayers removeAllObjects];
  if (self->_style)
  {
    memset(v19, 0, 512);
    sub_7524(self->_device, v19);
    uint64_t v8 = 0;
    uint64_t v9 = 504;
    double v10 = *((double *)v19 + 1);
    do
    {
      if (self->_style == 1)
      {
        v11 = -[NTKGladiusDialView _tickWithLength:width:position:angle:](self, "_tickWithLength:width:position:angle:", *((double *)&v19[91] + v8 + 1), v10, *(double *)((char *)v19 + v9), *(double *)((char *)v19 + v9 + 8), *((double *)&v19[1] + v8 + 1));
      }
      else
      {
        if (v8) {
          uint64_t v12 = v8;
        }
        else {
          uint64_t v12 = 60;
        }
        uint64_t v13 = +[NSString localizedStringWithFormat:@"%02i", v12];
        v11 = -[NTKGladiusDialView _textLayerWithText:position:](self, "_textLayerWithText:position:", v13, *(double *)((char *)v19 + v9), *(double *)((char *)v19 + v9 + 8));
      }
      [(NSMutableArray *)self->_minorHourLayers addObject:v11];
      v14 = [(NTKGladiusDialView *)self layer];
      [v14 addSublayer:v11];

      v8 += 5;
      v9 += 80;
    }
    while (v8 != 60);
    minorHourLayers = self->_minorHourLayers;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lightSpillCoordinator);
    v17 = WeakRetained;
    v18 = minorHourLayers;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lightSpillCoordinator);
    v17 = WeakRetained;
    v18 = (NSMutableArray *)&__NSArray0__struct;
  }
  [WeakRetained setMinorHourLayers:v18];
}

- (void)_createMajorHourLayers
{
  memset(v18, 0, 512);
  sub_7524(self->_device, v18);
  id v17 = +[NSMutableArray array];
  uint64_t v3 = 0;
  double v4 = *((double *)v18 + 1);
  id v5 = (double *)&v18[1] + 1;
  do
  {
    double v6 = *v5;
    v5 += 5;
    [(NTKGladiusDialView *)self _hourTickLengthAtIndex:v3 forStyle:self->_style];
    double v8 = v7;
    [(NTKGladiusDialView *)self _hourTickPositionAtIndex:v3 forStyle:self->_style];
    v11 = -[NTKGladiusDialView _tickWithLength:width:position:angle:](self, "_tickWithLength:width:position:angle:", v8, v4, v9, v10, v6);
    [v17 addObject:v11];
    uint64_t v12 = [(NTKGladiusDialView *)self layer];
    [v12 addSublayer:v11];

    ++v3;
  }
  while (v3 != 12);
  uint64_t v13 = (NSArray *)[v17 copy];
  majorHourLayers = self->_majorHourLayers;
  self->_majorHourLayers = v13;

  v15 = self->_majorHourLayers;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lightSpillCoordinator);
  [WeakRetained setMajorHourLayers:v15];
}

- (id)_tickWithLength:(double)a3 width:(double)a4 position:(CGPoint)a5 angle:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  v11 = +[CAGradientLayer layer];
  objc_msgSend(v11, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v11, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, a3, a4);
  [v11 setCornerRadius:a4 * 0.5];
  objc_msgSend(v11, "setPosition:", x, y);
  CGAffineTransformMakeRotation(&v17, a6);
  CGAffineTransform v16 = v17;
  [v11 setAffineTransform:&v16];
  v18[0] = @"backgroundColor";
  uint64_t v12 = +[NSNull null];
  v19[0] = v12;
  v18[1] = @"colors";
  uint64_t v13 = +[NSNull null];
  v19[1] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v11 setActions:v14];

  return v11;
}

- (id)_textLayerWithText:(id)a3 position:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  device = self->_device;
  id v8 = a3;
  sub_7524(device, v24);
  double v9 = +[CLKFont compactSoftFontOfSize:v25 weight:UIFontWeightRegular];
  NSAttributedStringKey v28 = NSFontAttributeName;
  v29 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 3, v10, 0, CGSizeZero.width, CGSizeZero.height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = +[CATextLayer layer];
  [v19 setFont:v9];
  [v9 pointSize];
  objc_msgSend(v19, "setFontSize:");
  [(CLKDevice *)self->_device screenScale];
  objc_msgSend(v19, "setContentsScale:");
  objc_msgSend(v19, "setBounds:", v12, v14, v16, v18);
  [v19 setString:v8];

  objc_msgSend(v19, "setPosition:", x, y);
  id v20 = +[UIColor whiteColor];
  objc_msgSend(v19, "setForegroundColor:", objc_msgSend(v20, "CGColor"));

  CFStringRef v26 = @"contentsMultiplyColor";
  long long v21 = +[NSNull null];
  v27 = v21;
  long long v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v19 setActions:v22];

  return v19;
}

- (void)_updateMajorHourTickAtIndex:(unint64_t)a3 forStyle:(unint64_t)a4
{
  if ([(NSArray *)self->_majorHourLayers count] > a3)
  {
    [(NTKGladiusDialView *)self _hourTickLengthAtIndex:a3 forStyle:a4];
    [(NTKGladiusDialView *)self _hourTickPositionAtIndex:a3 forStyle:a4];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(NSArray *)self->_majorHourLayers objectAtIndexedSubscript:a3];
    double v12 = v11;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    if (v11) {
      [v11 affineTransform];
    }
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v15[1] = v13;
    v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v12 setAffineTransform:v15];
    [v12 frame];
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v12, "setPosition:", v8, v10);
    v14[0] = v16;
    v14[1] = v17;
    v14[2] = v18;
    [v12 setAffineTransform:v14];
  }
}

- (double)_hourTickLengthAtIndex:(unint64_t)a3 forStyle:(unint64_t)a4
{
  memset(v10, 0, 512);
  sub_7524(self->_device, v10);
  double v6 = (char *)v10 + 8 * a3;
  double v7 = (double *)(v6 + 2424);
  double v8 = (double *)(v6 + 2136);
  if (!a4) {
    double v8 = v7;
  }
  return *v8;
}

- (CGPoint)_hourTickPositionAtIndex:(unint64_t)a3 forStyle:(unint64_t)a4
{
  memset(v11, 0, 512);
  sub_7524(self->_device, v11);
  double v6 = &v11[a3];
  double v7 = (double *)v6 + 279;
  double v8 = (double *)v6 + 243;
  if (!a4) {
    double v8 = v7;
  }
  double v9 = *v8;
  double v10 = v8[1];
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_applyPalette
{
  uint64_t v3 = [(NTKGladiusColorPalette *)self->_palette minuteTickDay];
  double v4 = [(NTKGladiusColorPalette *)self->_palette minuteTickNight];
  id v5 = NTKInterpolateBetweenColors();

  double v6 = [(NTKGladiusColorPalette *)self->_palette minuteTickDay];
  double v7 = [(NTKGladiusColorPalette *)self->_palette minuteTickStart];
  double v8 = NTKInterpolateBetweenColors();

  double v9 = [(NTKGladiusColorPalette *)self->_palette minuteTickDay];
  double v10 = [(NTKGladiusColorPalette *)self->_palette minuteTickEnd];
  double v11 = NTKInterpolateBetweenColors();

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v48 = self;
  double v12 = self->_minorMinuteLayers;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v61;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v61 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        objc_msgSend(v17, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
        v66[0] = [v8 CGColor];
        v66[1] = [v11 CGColor];
        long long v18 = +[NSArray arrayWithObjects:v66 count:2];
        [v17 setColors:v18];
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v14);
  }
  v46 = v8;

  v19 = [(NTKGladiusColorPalette *)v48->_palette hourTickEndDay];
  id v20 = [(NTKGladiusColorPalette *)v48->_palette hourTickEndNight];
  NTKInterpolateBetweenColors();
  id v50 = (id)objc_claimAutoreleasedReturnValue();

  long long v21 = +[UIColor clearColor];
  long long v22 = [(NTKGladiusColorPalette *)v48->_palette hourTickNight];
  NTKInterpolateBetweenColors();
  id v49 = (id)objc_claimAutoreleasedReturnValue();

  long long v23 = [(NTKGladiusColorPalette *)v48->_palette hourTickEndDay];
  v24 = [(NTKGladiusColorPalette *)v48->_palette hourTickNight];
  uint64_t v25 = NTKInterpolateBetweenColors();

  CLKInterpolateBetweenFloatsClipped();
  v47 = (void *)v25;
  NTKColorByApplyingWhiteOverlay();
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  CFStringRef v26 = v48->_minorHourLayers;
  id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v57;
    v30 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v57 != v29) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = v51;
          id v34 = v32;
          objc_msgSend(v34, "setContentsMultiplyColor:", objc_msgSend(v33, "CGColor"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v35 = v49;
          v36 = v11;
          v37 = v30;
          id v38 = v32;
          objc_msgSend(v38, "setBackgroundColor:", objc_msgSend(v35, "CGColor"));
          id v39 = v50;
          v64[0] = [v39 CGColor];
          v64[1] = [v39 CGColor];
          id v34 = +[NSArray arrayWithObjects:v64 count:2];
          [v38 setColors:v34];

          v30 = v37;
          double v11 = v36;
        }
      }
      id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v28);
  }

  v40 = +[NSMutableArray arrayWithCapacity:12];
  majorHourLayers = v48->_majorHourLayers;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_891C;
  v52[3] = &unk_20988;
  v52[4] = v48;
  id v53 = v40;
  id v54 = v49;
  id v55 = v50;
  id v42 = v50;
  id v43 = v49;
  id v44 = v40;
  [(NSArray *)majorHourLayers enumerateObjectsUsingBlock:v52];
  id WeakRetained = objc_loadWeakRetained((id *)&v48->_lightSpillCoordinator);
  [WeakRetained handleDialPaletteChangeWithHourStartColors:v44 minuteStartColor:v46 minuteEndColor:v11 hourEndColor:v42 hourTextColor:v51];
}

+ (double)minorMinuteAngleAtIndex:(int64_t)a3 device:(id)a4
{
  if (a3 >= 0) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = a3 + 3;
  }
  sub_7524(a4, v7);
  return *(double *)&v7[(a3 + (v5 >> 2) + 1) % 0x3CuLL + 3] + 1.57079633;
}

+ (double)minorHourAngleAtIndex:(int64_t)a3 device:(id)a4
{
  sub_7524(a4, v6);
  return *(double *)&v6[5 * a3 % 60 + 3] + 1.57079633;
}

- (unint64_t)style
{
  return self->_style;
}

- (NTKGladiusColorPalette)palette
{
  return self->_palette;
}

- (double)colorFraction
{
  return self->_colorFraction;
}

- (BOOL)showingStatus
{
  return self->_showingStatus;
}

- (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator)lightSpillCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lightSpillCoordinator);

  return (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lightSpillCoordinator);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_majorHourLayers, 0);
  objc_storeStrong((id *)&self->_minorHourLayers, 0);
  objc_storeStrong((id *)&self->_minorMinuteLayers, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end