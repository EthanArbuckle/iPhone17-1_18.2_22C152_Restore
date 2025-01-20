@interface EKUICalendarsIntent
- (EKUICalendarsIntent)init;
- (EKUICalendarsIntent)initWithCoder:(id)a3;
- (EKUICalendarsIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (EKUICalendarsIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation EKUICalendarsIntent

- (EKUICalendarsIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  return [(EKUICalendarsIntent *)&v3 init];
}

- (EKUICalendarsIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  return [(EKUICalendarsIntent *)&v5 initWithCoder:a3];
}

- (EKUICalendarsIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_1DAF99800();
    id v6 = a4;
    v7 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  v9 = [(EKUICalendarsIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (EKUICalendarsIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1DAF99800();
  sub_1DAF99800();
  if (a5) {
    a5 = (id)sub_1DAF996B0();
  }
  v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  v10 = [(EKUICalendarsIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end