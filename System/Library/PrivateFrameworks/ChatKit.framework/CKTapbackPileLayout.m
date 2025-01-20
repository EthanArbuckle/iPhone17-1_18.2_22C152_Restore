@interface CKTapbackPileLayout
- (CGSize)pilePositioningSize;
- (CKTapbackPileLayout)init;
- (CKTapbackPileLayout)initWithSourcePoint:(CGPoint)a3 viewModel:(id)a4;
@end

@implementation CKTapbackPileLayout

- (CKTapbackPileLayout)initWithSourcePoint:(CGPoint)a3 viewModel:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  v7 = (CKTapbackPileLayout *)sub_18F7407F0((uint64_t)v6, x, y);

  return v7;
}

- (CGSize)pilePositioningSize
{
  v2 = self;
  sub_18F74021C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CKTapbackPileLayout)init
{
  CGSize result = (CKTapbackPileLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackPileLayout_bottomPeekPlatterLayout);
}

@end