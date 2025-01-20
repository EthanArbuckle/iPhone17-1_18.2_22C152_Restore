@interface DSPeopleSharedResouce
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (_TtC29FindMyPeopleDigitalSeparation21DSPeopleSharedResouce)init;
- (int64_t)visibility;
@end

@implementation DSPeopleSharedResouce

- (_TtC29FindMyPeopleDigitalSeparation21DSPeopleSharedResouce)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation21DSPeopleSharedResouce_dsFriends) = (Class)&_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DSPeopleSharedResouce();
  return [(DSPeopleSharedResouce *)&v3 init];
}

- (NSArray)participants
{
  v2 = self;
  sub_926C();

  sub_6DF4(&qword_11CF0);
  v3.super.isa = sub_95C8().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (int64_t)visibility
{
  return 1;
}

- (NSString)displayName
{
  NSString v2 = sub_9548();

  return (NSString *)v2;
}

- (NSString)displayDetail
{
  return (NSString *)0;
}

- (void).cxx_destruct
{
}

@end