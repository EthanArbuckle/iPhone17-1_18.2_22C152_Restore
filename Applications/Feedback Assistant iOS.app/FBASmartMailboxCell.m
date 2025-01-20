@interface FBASmartMailboxCell
+ (NSString)reuseIdentifier;
- (BOOL)isHighlighted;
- (UIImageView)filterImage;
- (UILabel)countLabel;
- (UILabel)titleLabel;
- (_TtC18Feedback_Assistant19FBASmartMailboxCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant19FBASmartMailboxCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)configureWithInbox:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setFilterImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FBASmartMailboxCell

- (UILabel)titleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)filterImage
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIImageView *)Strong;
}

- (void)setFilterImage:(id)a3
{
}

- (UILabel)countLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setCountLabel:(id)a3
{
}

+ (NSString)reuseIdentifier
{
  if (qword_100121E40 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)awakeFromNib
{
  NSString v2 = self;
  sub_100099494();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(FBASmartMailboxCell *)v5 traitCollection];
  id v7 = [v6 preferredContentSizeCategory];

  sub_1000996F8();
}

- (void)configureWithInbox:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100099838(v4);
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  return [(FBASmartMailboxCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_10009A3C0(v3);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  [(FBASmartMailboxCell *)&v5 setHighlighted:v3];
}

- (_TtC18Feedback_Assistant19FBASmartMailboxCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  return -[FBASmartMailboxCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC18Feedback_Assistant19FBASmartMailboxCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  return [(FBASmartMailboxCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end