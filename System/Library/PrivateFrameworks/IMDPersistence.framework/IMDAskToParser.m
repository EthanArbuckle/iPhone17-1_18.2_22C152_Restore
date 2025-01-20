@interface IMDAskToParser
- (BOOL)isValid;
- (IMDAskToParser)init;
- (IMDAskToParser)initWithUrl:(id)a3;
- (NSString)notificationText;
- (NSString)questionIdentifier;
- (NSString)summary;
@end

@implementation IMDAskToParser

- (IMDAskToParser)initWithUrl:(id)a3
{
  uint64_t v4 = sub_1AFC5683C(&qword_1E9AF7DD0);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1AFC71AA8();
    uint64_t v7 = sub_1AFC71AC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_1AFC71AC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (IMDAskToParser *)AskToParser.init(url:)((uint64_t)v6);
}

- (BOOL)isValid
{
  uint64_t v3 = sub_1AFC71AC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR___IMDAskToParser_url;
  uint64_t v8 = sub_1AFC5683C(&qword_1E9AF7DD0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AFC59B3C((uint64_t)v7, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) == 1)
  {
    sub_1AFC59BA4((uint64_t)v10);
    char v11 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v10, v3);
    v12 = self;
    char v11 = sub_1AFC71C98();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v11 & 1;
}

- (NSString)notificationText
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDAskToParser_payload);
  if (v2)
  {
    uint64_t v3 = self;
    uint64_t v4 = (void *)sub_1AFC71CC8();
    sub_1AFC71BF8();
    uint64_t v6 = v5;

    if (v6)
    {
      v2 = (void *)sub_1AFC71CF8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (NSString)summary
{
  return (NSString *)sub_1AFC5A184((char *)self, (uint64_t)a2, MEMORY[0x1E4F4E208]);
}

- (NSString)questionIdentifier
{
  return (NSString *)sub_1AFC5A184((char *)self, (uint64_t)a2, MEMORY[0x1E4F4E200]);
}

- (IMDAskToParser)init
{
  result = (IMDAskToParser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___IMDAskToParser_urlParser;
  uint64_t v4 = sub_1AFC71CB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = (char *)self + OBJC_IVAR___IMDAskToParser_url;
  sub_1AFC59BA4((uint64_t)v5);
}

@end