@interface DetermineIntent
- (DetermineIntent)init;
- (DetermineIntent)initWithCoder:(id)a3;
- (DetermineIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (DetermineIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation DetermineIntent

- (DetermineIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DetermineIntent();
  return [(DetermineIntent *)&v3 init];
}

- (DetermineIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DetermineIntent();
  return [(DetermineIntent *)&v5 initWithCoder:a3];
}

- (DetermineIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_2989C0();
    id v6 = a4;
    NSString v7 = sub_2989B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DetermineIntent();
  v9 = [(DetermineIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (DetermineIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_2989C0();
  sub_2989C0();
  if (a5) {
    a5 = (id)sub_298960();
  }
  NSString v7 = sub_2989B0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_2989B0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = sub_298950().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DetermineIntent();
  v10 = [(DetermineIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end