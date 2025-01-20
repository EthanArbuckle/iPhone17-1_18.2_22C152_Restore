@interface TimelineIdentifier
- (BOOL)isEqual:(id)a3;
- (_TtC7SwiftUI18TimelineIdentifier)init;
- (int64_t)hash;
@end

@implementation TimelineIdentifier

- (_TtC7SwiftUI18TimelineIdentifier)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  UniqueID.init()();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7SwiftUI18TimelineIdentifier_identifier) = v7;

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [(TimelineIdentifier *)&v6 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = TimelineIdentifier.isEqual(_:)((uint64_t)v8);

  _sypSgWOhTm_10((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Any?);
  return v6;
}

- (int64_t)hash
{
  return Hasher.finalize()();
}

@end