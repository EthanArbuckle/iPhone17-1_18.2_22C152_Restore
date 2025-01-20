@interface HUSceneTileCell
- (BOOL)isRearranging;
- (BOOL)reorderable;
- (HUSceneTileCell)initWithCoder:(id)a3;
- (HUSceneTileCell)initWithFrame:(CGRect)a3;
- (id)executeActionSetFuture;
- (id)tappableAreaForPoint:(CGPoint)a3;
- (void)setExecuteActionSetFuture:(id)a3;
- (void)setRearranging:(BOOL)a3;
- (void)setReorderable:(BOOL)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUSceneTileCell

- (id)executeActionSetFuture
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture);
  swift_beginAccess();
  return *v2;
}

- (void)setExecuteActionSetFuture:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1BE4B1298();
}

- (id)tappableAreaForPoint:(CGPoint)a3
{
  return @"HUTileCellTappableAreaGeneralToggleArea";
}

- (BOOL)isRearranging
{
  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_isRearranging;
  swift_beginAccess();
  return *v2;
}

- (void)setRearranging:(BOOL)a3
{
  v4 = self;
  sub_1BE4B1FF0(a3);
}

- (BOOL)reorderable
{
  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_reorderable;
  swift_beginAccess();
  return *v2;
}

- (void)setReorderable:(BOOL)a3
{
  v4 = self;
  sub_1BE4B2270(a3);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v3 = self;
  [(HUSceneTileCell *)v3 setNeedsUpdateConfiguration];
  sub_1BE4B24DC();
}

- (HUSceneTileCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUSceneTileCell_dimsWhenReorderingAndNotReorderable) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell__executeActionSetFuture) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SceneTileCell();
  return -[HUTileCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUSceneTileCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUSceneTileCell_dimsWhenReorderingAndNotReorderable) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell__executeActionSetFuture) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SceneTileCell();
  return [(HUTileCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUSceneTileCell__executeActionSetFuture));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUSceneTileCell_executeActionSetFuture);
}

@end