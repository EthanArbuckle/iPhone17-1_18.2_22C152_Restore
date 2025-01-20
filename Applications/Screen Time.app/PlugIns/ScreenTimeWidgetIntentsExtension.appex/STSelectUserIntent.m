@interface STSelectUserIntent
- (STSelectUserIntent)init;
- (STSelectUserIntent)initWithCoder:(id)a3;
- (STSelectUserIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (STSelectUserIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation STSelectUserIntent

- (STSelectUserIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STSelectUserIntent();
  return [(STSelectUserIntent *)&v3 init];
}

- (STSelectUserIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntent();
  return [(STSelectUserIntent *)&v5 initWithCoder:a3];
}

- (STSelectUserIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_100009090();
    id v6 = a4;
    NSString v7 = sub_100009080();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for STSelectUserIntent();
  v9 = [(STSelectUserIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (STSelectUserIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_100009090();
  sub_100009090();
  if (a5) {
    a5 = (id)sub_100009070();
  }
  NSString v7 = sub_100009080();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100009080();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = sub_100009060().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for STSelectUserIntent();
  v10 = [(STSelectUserIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end