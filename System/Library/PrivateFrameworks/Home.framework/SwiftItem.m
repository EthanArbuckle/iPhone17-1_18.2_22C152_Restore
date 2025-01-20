@interface SwiftItem
- (_TtC4Home9SwiftItem)init;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation SwiftItem

- (id)_subclass_updateWithOptions:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_20BCE7520();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  v6 = (void *)sub_20BA13114(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC4Home9SwiftItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftItem();
  return [(SwiftItem *)&v3 init];
}

@end