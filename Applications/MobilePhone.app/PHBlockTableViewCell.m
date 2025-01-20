@interface PHBlockTableViewCell
+ (NSString)reuseIdentifier;
- (PHBlockTableViewCell)initWithCoder:(id)a3;
- (PHBlockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)updateCellOfFlow:(int64_t)a3 isBlocked:(BOOL)a4 style:(int64_t)a5;
@end

@implementation PHBlockTableViewCell

+ (NSString)reuseIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (PHBlockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (PHBlockTableViewCell *)specialized BlockTableViewCell.init(style:reuseIdentifier:)();
}

- (PHBlockTableViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration;
  uint64_t v6 = type metadata accessor for UIListContentConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView) = 0;
  id v7 = a3;

  result = (PHBlockTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateCellOfFlow:(int64_t)a3 isBlocked:(BOOL)a4 style:(int64_t)a5
{
  BOOL v6 = a4;
  v8 = self;
  BlockTableViewCell.updateCell(flow:isBlocked:style:)(a3, v6, a5);
}

- (void).cxx_destruct
{
  outlined destroy of UIListContentConfiguration?((uint64_t)self + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView);
}

@end