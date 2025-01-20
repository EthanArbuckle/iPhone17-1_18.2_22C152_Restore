@interface SCATBluetoothDevice
+ (id)scatBluetoothDeviceWithDevice:(BTDeviceImpl *)a3 accessoryManager:(BTAccessoryManagerImpl *)a4;
- (BOOL)_setPropertiesFromDevice:(BTDeviceImpl *)a3 error:(id *)a4;
- (BOOL)connected;
- (NSString)addressString;
- (NSString)name;
- (SCATBluetoothDevice)initWithDevice:(BTDeviceImpl *)a3;
- (id)description;
- (unint64_t)deviceType;
@end

@implementation SCATBluetoothDevice

+ (id)scatBluetoothDeviceWithDevice:(BTDeviceImpl *)a3 accessoryManager:(BTAccessoryManagerImpl *)a4
{
  memset(v27, 0, sizeof(v27));
  int AddressString = BTDeviceGetAddressString();
  if (AddressString)
  {
    int v6 = AddressString;
    v7 = SWCHLogHW();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100115204(v6, v7);
    }
LABEL_7:

LABEL_8:
    id v8 = 0;
    goto LABEL_9;
  }
  if (BTDeviceGetDeviceId())
  {
    v7 = SWCHLogHW();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10011519C();
    }
    goto LABEL_7;
  }
  int ConnectedServices = BTDeviceGetConnectedServices();
  v11 = SWCHLogHW();
  v12 = v11;
  if (ConnectedServices)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100115134();
    }

    goto LABEL_8;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v14 = v27;
    __int16 v15 = 1024;
    int v16 = 0;
    __int16 v17 = 1024;
    int v18 = 0;
    __int16 v19 = 1024;
    int v20 = 0;
    __int16 v21 = 1024;
    int v22 = 0;
    __int16 v23 = 1024;
    int v24 = 0;
    __int16 v25 = 1024;
    int v26 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Creating SCATBluetooth device for device with address %s source %x vendor %x pid %x version %x services %x switchsupport %d", buf, 0x30u);
  }

  id v8 = [objc_alloc((Class)objc_opt_class()) initWithDevice:a3];
LABEL_9:

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  if (self->_connected) {
    CFStringRef v4 = @"connected";
  }
  else {
    CFStringRef v4 = @"not connected";
  }
  return +[NSString stringWithFormat:@"<%@@%p: %@ (%@, %@)>", v3, self, self->_name, self->_addressString, v4];
}

- (BOOL)_setPropertiesFromDevice:(BTDeviceImpl *)a3 error:(id *)a4
{
  memset(v15, 0, sizeof(v15));
  int AddressString = BTDeviceGetAddressString();
  if (AddressString)
  {
    if (a4)
    {
LABEL_3:
      id v7 = +[NSError errorWithDomain:off_1001EEC78 code:AddressString userInfo:0];
      BOOL v8 = 0;
LABEL_4:
      *a4 = v7;
      return v8;
    }
    return 0;
  }
  v9 = +[NSString stringWithUTF8String:v15];
  v10 = self->_addressString;
  self->_addressString = v9;

  int AddressString = BTDeviceGetName();
  if (AddressString)
  {
    if (a4) {
      goto LABEL_3;
    }
    return 0;
  }
  v12 = +[NSString stringWithUTF8String:v15];
  name = self->_name;
  self->_name = v12;

  int ConnectedServices = BTDeviceGetConnectedServices();
  BOOL v8 = ConnectedServices == 0;
  if (!ConnectedServices)
  {
    self->_connected = 0;
    return v8;
  }
  if (a4)
  {
    id v7 = +[NSError errorWithDomain:off_1001EEC78 code:ConnectedServices userInfo:0];
    goto LABEL_4;
  }
  return v8;
}

- (SCATBluetoothDevice)initWithDevice:(BTDeviceImpl *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCATBluetoothDevice;
  CFStringRef v4 = [(SCATBluetoothDevice *)&v9 init];
  v5 = v4;
  if (!v4
    || (unsigned int v6 = [(SCATBluetoothDevice *)v4 _setPropertiesFromDevice:a3 error:0],
        id v7 = 0,
        v6))
  {
    id v7 = v5;
  }

  return v7;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (BOOL)connected
{
  return self->_connected;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)deviceType
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_addressString, 0);
}

@end