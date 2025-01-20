@interface ABSBarButtonItem
- (BOOL)isEnabled;
- (NSString)title;
- (_TtC8Business16ABSBarButtonItem)init;
- (_TtC8Business16ABSBarButtonItem)initWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation ABSBarButtonItem

- (NSString)title
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  id v2 = v7.receiver;
  v3 = [(ABSBarButtonItem *)&v7 title];
  if (v3)
  {
    v4 = v3;
    sub_1000BBAC8();

    NSString v5 = sub_1000BBA88();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1000BBAC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = self;
  sub_100075F4C(v4, v6);
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  return [(ABSBarButtonItem *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1000760E4(a3);
}

- (_TtC8Business16ABSBarButtonItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  return [(ABSBarButtonItem *)&v3 init];
}

- (_TtC8Business16ABSBarButtonItem)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  return [(ABSBarButtonItem *)&v5 initWithCoder:a3];
}

@end