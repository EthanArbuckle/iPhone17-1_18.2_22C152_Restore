@interface NTKChronoDialView
+ (id)cacheIdentifierForClockSubdial:(BOOL)a3 device:(unint64_t)a4 component:(int)a5;
+ (id)cacheIdentifierForTimescale:(unint64_t)a3 subdial:(BOOL)a4 device:(unint64_t)a5 component:(int)a6;
+ (id)createClockDialViewForDevice:(id)a3;
+ (id)createClockSubdialViewForDevice:(id)a3;
+ (id)createDialViewForTimescale:(unint64_t)a3 device:(id)a4;
+ (id)createSubdialViewForTimescale:(unint64_t)a3 device:(id)a4;
+ (id)sharedCache;
- (BOOL)subdial;
- (CGRect)_boundsForText:(id)a3 font:(id)a4;
- (CLKDevice)device;
- (NTKChronoDialView)initWithTimescale:(unint64_t)a3 device:(id)a4;
- (UIColor)majorTickColor;
- (UIColor)minorTickColor;
- (UIColor)textColor;
- (UILabel)timeLabel;
- (id)cacheIdentifierForClockComponent:(int)a3;
- (id)cacheIdentifierForComponent:(int)a3;
- (id)initClockSubdialWithDevice:(id)a3;
- (id)initClockWithDevice:(id)a3;
- (id)initSubdialWithTimescale:(unint64_t)a3 device:(id)a4;
- (unint64_t)timescale;
- (void)applyPalette:(id)a3;
- (void)create30SecondsSubdialText;
- (void)create30SecondsText;
- (void)create3SecondsSubdialText;
- (void)create3SecondsText;
- (void)create60SecondsSubdialText;
- (void)create60SecondsText;
- (void)create6SecondsSubdialText;
- (void)create6SecondsText;
- (void)createClockSubdialText;
- (void)createClockText;
- (void)createSubdialText;
- (void)createText;
- (void)createTicks;
- (void)createTimescaleLabel;
- (void)setMajorTickColor:(id)a3;
- (void)setMinorTickColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation NTKChronoDialView

+ (id)createDialViewForTimescale:(unint64_t)a3 device:(id)a4
{
  id v5 = a4;
  v6 = [[NTKChronoDialView alloc] initWithTimescale:a3 device:v5];

  return v6;
}

+ (id)createSubdialViewForTimescale:(unint64_t)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = [[NTKChronoDialView alloc] initSubdialWithTimescale:a3 device:v5];

  return v6;
}

+ (id)createClockDialViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKChronoDialView alloc] initClockWithDevice:v3];

  return v4;
}

+ (id)createClockSubdialViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKChronoDialView alloc] initClockSubdialWithDevice:v3];

  return v4;
}

+ (id)sharedCache
{
  if (qword_23968 != -1) {
    dispatch_once(&qword_23968, &stru_1C6E8);
  }
  v2 = (void *)qword_23960;

  return v2;
}

+ (id)cacheIdentifierForTimescale:(unint64_t)a3 subdial:(BOOL)a4 device:(unint64_t)a5 component:(int)a6
{
  return +[NSString stringWithFormat:@"timescale-%i-%i-%i-%i", a3, a4, a5, *(void *)&a6];
}

+ (id)cacheIdentifierForClockSubdial:(BOOL)a3 device:(unint64_t)a4 component:(int)a5
{
  return +[NSString stringWithFormat:@"clock-%i-%i-%i", a3, a4, *(void *)&a5];
}

- (id)cacheIdentifierForComponent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_opt_class();
  unint64_t v6 = [(NTKChronoDialView *)self timescale];
  BOOL v7 = [(NTKChronoDialView *)self subdial];
  v8 = [(NTKChronoDialView *)self device];
  v9 = objc_msgSend(v5, "cacheIdentifierForTimescale:subdial:device:component:", v6, v7, objc_msgSend(v8, "sizeClass"), v3);

  return v9;
}

- (id)cacheIdentifierForClockComponent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_opt_class();
  BOOL v6 = [(NTKChronoDialView *)self subdial];
  BOOL v7 = [(NTKChronoDialView *)self device];
  v8 = objc_msgSend(v5, "cacheIdentifierForClockSubdial:device:component:", v6, objc_msgSend(v7, "sizeClass"), v3);

  return v8;
}

- (NTKChronoDialView)initWithTimescale:(unint64_t)a3 device:(id)a4
{
  id v7 = a4;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_5ADC(v7, (uint64_t)v14);
  v8 = +[NSString stringWithFormat:@"dial-%i", a3];
  double v9 = *(double *)v14;
  v10 = +[NTKChronoDialView sharedCache];
  v13.receiver = self;
  v13.super_class = (Class)NTKChronoDialView;
  v11 = [(NTKChronoDialView *)&v13 initWithDialDiameter:v7 device:v10 cache:v8 key:v9];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v11->_timescale = a3;
    v11->_subdial = 0;
    [(NTKChronoDialView *)v11 createTicks];
    [(NTKChronoDialView *)v11 createText];
    [(NTKChronoDialView *)v11 createTimescaleLabel];
  }

  return v11;
}

- (id)initSubdialWithTimescale:(unint64_t)a3 device:(id)a4
{
  id v7 = a4;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_5ADC(v7, (uint64_t)v14);
  v8 = +[NSString stringWithFormat:@"subdial-%i", a3];
  double v9 = *((double *)v14 + 1);
  v10 = +[NTKChronoDialView sharedCache];
  v13.receiver = self;
  v13.super_class = (Class)NTKChronoDialView;
  v11 = [(NTKChronoDialView *)&v13 initWithDialDiameter:v7 device:v10 cache:v8 key:v9];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v11->_timescale = a3;
    v11->_subdial = 1;
    [(NTKChronoDialView *)v11 createTicks];
    [(NTKChronoDialView *)v11 createSubdialText];
  }

  return v11;
}

- (id)initClockWithDevice:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_5ADC(v5, (uint64_t)v11);
  double v6 = *(double *)v11;
  id v7 = +[NTKChronoDialView sharedCache];
  v10.receiver = self;
  v10.super_class = (Class)NTKChronoDialView;
  v8 = [(NTKChronoDialView *)&v10 initWithDialDiameter:v5 device:v7 cache:@"clock" key:v6];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v8->_timescale = 0;
    v8->_subdial = 0;
    [(NTKChronoDialView *)v8 createTicks];
    [(NTKChronoDialView *)v8 createClockText];
  }

  return v8;
}

- (id)initClockSubdialWithDevice:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_5ADC(v5, (uint64_t)v11);
  double v6 = *((double *)v11 + 1);
  id v7 = +[NTKChronoDialView sharedCache];
  v10.receiver = self;
  v10.super_class = (Class)NTKChronoDialView;
  v8 = [(NTKChronoDialView *)&v10 initWithDialDiameter:v5 device:v7 cache:@"subclock" key:v6];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v8->_timescale = 3;
    v8->_subdial = 1;
    [(NTKChronoDialView *)v8 createTicks];
    [(NTKChronoDialView *)v8 createClockSubdialText];
  }

  return v8;
}

- (void)createTicks
{
  uint64_t v44 = 0;
  memset(v43, 0, sizeof(v43));
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)v43);

  unsigned int v4 = [(NTKChronoDialView *)self subdial];
  uint64_t v5 = 88;
  if (v4) {
    uint64_t v5 = 136;
  }
  long long v42 = *(_OWORD *)((char *)v43 + v5);
  unsigned int v6 = [(NTKChronoDialView *)self subdial];
  uint64_t v7 = 104;
  if (v6) {
    uint64_t v7 = 152;
  }
  long long v41 = *(_OWORD *)((char *)v43 + v7);
  unsigned int v8 = [(NTKChronoDialView *)self subdial];
  uint64_t v9 = 120;
  if (v8) {
    uint64_t v9 = 168;
  }
  long long v40 = *(_OWORD *)((char *)v43 + v9);
  unsigned __int8 v10 = [(NTKChronoDialView *)self subdial];
  unint64_t v11 = [(NTKChronoDialView *)self timescale];
  if (v10)
  {
    switch(v11)
    {
      case 0uLL:
        long long v31 = v42;
        uint64_t v12 = +[NSValue valueWithBytes:&v31 objCType:"{CGSize=dd}"];
        v48[0] = v12;
        long long v30 = v41;
        objc_super v13 = +[NSValue valueWithBytes:&v30 objCType:"{CGSize=dd}"];
        v48[1] = v13;
        long long v29 = v40;
        v14 = +[NSValue valueWithBytes:&v29 objCType:"{CGSize=dd}"];
        v48[2] = v14;
        uint64_t v15 = +[NSArray arrayWithObjects:v48 count:3];
        v16 = &off_1DF78;
        goto LABEL_16;
      case 1uLL:
        long long v28 = v42;
        uint64_t v12 = +[NSValue valueWithBytes:&v28 objCType:"{CGSize=dd}"];
        v47[0] = v12;
        long long v27 = v41;
        objc_super v13 = +[NSValue valueWithBytes:&v27 objCType:"{CGSize=dd}"];
        v47[1] = v13;
        long long v26 = v40;
        v14 = +[NSValue valueWithBytes:&v26 objCType:"{CGSize=dd}"];
        v47[2] = v14;
        uint64_t v15 = +[NSArray arrayWithObjects:v47 count:3];
        v16 = &off_1DF90;
LABEL_16:
        v17 = self;
        uint64_t v18 = 60;
        goto LABEL_22;
      case 2uLL:
        long long v25 = v42;
        uint64_t v12 = +[NSValue valueWithBytes:&v25 objCType:"{CGSize=dd}"];
        v46[0] = v12;
        long long v24 = v40;
        objc_super v13 = +[NSValue valueWithBytes:&v24 objCType:"{CGSize=dd}"];
        v46[1] = v13;
        v14 = +[NSArray arrayWithObjects:v46 count:2];
        v19 = &off_1DFA8;
        goto LABEL_19;
      case 3uLL:
        long long v23 = v42;
        uint64_t v12 = +[NSValue valueWithBytes:&v23 objCType:"{CGSize=dd}"];
        v45[0] = v12;
        long long v22 = v40;
        objc_super v13 = +[NSValue valueWithBytes:&v22 objCType:"{CGSize=dd}"];
        v45[1] = v13;
        v14 = +[NSArray arrayWithObjects:v45 count:2];
        v19 = &off_1DFC0;
LABEL_19:
        v20 = self;
        uint64_t v21 = 60;
        goto LABEL_20;
      default:
        return;
    }
  }
  if (v11 - 2 < 2)
  {
    long long v33 = v42;
    uint64_t v12 = +[NSValue valueWithBytes:&v33 objCType:"{CGSize=dd}"];
    v49[0] = v12;
    long long v32 = v40;
    objc_super v13 = +[NSValue valueWithBytes:&v32 objCType:"{CGSize=dd}"];
    v49[1] = v13;
    v14 = +[NSArray arrayWithObjects:v49 count:2];
    v19 = &off_1DF60;
    v20 = self;
    uint64_t v21 = 300;
LABEL_20:
    [(NTKChronoDialView *)v20 addTicksWithCount:v21 moduloGroups:v19 sizes:v14 roundedCorners:0];
  }
  else
  {
    if (v11 == 1)
    {
      long long v36 = v42;
      uint64_t v12 = +[NSValue valueWithBytes:&v36 objCType:"{CGSize=dd}"];
      v50[0] = v12;
      long long v35 = v41;
      objc_super v13 = +[NSValue valueWithBytes:&v35 objCType:"{CGSize=dd}"];
      v50[1] = v13;
      long long v34 = v40;
      v14 = +[NSValue valueWithBytes:&v34 objCType:"{CGSize=dd}"];
      v50[2] = v14;
      uint64_t v15 = +[NSArray arrayWithObjects:v50 count:3];
      v16 = &off_1DF48;
      v17 = self;
      uint64_t v18 = 120;
    }
    else
    {
      if (v11) {
        return;
      }
      long long v39 = v42;
      uint64_t v12 = +[NSValue valueWithBytes:&v39 objCType:"{CGSize=dd}"];
      v51[0] = v12;
      long long v38 = v41;
      objc_super v13 = +[NSValue valueWithBytes:&v38 objCType:"{CGSize=dd}"];
      v51[1] = v13;
      long long v37 = v40;
      v14 = +[NSValue valueWithBytes:&v37 objCType:"{CGSize=dd}"];
      v51[2] = v14;
      uint64_t v15 = +[NSArray arrayWithObjects:v51 count:3];
      v16 = &off_1DF30;
      v17 = self;
      uint64_t v18 = 240;
    }
LABEL_22:
    [(NTKChronoDialView *)v17 addTicksWithCount:v18 moduloGroups:v16 sizes:v15 roundedCorners:0];
  }
}

- (void)createTimescaleLabel
{
  unint64_t timescale = self->_timescale;
  if (timescale > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_16A20[timescale];
  }
  id v19 = +[NTKChronographFaceBundle localizedStringForKey:@"CHRONO_SECONDS_CAPS" table:@"Formats" comment:@"n-SECOND"];
  uint64_t v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v4);
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  memset(v20, 0, sizeof(v20));
  unsigned int v6 = [(NTKChronoDialView *)self device];
  sub_5ADC(v6, (uint64_t)v20);

  uint64_t v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  timeLabel = self->_timeLabel;
  self->_timeLabel = v7;

  [(UILabel *)self->_timeLabel setText:v5];
  uint64_t v9 = +[CLKFont systemFontOfSize:weight:](CLKFont, "systemFontOfSize:weight:", v21);
  [(UILabel *)self->_timeLabel setFont:v9];

  unsigned __int8 v10 = +[UIColor systemTealColor];
  [(UILabel *)self->_timeLabel setTextColor:v10];

  [(UILabel *)self->_timeLabel sizeToFit];
  [(NTKChronoDialView *)self bounds];
  double v12 = v11 * 0.5 - *(double *)&v22;
  [(NTKChronoDialView *)self bounds];
  double v14 = v13 * 0.5;
  [(UILabel *)self->_timeLabel bounds];
  double v16 = v14 - v15 * 0.5;
  [(UILabel *)self->_timeLabel bounds];
  double v18 = v17;
  [(UILabel *)self->_timeLabel bounds];
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", v12, v16, v18);
  [(NTKChronoDialView *)self addSubview:self->_timeLabel];
}

- (void)setMajorTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_majorTickColor, a3);
  id v5 = a3;
  [(NTKChronoDialView *)self applyTickColor:v5 toGroupIndex:0];
}

- (void)setMinorTickColor:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_minorTickColor, a3);
  id v5 = [(NTKChronoDialView *)self timeLabel];
  [v5 setTextColor:v11];

  unsigned int v6 = [(NTKChronoDialView *)self tickGroups];
  id v7 = [v6 count];

  if ((unint64_t)v7 >= 2)
  {
    unint64_t v8 = 1;
    do
    {
      [(NTKChronoDialView *)self applyTickColor:v11 toGroupIndex:v8++];
      uint64_t v9 = [(NTKChronoDialView *)self tickGroups];
      id v10 = [v9 count];
    }
    while (v8 < (unint64_t)v10);
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_textColor, a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_691C;
  v7[3] = &unk_1C710;
  id v8 = v5;
  id v6 = v5;
  [(NTKChronoDialView *)self enumerateTextLayersWithBlock:v7];
}

- (void)applyPalette:(id)a3
{
  id v4 = a3;
  id v5 = [v4 alternativeTickColor];
  [v4 largeTickValue];
  id v6 = NTKColorByPremultiplyingAlpha();
  [(NTKChronoDialView *)self setMajorTickColor:v6];

  id v7 = [v4 tickColor];
  [v4 smallTickValue];
  id v8 = NTKColorByPremultiplyingAlpha();
  [(NTKChronoDialView *)self setMinorTickColor:v8];

  id v9 = [v4 labelColor];

  [(NTKChronoDialView *)self setTextColor:v9];
}

- (void)createText
{
  switch([(NTKChronoDialView *)self timescale])
  {
    case 0uLL:
      [(NTKChronoDialView *)self create60SecondsText];
      break;
    case 1uLL:
      [(NTKChronoDialView *)self create30SecondsText];
      break;
    case 2uLL:
      [(NTKChronoDialView *)self create6SecondsText];
      break;
    case 3uLL:
      [(NTKChronoDialView *)self create3SecondsText];
      break;
    default:
      return;
  }
}

- (void)createSubdialText
{
  switch([(NTKChronoDialView *)self timescale])
  {
    case 0uLL:
      [(NTKChronoDialView *)self create60SecondsSubdialText];
      break;
    case 1uLL:
      [(NTKChronoDialView *)self create30SecondsSubdialText];
      break;
    case 2uLL:
      [(NTKChronoDialView *)self create6SecondsSubdialText];
      break;
    case 3uLL:
      [(NTKChronoDialView *)self create3SecondsSubdialText];
      break;
    default:
      return;
  }
}

- (void)createClockText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v25 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v25 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6DB4;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:12 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)createClockSubdialText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v26 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v26 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7038;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:4 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)create60SecondsText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v25 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v25 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_72A4;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:12 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)create60SecondsSubdialText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v26 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v26 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_752C;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:6 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)create30SecondsText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v25 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v25 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7794;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:15 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)create30SecondsSubdialText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v26 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v26 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7A1C;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:5 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)create6SecondsText
{
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v28);

  id v5 = (void *)*((void *)&v30 + 1);
  id v4 = (void *)v31;
  id v6 = +[CLKFont systemFontOfSize:*((double *)&v30 + 1)];
  id v7 = +[CLKFont systemFontOfSize:*(double *)&v4];
  id v8 = [v7 CLKFontWithStylisticSet:1];

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_7CD0;
  v11[3] = &unk_1C760;
  objc_copyWeak(v14, &location);
  id v9 = v6;
  id v12 = v9;
  v14[1] = v5;
  id v10 = v8;
  v14[2] = v4;
  long long v23 = v36;
  long long v24 = v37;
  long long v25 = v38;
  long long v19 = v32;
  long long v20 = v33;
  long long v21 = v34;
  long long v22 = v35;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v18 = v31;
  id v13 = v10;
  uint64_t v26 = v39;
  [(NTKChronoDialView *)self addTextWithCount:30 configurationBlock:v11];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)create6SecondsSubdialText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v26 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v26 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7FD0;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:3 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)create3SecondsText
{
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v28);

  id v5 = (void *)*((void *)&v30 + 1);
  id v4 = (void *)v31;
  id v6 = +[CLKFont systemFontOfSize:*((double *)&v30 + 1)];
  id v7 = +[CLKFont systemFontOfSize:*(double *)&v4];
  id v8 = [v7 CLKFontWithStylisticSet:1];

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8280;
  v11[3] = &unk_1C760;
  objc_copyWeak(v14, &location);
  id v9 = v6;
  id v12 = v9;
  v14[1] = v5;
  id v10 = v8;
  v14[2] = v4;
  long long v23 = v36;
  long long v24 = v37;
  long long v25 = v38;
  long long v19 = v32;
  long long v20 = v33;
  long long v21 = v34;
  long long v22 = v35;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v18 = v31;
  id v13 = v10;
  uint64_t v26 = v39;
  [(NTKChronoDialView *)self addTextWithCount:30 configurationBlock:v11];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)create3SecondsSubdialText
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NTKChronoDialView *)self device];
  sub_5ADC(v3, (uint64_t)&v23);

  id v4 = (void *)*((void *)&v26 + 1);
  id v5 = +[CLKFont systemFontOfSize:*((double *)&v26 + 1)];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_857C;
  v7[3] = &unk_1C738;
  objc_copyWeak(v9, &location);
  id v6 = v5;
  v9[1] = v4;
  long long v18 = v31;
  long long v19 = v32;
  long long v20 = v33;
  long long v15 = v28;
  long long v16 = v29;
  long long v17 = v30;
  long long v10 = v23;
  long long v11 = v24;
  long long v12 = v25;
  id v8 = v6;
  uint64_t v21 = v34;
  long long v13 = v26;
  long long v14 = v27;
  [(NTKChronoDialView *)self addTextWithCount:2 configurationBlock:v7];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (CGRect)_boundsForText:(id)a3 font:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = CLKLocaleCurrentNumberSystem();
  [v5 capHeight];
  double v9 = v8;
  if (v7 == 2)
  {
    [v5 descender];
    double v11 = v9 - v10;
  }
  else
  {
    double v11 = v8 + 1.0;
  }
  NSAttributedStringKey v23 = NSFontAttributeName;
  id v24 = v5;
  long long v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 3, v12, 0, CGSizeZero.width, CGSizeZero.height);
  double v14 = v13;

  [v5 ascender];
  double v16 = v15;
  [v5 capHeight];
  double v18 = v17;

  double v19 = v16 - v18 + -1.0;
  double v20 = ceil(v11);
  double v21 = 0.0;
  double v22 = v14;
  result.size.height = v20;
  result.size.width = v22;
  result.origin.y = v19;
  result.origin.x = v21;
  return result;
}

- (UIColor)majorTickColor
{
  return self->_majorTickColor;
}

- (UIColor)minorTickColor
{
  return self->_minorTickColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (unint64_t)timescale
{
  return self->_timescale;
}

- (CLKDevice)device
{
  return (CLKDevice *)objc_getProperty(self, a2, 48, 1);
}

- (UILabel)timeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)subdial
{
  return self->_subdial;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_minorTickColor, 0);

  objc_storeStrong((id *)&self->_majorTickColor, 0);
}

@end