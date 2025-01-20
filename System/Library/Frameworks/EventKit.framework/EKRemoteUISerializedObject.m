@interface EKRemoteUISerializedObject
- (NSDictionary)objectIDToChangeSetDictionaryMap;
- (NSDictionary)objectIDToPersistentDictionaryMap;
- (NSDictionary)serializedObjectIDDictionary;
- (_TtC8EventKit26EKRemoteUISerializedObject)init;
@end

@implementation EKRemoteUISerializedObject

- (NSDictionary)serializedObjectIDDictionary
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A4F7AF18();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (NSDictionary)objectIDToChangeSetDictionaryMap
{
  return (NSDictionary *)sub_1A4F59FA0();
}

- (NSDictionary)objectIDToPersistentDictionaryMap
{
  return (NSDictionary *)sub_1A4F59FA0();
}

- (_TtC8EventKit26EKRemoteUISerializedObject)init
{
  result = (_TtC8EventKit26EKRemoteUISerializedObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end