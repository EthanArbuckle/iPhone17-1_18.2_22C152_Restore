@interface DADeviceWatchProxy
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (DADeviceConnectionWatchProxy)connection;
- (DADeviceDelegate)delegate;
- (DADeviceState)state;
- (DADeviceWatchProxy)initWithNanoDevice:(id)a3;
- (NRDevice)nrDevice;
- (NSString)description;
- (id)_IMEI;
- (id)_caseSize;
- (id)_deviceAttributes;
- (id)_deviceClass;
- (id)_deviceColor;
- (id)_deviceEnclosureColor;
- (id)_deviceType;
- (id)_enclosure;
- (id)_marketingName;
- (id)_productClass;
- (id)_serialNumber;
- (unint64_t)hash;
- (void)connect;
- (void)end;
- (void)idle;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNrDevice:(id)a3;
- (void)setState:(id)a3;
- (void)start;
@end

@implementation DADeviceWatchProxy

- (DADeviceWatchProxy)initWithNanoDevice:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceWatchProxy;
  v6 = [(DADeviceWatchProxy *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nrDevice, a3);
    v8 = [(DADeviceWatchProxy *)v7 _deviceAttributes];
    v9 = [DADeviceState alloc];
    v10 = [(DADeviceWatchProxy *)v7 _serialNumber];
    v11 = [(DADeviceState *)v9 initWithSerialNumber:v10 attributes:v8];
    state = v7->_state;
    v7->_state = v11;

    v13 = [[DADeviceConnectionWatchProxy alloc] initWithState:v7->_state nanoDevice:v7->_nrDevice];
    connection = v7->_connection;
    v7->_connection = v13;

    [(DADeviceConnectionIDSProxy *)v7->_connection setDelegate:v7];
  }

  return v7;
}

- (BOOL)isLocal
{
  return 0;
}

- (void)connect
{
  id v2 = [(DADeviceWatchProxy *)self connection];
  [v2 connect];
}

- (void)start
{
  id v2 = [(DADeviceWatchProxy *)self connection];
  [v2 start];
}

- (void)idle
{
  id v2 = [(DADeviceWatchProxy *)self connection];
  [v2 idle];
}

- (void)end
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010044;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (unint64_t)hash
{
  id v2 = [(DADeviceWatchProxy *)self state];
  v3 = [v2 serialNumber];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___DADevice])
  {
    id v5 = [(DADeviceWatchProxy *)self state];
    v6 = [v5 serialNumber];
    v7 = [v4 state];
    v8 = [v7 serialNumber];
    unsigned __int8 v9 = [v6 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DADeviceWatchProxy *)self state];
  v6 = [v5 serialNumber];
  v7 = +[NSString stringWithFormat:@"<%@; %p: %@>", v4, self, v6];

  return (NSString *)v7;
}

- (id)_deviceAttributes
{
  v26[0] = @"productClass";
  uint64_t v3 = [(DADeviceWatchProxy *)self _productClass];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = +[NSNull null];
  }
  v22 = (void *)v3;
  v27[0] = v3;
  v26[1] = @"IMEI";
  uint64_t v5 = [(DADeviceWatchProxy *)self _IMEI];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = +[NSNull null];
  }
  v21 = (void *)v5;
  v27[1] = v5;
  v26[2] = @"marketingName";
  v24 = [(DADeviceWatchProxy *)self _marketingName];
  v27[2] = v24;
  v26[3] = @"enclosure";
  uint64_t v7 = [(DADeviceWatchProxy *)self _enclosure];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = +[NSNull null];
  }
  v20 = (void *)v7;
  v27[3] = v7;
  v26[4] = @"size";
  uint64_t v9 = [(DADeviceWatchProxy *)self _caseSize];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = +[NSNull null];
  }
  v19 = (void *)v9;
  v27[4] = v9;
  v26[5] = @"deviceType";
  v11 = [(DADeviceWatchProxy *)self _deviceType];
  v12 = v11;
  if (!v11)
  {
    v12 = +[NSNull null];
  }
  v25 = v4;
  v27[5] = v12;
  v26[6] = @"deviceClass";
  v13 = [(DADeviceWatchProxy *)self _deviceClass];
  v27[6] = v13;
  v26[7] = @"deviceEnclosureColor";
  v14 = [(DADeviceWatchProxy *)self _deviceEnclosureColor];
  v15 = v14;
  if (!v14)
  {
    v15 = +[NSNull null];
  }
  v27[7] = v15;
  v26[8] = @"deviceColor";
  objc_super v16 = [(DADeviceWatchProxy *)self _deviceColor];
  v17 = v16;
  if (!v16)
  {
    v17 = +[NSNull null];
  }
  v27[8] = v17;
  id v23 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:9];
  if (!v16) {

  }
  if (!v14) {
  if (!v11)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v6) {
  if (!v25)
  }

  return v23;
}

- (id)_enclosure
{
  uint64_t v3 = [(DADeviceWatchProxy *)self nrDevice];
  id v4 = [v3 valueForProperty:NRDevicePropertyDeviceHousingColor];

  uint64_t v5 = [(DADeviceWatchProxy *)self nrDevice];
  v6 = [v5 valueForProperty:NRDevicePropertyDmin];

  if (v4)
  {
    unint64_t v7 = (unint64_t)[v4 unsignedIntegerValue] - 1;
    if (v7 < 0x27 && ((0x6A8E623CFFuLL >> v7) & 1) != 0)
    {
      CFStringRef v11 = off_10014B638[v7];
      goto LABEL_17;
    }
    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001018D0(v4, v8);
    }
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10010189C();
    }
  }

  if (v6)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:&off_100156A78];
    v10 = v9;
    if (v9)
    {
      CFStringRef v11 = 0;
      switch((unint64_t)[v9 unsignedIntegerValue])
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
          CFStringRef v11 = @"ALUMINUM";
          break;
        case 5uLL:
        case 7uLL:
          CFStringRef v11 = @"STAINLESS_STEEL";
          break;
        case 8uLL:
          CFStringRef v11 = @"YELLOW_GOLD";
          break;
        case 9uLL:
          CFStringRef v11 = @"ROSE_GOLD";
          break;
        default:
          goto LABEL_19;
      }
    }
    else
    {
      v12 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100101868();
      }

      CFStringRef v11 = 0;
    }
    goto LABEL_19;
  }
  CFStringRef v11 = 0;
LABEL_17:
  v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100101834();
  }
LABEL_19:

  return (id)v11;
}

- (id)_caseSize
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyProductType];

  if (v3)
  {
    unsigned int v4 = NRDeviceSizeForProductType();
    int v5 = v4;
    if (v4 >= 0xA)
    {
      v8 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_100101990(v5, v8);
      }

      CFStringRef v6 = @"42_CASE";
    }
    else
    {
      CFStringRef v6 = off_10014B770[(__int16)v4];
    }
  }
  else
  {
    unint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10010195C();
    }

    CFStringRef v6 = 0;
  }

  return (id)v6;
}

- (id)_serialNumber
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertySerialNumber];

  return v3;
}

- (id)_productClass
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyLocalizedModel];

  return v3;
}

- (id)_marketingName
{
  return @"Apple Watch";
}

- (id)_IMEI
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyIMEI];

  if ([v3 isEqual:@"Unknown"])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_deviceClass
{
  return @"Watch";
}

- (id)_deviceType
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyProductType];

  return v3;
}

- (id)_deviceColor
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyColor];

  if ([v3 isEqualToString:@"unknown"])
  {
    unsigned int v4 = 0;
  }
  else
  {
    unsigned int v4 = [v3 stringByReplacingOccurrencesOfString:@"#" withString:&stru_1001548A0];
  }

  return v4;
}

- (id)_deviceEnclosureColor
{
  id v2 = [(DADeviceWatchProxy *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyEnclosureColor];

  if ([v3 isEqualToString:@"unknown"])
  {
    unsigned int v4 = 0;
  }
  else
  {
    unsigned int v4 = [v3 stringByReplacingOccurrencesOfString:@"#" withString:&stru_1001548A0];
  }

  return v4;
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DADeviceConnectionWatchProxy)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (void)setNrDevice:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end