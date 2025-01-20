@interface MultiLinkableFooterView
+ (NSString)footerLinkActionsKey;
+ (NSString)footerLinkRangesKey;
+ (NSString)footerLinkReuseIDKey;
+ (NSString)footerLinkStringsKey;
+ (NSString)footerLinkTargetsKey;
- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithReuseIdentifier:(id)a3;
- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)refreshContentsWithSpecifier:(id)a3;
@end

@implementation MultiLinkableFooterView

+ (NSString)footerLinkStringsKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

+ (NSString)footerLinkTargetsKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

+ (NSString)footerLinkActionsKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

+ (NSString)footerLinkRangesKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

+ (NSString)footerLinkReuseIDKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  return (_TtC16HeadphoneConfigs23MultiLinkableFooterView *)MultiLinkableFooterView.init(specifier:)(a3);
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  [(MultiLinkableFooterView *)v5 setNeedsLayout];
  [(MultiLinkableFooterView *)v5 layoutIfNeeded];
}

- (double)preferredHeightForWidth:(double)a3
{
  v3 = self;
  id v4 = sub_1E4CAE9AC();
  objc_msgSend(v4, sel_intrinsicContentSize);
  double v6 = v5;

  return v6;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v5 = a4;
  double v6 = self;
  id v7 = sub_1E4CAE9AC();
  objc_msgSend(v7, sel_intrinsicContentSize);
  double v9 = v8;

  return v9;
}

- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_heightConstraints) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container) = 0;
  id v4 = a3;

  result = (_TtC16HeadphoneConfigs23MultiLinkableFooterView *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithReuseIdentifier:(id)a3
{
  result = (_TtC16HeadphoneConfigs23MultiLinkableFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container);
}

@end