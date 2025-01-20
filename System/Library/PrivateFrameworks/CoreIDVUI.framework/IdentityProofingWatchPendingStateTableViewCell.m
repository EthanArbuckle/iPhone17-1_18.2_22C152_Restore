@interface IdentityProofingWatchPendingStateTableViewCell
- (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)buttonClickedWithSender:(id)a3;
- (void)prepareForReuse;
@end

@implementation IdentityProofingWatchPendingStateTableViewCell

- (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_21F5515A0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell *)sub_21F4E0A54(v4, v5);
}

- (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F4E0CCC();
}

- (void)buttonClickedWithSender:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_21F47F790((uint64_t)v3);
    v3(v6);
    sub_21F47D8F8((uint64_t)v3);
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateTableViewCell();
  v2 = (char *)v5.receiver;
  [(IdentityProofingWatchPendingStateTableViewCell *)&v5 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  sub_21F47D8F8(v4);
}

- (void).cxx_destruct
{
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_subTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_button);
}

@end