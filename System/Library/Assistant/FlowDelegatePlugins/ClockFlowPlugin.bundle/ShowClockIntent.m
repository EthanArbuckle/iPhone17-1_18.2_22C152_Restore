@interface ShowClockIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (ShowClockIntent)init;
- (ShowClockIntent)initWithCoder:(id)a3;
- (ShowClockIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ShowClockIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ShowClockIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (ShowClockIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShowClockIntent();
  return [(ShowClockIntent *)&v3 init];
}

- (ShowClockIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShowClockIntent();
  return [(ShowClockIntent *)&v5 initWithCoder:a3];
}

- (ShowClockIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_18460();
    id v6 = a4;
    NSString v7 = sub_18450();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ShowClockIntent();
  v9 = [(ShowClockIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (ShowClockIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_18460();
  sub_18460();
  if (a5) {
    a5 = (id)sub_18420();
  }
  NSString v7 = sub_18450();
  swift_bridgeObjectRelease();
  NSString v8 = sub_18450();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = sub_18410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ShowClockIntent();
  v10 = [(ShowClockIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end