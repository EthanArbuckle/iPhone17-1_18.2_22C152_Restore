@interface ISComponentIdentifier
- (ISComponentIdentifier)init;
- (ISComponentIdentifier)initWithName:(int)a3 uuid:(id)a4;
- (NSUUID)uuid;
- (int)componentName;
@end

@implementation ISComponentIdentifier

- (ISComponentIdentifier)initWithName:(int)a3 uuid:(id)a4
{
  uint64_t v5 = sub_22AEA93B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v5, v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  v13 = (char *)&v18 - v12;
  sub_22AEA9398();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v13, v5);
  objc_allocWithZone((Class)sub_22AEA9678());
  v14 = self;
  *(Class *)((char *)&v14->super.isa + OBJC_IVAR___ISComponentIdentifier_componentIdentifier) = (Class)sub_22AEA9658();

  v15 = (objc_class *)type metadata accessor for ComponentIdentifierBridge();
  v18.receiver = v14;
  v18.super_class = v15;
  v16 = [(ISComponentIdentifier *)&v18 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
  return v16;
}

- (int)componentName
{
  v2 = self;
  int v3 = sub_22AEA9638();

  return v3;
}

- (NSUUID)uuid
{
  uint64_t v3 = sub_22AEA93B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_22AEA9668();

  uint64_t v9 = (void *)sub_22AEA9368();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSUUID *)v9;
}

- (ISComponentIdentifier)init
{
  result = (ISComponentIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end