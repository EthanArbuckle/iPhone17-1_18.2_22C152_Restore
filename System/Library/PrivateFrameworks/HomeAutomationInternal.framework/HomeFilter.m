@interface HomeFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HomeFilter)initWithCoder:(id)a3;
- (HomeFilter)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
- (int64_t)hash;
@end

@implementation HomeFilter

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = HomeFilter.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_22E329BAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))HomeFilter.isEqual(_:));
}

- (NSString)description
{
  v2 = self;
  HomeFilter.description.getter();

  int64_t v3 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HomeFilter)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
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
  return (HomeFilter *)HomeFilter.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (HomeFilter)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeFilter();
  return [(HomeFilter *)&v5 initWithCoder:a3];
}

@end