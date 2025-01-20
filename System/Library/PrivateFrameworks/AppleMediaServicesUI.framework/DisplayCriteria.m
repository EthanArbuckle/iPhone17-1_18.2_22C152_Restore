@interface DisplayCriteria
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (_TtC14amsengagementd15DisplayCriteria)init;
- (_TtC14amsengagementd15DisplayCriteria)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DisplayCriteria

+ (BOOL)supportsSecureCoding
{
  return sub_1001545CC() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10015461C(v4);
}

- (_TtC14amsengagementd15DisplayCriteria)initWithCoder:(id)a3
{
  return (_TtC14amsengagementd15DisplayCriteria *)sub_1001547C0(a3);
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
  char v6 = sub_100154A54((uint64_t)v8);

  sub_100027BD8((uint64_t)v8, &qword_10022F490);
  return v6 & 1;
}

- (_TtC14amsengagementd15DisplayCriteria)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end