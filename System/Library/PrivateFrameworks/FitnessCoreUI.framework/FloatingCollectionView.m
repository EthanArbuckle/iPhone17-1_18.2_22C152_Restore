@interface FloatingCollectionView
- (_TtC13FitnessCoreUI22FloatingCollectionView)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI22FloatingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)layoutSubviews;
@end

@implementation FloatingCollectionView

- (void)layoutSubviews
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24EEC5C48();
  swift_release();
}

- (_TtC13FitnessCoreUI22FloatingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate);
  v11 = (objc_class *)type metadata accessor for FloatingCollectionView();
  void *v10 = 0;
  v10[1] = 0;
  v14.receiver = self;
  v14.super_class = v11;
  v12 = -[FloatingCollectionView initWithFrame:collectionViewLayout:](&v14, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
  swift_release();
  return v12;
}

- (_TtC13FitnessCoreUI22FloatingCollectionView)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate);
  v6 = (objc_class *)type metadata accessor for FloatingCollectionView();
  void *v5 = 0;
  v5[1] = 0;
  v9.receiver = self;
  v9.super_class = v6;
  v7 = [(FloatingCollectionView *)&v9 initWithCoder:a3];
  swift_release();
  return v7;
}

- (void).cxx_destruct
{
  sub_24EE97098(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate));
}

@end