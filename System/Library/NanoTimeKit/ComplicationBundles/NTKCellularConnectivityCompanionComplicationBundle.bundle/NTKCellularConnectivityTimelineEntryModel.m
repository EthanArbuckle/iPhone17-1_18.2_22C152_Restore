@interface NTKCellularConnectivityTimelineEntryModel
- (BOOL)_cutoutImageFromPlatterForComplicationFamily:(int64_t)a3;
- (BOOL)_needsPlatterForComplicationFamily:(int64_t)a3;
- (BOOL)pauseAnimations;
- (double)_imageAlphaForComplicationFamily:(int64_t)a3;
- (double)_platterAlphaForComplicationFamily:(int64_t)a3;
- (id)_cellImageSizeForComplicationFamily:(int64_t)a3;
- (id)_circularMediumTemplate;
- (id)_circularSmallTemplate;
- (id)_dotConstraintsForComplicationFamily:(int64_t)a3;
- (id)_extraLargeTemplate;
- (id)_graphicBezelTemplate;
- (id)_graphicCircularTemplate;
- (id)_graphicCornerTemplate;
- (id)_graphicExtraLargeTemplate;
- (id)_imageOverrideColorForComplicationFamily:(int64_t)a3;
- (id)_imageProviderForComplicationFamily:(int64_t)a3;
- (id)_modularSmallTemplate;
- (id)_platterOverrideColorForComplicationFamily:(int64_t)a3;
- (id)_tritiumPlatterColorForComplicationFamily:(int64_t)a3;
- (id)_utilitarianSmallTemplate;
- (id)templateForComplicationFamily:(int64_t)a3;
- (unint64_t)cellularConnectivityState;
- (void)setCellularConnectivityState:(unint64_t)a3;
- (void)setPauseAnimations:(BOOL)a3;
@end

@implementation NTKCellularConnectivityTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  v5 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _modularSmallTemplate];
      goto LABEL_10;
    case 2:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _utilitarianSmallTemplate];
      goto LABEL_10;
    case 4:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _circularSmallTemplate];
      goto LABEL_10;
    case 7:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _extraLargeTemplate];
      goto LABEL_10;
    case 8:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _graphicCornerTemplate];
      goto LABEL_10;
    case 9:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _graphicBezelTemplate];
      goto LABEL_10;
    case 10:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _graphicCircularTemplate];
      goto LABEL_10;
    case 12:
      uint64_t v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _graphicExtraLargeTemplate];
LABEL_10:
      v5 = (void *)v6;
      break;
    default:
      break;
  }
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    uint64_t v7 = [(NTKCellularConnectivityTimelineEntryModel *)self _circularMediumTemplate];

    v5 = (void *)v7;
  }
  if (self->_cellularConnectivityState > 2 || a3 != 7 && a3)
  {
    uint64_t v8 = +[UIColor systemGreenColor];
  }
  else
  {
    uint64_t v8 = +[UIColor whiteColor];
  }
  v9 = (void *)v8;
  [v5 setTintColor:v8];

  return v5;
}

- (BOOL)_needsPlatterForComplicationFamily:(int64_t)a3
{
  LOBYTE(v3) = 1;
  if (a3 != 2 && a3 != 4)
  {
    if (CLKComplicationFamilyCircularMedium == a3)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      unint64_t cellularConnectivityState = self->_cellularConnectivityState;
      LOBYTE(v3) = cellularConnectivityState < 3;
      if ((unint64_t)(a3 - 8) <= 4) {
        unsigned int v3 = (0x17u >> (a3 - 8)) | (cellularConnectivityState < 3);
      }
    }
  }
  return v3 & 1;
}

- (BOOL)_cutoutImageFromPlatterForComplicationFamily:(int64_t)a3
{
  return NTKIsRichComplicationFamily() && self->_cellularConnectivityState == 2;
}

- (double)_platterAlphaForComplicationFamily:(int64_t)a3
{
  int v5 = NTKIsRichComplicationFamily();
  unint64_t cellularConnectivityState = self->_cellularConnectivityState;
  if (v5)
  {
    double result = 0.0;
    if (cellularConnectivityState == 2) {
      return 1.0;
    }
  }
  else if (cellularConnectivityState > 1)
  {
    double result = 1.0;
    if (cellularConnectivityState != 2)
    {
      double result = 0.119999997;
      if (a3 != 4 && CLKComplicationFamilyCircularMedium != a3)
      {
        double result = 1.0;
        if ((unint64_t)(a3 - 8) <= 4) {
          return dbl_63D0[a3 - 8];
        }
      }
    }
  }
  else
  {
    double result = 0.119999997;
    if (a3 != 4 && CLKComplicationFamilyCircularMedium != a3)
    {
      if (a3) {
        BOOL v8 = a3 == 7;
      }
      else {
        BOOL v8 = 1;
      }
      double result = 0.119999997;
      if (!v8) {
        return 1.0;
      }
    }
  }
  return result;
}

- (id)_platterOverrideColorForComplicationFamily:(int64_t)a3
{
  int v5 = 0;
  if ((unint64_t)a3 <= 0xC && ((1 << a3) & 0x1704) != 0)
  {
    unint64_t cellularConnectivityState = self->_cellularConnectivityState;
    if (cellularConnectivityState >= 2)
    {
      if (cellularConnectivityState != 2)
      {
        int v5 = 0;
        goto LABEL_9;
      }
      double v7 = 0.800000012;
    }
    else
    {
      double v7 = 0.100000001;
    }
    int v5 = +[UIColor colorWithWhite:v7 alpha:1.0];
  }
LABEL_9:
  if ((unint64_t)(a3 - 8) < 3 || a3 == 12)
  {
    if (self->_cellularConnectivityState < 3) {
      goto LABEL_17;
    }
    uint64_t v8 = +[UIColor systemGreenColor];
    goto LABEL_16;
  }
  if (a3 == 2 && self->_cellularConnectivityState >= 3)
  {
    uint64_t v8 = +[UIColor colorWithWhite:0.100000001 alpha:1.0];
LABEL_16:
    v9 = (void *)v8;

    int v5 = v9;
  }
LABEL_17:

  return v5;
}

- (id)_tritiumPlatterColorForComplicationFamily:(int64_t)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 0.100000001, 1.0);
}

- (double)_imageAlphaForComplicationFamily:(int64_t)a3
{
  if (CLKComplicationFamilyCircularMedium == a3
    || (double result = 1.0, (unint64_t)a3 <= 7) && ((1 << a3) & 0x91) != 0)
  {
    double result = 0.400000006;
    if (self->_cellularConnectivityState >= 2) {
      return 1.0;
    }
  }
  return result;
}

- (id)_imageOverrideColorForComplicationFamily:(int64_t)a3
{
  unint64_t cellularConnectivityState = self->_cellularConnectivityState;
  if (cellularConnectivityState > 1)
  {
    if (cellularConnectivityState == 3)
    {
      if (a3 != 4 && a3 != 2)
      {
        double v5 = 0.5;
        goto LABEL_5;
      }
      v4 = +[UIColor whiteColor];
    }
    else if (cellularConnectivityState == 2)
    {
      v4 = +[UIColor blackColor];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    if ((unint64_t)a3 <= 0xC && ((1 << a3) & 0x1704) != 0)
    {
      double v5 = 0.400000006;
LABEL_5:
      v4 = +[UIColor colorWithWhite:v5 alpha:1.0];
    }
  }

  return v4;
}

- (id)_cellImageSizeForComplicationFamily:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_D950);
  id WeakRetained = objc_loadWeakRetained(&qword_D958);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = +[CLKDevice currentDevice];
    id v7 = objc_loadWeakRetained(&qword_D958);
    if (v6 == v7)
    {
      uint64_t v8 = +[CLKDevice currentDevice];
      id v9 = [v8 version];
      uint64_t v10 = qword_D960;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v11 = +[CLKDevice currentDevice];
  objc_storeWeak(&qword_D958, v11);

  id v12 = objc_loadWeakRetained(&qword_D958);
  qword_D960 = (uint64_t)[v12 version];

  v13 = +[CLKDevice currentDevice];
  sub_1A44((uint64_t)v13, v13);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_D950);
  v14 = (void *)qword_D948;
  v15 = +[NSNumber numberWithInteger:a3];
  v16 = [v14 objectForKey:v15];

  return v16;
}

- (id)_dotConstraintsForComplicationFamily:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_D970);
  id WeakRetained = objc_loadWeakRetained(&qword_D978);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = +[CLKDevice currentDevice];
    id v7 = objc_loadWeakRetained(&qword_D978);
    if (v6 == v7)
    {
      uint64_t v8 = +[CLKDevice currentDevice];
      id v9 = [v8 version];
      uint64_t v10 = qword_D980;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v11 = +[CLKDevice currentDevice];
  objc_storeWeak(&qword_D978, v11);

  id v12 = objc_loadWeakRetained(&qword_D978);
  qword_D980 = (uint64_t)[v12 version];

  v13 = +[CLKDevice currentDevice];
  sub_1E40((uint64_t)v13, v13);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_D970);
  v14 = (void *)qword_D968;
  id v15 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:a3];
  v16 = [v14 objectForKey:v15];

  if (v16)
  {
    id v17 = [v16 copy];
  }
  else
  {
    id v17 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);
  }

  return v17;
}

- (id)_imageProviderForComplicationFamily:(int64_t)a3
{
  double v5 = objc_alloc_init(NTKCellularConnectivityImageProvider);
  [(NTKCellularConnectivityImageProvider *)v5 setNeedsPlatter:[(NTKCellularConnectivityTimelineEntryModel *)self _needsPlatterForComplicationFamily:a3]];
  [(NTKCellularConnectivityTimelineEntryModel *)self _platterAlphaForComplicationFamily:a3];
  -[NTKCellularConnectivityImageProvider setPlatterAlpha:](v5, "setPlatterAlpha:");
  [(NTKCellularConnectivityImageProvider *)v5 setCutoutImageFromPlatter:[(NTKCellularConnectivityTimelineEntryModel *)self _cutoutImageFromPlatterForComplicationFamily:a3]];
  id v6 = [(NTKCellularConnectivityTimelineEntryModel *)self _platterOverrideColorForComplicationFamily:a3];
  [(NTKCellularConnectivityImageProvider *)v5 setPlatterOverrideColor:v6];

  id v7 = [(NTKCellularConnectivityTimelineEntryModel *)self _tritiumPlatterColorForComplicationFamily:a3];
  [(NTKCellularConnectivityImageProvider *)v5 setTritiumPlatterColor:v7];

  [(NTKCellularConnectivityImageProvider *)v5 setShowsAsDots:self->_cellularConnectivityState > 2];
  [(NTKCellularConnectivityImageProvider *)v5 setDisconnected:self->_cellularConnectivityState < 5];
  uint64_t v8 = [(NTKCellularConnectivityTimelineEntryModel *)self _cellImageSizeForComplicationFamily:a3];
  [(NTKCellularConnectivityImageProvider *)v5 setImageSize:v8];

  [(NTKCellularConnectivityImageProvider *)v5 setImageVerticalOffsetScaleFromWidth:&off_8678];
  [(NTKCellularConnectivityTimelineEntryModel *)self _imageAlphaForComplicationFamily:a3];
  -[NTKCellularConnectivityImageProvider setImageAlpha:](v5, "setImageAlpha:");
  id v9 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageOverrideColorForComplicationFamily:a3];
  [(NTKCellularConnectivityImageProvider *)v5 setImageOverrideColor:v9];

  uint64_t v10 = [(NTKCellularConnectivityTimelineEntryModel *)self _dotConstraintsForComplicationFamily:a3];
  [(NTKCellularConnectivityImageProvider *)v5 setDotLayoutConstraints:v10];

  id v11 = objc_alloc_init((Class)NTKExplorerDotColorOptions);
  if (a3 == 4 || a3 == 2)
  {
    uint64_t v12 = +[UIColor whiteColor];
  }
  else
  {
    uint64_t v12 = +[UIColor colorWithWhite:0.5 alpha:1.0];
  }
  v13 = (void *)v12;
  [v11 setNoServiceDotColor:v12];

  [(NTKCellularConnectivityImageProvider *)v5 setDotColorOptions:v11];
  unint64_t cellularConnectivityState = self->_cellularConnectivityState;
  if (cellularConnectivityState <= 4) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = cellularConnectivityState - 5;
  }
  [(NTKCellularConnectivityImageProvider *)v5 setNumDotsFilled:v15];
  BOOL v16 = self->_cellularConnectivityState == 3 && !self->_pauseAnimations;
  [(NTKCellularConnectivityImageProvider *)v5 setAnimateSearchingState:v16];

  return v5;
}

- (id)_modularSmallTemplate
{
  v2 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:0];
  unsigned int v3 = +[CLKComplicationTemplateModularSmallSimpleImage templateWithImageProvider:v2];

  return v3;
}

- (id)_utilitarianSmallTemplate
{
  v2 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:2];
  unsigned int v3 = +[CLKComplicationTemplateUtilitarianSmallSquare templateWithImageProvider:v2];

  return v3;
}

- (id)_circularSmallTemplate
{
  v2 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:4];
  unsigned int v3 = +[CLKComplicationTemplateCircularSmallCircularImage templateWithImageProvider:v2];

  return v3;
}

- (id)_extraLargeTemplate
{
  v2 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:7];
  unsigned int v3 = +[CLKComplicationTemplateExtraLargeSimpleImage templateWithImageProvider:v2];

  return v3;
}

- (id)_circularMediumTemplate
{
  v2 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:CLKComplicationFamilyCircularMedium];
  unsigned int v3 = +[CLKComplicationTemplateCircularMediumCircularImage templateWithImageProvider:v2];

  return v3;
}

- (id)_graphicCornerTemplate
{
  unsigned int v3 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v11 = @"NTKCellularConnectivityImageProviderMetadataKey";
  v4 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:8];
  uint64_t v12 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v3 setMetadata:v5];

  id v6 = +[CLKComplicationTemplateGraphicCornerCircularImage templateWithImageProvider:v3];
  uint64_t v9 = NTKRichComplicationViewUsePlatterKey;
  uint64_t v10 = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v6 setMetadata:v7];

  return v6;
}

- (id)_graphicCircularTemplate
{
  unsigned int v3 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v11 = @"NTKCellularConnectivityImageProviderMetadataKey";
  v4 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:10];
  uint64_t v12 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v3 setMetadata:v5];

  id v6 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v3];
  uint64_t v9 = NTKRichComplicationViewUsePlatterKey;
  uint64_t v10 = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v6 setMetadata:v7];

  return v6;
}

- (id)_graphicExtraLargeTemplate
{
  unsigned int v3 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v11 = @"NTKCellularConnectivityImageProviderMetadataKey";
  v4 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:12];
  uint64_t v12 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v3 setMetadata:v5];

  id v6 = +[CLKComplicationTemplateGraphicExtraLargeCircularImage templateWithImageProvider:v3];
  uint64_t v9 = NTKRichComplicationViewUsePlatterKey;
  uint64_t v10 = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v6 setMetadata:v7];

  return v6;
}

- (id)_graphicBezelTemplate
{
  unsigned int v3 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v12 = @"NTKCellularConnectivityImageProviderMetadataKey";
  v4 = [(NTKCellularConnectivityTimelineEntryModel *)self _imageProviderForComplicationFamily:10];
  v13 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v3 setMetadata:v5];

  id v6 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v3];
  id v7 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v6];
  uint64_t v10 = NTKRichComplicationViewUsePlatterKey;
  CFStringRef v11 = &__kCFBooleanTrue;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 setMetadata:v8];

  return v7;
}

- (unint64_t)cellularConnectivityState
{
  return self->_cellularConnectivityState;
}

- (void)setCellularConnectivityState:(unint64_t)a3
{
  self->_unint64_t cellularConnectivityState = a3;
}

- (BOOL)pauseAnimations
{
  return self->_pauseAnimations;
}

- (void)setPauseAnimations:(BOOL)a3
{
  self->_pauseAnimations = a3;
}

@end