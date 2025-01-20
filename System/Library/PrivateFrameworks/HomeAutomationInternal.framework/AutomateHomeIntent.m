@interface AutomateHomeIntent
- (AutomateHomeIntent)init;
- (AutomateHomeIntent)initWithCoder:(id)a3;
- (AutomateHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (AutomateHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
- (NSString)description;
@end

@implementation AutomateHomeIntent

- (NSString)description
{
  return (NSString *)sub_22E697894(self, (uint64_t)a2, (void (*)(void))AutomateHomeIntent.description.getter);
}

- (AutomateHomeIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  return [(AutomateHomeIntent *)&v3 init];
}

- (AutomateHomeIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  return [(AutomateHomeIntent *)&v5 initWithCoder:a3];
}

- (AutomateHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  v11.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  v9 = [(AutomateHomeIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (AutomateHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
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
  v12.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  v10 = [(AutomateHomeIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end