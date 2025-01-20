@interface NextEventComplicationConfigurationIntent
- (NextEventComplicationConfigurationIntent)init;
- (NextEventComplicationConfigurationIntent)initWithCoder:(id)a3;
- (NextEventComplicationConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (NextEventComplicationConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation NextEventComplicationConfigurationIntent

- (NextEventComplicationConfigurationIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  return [(NextEventComplicationConfigurationIntent *)&v3 init];
}

- (NextEventComplicationConfigurationIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  return [(NextEventComplicationConfigurationIntent *)&v5 initWithCoder:a3];
}

- (NextEventComplicationConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_1000098E0();
    id v6 = a4;
    NSString v7 = sub_1000098D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  v9 = [(NextEventComplicationConfigurationIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (NextEventComplicationConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1000098E0();
  sub_1000098E0();
  if (a5) {
    a5 = (id)sub_1000098C0();
  }
  NSString v7 = sub_1000098D0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000098D0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = sub_1000098B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  v10 = [(NextEventComplicationConfigurationIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end