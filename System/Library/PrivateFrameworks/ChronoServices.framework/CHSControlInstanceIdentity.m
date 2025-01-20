@interface CHSControlInstanceIdentity
- (BOOL)isEqual:(id)a3;
- (CHSControlIdentity)control;
- (CHSControlInstanceIdentity)init;
- (CHSControlInstanceIdentity)initWithControl:(id)a3 contentType:(unint64_t)a4 hostIdentifier:(id)a5 configurationIdentifier:(id)a6;
- (NSString)configurationIdentifier;
- (NSString)hostIdentifier;
- (int64_t)hash;
- (unint64_t)contentType;
@end

@implementation CHSControlInstanceIdentity

- (CHSControlIdentity)control
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHSControlInstanceIdentity_control));
}

- (NSString)hostIdentifier
{
  return (NSString *)sub_190D10D68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHSControlInstanceIdentity_hostIdentifier);
}

- (NSString)configurationIdentifier
{
  return (NSString *)sub_190D10D68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHSControlInstanceIdentity_configurationIdentifier);
}

- (unint64_t)contentType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlInstanceIdentity_contentType);
}

- (CHSControlInstanceIdentity)initWithControl:(id)a3 contentType:(unint64_t)a4 hostIdentifier:(id)a5 configurationIdentifier:(id)a6
{
  if (!a5)
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = sub_190D41978();
  uint64_t v12 = v11;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_190D41978();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlInstanceIdentity_control) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlInstanceIdentity_contentType) = (Class)a4;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___CHSControlInstanceIdentity_hostIdentifier);
  uint64_t *v15 = v10;
  v15[1] = v12;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___CHSControlInstanceIdentity_configurationIdentifier);
  uint64_t *v16 = v13;
  v16[1] = v14;
  v19.receiver = self;
  v19.super_class = (Class)CHSControlInstanceIdentity;
  id v17 = a3;
  return [(CHSControlInstanceIdentity *)&v19 init];
}

- (CHSControlInstanceIdentity)init
{
  result = (CHSControlInstanceIdentity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = CHSControlInstanceIdentity.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = CHSControlInstanceIdentity.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

@end