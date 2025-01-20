@interface _GCGenericDeviceDBServiceConnection
+ (id)serviceProtocol;
- (id)hasModelForDevice:(id)a3;
- (id)preparedModelForDevice:(id)a3;
@end

@implementation _GCGenericDeviceDBServiceConnection

+ (id)serviceProtocol
{
  return &unk_26BEE8588;
}

- (id)hasModelForDevice:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke;
  v7[3] = &unk_26BEC4B18;
  id v8 = a3;
  id v4 = v8;
  v5 = [(GCConfigXPCServiceServiceConnection *)self serviceVendorRequestWithLabel:@"Has Model For Device" handler:v7];

  return v5;
}

- (id)preparedModelForDevice:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke;
  v7[3] = &unk_26BEC4B18;
  id v8 = a3;
  id v4 = v8;
  v5 = [(GCConfigXPCServiceServiceConnection *)self serviceVendorRequestWithLabel:@"Has Model For Device" handler:v7];

  return v5;
}

@end