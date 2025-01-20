@interface NLActivityRichComplicationBaseRingsView
- (BOOL)_ringsShouldAdoptAccentColor;
- (CLKMonochromeFilterProvider)filterProvider;
- (NLActivityRichComplicationBaseRingsView)initWithFrame:(CGRect)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (int64_t)family;
- (void)_showEmptyViews;
- (void)_updateRingWithTemplate:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NLActivityRichComplicationBaseRingsView

- (NLActivityRichComplicationBaseRingsView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)NLActivityRichComplicationBaseRingsView;
  v3 = -[NLActivityRichComplicationBaseRingsView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3) {
    return v3;
  }
  v4 = +[CLKDevice currentDevice];
  v5 = [(NLActivityRichComplicationBaseRingsView *)v3 family];
  id v6 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16A90);
  id WeakRetained = objc_loadWeakRetained(&qword_16A98);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&qword_16A98);
    if (v9 == v6)
    {
      id v10 = [v6 version];
      uint64_t v11 = qword_16AA0;

      if (v10 == (id)v11) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&qword_16A98, v6);
  qword_16AA0 = (uint64_t)[v6 version];

  sub_5CC8(v13, v6);
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16A90);
  if (v5 == &dword_8)
  {
    v14 = (long long *)&qword_16A70;
    v15 = &qword_16A78;
    v16 = &qword_16A80;
    v17 = &qword_16A88;
  }
  else
  {
    v14 = &xmmword_16A30;
    if (v5 != (int *)((char *)&dword_8 + 2))
    {
      if (v5 != &dword_C)
      {
        _HKInitializeLogging();
        v18 = HKLogActivity;
        v15 = (uint64_t *)&xmmword_16A30 + 1;
        v16 = &qword_16A40;
        v17 = &qword_16A48;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
          sub_98BC((uint64_t)v5, v18);
        }
        goto LABEL_15;
      }
      v14 = &xmmword_16A50;
    }
    v15 = (uint64_t *)v14 + 1;
    v16 = (uint64_t *)(v14 + 1);
    v17 = (uint64_t *)v14 + 3;
  }
LABEL_15:
  double v19 = *(double *)v14;
  double v20 = *(double *)v15;
  double v21 = *(double *)v16;
  double v22 = *(double *)v17;

  v23 = (NTKRingsAndDotsView *)objc_msgSend(objc_alloc((Class)NTKRingsAndDotsView), "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v21, v19, v20, v22);
  ringsView = v3->_ringsView;
  v3->_ringsView = v23;

  if ([(NLActivityRichComplicationBaseRingsView *)v3 _ringsShouldAdoptAccentColor]) {
    [(NTKRingsAndDotsView *)v3->_ringsView setShouldUseMonochromeAccentColor:1];
  }
  v25 = v3->_ringsView;
  v26 = NTKMoveNonGradientTextColor();
  v32[0] = v26;
  v27 = NTKExerciseNonGradientTextColor();
  v32[1] = v27;
  v28 = NTKStandNonGradientTextColor();
  v32[2] = v28;
  v29 = +[NSArray arrayWithObjects:v32 count:3];
  [(NTKRingsAndDotsView *)v25 setRingColors:v29];

  [(NLActivityRichComplicationBaseRingsView *)v3 _showEmptyViews];
  [(NLActivityRichComplicationBaseRingsView *)v3 addSubview:v3->_ringsView];
  return v3;
}

- (BOOL)_ringsShouldAdoptAccentColor
{
  v3 = +[CLKDevice currentDevice];
  int v4 = NTKShowGossamerUI();

  return v4
      && (((unint64_t)[(NLActivityRichComplicationBaseRingsView *)self family] - 10) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)NLActivityRichComplicationBaseRingsView;
  [(NLActivityRichComplicationBaseRingsView *)&v11 layoutSubviews];
  [(NLActivityRichComplicationBaseRingsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  if (!CGRectEqualToRect(self->_prevLayoutBounds, v12))
  {
    -[NTKRingsAndDotsView setFrame:](self->_ringsView, "setFrame:", v4, v6, v8, v10);
    self->_prevLayoutBounds.origin.x = v4;
    self->_prevLayoutBounds.origin.y = v6;
    self->_prevLayoutBounds.size.width = v8;
    self->_prevLayoutBounds.size.height = v10;
  }
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NLActivityRichComplicationBaseRingsView initWithFrame:](self, "initWithFrame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  CGFloat v5 = [a3 metadata];
  id v6 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationActivityTemplateKey"];

  if ([v6 dotsAreHidden]) {
    [(NLActivityRichComplicationBaseRingsView *)self _showEmptyViews];
  }
  else {
    [(NLActivityRichComplicationBaseRingsView *)self _updateRingWithTemplate:v6];
  }
}

- (void)setFilterProvider:(id)a3
{
  p_filterProvider = &self->_filterProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_filterProvider, v5);
  [(NTKRingsAndDotsView *)self->_ringsView setFilterProvider:v5];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (void)_showEmptyViews
{
  CGFloat v3 = +[NTKRingsAndDotsView emptyFillFractions];
  double v4 = (NSMutableArray *)[v3 mutableCopy];
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v4;

  ringsView = self->_ringsView;
  CGFloat v7 = self->_ringsFillFractions;

  [(NTKRingsAndDotsView *)ringsView setRingsFillFractions:v7];
}

- (void)_updateRingWithTemplate:(id)a3
{
  id v17 = a3;
  [v17 movePercentComplete];
  if (v4 < 0.00000011920929) {
    double v4 = 0.00000011920929;
  }
  id v5 = +[NSNumber numberWithDouble:v4];
  id v6 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:0];
  unsigned int v7 = [v5 isEqualToNumber:v6];

  if ((v7 & 1) == 0) {
    [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:0 withObject:v5];
  }
  [v17 exercisePercentComplete];
  if (v8 < 0.00000011920929) {
    double v8 = 0.00000011920929;
  }
  CGFloat v9 = +[NSNumber numberWithDouble:v8];
  double v10 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:1];
  unsigned __int8 v11 = [v9 isEqualToNumber:v10];

  if (v11)
  {
    int v12 = v7 ^ 1;
  }
  else
  {
    int v12 = 1;
    [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:1 withObject:v9];
  }
  [v17 standPercentComplete];
  if (v13 < 0.00000011920929) {
    double v13 = 0.00000011920929;
  }
  v14 = +[NSNumber numberWithDouble:v13];
  v15 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:2];
  unsigned __int8 v16 = [v14 isEqualToNumber:v15];

  if ((v16 & 1) == 0)
  {
    [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:2 withObject:v14];
    goto LABEL_16;
  }
  if (v12) {
LABEL_16:
  }
    [(NTKRingsAndDotsView *)self->_ringsView setRingsFillFractions:self->_ringsFillFractions];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

- (int64_t)family
{
  return -1;
}

@end