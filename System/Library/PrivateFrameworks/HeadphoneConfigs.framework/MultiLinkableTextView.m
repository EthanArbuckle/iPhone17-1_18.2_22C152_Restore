@interface MultiLinkableTextView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (NSString)action;
- (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)refreshContentsWith:(id)a3;
@end

@implementation MultiLinkableTextView

- (NSString)action
{
  v2 = self;
  sub_1E4CAE348();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7 = sub_1E4CBE910();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4CBE8F0();
  id v11 = a3;
  v12 = self;
  id v13 = sub_1E4CAE194();
  if (!v13) {
    goto LABEL_4;
  }
  v14 = v13;
  BOOL result = sub_1E4CAE348();
  if (v16)
  {
    v17 = (NSString *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    SEL v18 = NSSelectorFromString(v17);

    objc_msgSend(v14, sel_performSelector_withObject_, v18, v12);
    id v19 = v14;
LABEL_4:

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return 0;
  }
  __break(1u);
  return result;
}

- (void)refreshContentsWith:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  sub_1E4CAE188();
  v5 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  [(MultiLinkableTextView *)v8 setText:v5];

  sub_1E4CAE3E8();
  v6 = (NSString *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();
  NSRange v7 = NSRangeFromString(v6);

  *(NSRange *)((char *)&v8->super.super.super.super.super.isa
             + OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange) = v7;
  sub_1E4CADBB4();
}

- (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange);
  *id v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  BOOL result = (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  BOOL result = (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier));
}

@end