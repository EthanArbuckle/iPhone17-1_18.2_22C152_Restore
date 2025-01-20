@interface AUVerticalSegmentControl
- (NSArray)accessibilityElements;
- (_TtC12CoreAudioKit24AUVerticalSegmentControl)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit24AUVerticalSegmentControl)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)segmentEnabledChangedWithNotification:(id)a3;
- (void)segmentSelectionChangedWithNotification:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AUVerticalSegmentControl

- (_TtC12CoreAudioKit24AUVerticalSegmentControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_items) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_accessibleElements) = v7;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_columnCount) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_selectedSegmentIndex) = (Class)-1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_segmentHeight) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AUVerticalSegmentControl();
  return -[AUVerticalSegmentControl initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit24AUVerticalSegmentControl)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit24AUVerticalSegmentControl *)sub_21E535290(a3);
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_21E535AA8();

  if (v3)
  {
    v4 = (void *)sub_21E5B6688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)removeFromSuperview
{
  uint64_t v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AUVerticalSegmentControl();
  [(AUVerticalSegmentControl *)&v6 removeFromSuperview];
}

- (void)segmentSelectionChangedWithNotification:(id)a3
{
}

- (void)segmentEnabledChangedWithNotification:(id)a3
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_21E53843C(0, &qword_267D37A20);
  sub_21E5382A0();
  uint64_t v6 = sub_21E5B6758();
  id v7 = a4;
  v8 = self;
  sub_21E53700C(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_21E53843C(0, &qword_267D37A20);
  sub_21E5382A0();
  uint64_t v6 = sub_21E5B6758();
  id v7 = self;
  id v8 = a4;
  objc_super v9 = (void *)sub_21E5A05D8(v6);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_locationInView_, v7);
    sub_21E536238(v11, v12);
  }
  v13 = (void *)sub_21E5B6748();
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for AUVerticalSegmentControl();
  [(AUVerticalSegmentControl *)&v14 touchesMoved:v13 withEvent:v8];

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E537750();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end