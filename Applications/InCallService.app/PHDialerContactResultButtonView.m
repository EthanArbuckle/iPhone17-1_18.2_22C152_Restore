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
- (void)setLargeContentTitle:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)shouldPrioritizeName;
- (void)shouldPrioritizeNumber;
@end

@implementation PHDialerContactResultButtonView

- (UILabel)primaryLabel
{
  v2 = self;
  id v3 = sub_10019D0D0();

  return (UILabel *)v3;
}

- (void)setPrimaryLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10019D18C((uint64_t)v4);
}

- (PHDialerContactResultButtonView)initWithType:(int64_t)a3
{
  return (PHDialerContactResultButtonView *)sub_10019D6B4(a3);
}

- (PHDialerContactResultButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10019DD08();
}

- (void)shouldPrioritizeName
{
  v2 = self;
  sub_10019DE68(1000.0, 750.0);
}

- (void)shouldPrioritizeNumber
{
  v2 = self;
  sub_10019DE68(750.0, 1000.0);
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10019DF64((uint64_t)a3, (uint64_t)a4);
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6
{
  if (a5)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_10019E558(a3, (uint64_t)a4, v10, v12, a6);

  swift_bridgeObjectRelease();
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = sub_10011EB3C(&qword_1003219E8);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for Notification();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    uint64_t v10 = 1;
  }
  sub_10011EB80((uint64_t)v8, v10, 1, v9);
  uint64_t v11 = self;
  sub_10019E6D0((uint64_t)v8);

  sub_10013FAFC((uint64_t)v8, &qword_1003219E8);
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (NSString)largeContentTitle
{
  v2 = self;
  sub_10019EA28();
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

- (void)setLargeContentTitle:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v4 = self;
  sub_10019EBD4();
}

- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel));
  sub_10012E7B4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel));
  uint64_t v3 = (char *)self + OBJC_IVAR___PHDialerContactResultButtonView_logger;
  type metadata accessor for Logger();
  sub_10013FC1C();
  (*(void (**)(char *))(v4 + 8))(v3);
  NSString v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView);
}

@end