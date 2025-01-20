@interface DNDSMutableMeDeviceStore
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMeDeviceName:(id)a3;
- (void)setMeDeviceStatus:(id)a3;
@end

@implementation DNDSMutableMeDeviceStore

- (void)setMeDeviceStatus:(id)a3
{
  v4 = (NSNumber *)[a3 copy];
  meDeviceStatus = self->super._meDeviceStatus;
  self->super._meDeviceStatus = v4;
  MEMORY[0x1F41817F8](v4, meDeviceStatus);
}

- (void)setMeDeviceName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  meDeviceName = self->super._meDeviceName;
  self->super._meDeviceName = v4;
  MEMORY[0x1F41817F8](v4, meDeviceName);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSMeDeviceStore alloc];
  return [(DNDSMeDeviceStore *)v4 _initWithStore:self];
}

@end