@interface DNDSClientConnectionDetails
- (BOOL)wantsActiveModeUpdates;
- (BOOL)wantsGlobalConfigurationUpdates;
- (BOOL)wantsMeDeviceStateUpdates;
- (BOOL)wantsModeUpdates;
- (BOOL)wantsSettingsUpdates;
- (BOOL)wantsStateUpdates;
- (DNDSClientConnectionDetails)init;
- (NSSet)activeAssertionUpdateClientIdentifiers;
- (NSSet)assertionUpdateClientIdentifiers;
- (NSUUID)interruptionInvalidationAssertionUUID;
- (id)_initWithDetails:(id)a3;
- (id)_initWithInterruptionInvalidationAssertionUUID:(id)a3 assertionUpdateClientIdentifiers:(id)a4 activeAssertionUpdateClientIdentifiers:(id)a5 wantsStateUpdates:(BOOL)a6 wantsSettingsUpdates:(BOOL)a7 wantsModeUpdates:(BOOL)a8 wantsActiveModeUpdates:(BOOL)a9 wantsGlobalConfigurationUpdates:(BOOL)a10 wantsMeDeviceStateUpdates:(BOOL)a11;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation DNDSClientConnectionDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertionUpdateClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_assertionUpdateClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_interruptionInvalidationAssertionUUID, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [DNDSMutableClientConnectionDetails alloc];
  return [(DNDSClientConnectionDetails *)v4 _initWithDetails:self];
}

- (DNDSClientConnectionDetails)init
{
  return (DNDSClientConnectionDetails *)[(DNDSClientConnectionDetails *)self _initWithDetails:0];
}

- (id)_initWithDetails:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSClientConnectionDetails *)self interruptionInvalidationAssertionUUID];
  v6 = [v4 assertionUpdateClientIdentifiers];
  v7 = [v4 activeAssertionUpdateClientIdentifiers];
  unsigned int v16 = [v4 wantsStateUpdates];
  uint64_t v8 = [v4 wantsSettingsUpdates];
  uint64_t v9 = [v4 wantsModeUpdates];
  char v10 = [v4 wantsActiveModeUpdates];
  char v11 = [v4 wantsGlobalConfigurationUpdates];
  char v12 = [v4 wantsMeDeviceStateUpdates];

  BYTE2(v15) = v12;
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  id v13 = -[DNDSClientConnectionDetails _initWithInterruptionInvalidationAssertionUUID:assertionUpdateClientIdentifiers:activeAssertionUpdateClientIdentifiers:wantsStateUpdates:wantsSettingsUpdates:wantsModeUpdates:wantsActiveModeUpdates:wantsGlobalConfigurationUpdates:wantsMeDeviceStateUpdates:](self, "_initWithInterruptionInvalidationAssertionUUID:assertionUpdateClientIdentifiers:activeAssertionUpdateClientIdentifiers:wantsStateUpdates:wantsSettingsUpdates:wantsModeUpdates:wantsActiveModeUpdates:wantsGlobalConfigurationUpdates:wantsMeDeviceStateUpdates:", v5, v6, v7, v16, v8, v9, v15);

  return v13;
}

- (NSUUID)interruptionInvalidationAssertionUUID
{
  return self->_interruptionInvalidationAssertionUUID;
}

- (id)_initWithInterruptionInvalidationAssertionUUID:(id)a3 assertionUpdateClientIdentifiers:(id)a4 activeAssertionUpdateClientIdentifiers:(id)a5 wantsStateUpdates:(BOOL)a6 wantsSettingsUpdates:(BOOL)a7 wantsModeUpdates:(BOOL)a8 wantsActiveModeUpdates:(BOOL)a9 wantsGlobalConfigurationUpdates:(BOOL)a10 wantsMeDeviceStateUpdates:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v32.receiver = self;
  v32.super_class = (Class)DNDSClientConnectionDetails;
  v20 = [(DNDSClientConnectionDetails *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v17 copy];
    interruptionInvalidationAssertionUUID = v20->_interruptionInvalidationAssertionUUID;
    v20->_interruptionInvalidationAssertionUUID = (NSUUID *)v21;

    v23 = (void *)[v18 copy];
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CAD0] set];
    }
    assertionUpdateClientIdentifiers = v20->_assertionUpdateClientIdentifiers;
    v20->_assertionUpdateClientIdentifiers = v25;

    v27 = (void *)[v19 copy];
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CAD0] set];
    }
    activeAssertionUpdateClientIdentifiers = v20->_activeAssertionUpdateClientIdentifiers;
    v20->_activeAssertionUpdateClientIdentifiers = v29;

    v20->_wantsStateUpdates = a6;
    v20->_wantsSettingsUpdates = a7;
    v20->_wantsModeUpdates = a8;
    v20->_wantsActiveModeUpdates = a9;
    v20->_wantsGlobalConfigurationUpdates = a10;
    v20->_wantsMeDeviceStateUpdates = a11;
  }

  return v20;
}

- (BOOL)wantsStateUpdates
{
  return self->_wantsStateUpdates;
}

- (BOOL)wantsSettingsUpdates
{
  return self->_wantsSettingsUpdates;
}

- (BOOL)wantsModeUpdates
{
  return self->_wantsModeUpdates;
}

- (BOOL)wantsMeDeviceStateUpdates
{
  return self->_wantsMeDeviceStateUpdates;
}

- (BOOL)wantsGlobalConfigurationUpdates
{
  return self->_wantsGlobalConfigurationUpdates;
}

- (BOOL)wantsActiveModeUpdates
{
  return self->_wantsActiveModeUpdates;
}

- (NSSet)assertionUpdateClientIdentifiers
{
  return self->_assertionUpdateClientIdentifiers;
}

- (NSSet)activeAssertionUpdateClientIdentifiers
{
  return self->_activeAssertionUpdateClientIdentifiers;
}

@end