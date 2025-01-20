@interface EKRemoteUIDeserializedObject
- (EKObject)deserializedObject;
- (NSDictionary)tempObjectIDMap;
- (_TtC8EventKit28EKRemoteUIDeserializedObject)init;
@end

@implementation EKRemoteUIDeserializedObject

- (EKObject)deserializedObject
{
  return (EKObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject));
}

- (NSDictionary)tempObjectIDMap
{
  sub_1A4F68994(0, &qword_1E96646F8);
  sub_1A4F68938(&qword_1E9664708, &qword_1E96646F8);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A4F7AF18();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (_TtC8EventKit28EKRemoteUIDeserializedObject)init
{
  result = (_TtC8EventKit28EKRemoteUIDeserializedObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject));

  swift_bridgeObjectRelease();
}

@end