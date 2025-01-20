@interface SearchFooterCell
- (_TtC11MobilePhone16SearchFooterCell)initWithCoder:(id)a3;
- (_TtC11MobilePhone16SearchFooterCell)initWithReuseIdentifier:(id)a3;
@end

@implementation SearchFooterCell

- (_TtC11MobilePhone16SearchFooterCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SearchFooterCell.init(coder:)();
}

- (_TtC11MobilePhone16SearchFooterCell)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC11MobilePhone16SearchFooterCell *)SearchFooterCell.init(reuseIdentifier:)(v3, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone16SearchFooterCell_footerLabel));
}

@end