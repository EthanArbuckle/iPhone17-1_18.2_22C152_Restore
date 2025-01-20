@interface HRUITextAndActionCell
- (HRUITextAndActionCell)initWithCoder:(id)a3;
- (HRUITextAndActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)actionTitle;
- (NSString)explanation;
- (UIButton)actionButton;
- (void)setActionTitle:(id)a3;
- (void)setExplanation:(id)a3;
@end

@implementation HRUITextAndActionCell

- (UIButton)actionButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HRUITextAndActionCell_actionButton));
}

- (NSString)explanation
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITextAndActionCell_explanation);
}

- (void)setExplanation:(id)a3
{
}

- (NSString)actionTitle
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITextAndActionCell_actionTitle);
}

- (void)setActionTitle:(id)a3
{
}

- (HRUITextAndActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (HRUITextAndActionCell *)TextAndActionCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRUITextAndActionCell)initWithCoder:(id)a3
{
  return (HRUITextAndActionCell *)sub_1C23B7CD0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end