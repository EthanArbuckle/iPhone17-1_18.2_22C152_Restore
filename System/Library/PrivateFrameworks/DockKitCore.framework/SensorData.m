@interface SensorData
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore10SensorData)init;
- (_TtC11DockKitCore10SensorData)initWithCoder:(id)a3;
@end

@implementation SensorData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore10SensorData)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SensorData();
  return [(SensorData *)&v3 init];
}

- (_TtC11DockKitCore10SensorData)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SensorData();
  return [(SensorData *)&v4 init];
}

@end