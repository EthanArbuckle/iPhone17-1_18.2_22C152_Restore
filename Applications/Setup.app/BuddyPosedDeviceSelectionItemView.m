@interface BuddyPosedDeviceSelectionItemView
- (BOOL)selected;
- (BuddyPosedDeviceSelectionItemAccessoryView)accessoryView;
- (BuddyPosedDeviceSelectionItemView)initWithContentImage:(id)a3 selectionSegment:(int64_t)a4 accessoryView:(id)a5 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a6 posedDevicesPadding:(double)a7;
- (BuddyPosedDeviceSelectionItemView)initWithContentView:(id)a3 selectionSegment:(int64_t)a4 accessoryView:(id)a5;
- (NSArray)contentContainerWidthHeightConstraints;
- (NSDirectionalEdgeInsets)hostViewLayoutMargins;
- (UIView)contentContainer;
- (double)_idealPosedDeviceSizeForAspectRatio:(double)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 posedDevicesPadding:(double)a5;
- (double)_mainViewToAccessoryViewPadding;
- (double)_preferredHeight;
- (double)accessoryViewAndPaddingHeight;
- (double)aspectRatio;
- (double)contentContainerHeight;
- (double)posedDevicesPadding;
- (double)updateBoundsForMaxContentHeight:(double)a3;
- (id)_createContainerSize:(CGRect)a3 aspectRatio:(double)a4 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a5 posedDevicesPadding:(double)a6;
- (id)title;
- (void)setAccessoryView:(id)a3;
- (void)setAspectRatio:(double)a3;
- (void)setContentContainer:(id)a3;
- (void)setContentContainerWidthHeightConstraints:(id)a3;
- (void)setHostViewLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setPosedDevicesPadding:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation BuddyPosedDeviceSelectionItemView

- (BuddyPosedDeviceSelectionItemView)initWithContentView:(id)a3 selectionSegment:(int64_t)a4 accessoryView:(id)a5
{
  id v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj[1] = (id)a4;
  obj[0] = 0;
  objc_storeStrong(obj, a5);
  id v7 = v44;
  id v44 = 0;
  v41.receiver = v7;
  v41.super_class = (Class)BuddyPosedDeviceSelectionItemView;
  v8 = -[BuddyPosedDeviceSelectionItemView initWithFrame:](&v41, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v44 = v8;
  objc_storeStrong(&v44, v8);
  if (v8)
  {
    objc_storeStrong((id *)v44 + 2, obj[0]);
    objc_storeStrong((id *)v44 + 1, location[0]);
    [v44 addSubview:*((void *)v44 + 2)];
    [v44 addSubview:*((void *)v44 + 1)];
    [v44 _mainViewToAccessoryViewPadding];
    double v40 = v9;
    id v10 = [*((id *)v44 + 1) heightAnchor];
    [*((id *)v44 + 1) bounds];
    id v12 = [v10 constraintEqualToConstant:v11];
    v46[0] = v12;
    id v13 = [*((id *)v44 + 1) widthAnchor];
    [*((id *)v44 + 1) bounds];
    id v15 = [v13 constraintEqualToConstant:v14];
    v46[1] = v15;
    v16 = +[NSArray arrayWithObjects:v46 count:2];
    v17 = (void *)*((void *)v44 + 4);
    *((void *)v44 + 4) = v16;

    [*((id *)v44 + 1) bounds];
    double v19 = v18;
    [*((id *)v44 + 1) bounds];
    *((double *)v44 + 3) = v19 / v20;
    id v39 = [*((id *)v44 + 1) topAnchor];
    id v38 = [v44 topAnchor];
    id v37 = [v39 constraintEqualToAnchor:];
    v45[0] = v37;
    id v36 = [*((id *)v44 + 1) centerXAnchor];
    id v35 = [v44 centerXAnchor];
    id v34 = [v36 constraintEqualToAnchor:];
    v45[1] = v34;
    id v21 = [*((id *)v44 + 2) topAnchor];
    id v22 = [*((id *)v44 + 1) bottomAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22 constant:v40];
    v45[2] = v23;
    id v24 = [*((id *)v44 + 2) centerXAnchor];
    id v25 = [*((id *)v44 + 1) centerXAnchor];
    id v26 = [v24 constraintEqualToAnchor:v25];
    v45[3] = v26;
    id v27 = [v44 bottomAnchor];
    id v28 = [*((id *)v44 + 2) bottomAnchor];
    id v29 = [v27 constraintEqualToAnchor:v28 constant:v40];
    v45[4] = v29;
    v30 = +[NSArray arrayWithObjects:v45 count:5];
    +[NSLayoutConstraint activateConstraints:v30];

    id v31 = [v44 contentContainerWidthHeightConstraints];
    +[NSLayoutConstraint activateConstraints:v31];

    [v44 layoutSubviews];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v32 = (BuddyPosedDeviceSelectionItemView *)v44;
  objc_storeStrong(obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v44, 0);
  return v32;
}

- (BuddyPosedDeviceSelectionItemView)initWithContentImage:(id)a3 selectionSegment:(int64_t)a4 accessoryView:(id)a5 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a6 posedDevicesPadding:(double)a7
{
  NSDirectionalEdgeInsets v33 = a6;
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v30 = a4;
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  double v28 = a7;
  id v10 = objc_alloc((Class)UIImageView);
  id v27 = [v10 initWithImage:location[0]];
  double v11 = +[UIColor colorWithRed:0.152941182 green:0.152941182 blue:0.152941182 alpha:1.0];
  [v27 setTintColor:v11];

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [location[0] size];
  v25[3] = v12;
  v25[4] = v13;
  double v14 = *(double *)&v13;
  [location[0] size];
  v25[1] = v15;
  v25[2] = v16;
  double v26 = v14 / *(double *)&v15;
  id v17 = v32;
  [v27 bounds];
  v25[0] = [v17 _createContainerSize:v18 aspectRatio:v19 hostViewLayoutMargins:v20 posedDevicesPadding:v26 top:v33.top leading:v33.leading bottom:v33.bottom trailing:v33.trailing];
  [v25[0] addSubview:v27];
  [v27 pinToEdges:v25[0]];
  id v22 = v32;
  id v32 = 0;
  id v32 = [v22 initWithContentView:v25[0] selectionSegment:v30 accessoryView:v29];
  objc_storeStrong(&v32, v32);
  if (v32)
  {
    *((double *)v32 + 3) = v26;
    *(NSDirectionalEdgeInsets *)((char *)v32 + 48) = v33;
    *((double *)v32 + 5) = v28;
  }
  id v23 = (BuddyPosedDeviceSelectionItemView *)v32;
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v32, 0);
  return v23;
}

- (double)_idealPosedDeviceSizeForAspectRatio:(double)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 posedDevicesPadding:(double)a5
{
  double leading = a4.leading;
  double trailing = a4.trailing;
  v5 = +[UIDevice currentDevice];
  id v6 = [(UIDevice *)v5 userInterfaceIdiom];

  if (v6 == (id)1)
  {
    +[OBWelcomeController preferredContentSize];
    -[BuddyPosedDeviceSelectionItemView buddy_heightForContainerWidth:ratio:](self, "buddy_heightForContainerWidth:ratio:", (v7 - a5 - (leading + trailing)) / 3.0, a3, 0, v15, v17, v19, v21, *(void *)&v7, v8);
  }
  else
  {
    id v10 = +[UIScreen mainScreen];
    [(UIScreen *)v10 bounds];
    uint64_t v18 = v11;
    uint64_t v16 = v12;
    uint64_t v22 = v13;
    double v20 = v14;
    double v25 = v14 - a5 - (leading + trailing);

    -[BuddyPosedDeviceSelectionItemView buddy_heightForContainerWidth:ratio:](self, "buddy_heightForContainerWidth:ratio:", v25 / 3.0, a3, 0, v16, v18, *(void *)&v20, v22, v23, v24);
  }
  return result;
}

- (id)_createContainerSize:(CGRect)a3 aspectRatio:(double)a4 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a5 posedDevicesPadding:(double)a6
{
  CGRect v15 = a3;
  NSDirectionalEdgeInsets v14 = a5;
  uint64_t v13 = self;
  SEL v12 = a2;
  double v11 = a4;
  id location = [objc_alloc((Class)UIView) initWithFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  [location setTranslatesAutoresizingMaskIntoConstraints:0];
  -[BuddyPosedDeviceSelectionItemView _idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:](v13, "_idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:", v11, a5.top, a5.leading, a5.bottom, a5.trailing, a6);
  id v7 = [location buddy_scaleHeightTo:v6 ratio:v11];
  id v8 = location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)setSelected:(BOOL)a3
{
  v4 = [(BuddyPosedDeviceSelectionItemView *)self accessoryView];
  [(BuddyPosedDeviceSelectionItemAccessoryView *)v4 setSelected:a3];
}

- (BOOL)selected
{
  v2 = [(BuddyPosedDeviceSelectionItemView *)self accessoryView];
  unsigned __int8 v3 = [(BuddyPosedDeviceSelectionItemAccessoryView *)v2 selected];

  return v3 & 1;
}

- (id)title
{
  v2 = [(BuddyPosedDeviceSelectionItemView *)self accessoryView];
  unsigned __int8 v3 = [(BuddyPosedDeviceSelectionItemAccessoryView *)v2 titleLabel];
  v4 = [(UILabel *)v3 text];

  return v4;
}

- (double)updateBoundsForMaxContentHeight:(double)a3
{
  unsigned __int8 v3 = [(BuddyPosedDeviceSelectionItemView *)self accessoryView];
  [(BuddyPosedDeviceSelectionItemAccessoryView *)v3 bounds];
  double v5 = v4;
  [(BuddyPosedDeviceSelectionItemView *)self _mainViewToAccessoryViewPadding];
  double v41 = a3 - (v5 + v6);

  [(BuddyPosedDeviceSelectionItemView *)self aspectRatio];
  double v8 = v7;
  [(BuddyPosedDeviceSelectionItemView *)self hostViewLayoutMargins];
  double v36 = v9;
  double v37 = v10;
  double v38 = v11;
  double v39 = v12;
  [(BuddyPosedDeviceSelectionItemView *)self posedDevicesPadding];
  -[BuddyPosedDeviceSelectionItemView _idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:](self, "_idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:", v8, v36, v37, v38, v39, v13);
  double v15 = sub_100118158(v41, v14);
  [(BuddyPosedDeviceSelectionItemView *)self _preferredHeight];
  double v35 = sub_100118158(v15, v16);
  uint64_t v17 = [(BuddyPosedDeviceSelectionItemView *)self contentContainerWidthHeightConstraints];
  +[NSLayoutConstraint deactivateConstraints:v17];

  uint64_t v18 = [(BuddyPosedDeviceSelectionItemView *)self contentContainer];
  [(BuddyPosedDeviceSelectionItemView *)self aspectRatio];
  id v20 = [(UIView *)v18 buddy_scaleHeightTo:v35 ratio:v19];

  uint64_t v21 = [(BuddyPosedDeviceSelectionItemView *)self contentContainer];
  uint64_t v22 = [(UIView *)v21 heightAnchor];
  [(UIView *)self->_contentContainer bounds];
  uint64_t v24 = [(NSLayoutDimension *)v22 constraintEqualToConstant:v23];
  v43[0] = v24;
  double v25 = [(BuddyPosedDeviceSelectionItemView *)self contentContainer];
  double v26 = [(UIView *)v25 widthAnchor];
  [(UIView *)self->_contentContainer bounds];
  id v31 = -[NSLayoutDimension constraintEqualToConstant:](v26, "constraintEqualToConstant:", v29, v27, v28, *(void *)&v29, v30);
  v43[1] = v31;
  id v32 = +[NSArray arrayWithObjects:v43 count:2];
  [(BuddyPosedDeviceSelectionItemView *)self setContentContainerWidthHeightConstraints:v32];

  NSDirectionalEdgeInsets v33 = [(BuddyPosedDeviceSelectionItemView *)self contentContainerWidthHeightConstraints];
  +[NSLayoutConstraint activateConstraints:v33];

  return v35;
}

- (double)accessoryViewAndPaddingHeight
{
  v2 = [(BuddyPosedDeviceSelectionItemView *)self accessoryView];
  [(BuddyPosedDeviceSelectionItemAccessoryView *)v2 bounds];
  double v4 = v3;
  [(BuddyPosedDeviceSelectionItemView *)self _mainViewToAccessoryViewPadding];
  double v9 = v4 + v8;

  return v9;
}

- (double)_preferredHeight
{
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 bounds];
  double v4 = v3 * 0.3;

  return v4;
}

- (double)_mainViewToAccessoryViewPadding
{
  double v5 = 22.0;
  id v2 = +[BYDevice currentDevice];
  id v3 = [v2 size];

  if (v3 == (id)2) {
    return 10.0;
  }
  return v5;
}

- (double)contentContainerHeight
{
  id v2 = [(BuddyPosedDeviceSelectionItemView *)self contentContainer];
  [(UIView *)v2 bounds];
  double v4 = v3;

  return v4;
}

- (UIView)contentContainer
{
  return self->_contentContainer;
}

- (void)setContentContainer:(id)a3
{
}

- (BuddyPosedDeviceSelectionItemAccessoryView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (NSArray)contentContainerWidthHeightConstraints
{
  return self->_contentContainerWidthHeightConstraints;
}

- (void)setContentContainerWidthHeightConstraints:(id)a3
{
}

- (NSDirectionalEdgeInsets)hostViewLayoutMargins
{
  double leading = self->_hostViewLayoutMargins.leading;
  double top = self->_hostViewLayoutMargins.top;
  double trailing = self->_hostViewLayoutMargins.trailing;
  double bottom = self->_hostViewLayoutMargins.bottom;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setHostViewLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_hostViewLayoutMargins = a3;
}

- (double)posedDevicesPadding
{
  return self->_posedDevicesPadding;
}

- (void)setPosedDevicesPadding:(double)a3
{
  self->_posedDevicesPadding = a3;
}

- (void).cxx_destruct
{
}

@end