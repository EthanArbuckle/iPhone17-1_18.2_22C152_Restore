@interface LACEnvironmentMechanismBiometry
+ (BOOL)supportsSecureCoding;
+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)enrolled;
- (BOOL)isEqual:(id)a3;
- (BOOL)lockedOut;
- (BOOL)sensorInaccessible;
- (LACEnvironmentMechanismBiometry)initWithAvailabilityError:(id)a3 biometryType:(int64_t)a4 enrolled:(BOOL)a5 lockedOut:(BOOL)a6 stateHash:(id)a7 sensorInaccessible:(BOOL)a8 approvalState:(int64_t)a9;
- (LACEnvironmentMechanismBiometry)initWithCoder:(id)a3;
- (NSData)stateHash;
- (id)descriptionDetails;
- (int64_t)approvalState;
- (int64_t)biometryType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanismBiometry

- (LACEnvironmentMechanismBiometry)initWithAvailabilityError:(id)a3 biometryType:(int64_t)a4 enrolled:(BOOL)a5 lockedOut:(BOOL)a6 stateHash:(id)a7 sensorInaccessible:(BOOL)a8 approvalState:(int64_t)a9
{
  id v16 = a7;
  id v17 = a3;
  v18 = NSLocalizedStringFromLACBiometryType(a4);
  switch(a4)
  {
    case 1:
      v19 = @"touchid";
      break;
    case 2:
      v19 = @"faceid";
      break;
    case 4:
      v19 = @"opticid";
      break;
    default:
      v19 = @"questionmark";
      break;
  }
  v22.receiver = self;
  v22.super_class = (Class)LACEnvironmentMechanismBiometry;
  v20 = [(LACEnvironmentMechanism *)&v22 initWithAvailabilityError:v17 localizedName:v18 iconSystemName:v19];

  if (v20)
  {
    v20->_biometryType = a4;
    v20->_enrolled = a5;
    v20->_lockedOut = a6;
    objc_storeStrong((id *)&v20->_stateHash, a7);
    v20->_sensorInaccessible = a8;
    v20->_approvalState = a9;
  }

  return v20;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  id v8 = a5;
  v9 = [v8 biometryHelper];
  if (!v9)
  {
    id v17 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v7];
  id v34 = 0;
  uint64_t v11 = [v9 isEnrolled:v10 error:&v34];
  id v12 = v34;
  if (!v11) {
    goto LABEL_5;
  }
  v13 = objc_opt_new();
  id v33 = v12;
  int v14 = [v9 isLockedOutForUser:v10 request:v13 error:&v33];
  id v15 = v33;

  if (v14)
  {
    id v12 = v15;
LABEL_5:
    id v15 = v12;
    unsigned int v27 = v11;
    id v16 = v15;
    goto LABEL_8;
  }
  unsigned int v27 = 0;
  id v16 = 0;
LABEL_8:
  v18 = [v8 onenessSessionMonitor];
  int v19 = [v18 isSessionActive];

  if (v19 && !v16)
  {
    id v16 = +[LACError errorWithCode:-6 debugDescription:@"Companion session is active"];
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __93__LACEnvironmentMechanismBiometry_environmentMechanismForUser_auditToken_dependencies_error___block_invoke;
  v29[3] = &unk_2653B6B68;
  id v20 = v9;
  id v30 = v20;
  long long v21 = *(_OWORD *)&a4->var0[4];
  long long v31 = *(_OWORD *)a4->var0;
  long long v32 = v21;
  int64_t v22 = __93__LACEnvironmentMechanismBiometry_environmentMechanismForUser_auditToken_dependencies_error___block_invoke((uint64_t)v29);
  if (!v22 && !v16)
  {
    id v16 = +[LACError errorWithCode:-1018 debugDescription:@"User has denied the use of biometry for this app."];
  }
  v28 = (void *)v10;
  if (v11)
  {
    v23 = [v20 biometryDatabaseHashForUser:v10 error:0];
  }
  else
  {
    v23 = 0;
  }
  v24 = [LACEnvironmentMechanismBiometry alloc];
  v25 = v16;
  if (!v16)
  {
    v25 = +[LACError errorWithCode:-1004 debugDescription:@"User interaction is required"];
  }
  id v17 = -[LACEnvironmentMechanismBiometry initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:](v24, "initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:", v25, [v20 biometryType], v11, v27, v23, 0, v22);
  if (!v16) {

  }
LABEL_22:
  return v17;
}

int64_t __93__LACEnvironmentMechanismBiometry_environmentMechanismForUser_auditToken_dependencies_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) biometryType] != 2) {
    return 1;
  }
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  return +[LACTCCHelper approvalStateOfFaceIDSeviceForAuditToken:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)LACEnvironmentMechanismBiometry;
  id v4 = a3;
  [(LACEnvironmentMechanism *)&v17 encodeWithCoder:v4];
  int64_t v5 = [(LACEnvironmentMechanismBiometry *)self biometryType];
  v6 = NSStringFromSelector(sel_biometryType);
  [v4 encodeInteger:v5 forKey:v6];

  BOOL v7 = [(LACEnvironmentMechanismBiometry *)self enrolled];
  id v8 = NSStringFromSelector(sel_enrolled);
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = [(LACEnvironmentMechanismBiometry *)self lockedOut];
  uint64_t v10 = NSStringFromSelector(sel_lockedOut);
  [v4 encodeBool:v9 forKey:v10];

  uint64_t v11 = [(LACEnvironmentMechanismBiometry *)self stateHash];
  id v12 = NSStringFromSelector(sel_stateHash);
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = [(LACEnvironmentMechanismBiometry *)self sensorInaccessible];
  int v14 = NSStringFromSelector(sel_sensorInaccessible);
  [v4 encodeBool:v13 forKey:v14];

  int64_t v15 = [(LACEnvironmentMechanismBiometry *)self approvalState];
  id v16 = NSStringFromSelector(sel_approvalState);
  [v4 encodeInt:v15 forKey:v16];
}

- (LACEnvironmentMechanismBiometry)initWithCoder:(id)a3
{
  id v3 = a3;
  id v20 = NSStringFromSelector(sel_availabilityError);
  objc_super v17 = [v3 decodeObjectForKey:v20];
  int v19 = NSStringFromSelector(sel_biometryType);
  uint64_t v16 = [v3 decodeIntegerForKey:v19];
  id v4 = NSStringFromSelector(sel_enrolled);
  unsigned int v15 = [v3 decodeBoolForKey:v4];
  int64_t v5 = NSStringFromSelector(sel_lockedOut);
  uint64_t v6 = [v3 decodeBoolForKey:v5];
  BOOL v7 = NSStringFromSelector(sel_stateHash);
  id v8 = [v3 decodeObjectForKey:v7];
  BOOL v9 = NSStringFromSelector(sel_sensorInaccessible);
  uint64_t v10 = [v3 decodeBoolForKey:v9];
  uint64_t v11 = NSStringFromSelector(sel_approvalState);
  int v12 = [v3 decodeIntForKey:v11];

  BOOL v13 = [(LACEnvironmentMechanismBiometry *)self initWithAvailabilityError:v17 biometryType:v16 enrolled:v15 lockedOut:v6 stateHash:v8 sensorInaccessible:v10 approvalState:v12];
  return v13;
}

- (id)descriptionDetails
{
  id v3 = objc_opt_new();
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"biometryType: %d", -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType"));
  [v3 addObject:v4];

  if (![(LACEnvironmentMechanismBiometry *)self enrolled]) {
    [v3 addObject:@"not enrolled"];
  }
  if ([(LACEnvironmentMechanismBiometry *)self lockedOut]) {
    [v3 addObject:@"locked out"];
  }
  if ([(LACEnvironmentMechanismBiometry *)self sensorInaccessible]) {
    [v3 addObject:@"sensor inaccessible"];
  }
  if ([(LACEnvironmentMechanismBiometry *)self approvalState] != 1)
  {
    int64_t v5 = NSString;
    uint64_t v6 = NSStringFromLACEnvironmentMechanismApprovalState([(LACEnvironmentMechanismBiometry *)self approvalState]);
    BOOL v7 = [v5 stringWithFormat:@"approvalState: %@", v6];
    [v3 addObject:v7];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanismBiometry *)a3;
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)LACEnvironmentMechanismBiometry;
  if (![(LACEnvironmentMechanism *)&v18 isEqual:v4]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v15) = 0;
    goto LABEL_13;
  }
  int64_t v5 = v4;
  int64_t v6 = [(LACEnvironmentMechanismBiometry *)self biometryType];
  if (v6 != [(LACEnvironmentMechanismBiometry *)v5 biometryType]) {
    goto LABEL_9;
  }
  BOOL v7 = [(LACEnvironmentMechanismBiometry *)self enrolled];
  if (v7 != [(LACEnvironmentMechanismBiometry *)v5 enrolled]) {
    goto LABEL_9;
  }
  BOOL v8 = [(LACEnvironmentMechanismBiometry *)self lockedOut];
  if (v8 != [(LACEnvironmentMechanismBiometry *)v5 lockedOut]) {
    goto LABEL_9;
  }
  BOOL v9 = [(LACEnvironmentMechanismBiometry *)self stateHash];
  uint64_t v10 = [(LACEnvironmentMechanismBiometry *)v5 stateHash];
  if (v9 == (void *)v10)
  {

    goto LABEL_15;
  }
  uint64_t v11 = (void *)v10;
  int v12 = [(LACEnvironmentMechanismBiometry *)self stateHash];
  BOOL v13 = [(LACEnvironmentMechanismBiometry *)v5 stateHash];
  int v14 = [v12 isEqualToData:v13];

  if (v14)
  {
LABEL_15:
    BOOL v17 = [(LACEnvironmentMechanismBiometry *)self sensorInaccessible];
    BOOL v15 = v17 ^ [(LACEnvironmentMechanismBiometry *)v5 sensorInaccessible] ^ 1;
    goto LABEL_10;
  }
LABEL_9:
  LOBYTE(v15) = 0;
LABEL_10:

LABEL_13:
  return v15;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (BOOL)enrolled
{
  return self->_enrolled;
}

- (BOOL)lockedOut
{
  return self->_lockedOut;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (BOOL)sensorInaccessible
{
  return self->_sensorInaccessible;
}

- (int64_t)approvalState
{
  return self->_approvalState;
}

- (void).cxx_destruct
{
}

@end