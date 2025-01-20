@interface EmptyConfigurationINIntent
- (_TtC9WidgetKit26EmptyConfigurationINIntent)init;
- (_TtC9WidgetKit26EmptyConfigurationINIntent)initWithCoder:(id)a3;
- (_TtC9WidgetKit26EmptyConfigurationINIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (_TtC9WidgetKit26EmptyConfigurationINIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation EmptyConfigurationINIntent

- (_TtC9WidgetKit26EmptyConfigurationINIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmptyConfigurationINIntent();
  return [(EmptyConfigurationINIntent *)&v3 init];
}

- (_TtC9WidgetKit26EmptyConfigurationINIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmptyConfigurationINIntent();
  return [(EmptyConfigurationINIntent *)&v5 initWithCoder:a3];
}

- (_TtC9WidgetKit26EmptyConfigurationINIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_191CF5338();
    id v6 = a4;
    v7 = (void *)sub_191CF5318();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EmptyConfigurationINIntent();
  v9 = [(EmptyConfigurationINIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (_TtC9WidgetKit26EmptyConfigurationINIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_191CF5338();
  sub_191CF5338();
  if (a5) {
    a5 = (id)sub_191CF5248();
  }
  v7 = (void *)sub_191CF5318();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_191CF5318();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_191CF5238();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EmptyConfigurationINIntent();
  v10 = [(EmptyConfigurationINIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end