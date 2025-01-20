@interface OverlayMenuSlider
- (BOOL)highlightCurrentSelectedIndex;
- (BOOL)isDisabledAtIndex:(int64_t)a3;
- (CEKContactRecognizer)contactRecognizer;
- (CGAffineTransform)orientationTransform;
- (CGSize)sizeForImageAtIndex:(int64_t)a3;
- (NSArray)imageNames;
- (NSIndexSet)disabledMenuItemsIndices;
- (_TtC8CameraUI17OverlayMenuSlider)initWithCoder:(id)a3;
- (_TtC8CameraUI17OverlayMenuSlider)initWithFrame:(CGRect)a3;
- (_TtP8CameraUI25OverlayMenuSliderDelegate_)delegate;
- (id)imageForTickMarkAtIndex:(int64_t)a3;
- (int64_t)indexOfImageClosestToPoint:(CGPoint)a3 in:(id)a4;
- (int64_t)orientation;
- (int64_t)selectedControlIndex;
- (unint64_t)alignment;
- (void)discreteSliderDidChangeValue:(id)a3;
- (void)layoutSubviews;
- (void)setAlignment:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledMenuItemsIndices:(id)a3;
- (void)setHighlightCurrentSelectedIndex:(BOOL)a3;
- (void)setHighlightCurrentSelectedIndex:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageNames:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedControlIndex:(int64_t)a3;
- (void)setSelectedControlIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
@end

@implementation OverlayMenuSlider

- (_TtP8CameraUI25OverlayMenuSliderDelegate_)delegate
{
  v2 = (void *)MEMORY[0x21050C5A0]((char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate, a2);
  return (_TtP8CameraUI25OverlayMenuSliderDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedControlIndex
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_selectedIndex);
}

- (void)setSelectedControlIndex:(int64_t)a3
{
}

- (void)setSelectedControlIndex:(int64_t)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_209C18580(a3, a4);
}

- (NSArray)imageNames
{
  sub_209C4C708();
  v2 = (void *)sub_209C4D258();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setImageNames:(id)a3
{
  v4 = (objc_class *)sub_209C4D268();
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames) = v4;
  v6 = self;
  sub_209C187CC(v5);

  swift_bridgeObjectRelease();
}

- (CEKContactRecognizer)contactRecognizer
{
  return (CEKContactRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                         + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider));
}

- (NSIndexSet)disabledMenuItemsIndices
{
  uint64_t v3 = sub_209C4C948();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_209C4C908();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSIndexSet *)v8;
}

- (void)setDisabledMenuItemsIndices:(id)a3
{
  uint64_t v4 = sub_209C4C948();
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209C4C918();
  v7 = self;
  sub_209C18C84(v6);
}

- (void)discreteSliderDidChangeValue:(id)a3
{
  uint64_t v5 = MEMORY[0x21050C5A0]((char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate, a2);
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = a3;
    uint64_t v8 = self;
    objc_msgSend(v6, sel_overlayMenuSlider_didSelectControlAt_, v8, objc_msgSend(v7, sel_selectedIndex));

    swift_unknownObjectRelease();
  }
}

- (int64_t)indexOfImageClosestToPoint:(CGPoint)a3 in:(id)a4
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_indexForTickMarkAtPoint_in_, a4, a3.x, a3.y);
}

- (BOOL)highlightCurrentSelectedIndex
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_highlightSelectedIndex);
}

- (void)setHighlightCurrentSelectedIndex:(BOOL)a3
{
}

- (void)setHighlightCurrentSelectedIndex:(BOOL)a3 animated:(BOOL)a4
{
}

- (_TtC8CameraUI17OverlayMenuSlider)initWithFrame:(CGRect)a3
{
  return (_TtC8CameraUI17OverlayMenuSlider *)sub_209C18FA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_209C192A8();
}

- (_TtC8CameraUI17OverlayMenuSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_209C1A0B4();
}

- (id)imageForTickMarkAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_209C19630(a3);

  return v5;
}

- (CGSize)sizeForImageAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  sub_209C18920(a3);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isDisabledAtIndex:(int64_t)a3
{
  uint64_t v4 = sub_209C4C948();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = (char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v8, v4);
  double v9 = self;
  char v10 = sub_209C4C928();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v10 & 1;
}

- (void)sliderWillBeginScrolling:(id)a3
{
}

- (void)sliderDidEndScrolling:(id)a3
{
}

- (int64_t)orientation
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation);
}

- (void)setOrientation:(int64_t)a3
{
  uint64_t v4 = self;
  sub_209C199DC((id)a3);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  sub_209C19A78((id)a3, a4);
}

- (CGAffineTransform)orientationTransform
{
  uint64_t v4 = self;
  sub_209C19494(v8);

  long long v6 = v8[1];
  long long v7 = v8[2];
  *(_OWORD *)&retstr->a = v8[0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = v7;
  return result;
}

- (unint64_t)alignment
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment);
}

- (void)setAlignment:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment) = (Class)a3;
  if (v3 != a3) {
    [(OverlayMenuSlider *)self setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  sub_209C1A1F0((uint64_t)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate);

  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  uint64_t v4 = sub_209C4C948();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end