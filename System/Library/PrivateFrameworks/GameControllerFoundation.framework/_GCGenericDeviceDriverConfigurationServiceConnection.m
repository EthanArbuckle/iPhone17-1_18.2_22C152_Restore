@interface _GCGenericDeviceDriverConfigurationServiceConnection
+ (id)serviceProtocol;
- (id)applyConfiguration:(id)a3;
- (id)fetchDeviceSnapshot;
@end

@implementation _GCGenericDeviceDriverConfigurationServiceConnection

+ (id)serviceProtocol
{
  return &unk_26BEED958;
}

- (id)fetchDeviceSnapshot
{
  return [(_GCDeviceDriverServiceConnection *)self serviceVendorRequestWithLabel:@"Fetch Device Snapshot" handler:&__block_literal_global_13];
}

- (id)applyConfiguration:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke;
  v7[3] = &unk_26BEC4D48;
  id v8 = a3;
  id v4 = v8;
  v5 = [(_GCDeviceDriverServiceConnection *)self serviceVendorRequestWithLabel:@"Apply Configuration" handler:v7];

  return v5;
}

@end