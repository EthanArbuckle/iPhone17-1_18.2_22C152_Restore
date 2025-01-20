@interface GKPickerGroupCell
+ (NSString)reuseIdentifier;
+ (NSString)reuseIdentifierAX;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (UIImageView)messageIcon;
- (UIImageView)nearbyIcon;
- (UILabel)accessibilityTitleLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)container;
- (UIView)iconContainer;
- (UIView)nearbyIconContainer;
- (UIView)ringView;
- (UIVisualEffectView)nearbyIconVisualEffectView;
- (_TtC12GameCenterUI17GKPickerGroupCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17GKPickerGroupCell)initWithFrame:(CGRect)a3;
- (_TtP12GameCenterUI22GKPickerGroupCellProxy_)groupCellDelegate;
- (void)awakeFromNib;
- (void)configureWithPlayers:(id)a3 title:(id)a4 subtitle:(id)a5 messagesGroupIdentifier:(id)a6 source:(int64_t)a7 playerSelectionProxy:(id)a8;
- (void)dealloc;
- (void)handleLongPressWithSender:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContainer:(id)a3;
- (void)setGroupCellDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconContainer:(id)a3;
- (void)setMessageIcon:(id)a3;
- (void)setNearbyIcon:(id)a3;
- (void)setNearbyIconContainer:(id)a3;
- (void)setNearbyIconVisualEffectView:(id)a3;
- (void)setRingView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GKPickerGroupCell

+ (NSString)reuseIdentifier
{
  return (NSString *)sub_1AF3E083C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupCell.reuseIdentifier.getter);
}

+ (NSString)reuseIdentifierAX
{
  return (NSString *)sub_1AF3E083C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupCell.reuseIdentifierAX.getter);
}

- (UIView)container
{
}

- (void)setContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E092C();
}

- (UIImageView)messageIcon
{
}

- (void)setMessageIcon:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0A0C();
}

- (UIView)iconContainer
{
}

- (void)setIconContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0AEC();
}

- (UIView)ringView
{
}

- (void)setRingView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0BCC();
}

- (UILabel)titleLabel
{
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0CAC();
}

- (UILabel)subtitleLabel
{
}

- (void)setSubtitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0D8C();
}

- (UIView)nearbyIconContainer
{
}

- (void)setNearbyIconContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0E6C();
}

- (UIVisualEffectView)nearbyIconVisualEffectView
{
}

- (void)setNearbyIconVisualEffectView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E0F4C();
}

- (UIImageView)nearbyIcon
{
}

- (void)setNearbyIcon:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF3E102C();
}

- (_TtP12GameCenterUI22GKPickerGroupCellProxy_)groupCellDelegate
{
  v2 = (void *)sub_1AF3E10D4();

  return (_TtP12GameCenterUI22GKPickerGroupCellProxy_ *)v2;
}

- (void)setGroupCellDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AF3E1180();
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1AF3E130C();
}

- (void)dealloc
{
  v2 = self;
  GKPickerGroupCell.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17GKPickerGroupCell_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17GKPickerGroupCell_playerGroupView));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12GameCenterUI17GKPickerGroupCell_groupCellDelegate;

  sub_1AF3E32DC((uint64_t)v3);
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 subtitle:(id)a5 messagesGroupIdentifier:(id)a6 source:(int64_t)a7 playerSelectionProxy:(id)a8
{
  sub_1AF378DB4();
  unint64_t v13 = sub_1AF7AE2B0();
  uint64_t v14 = sub_1AF7AE0E0();
  uint64_t v16 = v15;
  if (a5)
  {
    uint64_t v17 = sub_1AF7AE0E0();
    a5 = v18;
    if (a6)
    {
LABEL_3:
      uint64_t v19 = sub_1AF7AE0E0();
      a6 = v20;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
LABEL_6:
  v21 = self;
  swift_unknownObjectRetain();
  sub_1AF3E1A8C(v13, v14, v16, v17, (uint64_t)a5, v19, (uint64_t)a6, a7, a8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF3E1FF0((uint64_t)a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF3E20E4();
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF3E2590((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_1AF3E22A4(a3);
}

- (void)handleLongPressWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF3E245C(v4);
}

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF3E2590((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  id v4 = self;
  sub_1AF3E2620(a3);
}

- (UILabel)accessibilityTitleLabel
{
  v2 = (void *)sub_1AF3E269C();

  return (UILabel *)v2;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF3E26C8();
}

- (_TtC12GameCenterUI17GKPickerGroupCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17GKPickerGroupCell *)GKPickerGroupCell.init(frame:)();
}

- (_TtC12GameCenterUI17GKPickerGroupCell)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI17GKPickerGroupCell *)GKPickerGroupCell.init(coder:)(a3);
}

@end