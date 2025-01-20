@interface CRDTModelSync
- (NSString)debugDescription;
- (_TtC14bookdatastored13CRDTModelSync)init;
- (_TtC14bookdatastored13CRDTModelSync)initWithCloudData:(id)a3;
- (_TtC14bookdatastored13CRDTModelSync)initWithCoder:(id)a3;
- (_TtC14bookdatastored13CRDTModelSync)initWithRecord:(id)a3;
- (id)identifier;
- (id)recordType;
- (id)zoneName;
@end

@implementation CRDTModelSync

- (_TtC14bookdatastored13CRDTModelSync)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_type);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_protoData) = xmmword_100215AF0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(BCMutableCloudData *)&v6 init];
}

- (_TtC14bookdatastored13CRDTModelSync)initWithCloudData:(id)a3
{
  return (_TtC14bookdatastored13CRDTModelSync *)sub_100156AF4((uint64_t)a3);
}

- (_TtC14bookdatastored13CRDTModelSync)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_type);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_protoData) = xmmword_100215AF0;
  id v5 = a3;

  result = (_TtC14bookdatastored13CRDTModelSync *)sub_1001ECE90();
  __break(1u);
  return result;
}

- (_TtC14bookdatastored13CRDTModelSync)initWithRecord:(id)a3
{
  id v3 = a3;
  result = (_TtC14bookdatastored13CRDTModelSync *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_protoData);
  unint64_t v4 = *(void *)(&self->super._deletedFlag + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_protoData);
  sub_100081700(v3, v4);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_100156EF8();

  NSString v3 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)recordType
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_type);
  unint64_t v3 = *(void *)(&self->super._deletedFlag + OBJC_IVAR____TtC14bookdatastored13CRDTModelSync_type);
  unint64_t v4 = self;
  swift_bridgeObjectRetain();
  sub_1001EC530();
  uint64_t v5 = sub_1001EC3E0();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  sub_100152E34(15, v5, v7, v2, v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)identifier
{
  sub_100157138();
  if (v2)
  {
    NSString v3 = sub_1001EC340();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  return v3;
}

- (id)zoneName
{
  uint64_t v2 = self;
  swift_bridgeObjectRetain();
  NSString v3 = sub_1001EC340();

  swift_bridgeObjectRelease();
  return v3;
}

@end