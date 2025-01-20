@interface CKGenericCondition
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)evaluateOn:(id)a3;
- (CKGenericCondition)init;
- (CKGenericCondition)initWithCoder:(id)a3;
- (CKGenericCondition)initWithMatchType:(int64_t)a3 value:(id)a4 negated:(BOOL)a5;
- (CKGenericCondition)initWithValue:(BOOL)a3;
- (NSPredicate)predicate;
- (NSString)description;
- (id)and:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)or:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKGenericCondition

- (NSPredicate)predicate
{
  v2 = self;
  id v3 = sub_1A77F0F38();

  return (NSPredicate *)v3;
}

- (NSString)description
{
  return (NSString *)sub_1A77F27A0(self, (uint64_t)a2, (void (*)(void))sub_1A77F11A8);
}

- (CKGenericCondition)initWithValue:(BOOL)a3
{
  return (CKGenericCondition *)CKGenericCondition.init(value:)(a3);
}

- (CKGenericCondition)initWithMatchType:(int64_t)a3 value:(id)a4 negated:(BOOL)a5
{
  return (CKGenericCondition *)CKGenericCondition.init(_:value:negated:)();
}

- (id)and:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1A77F1508(v4);

  return v6;
}

- (id)or:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1A77F1618(v4);

  return v6;
}

- (BOOL)evaluateOn:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A77F19AC((uint64_t)v8);

  sub_1A77DA3E0((uint64_t)v8, &qword_1EB59FC90);
  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1A77F4A24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_1A77F1CC8);
}

+ (BOOL)supportsSecureCoding
{
  return static CKGenericCondition.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A77F1E64(v4);
}

- (CKGenericCondition)initWithCoder:(id)a3
{
  CKGenericCondition.init(coder:)(a3);
  return result;
}

- (CKGenericCondition)init
{
}

- (void).cxx_destruct
{
  sub_1A77F4504(*(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKGenericCondition_type), *(void **)&self->type[OBJC_IVAR___CKGenericCondition_type], *(void **)&self->type[OBJC_IVAR___CKGenericCondition_type + 8]);
  swift_bridgeObjectRelease();
}

@end