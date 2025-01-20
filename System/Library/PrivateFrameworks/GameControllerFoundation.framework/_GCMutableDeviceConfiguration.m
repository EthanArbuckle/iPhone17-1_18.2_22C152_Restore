@interface _GCMutableDeviceConfiguration
- (id)_initWithIdentifier:(id)a3 attributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setDeviceBuilderIdentifier:(id)a3;
- (void)setDeviceDependencies:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setTransient:(BOOL)a3;
- (void)setValue:(id)a3 forAttribute:(id)a4;
@end

@implementation _GCMutableDeviceConfiguration

- (id)_initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 mutableCopy];
  v10.receiver = self;
  v10.super_class = (Class)_GCMutableDeviceConfiguration;
  id v8 = [(_GCDeviceConfiguration *)&v10 _initWithIdentifier:v6 attributes:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_GCDeviceConfiguration alloc];
  identifier = self->super._identifier;
  id v6 = (void *)[(NSDictionary *)self->super._attributes copy];
  id v7 = [(_GCDeviceConfiguration *)v4 _initWithIdentifier:identifier attributes:v6];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [_GCMutableDeviceConfiguration alloc];
  identifier = self->super._identifier;
  attributes = self->super._attributes;

  return [(_GCMutableDeviceConfiguration *)v4 _initWithIdentifier:identifier attributes:attributes];
}

- (void)setValue:(id)a3 forAttribute:(id)a4
{
}

- (void)setIdentifier:(id)a3
{
  self->super._identifier = [a3 copyWithZone:0];

  MEMORY[0x270F9A758]();
}

- (void)setTransient:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(_GCMutableDeviceConfiguration *)self setValue:v4 forAttribute:@"Transient"];
}

- (void)setPriority:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(_GCMutableDeviceConfiguration *)self setValue:v4 forAttribute:@"Priority"];
}

- (void)setDeviceIdentifier:(id)a3
{
  id v4 = (id)[a3 copyWithZone:0];
  [(_GCMutableDeviceConfiguration *)self setValue:v4 forAttribute:@"DeviceIdentifier"];
}

- (void)setDeviceDependencies:(id)a3
{
  id v4 = (id)[a3 copy];
  [(_GCMutableDeviceConfiguration *)self setValue:v4 forAttribute:@"DeviceDependencies"];
}

- (void)setDeviceBuilderIdentifier:(id)a3
{
  id v4 = (id)[a3 copyWithZone:0];
  [(_GCMutableDeviceConfiguration *)self setValue:v4 forAttribute:@"DeviceBuilderIdentifier"];
}

@end