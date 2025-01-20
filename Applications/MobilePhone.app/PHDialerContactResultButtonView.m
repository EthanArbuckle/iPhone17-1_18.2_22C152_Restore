@interface PHDialerContactResultButtonView
- (BOOL)showsLargeContentViewer;
- (NSString)largeContentTitle;
- (PHDialerContactResultButtonView)initWithCoder:(id)a3;
- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3;
- (PHDialerContactResultButtonView)initWithType:(int64_t)a3;
- (UILabel)primaryLabel;
- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4;
- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6;
- (void)handleContentSizeCategoryDidChange:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)shouldPrioritizeName;
- (void)shouldPrioritizeNumber;
@end

@implementation PHDialerContactResultButtonView

- (UILabel)primaryLabel
{
  v2 = self;
  id v3 = DialerContactResultButtonView.primaryLabel.getter();

  return (UILabel *)v3;
}

- (void)setPrimaryLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel) = (Class)a3;
  id v3 = a3;
}

- (PHDialerContactResultButtonView)initWithType:(int64_t)a3
{
  return (PHDialerContactResultButtonView *)DialerContactResultButtonView.init(type:)(a3);
}

- (PHDialerContactResultButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized DialerContactResultButtonView.init(coder:)();
}

- (void)shouldPrioritizeName
{
}

- (void)shouldPrioritizeNumber
{
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = DialerContactResultButtonView.primaryLabel.getter();
  [v9 setAttributedText:v6];

  id v10 = DialerContactResultButtonView.secondaryLabel.getter();
  [v10 setAttributedText:v7];
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6
{
  BOOL v6 = a6;
  if (a5)
  {
    id v10 = (objc_class *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    Swift::Bool v12 = v11;
  }
  else
  {
    id v10 = 0;
    Swift::Bool v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  v19.value.super.isa = (Class)a3;
  v19.is_nil = (char)a4;
  v20.value.super.isa = v10;
  v20.is_nil = v12;
  v16.value._countAndFlagsBits = v6;
  DialerContactResultButtonView.configure(primaryTitle:secondaryTitle:searchString:isNumberPriority:)(v19, v20, v16, v17);

  swift_bridgeObjectRelease();
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = self;
  DialerContactResultButtonView.handleContentSizeCategoryDidChange(_:)((uint64_t)v7);

  outlined destroy of Locale?((uint64_t)v7, &demangling cache variable for type metadata for Notification?);
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (NSString)largeContentTitle
{
  v2 = self;
  DialerContactResultButtonView.largeContentTitle.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3
{
  result = (PHDialerContactResultButtonView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel));
  outlined consume of UILabel??(*(id *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel));
  uint64_t v3 = (char *)self + OBJC_IVAR___PHDialerContactResultButtonView_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  NSString v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView);
}

@end