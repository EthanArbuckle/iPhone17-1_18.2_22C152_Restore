@interface CloudSyncCollectionViewCell
- (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation CloudSyncCollectionViewCell

- (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_cloudSyncDetailView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for ActivityIndicatorDetailView(0));
  v10 = self;
  id v11 = objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)v11;
  v12 = (char *)v10 + OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_item;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for CloudSyncCollectionViewCell();
  v13 = -[CloudSyncCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_1AD2EF36C();

  return v13;
}

- (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI27CloudSyncCollectionViewCell *)sub_1AD2EF21C(a3);
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CloudSyncCollectionViewCell();
  [(CloudSyncCollectionViewCell *)&v2 awakeFromNib];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_cloudSyncDetailView));
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27CloudSyncCollectionViewCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

@end