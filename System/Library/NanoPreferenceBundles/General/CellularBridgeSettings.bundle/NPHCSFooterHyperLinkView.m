@interface NPHCSFooterHyperLinkView
- (UITextView)textView;
- (_TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView)initWithCoder:(id)a3;
- (_TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView)initWithReuseIdentifier:(id)a3;
- (void)configureContents;
- (void)setTextView:(id)a3;
@end

@implementation NPHCSFooterHyperLinkView

- (UITextView)textView
{
  id v2 = sub_119B8();

  return (UITextView *)v2;
}

- (void)setTextView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_11A24((uint64_t)v4);
}

- (_TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_12660();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView *)sub_11A38(v3, v4);
}

- (_TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView)initWithCoder:(id)a3
{
}

- (void)configureContents
{
  id v2 = self;
  sub_11BB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView_textView));
}

@end