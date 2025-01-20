@interface AlertDeliveryTypeCell
+ (double)preferredHeightInWidth:(double)a3;
- (AlertDeliveryTypeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (id)_currentDescriptor;
- (id)_locationViewForGestureRecognizer:(id)a3;
- (void)_handleLocationViewPress:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
@end

@implementation AlertDeliveryTypeCell

- (AlertDeliveryTypeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)AlertDeliveryTypeCell;
  v4 = [(AlertDeliveryTypeCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  [(AlertDeliveryTypeCell *)v4 setClipsToBounds:1];
  uint64_t v5 = +[NSMutableArray array];
  deliveryTypeCellGestures = v4->_deliveryTypeCellGestures;
  v4->_deliveryTypeCellGestures = (NSMutableArray *)v5;

  v7 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
  feedbackGenerator = v4->_feedbackGenerator;
  v4->_feedbackGenerator = v7;

  v9 = objc_alloc_init(AlertDeliveryLocationView);
  lockscreenLocationView = v4->_lockscreenLocationView;
  v4->_lockscreenLocationView = v9;

  [(AlertDeliveryLocationView *)v4->_lockscreenLocationView setType:0];
  v11 = objc_alloc_init(AlertDeliveryLocationView);
  historyLocationView = v4->_historyLocationView;
  v4->_historyLocationView = v11;

  [(AlertDeliveryLocationView *)v4->_historyLocationView setType:1];
  v13 = objc_alloc_init(AlertDeliveryLocationView);
  bannersLocationView = v4->_bannersLocationView;
  v4->_bannersLocationView = v13;

  [(AlertDeliveryLocationView *)v4->_bannersLocationView setType:2];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v29[0] = v4->_lockscreenLocationView;
  v29[1] = v4->_historyLocationView;
  v29[2] = v4->_bannersLocationView;
  v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3, 0);
  id v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v19);
        v21 = [(AlertDeliveryTypeCell *)v4 contentView];
        [v21 addSubview:v20];

        id v22 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v4 action:"_handleLocationViewPress:"];
        [v22 setMinimumPressDuration:0.0];
        [v22 setCancelPastAllowableMovement:1];
        [v22 setDelegate:v4];
        [v20 addGestureRecognizer:v22];
        [(NSMutableArray *)v4->_deliveryTypeCellGestures addObject:v22];

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v17);
  }

  return v4;
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)AlertDeliveryTypeCell;
  [(AlertDeliveryTypeCell *)&v51 layoutSubviews];
  v3 = [(AlertDeliveryTypeCell *)self specifier];
  v4 = [v3 performGetter];

  if ([v4 lockScreenSetting]) {
    -[AlertDeliveryLocationView setSelected:](self->_lockscreenLocationView, "setSelected:", [v4 lockScreenSetting] == (char *)&dword_0 + 2);
  }
  if ([v4 notificationCenterSetting]) {
    -[AlertDeliveryLocationView setSelected:](self->_historyLocationView, "setSelected:", [v4 notificationCenterSetting] == (char *)&dword_0 + 2);
  }
  if ([v4 bannerSetting]) {
    -[AlertDeliveryLocationView setSelected:](self->_bannersLocationView, "setSelected:", [v4 bannerSetting] == (char *)&dword_0 + 2);
  }
  uint64_t v5 = +[NSMutableArray array];
  v6 = +[NSMutableArray array];
  historyLocationView = self->_historyLocationView;
  v55[0] = self->_lockscreenLocationView;
  v55[1] = historyLocationView;
  v55[2] = self->_bannersLocationView;
  v8 = +[NSArray arrayWithObjects:v55 count:3];
  if ([(AlertDeliveryTypeCell *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    uint64_t v9 = objc_msgSend(v8, "bs_reverse");

    v8 = (void *)v9;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (AlertDeliveryLocationTypeShouldBeHiddenForDescriptor((uint64_t)[v15 type], v4)) {
          id v16 = v6;
        }
        else {
          id v16 = v5;
        }
        [v16 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }

  [v5 count];
  id v17 = [(AlertDeliveryTypeCell *)self contentView];
  [v17 bounds];

  uint64_t v18 = [(AlertDeliveryTypeCell *)self traitCollection];
  [v18 displayScale];

  v19 = +[AlertDeliveryLocationView preferredFont];
  [v19 _scaledValueForValue:24.0];
  [v19 _scaledValueForValue:16.0];
  UIPointRoundToScale();
  double v21 = v20;
  double v23 = v22;
  UISizeRoundToScale();
  double v25 = v24;
  double v27 = v26;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v28 = v5;
  id v29 = [v28 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        [v33 setHidden:0];
        objc_msgSend(v33, "setFrame:", v21, v23, v25, v27);
        double v21 = v25 + v21;
      }
      id v30 = [v28 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v30);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = v6;
  id v35 = [v34 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v34);
        }
        objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)k), "setHidden:", 1, (void)v39);
      }
      id v36 = [v34 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v36);
  }
}

+ (double)preferredHeightInWidth:(double)a3
{
  v3 = +[AlertDeliveryLocationView preferredFont];
  v4 = +[UIScreen mainScreen];
  UIRoundToScreenScale();
  double v6 = v5;

  +[AlertDeliveryLocationView preferredHeightInWidth:v6];
  double v8 = v7;
  [v3 _scaledValueForValue:24.0];
  double v10 = v9;
  [v3 _scaledValueForValue:16.0];
  double v12 = v8 + v10 + v11;

  return v12;
}

- (id)_locationViewForGestureRecognizer:(id)a3
{
  return _[a3 view];
}

- (void)_handleLocationViewPress:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[v4 state];
  if (v5 == (unsigned char *)&dword_0 + 1) {
    [(UIImpactFeedbackGenerator *)self->_feedbackGenerator prepare];
  }
  id v15 = [(AlertDeliveryTypeCell *)self _locationViewForGestureRecognizer:v4];
  [v4 locationInView:v15];
  double v7 = v6;
  double v9 = v8;

  unsigned int v10 = objc_msgSend(v15, "pointInside:withEvent:", 0, v7, v9);
  unsigned int v11 = v10;
  if ((unint64_t)(v5 - 1) < 2) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  [v15 setHighlighted:v12];
  if (v5 == (unsigned char *)&dword_0 + 3 && v11)
  {
    objc_msgSend(v15, "setSelected:animated:", objc_msgSend(v15, "selected") ^ 1, 1);
    uint64_t v13 = [(AlertDeliveryTypeCell *)self specifier];
    v14 = [(AlertDeliveryTypeCell *)self _currentDescriptor];
    [v13 performSetterWithValue:v14];

    [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  if ([(NSMutableArray *)self->_deliveryTypeCellGestures containsObject:a3])
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

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)AlertDeliveryTypeCell;
  -[AlertDeliveryTypeCell reloadWithSpecifier:animated:](&v7, "reloadWithSpecifier:animated:", a3);
  [(AlertDeliveryTypeCell *)self setNeedsLayout];
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_221DC;
    v6[3] = &unk_40F58;
    v6[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:2 animations:v6 completion:0];
  }
}

- (id)_currentDescriptor
{
  v3 = objc_alloc_init(AlertDeliveryTypeDescriptor);
  if (([(AlertDeliveryLocationView *)self->_lockscreenLocationView isHidden] & 1) == 0)
  {
    if ([(AlertDeliveryLocationView *)self->_lockscreenLocationView selected]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(AlertDeliveryTypeDescriptor *)v3 setLockScreenSetting:v4];
  }
  if (([(AlertDeliveryLocationView *)self->_historyLocationView isHidden] & 1) == 0)
  {
    if ([(AlertDeliveryLocationView *)self->_historyLocationView selected]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [(AlertDeliveryTypeDescriptor *)v3 setNotificationCenterSetting:v5];
  }
  if (([(AlertDeliveryLocationView *)self->_bannersLocationView isHidden] & 1) == 0)
  {
    if ([(AlertDeliveryLocationView *)self->_bannersLocationView selected]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    [(AlertDeliveryTypeDescriptor *)v3 setBannerSetting:v6];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_deliveryTypeCellGestures, 0);
  objc_storeStrong((id *)&self->_bannersLocationView, 0);
  objc_storeStrong((id *)&self->_historyLocationView, 0);

  objc_storeStrong((id *)&self->_lockscreenLocationView, 0);
}

@end