@interface CEMApplicationLockDeclaration_AppOptions
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithDisableTouch:(id)a3 withDisableDeviceRotation:(id)a4 withDisableVolumeButtons:(id)a5 withDisableRingerSwitch:(id)a6 withDisableSleepWakeButton:(id)a7 withDisableAutoLock:(id)a8 withEnableVoiceOver:(id)a9 withEnableZoom:(id)a10 withEnableInvertColors:(id)a11 withEnableAssistiveTouch:(id)a12 withEnableSpeakSelection:(id)a13 withEnableMonoAudio:(id)a14;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadDisableAutoLock;
- (NSNumber)payloadDisableDeviceRotation;
- (NSNumber)payloadDisableRingerSwitch;
- (NSNumber)payloadDisableSleepWakeButton;
- (NSNumber)payloadDisableTouch;
- (NSNumber)payloadDisableVolumeButtons;
- (NSNumber)payloadEnableAssistiveTouch;
- (NSNumber)payloadEnableInvertColors;
- (NSNumber)payloadEnableMonoAudio;
- (NSNumber)payloadEnableSpeakSelection;
- (NSNumber)payloadEnableVoiceOver;
- (NSNumber)payloadEnableZoom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDisableAutoLock:(id)a3;
- (void)setPayloadDisableDeviceRotation:(id)a3;
- (void)setPayloadDisableRingerSwitch:(id)a3;
- (void)setPayloadDisableSleepWakeButton:(id)a3;
- (void)setPayloadDisableTouch:(id)a3;
- (void)setPayloadDisableVolumeButtons:(id)a3;
- (void)setPayloadEnableAssistiveTouch:(id)a3;
- (void)setPayloadEnableInvertColors:(id)a3;
- (void)setPayloadEnableMonoAudio:(id)a3;
- (void)setPayloadEnableSpeakSelection:(id)a3;
- (void)setPayloadEnableVoiceOver:(id)a3;
- (void)setPayloadEnableZoom:(id)a3;
@end

@implementation CEMApplicationLockDeclaration_AppOptions

+ (NSSet)allowedPayloadKeys
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DisableTouch";
  v6[1] = @"DisableDeviceRotation";
  v6[2] = @"DisableVolumeButtons";
  v6[3] = @"DisableRingerSwitch";
  v6[4] = @"DisableSleepWakeButton";
  v6[5] = @"DisableAutoLock";
  v6[6] = @"EnableVoiceOver";
  v6[7] = @"EnableZoom";
  v6[8] = @"EnableInvertColors";
  v6[9] = @"EnableAssistiveTouch";
  v6[10] = @"EnableSpeakSelection";
  v6[11] = @"EnableMonoAudio";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDisableTouch:(id)a3 withDisableDeviceRotation:(id)a4 withDisableVolumeButtons:(id)a5 withDisableRingerSwitch:(id)a6 withDisableSleepWakeButton:(id)a7 withDisableAutoLock:(id)a8 withEnableVoiceOver:(id)a9 withEnableZoom:(id)a10 withEnableInvertColors:(id)a11 withEnableAssistiveTouch:(id)a12 withEnableSpeakSelection:(id)a13 withEnableMonoAudio:(id)a14
{
  id v47 = a14;
  id v46 = a13;
  id v45 = a12;
  id v44 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  v27 = v26;
  v28 = (void *)MEMORY[0x263EFFA80];
  if (v25) {
    id v29 = v25;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA80];
  }
  objc_msgSend(v26, "setPayloadDisableTouch:", v29, a4);

  if (v24) {
    id v30 = v24;
  }
  else {
    id v30 = v28;
  }
  [v27 setPayloadDisableDeviceRotation:v30];

  if (v23) {
    id v31 = v23;
  }
  else {
    id v31 = v28;
  }
  [v27 setPayloadDisableVolumeButtons:v31];

  if (v22) {
    id v32 = v22;
  }
  else {
    id v32 = v28;
  }
  [v27 setPayloadDisableRingerSwitch:v32];

  if (v21) {
    id v33 = v21;
  }
  else {
    id v33 = v28;
  }
  [v27 setPayloadDisableSleepWakeButton:v33];

  if (v20) {
    id v34 = v20;
  }
  else {
    id v34 = v28;
  }
  [v27 setPayloadDisableAutoLock:v34];

  if (v19) {
    id v35 = v19;
  }
  else {
    id v35 = v28;
  }
  [v27 setPayloadEnableVoiceOver:v35];

  if (v18) {
    id v36 = v18;
  }
  else {
    id v36 = v28;
  }
  [v27 setPayloadEnableZoom:v36];

  if (v44) {
    id v37 = v44;
  }
  else {
    id v37 = v28;
  }
  [v27 setPayloadEnableInvertColors:v37];

  if (v45) {
    id v38 = v45;
  }
  else {
    id v38 = v28;
  }
  [v27 setPayloadEnableAssistiveTouch:v38];

  if (v46) {
    id v39 = v46;
  }
  else {
    id v39 = v28;
  }
  [v27 setPayloadEnableSpeakSelection:v39];

  if (v47) {
    id v40 = v47;
  }
  else {
    id v40 = v28;
  }
  [v27 setPayloadEnableMonoAudio:v40];

  return v27;
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

  v10 = +[CEMApplicationLockDeclaration_AppOptions allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v50 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableTouch" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v50];
  id v14 = v50;
  payloadDisableTouch = self->_payloadDisableTouch;
  self->_payloadDisableTouch = v13;

  if (!v14)
  {
    id v49 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableDeviceRotation" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v49];
    id v14 = v49;
    payloadDisableDeviceRotation = self->_payloadDisableDeviceRotation;
    self->_payloadDisableDeviceRotation = v16;

    if (!v14)
    {
      id v48 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableVolumeButtons" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v48];
      id v14 = v48;
      payloadDisableVolumeButtons = self->_payloadDisableVolumeButtons;
      self->_payloadDisableVolumeButtons = v18;

      if (!v14)
      {
        id v47 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableRingerSwitch" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v47];
        id v14 = v47;
        payloadDisableRingerSwitch = self->_payloadDisableRingerSwitch;
        self->_payloadDisableRingerSwitch = v20;

        if (!v14)
        {
          id v46 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableSleepWakeButton" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v46];
          id v14 = v46;
          payloadDisableSleepWakeButton = self->_payloadDisableSleepWakeButton;
          self->_payloadDisableSleepWakeButton = v22;

          if (!v14)
          {
            id v45 = 0;
            id v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableAutoLock" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v45];
            id v14 = v45;
            payloadDisableAutoLock = self->_payloadDisableAutoLock;
            self->_payloadDisableAutoLock = v24;

            if (!v14)
            {
              id v44 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableVoiceOver" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v44];
              id v14 = v44;
              payloadEnableVoiceOver = self->_payloadEnableVoiceOver;
              self->_payloadEnableVoiceOver = v26;

              if (!v14)
              {
                id v43 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableZoom" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v43];
                id v14 = v43;
                payloadEnableZoom = self->_payloadEnableZoom;
                self->_payloadEnableZoom = v28;

                if (!v14)
                {
                  id v42 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableInvertColors" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v42];
                  id v14 = v42;
                  payloadEnableInvertColors = self->_payloadEnableInvertColors;
                  self->_payloadEnableInvertColors = v30;

                  if (!v14)
                  {
                    id v41 = 0;
                    id v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableAssistiveTouch" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v41];
                    id v14 = v41;
                    payloadEnableAssistiveTouch = self->_payloadEnableAssistiveTouch;
                    self->_payloadEnableAssistiveTouch = v32;

                    if (!v14)
                    {
                      id v40 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableSpeakSelection" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v40];
                      id v14 = v40;
                      payloadEnableSpeakSelection = self->_payloadEnableSpeakSelection;
                      self->_payloadEnableSpeakSelection = v34;

                      if (!v14)
                      {
                        id v39 = 0;
                        id v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableMonoAudio" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v39];
                        id v14 = v39;
                        payloadEnableMonoAudio = self->_payloadEnableMonoAudio;
                        self->_payloadEnableMonoAudio = v36;
                      }
                    }
                  }
                }
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
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableTouch" withValue:self->_payloadDisableTouch isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableDeviceRotation" withValue:self->_payloadDisableDeviceRotation isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableVolumeButtons" withValue:self->_payloadDisableVolumeButtons isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableRingerSwitch" withValue:self->_payloadDisableRingerSwitch isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableSleepWakeButton" withValue:self->_payloadDisableSleepWakeButton isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableAutoLock" withValue:self->_payloadDisableAutoLock isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableVoiceOver" withValue:self->_payloadEnableVoiceOver isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableZoom" withValue:self->_payloadEnableZoom isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableInvertColors" withValue:self->_payloadEnableInvertColors isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableAssistiveTouch" withValue:self->_payloadEnableAssistiveTouch isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableSpeakSelection" withValue:self->_payloadEnableSpeakSelection isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableMonoAudio" withValue:self->_payloadEnableMonoAudio isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CEMApplicationLockDeclaration_AppOptions;
  v4 = [(CEMPayloadBase *)&v30 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadDisableTouch copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadDisableDeviceRotation copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadDisableVolumeButtons copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadDisableRingerSwitch copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadDisableSleepWakeButton copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadDisableAutoLock copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadEnableVoiceOver copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadEnableZoom copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadEnableInvertColors copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadEnableAssistiveTouch copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadEnableSpeakSelection copy];
  v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadEnableMonoAudio copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  return v4;
}

- (NSNumber)payloadDisableTouch
{
  return self->_payloadDisableTouch;
}

- (void)setPayloadDisableTouch:(id)a3
{
}

- (NSNumber)payloadDisableDeviceRotation
{
  return self->_payloadDisableDeviceRotation;
}

- (void)setPayloadDisableDeviceRotation:(id)a3
{
}

- (NSNumber)payloadDisableVolumeButtons
{
  return self->_payloadDisableVolumeButtons;
}

- (void)setPayloadDisableVolumeButtons:(id)a3
{
}

- (NSNumber)payloadDisableRingerSwitch
{
  return self->_payloadDisableRingerSwitch;
}

- (void)setPayloadDisableRingerSwitch:(id)a3
{
}

- (NSNumber)payloadDisableSleepWakeButton
{
  return self->_payloadDisableSleepWakeButton;
}

- (void)setPayloadDisableSleepWakeButton:(id)a3
{
}

- (NSNumber)payloadDisableAutoLock
{
  return self->_payloadDisableAutoLock;
}

- (void)setPayloadDisableAutoLock:(id)a3
{
}

- (NSNumber)payloadEnableVoiceOver
{
  return self->_payloadEnableVoiceOver;
}

- (void)setPayloadEnableVoiceOver:(id)a3
{
}

- (NSNumber)payloadEnableZoom
{
  return self->_payloadEnableZoom;
}

- (void)setPayloadEnableZoom:(id)a3
{
}

- (NSNumber)payloadEnableInvertColors
{
  return self->_payloadEnableInvertColors;
}

- (void)setPayloadEnableInvertColors:(id)a3
{
}

- (NSNumber)payloadEnableAssistiveTouch
{
  return self->_payloadEnableAssistiveTouch;
}

- (void)setPayloadEnableAssistiveTouch:(id)a3
{
}

- (NSNumber)payloadEnableSpeakSelection
{
  return self->_payloadEnableSpeakSelection;
}

- (void)setPayloadEnableSpeakSelection:(id)a3
{
}

- (NSNumber)payloadEnableMonoAudio
{
  return self->_payloadEnableMonoAudio;
}

- (void)setPayloadEnableMonoAudio:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnableMonoAudio, 0);
  objc_storeStrong((id *)&self->_payloadEnableSpeakSelection, 0);
  objc_storeStrong((id *)&self->_payloadEnableAssistiveTouch, 0);
  objc_storeStrong((id *)&self->_payloadEnableInvertColors, 0);
  objc_storeStrong((id *)&self->_payloadEnableZoom, 0);
  objc_storeStrong((id *)&self->_payloadEnableVoiceOver, 0);
  objc_storeStrong((id *)&self->_payloadDisableAutoLock, 0);
  objc_storeStrong((id *)&self->_payloadDisableSleepWakeButton, 0);
  objc_storeStrong((id *)&self->_payloadDisableRingerSwitch, 0);
  objc_storeStrong((id *)&self->_payloadDisableVolumeButtons, 0);
  objc_storeStrong((id *)&self->_payloadDisableDeviceRotation, 0);

  objc_storeStrong((id *)&self->_payloadDisableTouch, 0);
}

@end