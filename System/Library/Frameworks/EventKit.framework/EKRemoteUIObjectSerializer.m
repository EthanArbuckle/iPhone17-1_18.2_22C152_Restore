@interface EKRemoteUIObjectSerializer
- (_TtC8EventKit26EKRemoteUIObjectSerializer)init;
- (id)deserializedRepresentationWithSerializedDictionary:(id)a3 objectIDToChangeSetDictionaryMap:(id)a4 objectIDToPersistentDictionaryMap:(id)a5 eventStore:(id)a6 occurrenceDate:(id)a7;
- (id)serializedRepresentationWithEkObject:(id)a3;
- (id)serializedRepresentationWithEkObject:(id)a3 obfuscateKeyProperties:(BOOL)a4;
@end

@implementation EKRemoteUIObjectSerializer

- (id)serializedRepresentationWithEkObject:(id)a3 obfuscateKeyProperties:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = MEMORY[0x1E4FBC868];
  id v17 = (id)MEMORY[0x1E4FBC868];
  id v6 = a3;
  v7 = self;
  uint64_t v8 = sub_1A4F5A980(v6, v4, &v17, &v16);
  uint64_t v10 = v16;
  id v9 = v17;
  v11 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v8;
  *(void *)&v12[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v9;
  *(void *)&v12[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v10;
  v15.receiver = v12;
  v15.super_class = v11;
  v13 = [(EKRemoteUIObjectSerializer *)&v15 init];

  return v13;
}

- (id)serializedRepresentationWithEkObject:(id)a3
{
  uint64_t v14 = MEMORY[0x1E4FBC868];
  id v15 = (id)MEMORY[0x1E4FBC868];
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1A4F5A980(v4, 0, &v15, &v14);
  uint64_t v8 = v14;
  id v7 = v15;
  id v9 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v6;
  *(void *)&v10[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v7;
  *(void *)&v10[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v8;
  v13.receiver = v10;
  v13.super_class = v9;
  v11 = [(EKRemoteUIObjectSerializer *)&v13 init];

  return v11;
}

- (id)deserializedRepresentationWithSerializedDictionary:(id)a3 objectIDToChangeSetDictionaryMap:(id)a4 objectIDToPersistentDictionaryMap:(id)a5 eventStore:(id)a6 occurrenceDate:(id)a7
{
  v22 = self;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96646F0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1A4F7AF38();
  sub_1A4F68994(0, &qword_1E96646F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664700);
  sub_1A4F68938(&qword_1E9664708, &qword_1E96646F8);
  uint64_t v13 = sub_1A4F7AF38();
  uint64_t v14 = sub_1A4F7AF38();
  if (a7)
  {
    sub_1A4F7AEC8();
    uint64_t v15 = sub_1A4F7AED8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_1A4F7AED8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  id v17 = a6;
  v18 = v22;
  id v19 = EKRemoteUIObjectSerializer.deserializedRepresentation(serializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:)(v12, v13, v14, v17, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A4F68B34((uint64_t)v11, &qword_1E96646F0);

  return v19;
}

- (_TtC8EventKit26EKRemoteUIObjectSerializer)init
{
  return (_TtC8EventKit26EKRemoteUIObjectSerializer *)EKRemoteUIObjectSerializer.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end