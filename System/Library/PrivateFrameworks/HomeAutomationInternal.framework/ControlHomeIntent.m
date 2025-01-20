@interface ControlHomeIntent
- (BOOL)isEqual:(id)a3;
- (ControlHomeIntent)init;
- (ControlHomeIntent)initWithCoder:(id)a3;
- (ControlHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ControlHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ControlHomeIntent

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
  char v6 = ControlHomeIntent.isEqual(_:)((uint64_t)v8);

  sub_22E1AE3B4((uint64_t)v8);
  return v6 & 1;
}

- (ControlHomeIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ControlHomeIntent();
  return [(ControlHomeIntent *)&v3 init];
}

- (ControlHomeIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlHomeIntent();
  return [(ControlHomeIntent *)&v5 initWithCoder:a3];
}

- (ControlHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  v11.super_class = (Class)type metadata accessor for ControlHomeIntent();
  v9 = [(ControlHomeIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (ControlHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
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
  v12.super_class = (Class)type metadata accessor for ControlHomeIntent();
  v10 = [(ControlHomeIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end