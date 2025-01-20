@interface ARQLSegmentedControl
+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4;
+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4;
- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithCoder:(id)a3;
- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithFrame:(CGRect)a3;
- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithItems:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ARQLSegmentedControl

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4 = qword_1EADCA638;
  id v5 = a3;
  if (v4 != -1) {
    swift_once();
  }
  double v6 = *(double *)&qword_1EADCCD00;

  return v6;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 2.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self
     + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
  *(void *)v7 = 0;
  v7[8] = 0;
  *((void *)v7 + 2) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ARQLSegmentedControl();
  return -[ARQLSegmentedControl initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self
     + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
  *(void *)uint64_t v4 = 0;
  v4[8] = 0;
  *((void *)v4 + 2) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ARQLSegmentedControl();
  return [(ARQLSegmentedControl *)&v6 initWithCoder:a3];
}

- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithItems:(id)a3
{
  if (a3)
  {
    sub_1E2994428();
    uint64_t v4 = (char *)self
       + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
    *(void *)uint64_t v4 = 0;
    v4[8] = 0;
    *((void *)v4 + 2) = 0;
    id v5 = (void *)sub_1E2994418();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
    objc_super v6 = (char *)self
       + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
    *(void *)objc_super v6 = 0;
    v6[8] = 0;
    *((void *)v6 + 2) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ARQLSegmentedControl();
  v7 = [(ARQLSegmentedControl *)&v9 initWithItems:v5];

  return v7;
}

@end