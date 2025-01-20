@interface DiscoverHomeIntent
- (DiscoverHomeIntent)init;
- (DiscoverHomeIntent)initWithCoder:(id)a3;
- (DiscoverHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (DiscoverHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation DiscoverHomeIntent

- (DiscoverHomeIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  return [(DiscoverHomeIntent *)&v3 init];
}

- (DiscoverHomeIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  return [(DiscoverHomeIntent *)&v5 initWithCoder:a3];
}

- (DiscoverHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_22E6D0140();
    id v6 = a4;
    v7 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  v9 = [(DiscoverHomeIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (DiscoverHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_22E6D0140();
  sub_22E6D0140();
  if (a5) {
    a5 = (id)sub_22E6D0050();
  }
  v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  v10 = [(DiscoverHomeIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end