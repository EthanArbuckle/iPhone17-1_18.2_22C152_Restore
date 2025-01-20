@interface VibrantSegmentedControl
+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4;
+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithCoder:(id)a3;
- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithFrame:(CGRect)a3;
- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithItems:(id)a3;
- (void)_highlightSegment:(int64_t)a3;
- (void)insertSegmentWithImage:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forSegmentAtIndex:(int64_t)a4;
- (void)setSelected:(BOOL)a3;
- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation VibrantSegmentedControl

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  return 17.0;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 4.0;
}

- (BOOL)isEnabled
{
  return sub_24E9C964C(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_24E9C964C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isSelected
{
  return sub_24E9C964C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithFrame:(CGRect)a3
{
  return (_TtC14FitnessAppRoot23VibrantSegmentedControl *)sub_24E9C974C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
  id v4 = a3;

  result = (_TtC14FitnessAppRoot23VibrantSegmentedControl *)sub_24EA06E48();
  __break(1u);
  return result;
}

- (void)insertSegmentWithImage:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  id v9 = a3;
  v10 = self;
  sub_24E9C98F8(a3, a4, a5);
}

- (void)setImage:(id)a3 forSegmentAtIndex:(int64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_24E9C9B84(a3, a4);
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_24E9CAA34();
    uint64_t v5 = sub_24EA06848();
    id v7 = self;
    v8 = (void *)sub_24EA06838();
  }
  else
  {
    id v9 = self;
    v8 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  [(VibrantSegmentedControl *)&v10 setTitleTextAttributes:v8 forState:a4];

  sub_24E9CA5B4(v5, (id)a4);
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_24E9B72B4(0, &qword_26991E878);
  sub_24E9CAA8C();
  sub_24EA06B28();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 1;
  id v6 = a4;
  id v7 = self;
  v8 = (void *)sub_24EA06B18();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  [(VibrantSegmentedControl *)&v9 touchesBegan:v8 withEvent:v6];

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_24E9B72B4(0, &qword_26991E878);
  sub_24E9CAA8C();
  sub_24EA06B28();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
  id v6 = a4;
  id v7 = self;
  v8 = (void *)sub_24EA06B18();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  [(VibrantSegmentedControl *)&v9 touchesCancelled:v8 withEvent:v6];

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_24E9B72B4(0, &qword_26991E878);
  sub_24E9CAA8C();
  uint64_t v6 = sub_24EA06B28();
  id v7 = a4;
  v8 = self;
  sub_24E9C9F80(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)_highlightSegment:(int64_t)a3
{
  id v4 = self;
  uint64_t v5 = v4;
  if (a3 >= 1 && [(VibrantSegmentedControl *)v4 selectedSegmentIndex] != (id)a3) {
    *((unsigned char *)&v5->super.super.super.super.super.isa
  }
    + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  [(VibrantSegmentedControl *)&v6 _highlightSegment:a3];
}

- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithItems:(id)a3
{
  result = (_TtC14FitnessAppRoot23VibrantSegmentedControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end