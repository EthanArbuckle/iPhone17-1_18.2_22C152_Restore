@interface ActivityDigitalSeparationSharedResource
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (_TtC25ActivityDigitalSeparation39ActivityDigitalSeparationSharedResource)init;
- (int64_t)visibility;
@end

@implementation ActivityDigitalSeparationSharedResource

- (_TtC25ActivityDigitalSeparation39ActivityDigitalSeparationSharedResource)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC25ActivityDigitalSeparation39ActivityDigitalSeparationSharedResource_digitalSeparationFriends) = (Class)&_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityDigitalSeparationSharedResource();
  return [(ActivityDigitalSeparationSharedResource *)&v3 init];
}

- (NSString)displayName
{
  return (NSString *)0;
}

- (NSString)displayDetail
{
  return (NSString *)0;
}

- (NSArray)participants
{
  v2 = self;
  unint64_t v3 = swift_bridgeObjectRetain();
  sub_22B4(v3);

  swift_bridgeObjectRelease();
  sub_28E8((uint64_t *)&unk_116F0);
  v4.super.isa = sub_98D8().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (int64_t)visibility
{
  return 1;
}

- (void).cxx_destruct
{
}

@end