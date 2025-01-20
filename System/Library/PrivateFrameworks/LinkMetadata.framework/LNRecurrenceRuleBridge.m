@interface LNRecurrenceRuleBridge
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNRecurrenceRuleBridge)init;
- (LNRecurrenceRuleBridge)initWithCoder:(id)a3;
- (LNRecurrenceRuleBridge)initWithData:(id)a3;
- (NSData)data;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNRecurrenceRuleBridge

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  uint64_t v2 = LNRecurrenceRuleBridge.data.getter();
  unint64_t v4 = v3;
  v5 = (void *)sub_19CBBF2A0();
  sub_19CA2C5E0(v2, v4);
  return (NSData *)v5;
}

- (LNRecurrenceRuleBridge)initWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_19CBBF2D0();
  uint64_t v6 = v5;

  return (LNRecurrenceRuleBridge *)LNRecurrenceRuleBridge.init(data:)(v4, v6);
}

- (LNRecurrenceRuleBridge)initWithCoder:(id)a3
{
  return (LNRecurrenceRuleBridge *)LNRecurrenceRuleBridge.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LNRecurrenceRuleBridge.encode(with:)((NSCoder)v4);
}

- (LNRecurrenceRuleBridge)init
{
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_19CBBF890();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = LNRecurrenceRuleBridge.isEqual(_:)((uint64_t)v8);

  sub_19CB11B78((uint64_t)v8);
  return v6 & 1;
}

@end