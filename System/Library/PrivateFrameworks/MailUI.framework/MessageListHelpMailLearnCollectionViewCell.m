@interface MessageListHelpMailLearnCollectionViewCell
- (UIButton)cancelButton;
- (UIButton)helpMailLearnButton;
- (_TtC6MailUI42MessageListHelpMailLearnCollectionViewCell)initWithCoder:(id)a3;
- (_TtC6MailUI42MessageListHelpMailLearnCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation MessageListHelpMailLearnCollectionViewCell

- (UIButton)helpMailLearnButton
{
  v2 = self;
  id v5 = MessageListHelpMailLearnCollectionViewCell.helpMailLearnButton.getter();

  return (UIButton *)v5;
}

- (UIButton)cancelButton
{
  v2 = self;
  id v5 = MessageListHelpMailLearnCollectionViewCell.cancelButton.getter();

  return (UIButton *)v5;
}

- (_TtC6MailUI42MessageListHelpMailLearnCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI42MessageListHelpMailLearnCollectionViewCell *)sub_1DDE2241C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI42MessageListHelpMailLearnCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDE234F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListHelpMailLearnCollectionViewCell_helpMailLearnButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListHelpMailLearnCollectionViewCell_cancelButton));
}

@end