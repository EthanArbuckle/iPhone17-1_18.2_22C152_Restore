@interface HomeAttributeTargetArea
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HomeAttributeTargetArea)initWithCoder:(id)a3;
- (HomeAttributeTargetArea)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation HomeAttributeTargetArea

- (NSString)description
{
  v2 = self;
  HomeAttributeTargetArea.description.getter();

  v3 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22E6D09B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = HomeAttributeTargetArea.isEqual(_:)((uint64_t)v8);

  sub_22E1AE3B4((uint64_t)v8);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HomeAttributeTargetArea)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v6 = sub_22E6D0140();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_22E6D0140();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_22E6D0140();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (HomeAttributeTargetArea *)HomeAttributeTargetArea.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (HomeAttributeTargetArea)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeAttributeTargetArea();
  return [(HomeAttributeTargetArea *)&v5 initWithCoder:a3];
}

@end