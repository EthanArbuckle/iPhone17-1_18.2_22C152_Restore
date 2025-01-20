@interface CBControllerSettings
- (CBControllerSettings)initWithXPCObject:(id)a3 error:(id *)a4;
- (char)bleAdvRSSI;
- (char)hid3ppLELegacyMode;
- (char)setupAssistantIfNoKeyboard;
- (char)setupAssistantIfNoPointingDevice;
- (char)spatialSoundProfileAllowed;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)discoverableState;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBleAdvRSSI:(char)a3;
- (void)setDiscoverableState:(int)a3;
- (void)setHid3ppLELegacyMode:(char)a3;
- (void)setSetupAssistantIfNoKeyboard:(char)a3;
- (void)setSetupAssistantIfNoPointingDevice:(char)a3;
- (void)setSpatialSoundProfileAllowed:(char)a3;
@end

@implementation CBControllerSettings

- (CBControllerSettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBControllerSettings *)self init];
  if (!v7)
  {
    if (a4)
    {
      v22 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_27;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v29);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v7->_discoverableState = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_27;
  }
  int v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 == 6)
  {
    v7->_hid3ppLELegacyMode = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_27;
  }
  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v7->_bleAdvRSSI = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_27;
  }
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_setupAssistantIfNoKeyboard = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_27;
  }
  int v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v7->_setupAssistantIfNoPointingDevice = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_27;
  }
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 != 6)
  {
    if (v19 != 5) {
      goto LABEL_21;
    }
LABEL_27:
    v20 = 0;
    goto LABEL_22;
  }
  v7->_spatialSoundProfileAllowed = 0;
LABEL_21:
  v20 = v7;
LABEL_22:

  return v20;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  int64_t discoverableState = self->_discoverableState;
  xpc_object_t xdict = v4;
  if (discoverableState)
  {
    xpc_dictionary_set_int64(v4, "dsSt", discoverableState);
    id v4 = xdict;
  }
  if (self->_hid3ppLELegacyMode)
  {
    xpc_dictionary_set_int64(xdict, "hFMs", self->_hid3ppLELegacyMode);
    id v4 = xdict;
  }
  if (self->_bleAdvRSSI)
  {
    xpc_dictionary_set_int64(xdict, "rssi", self->_bleAdvRSSI);
    id v4 = xdict;
  }
  if (self->_setupAssistantIfNoKeyboard)
  {
    xpc_dictionary_set_int64(xdict, "saKB", self->_setupAssistantIfNoKeyboard);
    id v4 = xdict;
  }
  if (self->_setupAssistantIfNoPointingDevice)
  {
    xpc_dictionary_set_int64(xdict, "saPD", self->_setupAssistantIfNoPointingDevice);
    id v4 = xdict;
  }
  if (self->_spatialSoundProfileAllowed)
  {
    xpc_dictionary_set_int64(xdict, "spSP", self->_spatialSoundProfileAllowed);
    id v4 = xdict;
  }
}

- (id)description
{
  return [(CBControllerSettings *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 > 0x14u)
  {
    if ((a3 & 0x8000000) != 0)
    {
      id v3 = 0;
      id v18 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      NSAppendPrintF_safe();
      id v3 = 0;
      id v18 = v3;
    }
    NSAppendPrintF_safe();
    id v4 = v18;

    v17[4] = v4;
    NSAppendPrintF_safe();
    id v7 = v4;

    v17[3] = v7;
    NSAppendPrintF_safe();
    id v8 = v7;

    v17[2] = v8;
    NSAppendPrintF_safe();
    id v10 = v8;

    v17[1] = v10;
    NSAppendPrintF_safe();
    id v11 = v10;

    v17[0] = v11;
    uint64_t v12 = (id *)v17;
  }
  else
  {
    uint64_t v22 = 0;
    NSAppendPrintF_safe();
    id v21 = 0;
    NSAppendPrintF_safe();
    id v5 = v21;

    v20[3] = v5;
    NSAppendPrintF_safe();
    id v6 = v5;

    v20[2] = v6;
    NSAppendPrintF_safe();
    id v9 = v6;

    v20[1] = v9;
    NSAppendPrintF_safe();
    id v11 = v9;

    v20[0] = v11;
    uint64_t v12 = (id *)v20;
  }
  NSAppendPrintF_safe();
  uint64_t v13 = (__CFString *)*v12;

  if (v13) {
    int v14 = v13;
  }
  else {
    int v14 = &stru_1F02E5F20;
  }
  int v15 = v14;

  return v15;
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (void)setDiscoverableState:(int)a3
{
  self->_int64_t discoverableState = a3;
}

- (char)hid3ppLELegacyMode
{
  return self->_hid3ppLELegacyMode;
}

- (void)setHid3ppLELegacyMode:(char)a3
{
  self->_hid3ppLELegacyMode = a3;
}

- (char)setupAssistantIfNoKeyboard
{
  return self->_setupAssistantIfNoKeyboard;
}

- (void)setSetupAssistantIfNoKeyboard:(char)a3
{
  self->_setupAssistantIfNoKeyboard = a3;
}

- (char)setupAssistantIfNoPointingDevice
{
  return self->_setupAssistantIfNoPointingDevice;
}

- (void)setSetupAssistantIfNoPointingDevice:(char)a3
{
  self->_setupAssistantIfNoPointingDevice = a3;
}

- (char)spatialSoundProfileAllowed
{
  return self->_spatialSoundProfileAllowed;
}

- (void)setSpatialSoundProfileAllowed:(char)a3
{
  self->_spatialSoundProfileAllowed = a3;
}

- (char)bleAdvRSSI
{
  return self->_bleAdvRSSI;
}

- (void)setBleAdvRSSI:(char)a3
{
  self->_bleAdvRSSI = a3;
}

@end