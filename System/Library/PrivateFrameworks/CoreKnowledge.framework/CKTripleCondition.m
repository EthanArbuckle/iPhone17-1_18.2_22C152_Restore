@interface CKTripleCondition
+ (BOOL)supportsSecureCoding;
+ (id)havingPredicate:(id)a3 matchType:(int64_t)a4 error:(id *)a5;
+ (id)havingSubject:(id)a3 andAbject:(id)a4;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)evaluateOn:(id)a3;
- (CKTripleCondition)init;
- (CKTripleCondition)initWithCoder:(id)a3;
- (CKTripleCondition)initWithSubject:(id)a3 predicate:(id)a4 object:(id)a5;
- (CKTripleCondition)initWithValue:(BOOL)a3;
- (NSString)description;
- (id)and:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)or:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKTripleCondition

- (NSString)description
{
  return (NSString *)sub_1A77F27A0(self, (uint64_t)a2, (void (*)(void))sub_1A77F280C);
}

- (CKTripleCondition)initWithValue:(BOOL)a3
{
  return (CKTripleCondition *)CKTripleCondition.init(value:)(a3);
}

- (CKTripleCondition)initWithSubject:(id)a3 predicate:(id)a4 object:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v7 = sub_1A78317EC();
    uint64_t v9 = v8;
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    return (CKTripleCondition *)CKTripleCondition.init(subject:predicate:object:)(v7, v9, v6, v11, v12, v14);
  }
  uint64_t v7 = 0;
  uint64_t v9 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = sub_1A78317EC();
  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = sub_1A78317EC();
  uint64_t v14 = v13;
  return (CKTripleCondition *)CKTripleCondition.init(subject:predicate:object:)(v7, v9, v6, v11, v12, v14);
}

- (id)and:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1A77F4664();

  return v6;
}

- (id)or:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1A77F4774();

  return v6;
}

- (BOOL)evaluateOn:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  char v6 = sub_1A77F4884((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1A77F4A24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_1A77F4998);
}

+ (BOOL)supportsSecureCoding
{
  return static CKTripleCondition.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A77F4B78(v4);
}

- (CKTripleCondition)initWithCoder:(id)a3
{
  return (CKTripleCondition *)CKTripleCondition.init(coder:)(a3);
}

- (CKTripleCondition)init
{
}

- (void).cxx_destruct
{
}

+ (id)havingPredicate:(id)a3 matchType:(int64_t)a4 error:(id *)a5
{
  uint64_t v6 = sub_1A78317EC();
  static CKTripleCondition.havingPredicate(_:matchType:)(v6, v7, a4);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

+ (id)havingSubject:(id)a3 andAbject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  static CKTripleCondition.havingSubject(_:andAbject:)();
  uint64_t v8 = v7;

  return v8;
}

@end