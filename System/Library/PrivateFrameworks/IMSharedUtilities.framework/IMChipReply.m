@interface IMChipReply
- (IMChipReply)init;
- (IMChipReply)initWithDictionary:(id)a3;
- (IMChipReply)initWithSuggestion:(id)a3;
- (IMChipSuggestion)suggestion;
- (id)dictionaryRepresentation;
- (id)suggestedReplyBody;
@end

@implementation IMChipReply

- (IMChipSuggestion)suggestion
{
  return (IMChipSuggestion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___IMChipReply_suggestion));
}

- (IMChipReply)initWithSuggestion:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipReply_suggestion) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)IMChipReply;
  id v3 = a3;
  return [(IMChipReply *)&v5 init];
}

- (IMChipReply)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMChipReply *)IMChipReply.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = 0x6974736567677573;
  *(void *)(inited + 40) = 0xEA00000000006E6FLL;
  v4 = self;
  objc_super v5 = [(IMChipReply *)v4 suggestion];
  id v6 = [(IMChipSuggestion *)v5 dictionaryRepresentation];

  uint64_t v7 = sub_1A09F3D08();
  *(void *)(inited + 72) = sub_1A07856F8(&qword_1E94FDD10);
  *(void *)(inited + 48) = v7;
  sub_1A08D7480(inited);

  v8 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)suggestedReplyBody
{
  v2 = self;
  id v3 = sub_1A09B8194();

  return v3;
}

- (IMChipReply)init
{
  result = (IMChipReply *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end