@interface NFCTagReaderSessionDelegateSwiftWrapper
- (_TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper)init;
- (void)tagReaderSession:(id)a3 didDetectTags:(id)a4;
- (void)tagReaderSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)tagReaderSessionDidBecomeActive:(id)a3;
@end

@implementation NFCTagReaderSessionDelegateSwiftWrapper

- (void)tagReaderSessionDidBecomeActive:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate;
  if (MEMORY[0x223C83510]((char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 8);
    id v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)tagReaderSession:(id)a3 didInvalidateWithError:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate;
  if (MEMORY[0x223C83510]((char *)self + OBJC_IVAR____TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper_swiftDelegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, id, uint64_t, uint64_t))(v8 + 16);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
}

- (void)tagReaderSession:(id)a3 didDetectTags:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F525C0);
  unint64_t v6 = sub_2214FE9B0();
  id v7 = a3;
  uint64_t v8 = self;
  sub_2214E4BF0((unint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper)init
{
  result = (_TtC7CoreNFC39NFCTagReaderSessionDelegateSwiftWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end