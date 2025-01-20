@interface MetricsSequence
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared15MetricsSequence)init;
- (_TtC13CoreIDVShared15MetricsSequence)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MetricsSequence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared15MetricsSequence)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC13CoreIDVShared15MetricsSequence__sequence;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA842338);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MetricsSequence *)&v7 init];
}

- (_TtC13CoreIDVShared15MetricsSequence)initWithCoder:(id)a3
{
  return (_TtC13CoreIDVShared15MetricsSequence *)MetricsSequence.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  MetricsSequence.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
}

@end