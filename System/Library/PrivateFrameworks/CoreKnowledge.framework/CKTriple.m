@interface CKTriple
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKTriple)init;
- (CKTriple)initWithCoder:(id)a3;
- (CKTriple)initWithSubject:(id)a3 predicate:(id)a4 object:(id)a5 weight:(int64_t)a6;
- (NSString)description;
- (NSString)object;
- (NSString)predicate;
- (NSString)subject;
- (int64_t)hash;
- (int64_t)weight;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKTriple

- (NSString)subject
{
  return (NSString *)sub_1A77E4F5C(self, (uint64_t)a2, (void (*)(void))sub_1A77E4DF0);
}

- (NSString)predicate
{
  return (NSString *)sub_1A77E4F5C(self, (uint64_t)a2, (void (*)(void))sub_1A77E4E44);
}

- (NSString)object
{
  return (NSString *)sub_1A77E4F5C(self, (uint64_t)a2, (void (*)(void))sub_1A77E4EB4);
}

- (int64_t)weight
{
  return sub_1A77E4F30();
}

- (NSString)description
{
  return (NSString *)sub_1A77E4F5C(self, (uint64_t)a2, (void (*)(void))sub_1A77E4FCC);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1A77E51A0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A77E5278((uint64_t)v8);

  sub_1A77B9DB8((uint64_t)v8);
  return v6 & 1;
}

- (CKTriple)initWithSubject:(id)a3 predicate:(id)a4 object:(id)a5 weight:(int64_t)a6
{
  uint64_t v7 = sub_1A78317EC();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A78317EC();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1A78317EC();
  return (CKTriple *)CKTriple.init(subject:predicate:object:weight:)(v7, v9, v10, v12, v13, v14, a6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A77E579C(v4);
}

- (CKTriple)initWithCoder:(id)a3
{
  return (CKTriple *)CKTriple.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKTriple)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end