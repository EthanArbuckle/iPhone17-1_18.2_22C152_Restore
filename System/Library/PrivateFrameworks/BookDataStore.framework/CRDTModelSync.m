@interface CRDTModelSync
- (NSString)debugDescription;
- (_TtC13BookDataStore13CRDTModelSync)init;
- (_TtC13BookDataStore13CRDTModelSync)initWithCloudData:(id)a3;
- (_TtC13BookDataStore13CRDTModelSync)initWithCoder:(id)a3;
- (_TtC13BookDataStore13CRDTModelSync)initWithRecord:(id)a3;
- (id)identifier;
- (id)recordType;
- (id)zoneName;
@end

@implementation CRDTModelSync

- (_TtC13BookDataStore13CRDTModelSync)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData) = xmmword_23620DFD0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(BCMutableCloudData *)&v6 init];
}

- (_TtC13BookDataStore13CRDTModelSync)initWithCloudData:(id)a3
{
  return (_TtC13BookDataStore13CRDTModelSync *)sub_23613A6B0((uint64_t)a3);
}

- (_TtC13BookDataStore13CRDTModelSync)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData) = xmmword_23620DFD0;
  id v5 = a3;

  result = (_TtC13BookDataStore13CRDTModelSync *)sub_2361FF0A8();
  __break(1u);
  return result;
}

- (_TtC13BookDataStore13CRDTModelSync)initWithRecord:(id)a3
{
  id v3 = a3;
  result = (_TtC13BookDataStore13CRDTModelSync *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData);
  unint64_t v4 = *(void *)(&self->super._deletedFlag + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData);
  sub_2361343FC(v3, v4);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_23613AAEC();

  uint64_t v3 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)recordType
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  unint64_t v3 = *(void *)(&self->super._deletedFlag + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  unint64_t v4 = self;
  swift_bridgeObjectRetain();
  sub_2361FEA08();
  uint64_t v5 = sub_2361FE938();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  sub_2361368C8(15, v5, v7, v2, v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)identifier
{
  sub_23613AD2C();
  if (v2)
  {
    unint64_t v3 = (void *)sub_2361FE8C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)zoneName
{
  uint64_t v2 = self;
  swift_bridgeObjectRetain();
  unint64_t v3 = (void *)sub_2361FE8C8();

  swift_bridgeObjectRelease();
  return v3;
}

@end