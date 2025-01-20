@interface AXHearingLiveListenMeterCell
- (AXHearingLiveListenMeterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)dotImageViews;
- (void)audioLevelDidChange:(float)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDotImageViews:(id)a3;
- (void)setMeterLevel:(int)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation AXHearingLiveListenMeterCell

- (AXHearingLiveListenMeterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AXHearingLiveListenMeterCell;
  v4 = [(AXHearingLiveListenMeterCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[NSMutableArray array];
    int v6 = 5;
    do
    {
      id v7 = objc_alloc((Class)UIImageView);
      v8 = accessibilityHearingAidImageNamed();
      v9 = accessibilityHearingAidImageNamed();
      id v10 = [v7 initWithImage:v8 highlightedImage:v9];

      [v5 addObject:v10];
      v11 = [(AXHearingLiveListenMeterCell *)v4 contentView];
      [v11 addSubview:v10];

      --v6;
    }
    while (v6);
    [(AXHearingLiveListenMeterCell *)v4 setDotImageViews:v5];
  }
  return v4;
}

- (void)dealloc
{
  [(NSArray *)self->_dotImageViews makeObjectsPerformSelector:"removeFromSuperview"];
  [(AXHearingLiveListenMeterCell *)self setDotImageViews:0];
  v3.receiver = self;
  v3.super_class = (Class)AXHearingLiveListenMeterCell;
  [(AXHearingLiveListenMeterCell *)&v3 dealloc];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);

    if (!WeakRetained)
    {
      objc_initWeak(&location, self);
      int v6 = +[AXHAServer sharedInstance];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_25D74;
      v8[3] = &unk_3CA98;
      objc_copyWeak(&v9, &location);
      [v6 registerListener:self forLiveListenLevelsHandler:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)AXHearingLiveListenMeterCell;
  [(AXHearingLiveListenMeterCell *)&v7 setSpecifier:v4];
}

- (void)audioLevelDidChange:(float)a3
{
}

- (void)setMeterLevel:(int)a3
{
  if (a3 <= 5)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    int v6 = [(AXHearingLiveListenMeterCell *)self dotImageViews];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_25EE4;
    v7[3] = &unk_3D0D8;
    int v8 = a3;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AXHearingLiveListenMeterCell;
  [(AXHearingLiveListenMeterCell *)&v13 layoutSubviews];
  uint64_t v3 = [(AXHearingLiveListenMeterCell *)self dotImageViews];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(AXHearingLiveListenMeterCell *)self dotImageViews];
    int v6 = [v5 lastObject];
    [v6 frame];
    double Width = CGRectGetWidth(v14);

    int v8 = [(AXHearingLiveListenMeterCell *)self contentView];
    [v8 frame];
    double v9 = CGRectGetWidth(v15);

    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3010000000;
    v12[3] = &unk_39B73;
    *(double *)&v12[4] = v9 * 0.5 + Width * -2.5 + -22.0;
    v12[5] = 0x4034000000000000;
    uint64_t v10 = [(AXHearingLiveListenMeterCell *)self dotImageViews];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_260FC;
    v11[3] = &unk_3D100;
    v11[4] = v12;
    [v10 enumerateObjectsUsingBlock:v11];

    _Block_object_dispose(v12, 8);
  }
}

- (NSArray)dotImageViews
{
  return self->_dotImageViews;
}

- (void)setDotImageViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end