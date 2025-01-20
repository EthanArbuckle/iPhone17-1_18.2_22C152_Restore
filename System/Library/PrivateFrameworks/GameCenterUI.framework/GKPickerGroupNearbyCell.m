@interface GKPickerGroupNearbyCell
+ (NSString)reuseIdentifier;
+ (NSString)reuseIdentifierAX;
- (BOOL)isHighlighted;
- (UILabel)accessibilityTitleLabel;
- (UILabel)badgeLabel;
- (UILabel)titleLabel;
- (UIView)iconContainer;
- (_TtC12GameCenterUI23GKPickerGroupNearbyCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI23GKPickerGroupNearbyCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)configureWithBadgeCount:(int64_t)a3;
- (void)prepareForReuse;
- (void)setBadgeLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconContainer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GKPickerGroupNearbyCell

+ (NSString)reuseIdentifier
{
  return (NSString *)sub_1AF53BD90((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupNearbyCell.reuseIdentifier.getter);
}

+ (NSString)reuseIdentifierAX
{
  return (NSString *)sub_1AF53BD90((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupNearbyCell.reuseIdentifierAX.getter);
}

- (UIView)iconContainer
{
}

- (void)setIconContainer:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF53BE80(a3);
}

- (UILabel)badgeLabel
{
}

- (void)setBadgeLabel:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF53BF64(a3);
}

- (UILabel)titleLabel
{
}

- (void)setTitleLabel:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF53C048(a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1AF53C090();
}

- (void)configureWithBadgeCount:(int64_t)a3
{
  v4 = self;
  sub_1AF53C320(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF53C64C((uint64_t)a3);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF53C774();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1AF53C7FC(a3);
}

- (UILabel)accessibilityTitleLabel
{
  v2 = (void *)sub_1AF53C9B0();

  return (UILabel *)v2;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF53C9DC();
}

- (_TtC12GameCenterUI23GKPickerGroupNearbyCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI23GKPickerGroupNearbyCell *)GKPickerGroupNearbyCell.init(frame:)();
}

- (_TtC12GameCenterUI23GKPickerGroupNearbyCell)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI23GKPickerGroupNearbyCell *)GKPickerGroupNearbyCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end