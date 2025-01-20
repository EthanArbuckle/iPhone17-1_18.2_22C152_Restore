@interface CEMSystemEnergySaverDeclaration_PowerSettings
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithDisplaySleepTimer:(id)a3 withDiskSleepTimer:(id)a4 withSystemSleepTimer:(id)a5 withReduceProcessorSpeed:(id)a6 withDynamicPowerStep:(id)a7 withWakeOnLAN:(id)a8 withWakeOnModemRing:(id)a9 withAutomaticRestartOnPowerLoss:(id)a10;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadAutomaticRestartOnPowerLoss;
- (NSNumber)payloadDiskSleepTimer;
- (NSNumber)payloadDisplaySleepTimer;
- (NSNumber)payloadDynamicPowerStep;
- (NSNumber)payloadReduceProcessorSpeed;
- (NSNumber)payloadSystemSleepTimer;
- (NSNumber)payloadWakeOnLAN;
- (NSNumber)payloadWakeOnModemRing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAutomaticRestartOnPowerLoss:(id)a3;
- (void)setPayloadDiskSleepTimer:(id)a3;
- (void)setPayloadDisplaySleepTimer:(id)a3;
- (void)setPayloadDynamicPowerStep:(id)a3;
- (void)setPayloadReduceProcessorSpeed:(id)a3;
- (void)setPayloadSystemSleepTimer:(id)a3;
- (void)setPayloadWakeOnLAN:(id)a3;
- (void)setPayloadWakeOnModemRing:(id)a3;
@end

@implementation CEMSystemEnergySaverDeclaration_PowerSettings

+ (NSSet)allowedPayloadKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Display Sleep Timer";
  v6[1] = @"Disk Sleep Timer";
  v6[2] = @"System Sleep Timer";
  v6[3] = @"Reduce Processor Speed";
  v6[4] = @"Dynamic Power Step";
  v6[5] = @"Wake on LAN";
  v6[6] = @"Wake On Modem Ring";
  v6[7] = @"Automatic Restart On Power Loss";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDisplaySleepTimer:(id)a3 withDiskSleepTimer:(id)a4 withSystemSleepTimer:(id)a5 withReduceProcessorSpeed:(id)a6 withDynamicPowerStep:(id)a7 withWakeOnLAN:(id)a8 withWakeOnModemRing:(id)a9 withAutomaticRestartOnPowerLoss:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_opt_new();
  [v24 setPayloadDisplaySleepTimer:v23];

  [v24 setPayloadDiskSleepTimer:v22];
  [v24 setPayloadSystemSleepTimer:v21];

  [v24 setPayloadReduceProcessorSpeed:v20];
  [v24 setPayloadDynamicPowerStep:v19];

  [v24 setPayloadWakeOnLAN:v18];
  [v24 setPayloadWakeOnModemRing:v17];

  [v24 setPayloadAutomaticRestartOnPowerLoss:v16];

  return v24;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemEnergySaverDeclaration_PowerSettings allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v38 = 0;
  v13 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Display Sleep Timer" isRequired:0 defaultValue:0 error:&v38];
  id v14 = v38;
  payloadDisplaySleepTimer = self->_payloadDisplaySleepTimer;
  self->_payloadDisplaySleepTimer = v13;

  if (!v14)
  {
    id v37 = 0;
    id v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Disk Sleep Timer" isRequired:0 defaultValue:0 error:&v37];
    id v14 = v37;
    payloadDiskSleepTimer = self->_payloadDiskSleepTimer;
    self->_payloadDiskSleepTimer = v16;

    if (!v14)
    {
      id v36 = 0;
      id v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"System Sleep Timer" isRequired:0 defaultValue:0 error:&v36];
      id v14 = v36;
      payloadSystemSleepTimer = self->_payloadSystemSleepTimer;
      self->_payloadSystemSleepTimer = v18;

      if (!v14)
      {
        id v35 = 0;
        id v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Reduce Processor Speed" isRequired:0 defaultValue:0 error:&v35];
        id v14 = v35;
        payloadReduceProcessorSpeed = self->_payloadReduceProcessorSpeed;
        self->_payloadReduceProcessorSpeed = v20;

        if (!v14)
        {
          id v34 = 0;
          id v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Dynamic Power Step" isRequired:0 defaultValue:0 error:&v34];
          id v14 = v34;
          payloadDynamicPowerStep = self->_payloadDynamicPowerStep;
          self->_payloadDynamicPowerStep = v22;

          if (!v14)
          {
            id v33 = 0;
            v24 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Wake on LAN" isRequired:0 defaultValue:0 error:&v33];
            id v14 = v33;
            payloadWakeOnLAN = self->_payloadWakeOnLAN;
            self->_payloadWakeOnLAN = v24;

            if (!v14)
            {
              id v32 = 0;
              v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Wake On Modem Ring" isRequired:0 defaultValue:0 error:&v32];
              id v14 = v32;
              payloadWakeOnModemRing = self->_payloadWakeOnModemRing;
              self->_payloadWakeOnModemRing = v26;

              if (!v14)
              {
                id v31 = 0;
                v28 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Automatic Restart On Power Loss" isRequired:0 defaultValue:0 error:&v31];
                id v14 = v31;
                payloadAutomaticRestartOnPowerLoss = self->_payloadAutomaticRestartOnPowerLoss;
                self->_payloadAutomaticRestartOnPowerLoss = v28;
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Display Sleep Timer" withValue:self->_payloadDisplaySleepTimer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Disk Sleep Timer" withValue:self->_payloadDiskSleepTimer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"System Sleep Timer" withValue:self->_payloadSystemSleepTimer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Reduce Processor Speed" withValue:self->_payloadReduceProcessorSpeed isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Dynamic Power Step" withValue:self->_payloadDynamicPowerStep isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Wake on LAN" withValue:self->_payloadWakeOnLAN isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Wake On Modem Ring" withValue:self->_payloadWakeOnModemRing isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Automatic Restart On Power Loss" withValue:self->_payloadAutomaticRestartOnPowerLoss isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CEMSystemEnergySaverDeclaration_PowerSettings;
  v4 = [(CEMPayloadBase *)&v22 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadDisplaySleepTimer copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadDiskSleepTimer copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadSystemSleepTimer copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadReduceProcessorSpeed copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadDynamicPowerStep copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadWakeOnLAN copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadWakeOnModemRing copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAutomaticRestartOnPowerLoss copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

- (NSNumber)payloadDisplaySleepTimer
{
  return self->_payloadDisplaySleepTimer;
}

- (void)setPayloadDisplaySleepTimer:(id)a3
{
}

- (NSNumber)payloadDiskSleepTimer
{
  return self->_payloadDiskSleepTimer;
}

- (void)setPayloadDiskSleepTimer:(id)a3
{
}

- (NSNumber)payloadSystemSleepTimer
{
  return self->_payloadSystemSleepTimer;
}

- (void)setPayloadSystemSleepTimer:(id)a3
{
}

- (NSNumber)payloadReduceProcessorSpeed
{
  return self->_payloadReduceProcessorSpeed;
}

- (void)setPayloadReduceProcessorSpeed:(id)a3
{
}

- (NSNumber)payloadDynamicPowerStep
{
  return self->_payloadDynamicPowerStep;
}

- (void)setPayloadDynamicPowerStep:(id)a3
{
}

- (NSNumber)payloadWakeOnLAN
{
  return self->_payloadWakeOnLAN;
}

- (void)setPayloadWakeOnLAN:(id)a3
{
}

- (NSNumber)payloadWakeOnModemRing
{
  return self->_payloadWakeOnModemRing;
}

- (void)setPayloadWakeOnModemRing:(id)a3
{
}

- (NSNumber)payloadAutomaticRestartOnPowerLoss
{
  return self->_payloadAutomaticRestartOnPowerLoss;
}

- (void)setPayloadAutomaticRestartOnPowerLoss:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAutomaticRestartOnPowerLoss, 0);
  objc_storeStrong((id *)&self->_payloadWakeOnModemRing, 0);
  objc_storeStrong((id *)&self->_payloadWakeOnLAN, 0);
  objc_storeStrong((id *)&self->_payloadDynamicPowerStep, 0);
  objc_storeStrong((id *)&self->_payloadReduceProcessorSpeed, 0);
  objc_storeStrong((id *)&self->_payloadSystemSleepTimer, 0);
  objc_storeStrong((id *)&self->_payloadDiskSleepTimer, 0);

  objc_storeStrong((id *)&self->_payloadDisplaySleepTimer, 0);
}

@end