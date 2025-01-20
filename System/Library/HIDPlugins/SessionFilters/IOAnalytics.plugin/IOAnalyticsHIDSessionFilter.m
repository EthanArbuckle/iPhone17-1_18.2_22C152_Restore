@interface IOAnalyticsHIDSessionFilter
- (AUVDMAnalytics)auvdmAnalytics;
- (AppleFireWireAnalytics)firewireAnalytics;
- (ApplePCIeAnalytics)pcieAnalytics;
- (AppleUSBCLightningAdapterAnalytics)usbCLightningAdapterAnalytics;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CIOAnalytics)cioAnalytics;
- (DPAnalytics)dpAnalytics;
- (IOAnalyticsHIDSessionFilter)initWithSession:(id)a3;
- (PowerInAnalytics)powerInAnalytics;
- (USBAnalytics)usbAnalytics;
- (USBPDAnalytics)usbpdAnalytics;
- (id)filterEvent:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3;
- (void)dealloc;
- (void)setAuvdmAnalytics:(id)a3;
- (void)setCioAnalytics:(id)a3;
- (void)setDpAnalytics:(id)a3;
- (void)setFirewireAnalytics:(id)a3;
- (void)setPcieAnalytics:(id)a3;
- (void)setPowerInAnalytics:(id)a3;
- (void)setUsbAnalytics:(id)a3;
- (void)setUsbCLightningAdapterAnalytics:(id)a3;
- (void)setUsbpdAnalytics:(id)a3;
@end

@implementation IOAnalyticsHIDSessionFilter

- (id)filterEvent:(id)a3 forService:(id)a4
{
  id v4 = a3;

  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (IOAnalyticsHIDSessionFilter)initWithSession:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)IOAnalyticsHIDSessionFilter;
  v3 = [(IOAnalyticsHIDSessionFilter *)&v25 init];
  if (v3)
  {
    id v4 = objc_alloc_init(IOAnalytics);
    ioAnalyics = v3->_ioAnalyics;
    v3->_ioAnalyics = v4;

    uint64_t v6 = objc_opt_new();
    usbCLightningAdapterAnalytics = v3->_usbCLightningAdapterAnalytics;
    v3->_usbCLightningAdapterAnalytics = (AppleUSBCLightningAdapterAnalytics *)v6;

    [(AppleUSBCLightningAdapterAnalytics *)v3->_usbCLightningAdapterAnalytics start];
    uint64_t v8 = objc_opt_new();
    pcieAnalytics = v3->_pcieAnalytics;
    v3->_pcieAnalytics = (ApplePCIeAnalytics *)v8;

    [(ApplePCIeAnalytics *)v3->_pcieAnalytics start];
    uint64_t v10 = objc_opt_new();
    usbAnalytics = v3->_usbAnalytics;
    v3->_usbAnalytics = (USBAnalytics *)v10;

    [(USBAnalytics *)v3->_usbAnalytics start];
    uint64_t v12 = objc_opt_new();
    cioAnalytics = v3->_cioAnalytics;
    v3->_cioAnalytics = (CIOAnalytics *)v12;

    [(CIOAnalytics *)v3->_cioAnalytics start];
    uint64_t v14 = objc_opt_new();
    dpAnalytics = v3->_dpAnalytics;
    v3->_dpAnalytics = (DPAnalytics *)v14;

    [(DPAnalytics *)v3->_dpAnalytics start];
    uint64_t v16 = objc_opt_new();
    powerInAnalytics = v3->_powerInAnalytics;
    v3->_powerInAnalytics = (PowerInAnalytics *)v16;

    [(PowerInAnalytics *)v3->_powerInAnalytics start];
    uint64_t v18 = objc_opt_new();
    auvdmAnalytics = v3->_auvdmAnalytics;
    v3->_auvdmAnalytics = (AUVDMAnalytics *)v18;

    [(AUVDMAnalytics *)v3->_auvdmAnalytics start];
    v20 = objc_alloc_init(USBPDAnalytics);
    usbpdAnalytics = v3->_usbpdAnalytics;
    v3->_usbpdAnalytics = v20;

    [(USBPDAnalytics *)v3->_usbpdAnalytics start];
    uint64_t v22 = objc_opt_new();
    firewireAnalytics = v3->_firewireAnalytics;
    v3->_firewireAnalytics = (AppleFireWireAnalytics *)v22;

    [(AppleFireWireAnalytics *)v3->_firewireAnalytics start];
  }
  return v3;
}

- (void)dealloc
{
  ioAnalyics = self->_ioAnalyics;
  self->_ioAnalyics = 0;

  [(AppleUSBCLightningAdapterAnalytics *)self->_usbCLightningAdapterAnalytics stop];
  usbCLightningAdapterAnalytics = self->_usbCLightningAdapterAnalytics;
  self->_usbCLightningAdapterAnalytics = 0;

  [(ApplePCIeAnalytics *)self->_pcieAnalytics stop];
  pcieAnalytics = self->_pcieAnalytics;
  self->_pcieAnalytics = 0;

  [(CIOAnalytics *)self->_cioAnalytics stop];
  cioAnalytics = self->_cioAnalytics;
  self->_cioAnalytics = 0;

  [(DPAnalytics *)self->_dpAnalytics stop];
  dpAnalytics = self->_dpAnalytics;
  self->_dpAnalytics = 0;

  [(PowerInAnalytics *)self->_powerInAnalytics stop];
  powerInAnalytics = self->_powerInAnalytics;
  self->_powerInAnalytics = 0;

  [(AUVDMAnalytics *)self->_auvdmAnalytics stop];
  auvdmAnalytics = self->_auvdmAnalytics;
  self->_auvdmAnalytics = 0;

  [(USBPDAnalytics *)self->_usbpdAnalytics stop];
  usbpdAnalytics = self->_usbpdAnalytics;
  self->_usbpdAnalytics = 0;

  [(AppleFireWireAnalytics *)self->_firewireAnalytics stop];
  firewireAnalytics = self->_firewireAnalytics;
  self->_firewireAnalytics = 0;

  v12.receiver = self;
  v12.super_class = (Class)IOAnalyticsHIDSessionFilter;
  [(IOAnalyticsHIDSessionFilter *)&v12 dealloc];
}

- (AppleUSBCLightningAdapterAnalytics)usbCLightningAdapterAnalytics
{
  return self->_usbCLightningAdapterAnalytics;
}

- (void)setUsbCLightningAdapterAnalytics:(id)a3
{
}

- (ApplePCIeAnalytics)pcieAnalytics
{
  return self->_pcieAnalytics;
}

- (void)setPcieAnalytics:(id)a3
{
}

- (USBAnalytics)usbAnalytics
{
  return self->_usbAnalytics;
}

- (void)setUsbAnalytics:(id)a3
{
}

- (CIOAnalytics)cioAnalytics
{
  return self->_cioAnalytics;
}

- (void)setCioAnalytics:(id)a3
{
}

- (DPAnalytics)dpAnalytics
{
  return self->_dpAnalytics;
}

- (void)setDpAnalytics:(id)a3
{
}

- (PowerInAnalytics)powerInAnalytics
{
  return self->_powerInAnalytics;
}

- (void)setPowerInAnalytics:(id)a3
{
}

- (AUVDMAnalytics)auvdmAnalytics
{
  return self->_auvdmAnalytics;
}

- (void)setAuvdmAnalytics:(id)a3
{
}

- (USBPDAnalytics)usbpdAnalytics
{
  return self->_usbpdAnalytics;
}

- (void)setUsbpdAnalytics:(id)a3
{
}

- (AppleFireWireAnalytics)firewireAnalytics
{
  return self->_firewireAnalytics;
}

- (void)setFirewireAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firewireAnalytics, 0);
  objc_storeStrong((id *)&self->_usbpdAnalytics, 0);
  objc_storeStrong((id *)&self->_auvdmAnalytics, 0);
  objc_storeStrong((id *)&self->_powerInAnalytics, 0);
  objc_storeStrong((id *)&self->_dpAnalytics, 0);
  objc_storeStrong((id *)&self->_cioAnalytics, 0);
  objc_storeStrong((id *)&self->_usbAnalytics, 0);
  objc_storeStrong((id *)&self->_pcieAnalytics, 0);
  objc_storeStrong((id *)&self->_usbCLightningAdapterAnalytics, 0);

  objc_storeStrong((id *)&self->_ioAnalyics, 0);
}

@end