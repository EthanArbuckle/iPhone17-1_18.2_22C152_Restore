@interface DEStagingEntry
+ (BOOL)supportsSecureCoding;
- (NSData)payload;
- (_TtC8Dendrite14DEStagingEntry)init;
- (_TtC8Dendrite14DEStagingEntry)initWithCoder:(id)a3;
- (_TtC8Dendrite14DEStagingEntry)initWithId:(int64_t)a3 payload:(id)a4;
- (int64_t)id;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEStagingEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_24CA86230();
  objc_msgSend(v5, sel_encodeInt64_forKey_, v4, v7);

  v8 = (void *)sub_24CA86080();
  id v9 = (id)sub_24CA86230();
  objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);
}

- (_TtC8Dendrite14DEStagingEntry)initWithCoder:(id)a3
{
  return (_TtC8Dendrite14DEStagingEntry *)DEStagingEntry.init(coder:)(a3);
}

- (int64_t)id
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
}

- (NSData)payload
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  unint64_t v3 = *(void *)&self->id[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  sub_24CA497DC(v2, v3);
  uint64_t v4 = (void *)sub_24CA86080();
  sub_24CA4986C(v2, v3);
  return (NSData *)v4;
}

- (_TtC8Dendrite14DEStagingEntry)initWithId:(int64_t)a3 payload:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v8 = a4;
  uint64_t v9 = sub_24CA86090();
  uint64_t v11 = v10;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id) = (Class)a3;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  uint64_t *v12 = v9;
  v12[1] = v11;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return [(DEStagingEntry *)&v14 init];
}

- (_TtC8Dendrite14DEStagingEntry)init
{
  result = (_TtC8Dendrite14DEStagingEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end