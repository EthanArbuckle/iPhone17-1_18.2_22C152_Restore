@interface HRAccountTimelineButtonCell
+ (NSString)reuseIdentifier;
- (BOOL)roundBottomCorners;
- (HRAccountTimelineButtonCell)initWithCoder:(id)a3;
- (HRAccountTimelineButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)buttonText;
- (NSString)explanationText;
- (void)prepareForReuse;
- (void)setButtonText:(id)a3;
- (void)setExplanationText:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setRoundBottomCorners:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRAccountTimelineButtonCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (NSString)buttonText
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRAccountTimelineButtonCell_buttonText);
}

- (void)setButtonText:(id)a3
{
}

- (NSString)explanationText
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRAccountTimelineButtonCell_explanationText);
}

- (void)setExplanationText:(id)a3
{
}

- (BOOL)roundBottomCorners
{
  v2 = (BOOL *)self + OBJC_IVAR___HRAccountTimelineButtonCell_roundBottomCorners;
  swift_beginAccess();
  return *v2;
}

- (void)setRoundBottomCorners:(BOOL)a3
{
  v4 = self;
  sub_1C2376960(a3);
}

- (HRAccountTimelineButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRAccountTimelineButtonCell *)sub_1C2377110((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))AccountTimelineButtonCell.init(style:reuseIdentifier:));
}

- (HRAccountTimelineButtonCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C237862C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C23778EC(a3);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountTimelineButtonCell();
  id v2 = v6.receiver;
  [(HRAccountTimelineButtonCell *)&v6 prepareForReuse];
  id v3 = sub_1C2376B9C();
  objc_msgSend(v3, sel_setText_, 0, v6.receiver, v6.super_class);

  id v4 = sub_1C2376CFC();
  objc_msgSend(v4, sel_setText_, 0);

  id v5 = sub_1C2376E80();
  sub_1C254FE80();
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  id v5 = self;
  sub_1C23786FC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___buttonLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___explanationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___separatorView));
  swift_bridgeObjectRelease();
}

@end