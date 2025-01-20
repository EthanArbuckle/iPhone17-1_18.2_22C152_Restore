@interface SingleCycleView
- (UIColor)backgroundColor;
- (_TtC24MenstrualCyclesAppPlugin15SingleCycleView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin15SingleCycleView)initWithFrame:(CGRect)a3;
- (void)adaptToColorSchemeChanges;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)viewModelProviderDidUpdate:(id)a3;
@end

@implementation SingleCycleView

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SingleCycleView();
  v2 = [(SingleCycleView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SingleCycleView();
  id v4 = a3;
  v5 = (char *)v8.receiver;
  [(SingleCycleView *)&v8 setBackgroundColor:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_collectionView];
  id v7 = objc_msgSend(v5, sel_backgroundColor, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_setBackgroundColor_, v7);
}

- (_TtC24MenstrualCyclesAppPlugin15SingleCycleView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15SingleCycleView *)sub_24152AB80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin15SingleCycleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24152E13C();
}

- (void)layoutMarginsDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_collectionView);
  uint64_t v3 = qword_268CF98D0;
  id v4 = self;
  v9 = v4;
  if (v3 != -1)
  {
    swift_once();
    id v4 = v9;
  }
  double v5 = *(double *)&qword_268D02810;
  [(SingleCycleView *)v4 layoutMargins];
  double v7 = v6;
  if (qword_268CF98C8 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_268D02808;
  [(SingleCycleView *)v9 layoutMargins];
  objc_msgSend(v2, sel_setContentInset_, v5, v7, v8);
}

- (void)adaptToColorSchemeChanges
{
  v2 = self;
  sub_24152B3D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24152B590();
}

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_24152D068();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24162BB18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  type metadata accessor for CycleHistoryCycleDayCell();
  uint64_t v12 = swift_dynamicCastClass();
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    sub_24152D5E8(v13);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24162BB18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  uint64_t v12 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_cycleDataSource);
  if (v12
    && (*((unsigned char *)v12 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_dataFetchingState) & 1) == 0)
  {
    id v13 = a3;
    id v14 = a4;
    id v15 = self;
    id v16 = v12;
    sub_24152BF90();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_overlayGradient));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15SingleCycleView_cycleDataSource);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_24152DB98(v4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_24152E460("[%{public}s] scrollViewDidEndScrollingAnimation: resuming data fetching");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  double v7 = self;
  sub_24152E22C(a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_24152E460("[%{public}s] scrollViewDidEndDecelerating: resuming data fetching");
}

@end