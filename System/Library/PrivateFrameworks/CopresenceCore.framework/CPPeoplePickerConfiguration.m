@interface CPPeoplePickerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPPeoplePickerConfiguration)init;
- (CPPeoplePickerConfiguration)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPPeoplePickerConfiguration

- (CPPeoplePickerConfiguration)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPPeoplePickerConfiguration_shareSheetSessionID);
  v4 = (objc_class *)type metadata accessor for PeoplePickerConfiguration();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(CPPeoplePickerConfiguration *)&v6 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PeoplePickerConfiguration.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  Hasher.init()();
  v3 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  v4 = self;
  v3();
  if (v5)
  {
    Hasher._combine(_:)(1u);
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Swift::Int v6 = Hasher.finalize()();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPeoplePickerConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (CPPeoplePickerConfiguration *)specialized PeoplePickerConfiguration.init(coder:)();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  id v5 = a3;
  Swift::Int v6 = self;
  uint64_t v7 = v4();
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1B3EA1B00](v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = (id)MEMORY[0x1B3EA1B00](0xD000000000000013, 0x80000001B11622D0);
  objc_msgSend(v5, sel_encodeObject_forKey_, v9, v10);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
}

@end