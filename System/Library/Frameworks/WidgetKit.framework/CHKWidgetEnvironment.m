@interface CHKWidgetEnvironment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHKWidgetEnvironment)init;
- (CHKWidgetEnvironment)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHKWidgetEnvironment

- (CHKWidgetEnvironment)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___CHKWidgetEnvironment_tuples;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_191B2D144(MEMORY[0x1E4FBC860]);

  if (qword_1EB44BCA0 != -1) {
    swift_once();
  }
  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(CHKWidgetEnvironment *)&v7 init];
}

- (NSString)debugDescription
{
  v2 = self;
  WidgetEnvironment.Storage.debugDescription.getter();

  v3 = (void *)sub_191CF5318();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHKWidgetEnvironment)initWithCoder:(id)a3
{
  return (CHKWidgetEnvironment *)WidgetEnvironment.Storage.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  WidgetEnvironment.Storage.encode(with:)((NSCoder)v4);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = WidgetEnvironment.Storage.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_191CF5C58();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = WidgetEnvironment.Storage.isEqual(_:)((uint64_t)v8);

  sub_191B01770((uint64_t)v8, (uint64_t *)&unk_1EB44BC90);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end