@interface CKShareBlockedIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKShareBlockedIdentity)init;
- (CKShareBlockedIdentity)initWithCoder:(id)a3;
- (CKShareBlockedIdentity)initWithUserIdentity:(id)a3;
- (CKUserIdentity)userIdentity;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKShareBlockedIdentity

- (CKShareBlockedIdentity)init
{
  return (CKShareBlockedIdentity *)sub_18AF547BC();
}

- (CKShareBlockedIdentity)initWithUserIdentity:(id)a3
{
  return (CKShareBlockedIdentity *)CKShareBlockedIdentity.init(userIdentity:)((uint64_t)a3);
}

- (CKUserIdentity)userIdentity
{
  id v2 = CKShareBlockedIdentity.userIdentity.getter();

  return (CKUserIdentity *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CKShareBlockedIdentity.encode(with:)((NSCoder)v4);
}

- (CKShareBlockedIdentity)initWithCoder:(id)a3
{
  return (CKShareBlockedIdentity *)CKShareBlockedIdentity.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  CKShareBlockedIdentity.copy(with:)((char *)v3, v6);

  sub_18AF25FCC(v6, (uint64_t)v6[3]);
  id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18AF40A30((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = CKShareBlockedIdentity.isEqual(_:)((uint64_t)v8);

  sub_18AF551C4((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  id v2 = self;
  uint64_t v3 = CKShareBlockedIdentity.description.getter();
  uint64_t v5 = v4;

  char v6 = (void *)MEMORY[0x18C128F60](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end