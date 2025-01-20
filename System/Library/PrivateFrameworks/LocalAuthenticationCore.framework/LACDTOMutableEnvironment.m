@interface LACDTOMutableEnvironment
+ (id)nullInstance;
- (BOOL)_isBiometryUsable;
- (BOOL)allowsAuthenticationFallbacks;
- (BOOL)allowsGracePeriodUI;
- (BOOL)hasExpiredBiometry;
- (BOOL)inFamiliarLocation;
- (BOOL)isConfirmed;
- (BOOL)isDTOActive;
- (BOOL)isDTOEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGracePeriodActive;
- (BOOL)isStrictModeEnabled;
- (LACDTOBiometryWatchdogPack)biometryWatchdogPack;
- (LACDTOFeatureState)featureState;
- (LACDTOGracePeriodState)gracePeriodState;
- (LACDTOLocationState)locationState;
- (LACDTOLostModeState)lostModeState;
- (LACDTORatchetState)ratchetState;
- (NSString)description;
- (void)setBiometryWatchdogPack:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setFeatureState:(id)a3;
- (void)setGracePeriodState:(id)a3;
- (void)setLocationState:(id)a3;
- (void)setLostModeState:(id)a3;
- (void)setRatchetState:(id)a3;
@end

@implementation LACDTOMutableEnvironment

- (BOOL)allowsAuthenticationFallbacks
{
  if ([(LACDTOMutableEnvironment *)self inFamiliarLocation]
    || ![(LACDTOMutableEnvironment *)self isDTOActive])
  {
    return 1;
  }
  return [(LACDTOMutableEnvironment *)self hasExpiredBiometry];
}

- (BOOL)allowsGracePeriodUI
{
  if (![(LACDTOMutableEnvironment *)self isGracePeriodActive]
    || ![(LACDTOMutableEnvironment *)self isDTOActive])
  {
    return 0;
  }
  return [(LACDTOMutableEnvironment *)self _isBiometryUsable];
}

- (BOOL)isGracePeriodActive
{
  v2 = [(LACDTOMutableEnvironment *)self gracePeriodState];
  char v3 = [v2 isActive];

  return v3;
}

- (BOOL)hasExpiredBiometry
{
  v2 = [(LACDTOMutableEnvironment *)self ratchetState];
  BOOL v3 = [v2 rawValue] == 4;

  return v3;
}

- (BOOL)isDTOEnabled
{
  v2 = [(LACDTOMutableEnvironment *)self featureState];
  char v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)isDTOActive
{
  char v3 = [(LACDTOMutableEnvironment *)self featureState];
  if ([v3 isEnabled])
  {
    v4 = [(LACDTOMutableEnvironment *)self featureState];
    char v5 = [v4 isAvailable];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isStrictModeEnabled
{
  v2 = [(LACDTOMutableEnvironment *)self featureState];
  char v3 = [v2 isStrictModeEnabled];

  return v3;
}

- (BOOL)inFamiliarLocation
{
  v2 = [(LACDTOMutableEnvironment *)self locationState];
  char v3 = [v2 isInFamiliarLocation];

  return v3;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(LACDTOMutableEnvironment);
  [(LACDTOMutableEnvironment *)v2 setConfirmed:0];
  char v3 = +[LACDTOBiometryWatchdogPack nullInstance];
  [(LACDTOMutableEnvironment *)v2 setBiometryWatchdogPack:v3];

  v4 = +[LACDTOMutableFeatureState nullInstance];
  [(LACDTOMutableEnvironment *)v2 setFeatureState:v4];

  char v5 = +[LACDTOLocationState nullInstance];
  [(LACDTOMutableEnvironment *)v2 setLocationState:v5];

  v6 = +[LACDTOLostModeState nullInstance];
  [(LACDTOMutableEnvironment *)v2 setLostModeState:v6];

  v7 = +[LACDTORatchetState nullInstance];
  [(LACDTOMutableEnvironment *)v2 setRatchetState:v7];

  v8 = +[LACDTOGracePeriodState nullInstance];
  [(LACDTOMutableEnvironment *)v2 setGracePeriodState:v8];

  return v2;
}

- (BOOL)_isBiometryUsable
{
  char v3 = [(LACDTOMutableEnvironment *)self featureState];
  v4 = [v3 requirements];
  if ([v4 hasBiometricEnrollments]) {
    BOOL v5 = ![(LACDTOMutableEnvironment *)self hasExpiredBiometry];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)description
{
  v52[14] = *MEMORY[0x263EF8340];
  int v3 = os_variant_allows_internal_security_policies();
  v47 = NSString;
  uint64_t v46 = objc_opt_class();
  v4 = NSString;
  if ([(LACDTOMutableEnvironment *)self isConfirmed]) {
    BOOL v5 = @"YES";
  }
  else {
    BOOL v5 = @"NO";
  }
  v51 = [v4 stringWithFormat:@"confirmed: %@", v5];
  v52[0] = v51;
  v6 = NSString;
  if ([(LACDTOMutableEnvironment *)self isDTOEnabled]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v50 = [v6 stringWithFormat:@"isDTOEnabled: %@", v7];
  v52[1] = v50;
  v8 = NSString;
  if ([(LACDTOMutableEnvironment *)self isDTOActive]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v49 = [v8 stringWithFormat:@"isDTOActive: %@", v9];
  v52[2] = v49;
  v10 = NSString;
  if ([(LACDTOMutableEnvironment *)self isGracePeriodActive]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v48 = [v10 stringWithFormat:@"isGracePeriodActive: %@", v11];
  v52[3] = v48;
  v12 = NSString;
  if ([(LACDTOMutableEnvironment *)self isStrictModeEnabled]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v45 = [v12 stringWithFormat:@"isStrictModeEnabled: %@", v13];
  v52[4] = v45;
  v14 = NSString;
  if ([(LACDTOMutableEnvironment *)self hasExpiredBiometry]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v44 = [v14 stringWithFormat:@"hasExpiredBiometry: %@", v15];
  v52[5] = v44;
  v16 = NSString;
  if (v3)
  {
    if ([(LACDTOMutableEnvironment *)self allowsAuthenticationFallbacks]) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
  }
  else
  {
    v17 = @"<private>";
  }
  v43 = [v16 stringWithFormat:@"allowsAuthenticationFallbacks: %@", v17];
  v52[6] = v43;
  v18 = NSString;
  if (v3)
  {
    if ([(LACDTOMutableEnvironment *)self allowsGracePeriodUI]) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
  }
  else
  {
    v19 = @"<private>";
  }
  v42 = [v18 stringWithFormat:@"allowsGracePeriodUI: %@", v19];
  v52[7] = v42;
  v20 = NSString;
  v41 = [(LACDTOMutableEnvironment *)self biometryWatchdogPack];
  v40 = [v20 stringWithFormat:@"biometryWatchdogPack: %@", v41];
  v52[8] = v40;
  v21 = NSString;
  v39 = [(LACDTOMutableEnvironment *)self locationState];
  v38 = [v21 stringWithFormat:@"locationState: %@", v39];
  v52[9] = v38;
  v22 = NSString;
  v37 = [(LACDTOMutableEnvironment *)self lostModeState];
  v23 = [v22 stringWithFormat:@"lostModeState: %@", v37];
  v52[10] = v23;
  v24 = NSString;
  v25 = [(LACDTOMutableEnvironment *)self featureState];
  v26 = [v24 stringWithFormat:@"featureState: %@", v25];
  v52[11] = v26;
  v27 = NSString;
  v28 = [(LACDTOMutableEnvironment *)self ratchetState];
  v29 = [v27 stringWithFormat:@"ratchetState: %@", v28];
  v52[12] = v29;
  v30 = NSString;
  v31 = [(LACDTOMutableEnvironment *)self gracePeriodState];
  v32 = [v30 stringWithFormat:@"gracePeriodState: %@", v31];
  v52[13] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:14];
  v34 = [v33 componentsJoinedByString:@"; "];
  v35 = [v47 stringWithFormat:@"<%@ %p; %@>", v46, self, v34];

  return (NSString *)v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_27043AA30])
  {
    id v5 = v4;
    int v6 = [(LACDTOMutableEnvironment *)self isConfirmed];
    if (v6 != [v5 isConfirmed]) {
      goto LABEL_29;
    }
    int v7 = [(LACDTOMutableEnvironment *)self inFamiliarLocation];
    if (v7 != [v5 inFamiliarLocation]) {
      goto LABEL_29;
    }
    int v8 = [(LACDTOMutableEnvironment *)self isDTOEnabled];
    if (v8 != [v5 isDTOEnabled]) {
      goto LABEL_29;
    }
    int v9 = [(LACDTOMutableEnvironment *)self hasExpiredBiometry];
    if (v9 != [v5 hasExpiredBiometry]) {
      goto LABEL_29;
    }
    int v10 = [(LACDTOMutableEnvironment *)self allowsAuthenticationFallbacks];
    if (v10 != [v5 allowsAuthenticationFallbacks]) {
      goto LABEL_29;
    }
    int v11 = [(LACDTOMutableEnvironment *)self allowsGracePeriodUI];
    if (v11 != [v5 allowsGracePeriodUI]) {
      goto LABEL_29;
    }
    int v12 = [(LACDTOMutableEnvironment *)self isGracePeriodActive];
    if (v12 != [v5 isGracePeriodActive]) {
      goto LABEL_29;
    }
    int v13 = [(LACDTOMutableEnvironment *)self isStrictModeEnabled];
    if (v13 != [v5 isStrictModeEnabled]) {
      goto LABEL_29;
    }
    v14 = [(LACDTOMutableEnvironment *)self biometryWatchdogPack];
    uint64_t v15 = [v5 biometryWatchdogPack];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(LACDTOMutableEnvironment *)self biometryWatchdogPack];
      v18 = [v5 biometryWatchdogPack];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_29;
      }
    }
    v21 = [(LACDTOMutableEnvironment *)self featureState];
    uint64_t v22 = [v5 featureState];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(LACDTOMutableEnvironment *)self featureState];
      v25 = [v5 featureState];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_29;
      }
    }
    v27 = [(LACDTOMutableEnvironment *)self locationState];
    uint64_t v28 = [v5 locationState];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(LACDTOMutableEnvironment *)self locationState];
      v31 = [v5 locationState];
      char v32 = [v30 isEqual:v31];

      if (v32) {
        goto LABEL_29;
      }
    }
    v33 = [(LACDTOMutableEnvironment *)self lostModeState];
    uint64_t v34 = [v5 lostModeState];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(LACDTOMutableEnvironment *)self lostModeState];
      v37 = [v5 lostModeState];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_29;
      }
    }
    v39 = [(LACDTOMutableEnvironment *)self ratchetState];
    uint64_t v40 = [v5 ratchetState];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(LACDTOMutableEnvironment *)self ratchetState];
      v43 = [v5 ratchetState];
      int v44 = [v42 isEqual:v43];

      if (!v44)
      {
LABEL_29:
        char v20 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    uint64_t v46 = [(LACDTOMutableEnvironment *)self gracePeriodState];
    uint64_t v47 = [v5 gracePeriodState];
    if (v46 == (void *)v47)
    {
      char v20 = 1;
      v48 = v46;
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(LACDTOMutableEnvironment *)self gracePeriodState];
      v50 = [v5 gracePeriodState];
      char v20 = [v49 isEqual:v50];
    }
    goto LABEL_30;
  }
  char v20 = 0;
LABEL_31:

  return v20;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (LACDTOBiometryWatchdogPack)biometryWatchdogPack
{
  return self->_biometryWatchdogPack;
}

- (void)setBiometryWatchdogPack:(id)a3
{
}

- (LACDTOFeatureState)featureState
{
  return self->_featureState;
}

- (void)setFeatureState:(id)a3
{
}

- (LACDTOLocationState)locationState
{
  return self->_locationState;
}

- (void)setLocationState:(id)a3
{
}

- (LACDTOLostModeState)lostModeState
{
  return self->_lostModeState;
}

- (void)setLostModeState:(id)a3
{
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
}

- (LACDTOGracePeriodState)gracePeriodState
{
  return self->_gracePeriodState;
}

- (void)setGracePeriodState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gracePeriodState, 0);
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->_lostModeState, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_featureState, 0);
  objc_storeStrong((id *)&self->_biometryWatchdogPack, 0);
}

@end