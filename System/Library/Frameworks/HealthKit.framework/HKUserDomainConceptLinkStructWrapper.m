@interface HKUserDomainConceptLinkStructWrapper
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptLinkStructWrapper)init;
- (HKUserDomainConceptLinkStructWrapper)initWithLink:(id)a3;
- (HKUserDomainConceptLinkStructWrapper)initWithTarget:(id)a3 type:(int64_t)a4;
- (NSString)description;
- (NSUUID)target;
- (int64_t)hash;
- (int64_t)type;
@end

@implementation HKUserDomainConceptLinkStructWrapper

- (HKUserDomainConceptLinkStructWrapper)initWithLink:(id)a3
{
  id v4 = a3;
  v5 = [v4 targetUUID];
  uint64_t v6 = [v4 type];

  v7 = [(HKUserDomainConceptLinkStructWrapper *)self initWithTarget:v5 type:v6];
  return v7;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value);
}

- (NSUUID)target
{
  uint64_t v3 = type metadata accessor for UserDomainConceptLinkStruct(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_19C2D9948();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C2920D8((uint64_t)self + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value, (uint64_t)v6);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, &v6[*(int *)(v4 + 28)], v7);
  v11 = (void *)sub_19C2D9908();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return (NSUUID *)v11;
}

- (HKUserDomainConceptLinkStructWrapper)initWithTarget:(id)a3 type:(int64_t)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_19C2D9948();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C2D9928();
  v11 = (int64_t *)((char *)self + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value);
  uint64_t v12 = type metadata accessor for UserDomainConceptLinkStruct(0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v11 + *(int *)(v12 + 20), v10, v7);
  int64_t *v11 = a4;
  v15.receiver = self;
  v15.super_class = ObjectType;
  uint64_t v13 = [(HKUserDomainConceptLinkStructWrapper *)&v15 init];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (NSString)description
{
  v2 = self;
  UserDomainConceptLinkStructWrapper.description.getter();

  uint64_t v3 = (void *)sub_19C2D9E98();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_19C2970BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))UserDomainConceptLinkStructWrapper.isEqual(_:));
}

- (int64_t)hash
{
  sub_19C2DA838();
  sub_19C2DA848();
  type metadata accessor for UserDomainConceptLinkStruct(0);
  sub_19C2D9948();
  sub_19C292A1C(&qword_1E93FAF18, MEMORY[0x1E4F27990]);
  uint64_t v3 = self;
  sub_19C2D9DE8();
  int64_t v4 = sub_19C2DA878();

  return v4;
}

- (HKUserDomainConceptLinkStructWrapper)init
{
  result = (HKUserDomainConceptLinkStructWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end