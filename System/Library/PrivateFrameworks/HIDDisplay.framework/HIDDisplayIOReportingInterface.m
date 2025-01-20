@interface HIDDisplayIOReportingInterface
- (BOOL)setOutputData:(id)a3 error:(id *)a4;
- (BOOL)setupIOReporting;
- (HIDDisplayIOReportingInterface)initWithContainerID:(id)a3;
- (HIDDisplayIOReportingInterface)initWithService:(unsigned int)a3;
- (id)getHIDDevices;
- (void)activate;
- (void)cancel;
- (void)setCancelHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInputDataHandler:(id)a3;
@end

@implementation HIDDisplayIOReportingInterface

- (HIDDisplayIOReportingInterface)initWithContainerID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayIOReportingInterface;
  v3 = [(HIDDisplayInterface *)&v7 initWithContainerID:a3];
  v4 = v3;
  if (v3 && [(HIDDisplayIOReportingInterface *)v3 setupIOReporting]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (HIDDisplayIOReportingInterface)initWithService:(unsigned int)a3
{
  return 0;
}

- (BOOL)setupIOReporting
{
  v3 = [(HIDDisplayInterface *)self getDeviceElements:&unk_26D40FF70];
  v4 = v3;
  if (v3 && [v3 count])
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getHIDDevices
{
  return [(HIDDisplayInterface *)self getHIDDevicesForMatching:&unk_26D40FFC0];
}

- (void)setInputDataHandler:(id)a3
{
  self->_dataHandler = (id)MEMORY[0x223C8DE60](a3, a2);
  MEMORY[0x270F9A758]();
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setCancelHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDDisplayInterface *)self device];
  [v5 setCancelHandler:v4];
}

- (BOOL)setOutputData:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(NSDictionary *)self->_usageElementMap objectForKey:&unk_26D40FDD8];
  v8 = v7;
  if (v7)
  {
    [v7 setDataValue:v6];
    v12[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    BOOL v10 = [(HIDDisplayInterface *)self commit:v9 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870201 userInfo:0];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)activate
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(HIDDisplayInterface *)self device];
  [v3 setInputElementMatching:&unk_26D40FFE8];

  id v4 = [(HIDDisplayInterface *)self device];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __42__HIDDisplayIOReportingInterface_activate__block_invoke;
  BOOL v10 = &unk_2645DFD08;
  objc_copyWeak(&v11, &location);
  [v4 setInputElementHandler:&v7];

  id v5 = [(HIDDisplayInterface *)self device];
  [v5 setDispatchQueue:self->_queue];

  id v6 = [(HIDDisplayInterface *)self device];
  [v6 activate];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __42__HIDDisplayIOReportingInterface_activate__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v7 usage];
    if ([v7 usagePage] == 65315 || v4 == 1)
    {
      uint64_t v5 = WeakRetained[6];
      if (v5)
      {
        id v6 = [v7 dataValue];
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      }
    }
  }
}

- (void)cancel
{
  id v2 = [(HIDDisplayInterface *)self device];
  [v2 cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_usageElementMap, 0);
}

@end