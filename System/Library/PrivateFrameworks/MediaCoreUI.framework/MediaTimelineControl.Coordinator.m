@interface MediaTimelineControl.Coordinator
- (BOOL)isLoading;
- (BOOL)isPlaying;
- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4;
- (NSArray)timeRangeMarks;
- (NSString)currentValueText;
- (NSString)maxValueText;
- (_TtCV11MediaCoreUI20MediaTimelineControl11Coordinator)init;
- (float)currentValue;
- (float)maxValue;
- (float)minValue;
- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4;
- (void)mediaTimelineControl:(id)a3 didChangeScrubbingRate:(unint64_t)a4;
- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4;
- (void)mediaTimelineControl:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4;
- (void)mediaTimelineControlDidEndChanging:(id)a3;
- (void)mediaTimelineControlDidEndDecelerating:(id)a3;
- (void)mediaTimelineControlWillBeginChanging:(id)a3;
- (void)setCurrentValue:(float)a3;
- (void)setMaxValue:(float)a3;
- (void)setTimeRangeMarks:(id)a3;
@end

@implementation MediaTimelineControl.Coordinator

- (float)minValue
{
  return 0.0;
}

- (float)maxValue
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_maxValue);
}

- (void)setMaxValue:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_maxValue) = a3;
}

- (float)currentValue
{
  return *(float *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_currentValue);
}

- (void)setCurrentValue:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_currentValue) = a3;
}

- (BOOL)isPlaying
{
  return 1;
}

- (BOOL)isLoading
{
  return 0;
}

- (NSString)currentValueText
{
  return (NSString *)0;
}

- (NSString)maxValueText
{
  return (NSString *)0;
}

- (NSArray)timeRangeMarks
{
  sub_255A43740(0, (unint64_t *)&unk_269F24048);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_255C807E8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setTimeRangeMarks:(id)a3
{
  sub_255A43740(0, (unint64_t *)&unk_269F24048);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MediaCoreUI20MediaTimelineControl11Coordinator_timeRangeMarks) = (Class)sub_255C807F8();

  swift_bridgeObjectRelease();
}

- (void)mediaTimelineControl:(id)a3 didChangeScrubbingRate:(unint64_t)a4
{
  swift_getKeyPath();
  sub_255B12C70(&qword_269F23860, (void (*)(uint64_t))type metadata accessor for ScrubberViewModel);
  id v6 = a3;
  v7 = self;
  swift_retain();
  sub_255C7D708();

  swift_release();
  swift_release();
}

- (void)mediaTimelineControlWillBeginChanging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_255B038A8(v4);
}

- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4
{
  id v6 = a3;
  v7 = self;
  sub_255B1F128(a4);
}

- (void)mediaTimelineControlDidEndChanging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_255B03CE8(v4);
}

- (void)mediaTimelineControlDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_255B1F3A4();
}

- (void)mediaTimelineControl:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v10 = self;
  sub_255B1F680(top, left, bottom, right);
}

- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4
{
  double Height = CGRectGetHeight(a4);
  double v5 = 1.9047619;
  result.height = Height;
  result.width = v5;
  return result;
}

- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4
{
  id v4 = objc_msgSend(self, sel_maskedTimeRangeMarkUIProxyWithCornerRadius_, 0.0);

  return v4;
}

- (_TtCV11MediaCoreUI20MediaTimelineControl11Coordinator)init
{
  CGSize result = (_TtCV11MediaCoreUI20MediaTimelineControl11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end