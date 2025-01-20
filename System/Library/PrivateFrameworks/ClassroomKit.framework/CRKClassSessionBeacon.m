@interface CRKClassSessionBeacon
- (BOOL)isAdvertising;
- (CRKClassSessionBeacon)init;
- (DMFControlSessionIdentifier)advertisedIdentifier;
- (NSDictionary)beaconAdvertisement;
- (WPAdvertising)advertiser;
- (unsigned)flags;
- (void)advertiserDidRegisterService;
- (void)advertiserDidUpdateState:(id)a3;
- (void)advertiserFailedToRegisterService;
- (void)advertiserPendingServiceOfType:(id)a3;
- (void)setAdvertisedIdentifier:(id)a3;
- (void)setAdvertising:(BOOL)a3;
- (void)setBeaconAdvertisement:(id)a3;
- (void)setFlags:(unsigned __int16)a3;
- (void)startAdvertisingClassSessionWithIdentifier:(id)a3;
- (void)startAdvertisingWithUUID:(id)a3 IPAddress:(unsigned int)a4;
- (void)stopAdvertising;
@end

@implementation CRKClassSessionBeacon

- (CRKClassSessionBeacon)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRKClassSessionBeacon;
  v2 = [(CRKClassSessionBeacon *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F864B8]);
    uint64_t v4 = [v3 initWithDelegate:v2 queue:MEMORY[0x263EF83A0]];
    advertiser = v2->_advertiser;
    v2->_advertiser = (WPAdvertising *)v4;
  }
  return v2;
}

- (void)startAdvertisingClassSessionWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CRKClassSessionBeacon *)self setAdvertisedIdentifier:v4];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v5 = [v4 organizationUUID];
  [v5 getUUIDBytes:&v8];

  WORD2(v9) = __rev16([(CRKClassSessionBeacon *)self flags]);
  HIWORD(v9) = __rev16([v4 groupID]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v8];
  uint64_t v7 = [v4 leaderIP];

  [(CRKClassSessionBeacon *)self startAdvertisingWithUUID:v6 IPAddress:v7];
}

- (void)startAdvertisingWithUUID:(id)a3 IPAddress:(unsigned int)a4
{
  v25[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (unsigned __int16)a4;
  uint64_t v8 = [(CRKClassSessionBeacon *)self beaconAdvertisement];

  if (v8)
  {
    uint64_t v9 = [(CRKClassSessionBeacon *)self advertiser];
    uint64_t v10 = [(CRKClassSessionBeacon *)self beaconAdvertisement];
    [v9 deregisterService:v10];
  }
  uint64_t v11 = HIWORD(a4);
  uint64_t v12 = *MEMORY[0x263F864E0];
  v24[0] = *MEMORY[0x263F864D8];
  v24[1] = v12;
  uint64_t v13 = *MEMORY[0x263F864E8];
  v25[0] = &unk_26D81A270;
  v25[1] = v13;
  v24[2] = *MEMORY[0x263F86500];
  v14 = [v6 UUIDString];
  v25[2] = v14;
  v24[3] = *MEMORY[0x263F864F0];
  v15 = [NSNumber numberWithUnsignedShort:v11];
  v25[3] = v15;
  v24[4] = *MEMORY[0x263F864F8];
  v16 = [NSNumber numberWithUnsignedShort:v7];
  v25[4] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
  [(CRKClassSessionBeacon *)self setBeaconAdvertisement:v17];

  v18 = _CRKLogBluetooth_1();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(CRKClassSessionBeacon *)self beaconAdvertisement];
    int v22 = 138543362;
    v23 = v19;
    _os_log_impl(&dword_224C00000, v18, OS_LOG_TYPE_DEFAULT, "Beacon advertisement %{public}@", (uint8_t *)&v22, 0xCu);
  }
  v20 = [(CRKClassSessionBeacon *)self advertiser];
  v21 = [(CRKClassSessionBeacon *)self beaconAdvertisement];
  [v20 registerService:v21];
}

- (void)stopAdvertising
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = _CRKLogBluetooth_1();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CRKClassSessionBeacon *)self advertisedIdentifier];
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth Beacon STOP advertising %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v5 = [(CRKClassSessionBeacon *)self beaconAdvertisement];

  if (v5)
  {
    id v6 = [(CRKClassSessionBeacon *)self advertiser];
    uint64_t v7 = [(CRKClassSessionBeacon *)self beaconAdvertisement];
    [v6 deregisterService:v7];
  }
  [(CRKClassSessionBeacon *)self setBeaconAdvertisement:0];
  [(CRKClassSessionBeacon *)self setAdvertising:0];
}

- (void)advertiserDidUpdateState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _CRKLogBluetooth_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "advertiserState"));
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Beacon advertiser updated state %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if ([v4 state] == 3 && !-[CRKClassSessionBeacon isAdvertising](self, "isAdvertising"))
  {
    uint64_t v7 = [(CRKClassSessionBeacon *)self beaconAdvertisement];

    if (v7)
    {
      int v8 = [(CRKClassSessionBeacon *)self advertiser];
      uint64_t v9 = [(CRKClassSessionBeacon *)self beaconAdvertisement];
      [v8 registerService:v9];
    }
  }
}

- (void)advertiserDidRegisterService
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _CRKLogBluetooth_1();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CRKClassSessionBeacon *)self beaconAdvertisement];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Beacon advertiser registered service %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(CRKClassSessionBeacon *)self setAdvertising:1];
}

- (void)advertiserFailedToRegisterService
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 beaconAdvertisement];
  int v4 = 138543362;
  int v5 = v3;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Beacon advertiser failed to register service %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)advertiserPendingServiceOfType:(id)a3
{
  id v3 = a3;
  int v4 = _CRKLogBluetooth_1();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CRKClassSessionBeacon advertiserPendingServiceOfType:]((uint64_t)v3, v4);
  }
}

- (DMFControlSessionIdentifier)advertisedIdentifier
{
  return self->_advertisedIdentifier;
}

- (void)setAdvertisedIdentifier:(id)a3
{
}

- (BOOL)isAdvertising
{
  return self->_advertising;
}

- (void)setAdvertising:(BOOL)a3
{
  self->_advertising = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int16)a3
{
  self->_flags = a3;
}

- (WPAdvertising)advertiser
{
  return self->_advertiser;
}

- (NSDictionary)beaconAdvertisement
{
  return self->_beaconAdvertisement;
}

- (void)setBeaconAdvertisement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconAdvertisement, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);

  objc_storeStrong((id *)&self->_advertisedIdentifier, 0);
}

- (void)advertiserPendingServiceOfType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Beacon advertiser pending to service %{public}@", (uint8_t *)&v2, 0xCu);
}

@end