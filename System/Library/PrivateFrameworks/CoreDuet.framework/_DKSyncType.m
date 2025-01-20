@interface _DKSyncType
+ (BOOL)supportsSecureCoding;
- (BOOL)didActivatePeer;
- (BOOL)didAddSyncedEvents;
- (BOOL)didDeleteSyncedEvents;
- (BOOL)didReceivePush;
- (BOOL)forceSync;
- (BOOL)isEqualToSyncType:(uint64_t)a1;
- (BOOL)isInitialSync;
- (BOOL)isPeriodicSync;
- (BOOL)isTriggeredSync;
- (_BYTE)initWithIsSingleDevice:(unsigned char *)result;
- (_DKSyncType)initWithCoder:(id)a3;
- (double)periodicSyncInterval;
- (id)description;
- (uint64_t)setDidDeleteSyncedEvents:(uint64_t)result;
- (uint64_t)setDidReceivePush:(uint64_t)result;
- (uint64_t)setForceSync:(uint64_t)result;
- (uint64_t)setIsInitialSync:(uint64_t)result;
- (uint64_t)setIsPeriodicSync:(uint64_t)result;
- (uint64_t)setIsTriggeredSync:(uint64_t)result;
- (uint64_t)setPeriodicSyncInterval:(uint64_t)result;
- (uint64_t)setUrgency:(uint64_t)result;
- (uint64_t)urgency;
- (uint64_t)xpcActivity;
- (void)encodeWithCoder:(id)a3;
- (void)mergeType:(uint64_t)a1;
- (void)setXpcActivity:(uint64_t)a1;
@end

@implementation _DKSyncType

- (void)setXpcActivity:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (_BYTE)initWithIsSingleDevice:(unsigned char *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_DKSyncType;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[8] = a2;
    }
  }
  return result;
}

- (void)mergeType:(uint64_t)a1
{
  objc_super v3 = a2;
  if (!a1) {
    goto LABEL_43;
  }
  if (*(unsigned char *)(a1 + 9))
  {
    *(unsigned char *)(a1 + 9) = 1;
LABEL_6:
    *(_WORD *)(a1 + 10) = 0;
LABEL_7:
    *(unsigned char *)(a1 + 12) = 0;
    goto LABEL_8;
  }
  if (!v3)
  {
    v17 = (unsigned char *)(a1 + 10);
    int v24 = *(unsigned __int8 *)(a1 + 10);
    *(unsigned char *)(a1 + 9) = 0;
    if (v24)
    {
LABEL_47:
      unsigned char *v17 = 1;
LABEL_49:
      *(_WORD *)(a1 + 11) = 0;
      goto LABEL_8;
    }
    v19 = (unsigned char *)(a1 + 11);
    int v25 = *(unsigned __int8 *)(a1 + 11);
    *(unsigned char *)(a1 + 10) = 0;
    if (v25)
    {
LABEL_51:
      unsigned char *v19 = 1;
      goto LABEL_7;
    }
    *(unsigned char *)(a1 + 11) = 0;
    v23 = (unsigned char *)(a1 + 12);
    v21 = (BOOL *)(a1 + 12);
    goto LABEL_56;
  }
  int v4 = v3[9];
  *(unsigned char *)(a1 + 9) = v4;
  if (v4) {
    goto LABEL_6;
  }
  v17 = (unsigned char *)(a1 + 10);
  if (*(unsigned char *)(a1 + 10)) {
    goto LABEL_47;
  }
  int v18 = v3[10];
  unsigned char *v17 = v18;
  if (v18) {
    goto LABEL_49;
  }
  v19 = (unsigned char *)(a1 + 11);
  if (*(unsigned char *)(a1 + 11)) {
    goto LABEL_51;
  }
  int v20 = v3[11];
  unsigned char *v19 = v20;
  if (v20) {
    goto LABEL_7;
  }
  v21 = (BOOL *)(a1 + 12);
  if (!*(unsigned char *)(a1 + 12))
  {
    v23 = v3 + 12;
LABEL_56:
    BOOL v22 = *v23 != 0;
    goto LABEL_57;
  }
  BOOL v22 = 1;
LABEL_57:
  BOOL *v21 = v22;
LABEL_8:
  if (v3)
  {
    if (v3[11]) {
      *(void *)(a1 + 32) = *((void *)v3 + 4);
    }
    unint64_t v5 = *((void *)v3 + 3);
    if (v5 > *(void *)(a1 + 24)) {
      *(void *)(a1 + 24) = v5;
    }
  }
  if (!*(unsigned char *)(a1 + 12))
  {
    *(_DWORD *)(a1 + 13) = 0;
    goto LABEL_34;
  }
  if (*(unsigned char *)(a1 + 13))
  {
    *(unsigned char *)(a1 + 13) = 1;
    BOOL v6 = *(unsigned char *)(a1 + 14) != 0;
    if (!v3 || *(unsigned char *)(a1 + 14))
    {
LABEL_24:
      *(unsigned char *)(a1 + 14) = v6;
      if (*(unsigned char *)(a1 + 15)) {
        goto LABEL_25;
      }
      if (v3) {
        goto LABEL_29;
      }
      goto LABEL_65;
    }
LABEL_23:
    BOOL v6 = v3[14] != 0;
    goto LABEL_24;
  }
  if (!v3)
  {
    *(unsigned char *)(a1 + 13) = 0;
    if (*(unsigned char *)(a1 + 15))
    {
      *(unsigned char *)(a1 + 15) = 1;
LABEL_66:
      v11 = (unsigned char *)(a1 + 16);
      v7 = (BOOL *)(a1 + 16);
      goto LABEL_32;
    }
LABEL_65:
    *(unsigned char *)(a1 + 15) = 0;
    goto LABEL_66;
  }
  *(unsigned char *)(a1 + 13) = v3[13];
  if (!*(unsigned char *)(a1 + 14)) {
    goto LABEL_23;
  }
  *(unsigned char *)(a1 + 14) = 1;
  if (*(unsigned char *)(a1 + 15))
  {
LABEL_25:
    v7 = (BOOL *)(a1 + 16);
    int v8 = *(unsigned __int8 *)(a1 + 16);
    *(unsigned char *)(a1 + 15) = 1;
    BOOL v9 = v8 != 0;
    if (!v3 || v8) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
LABEL_29:
  v7 = (BOOL *)(a1 + 16);
  int v10 = *(unsigned __int8 *)(a1 + 16);
  *(unsigned char *)(a1 + 15) = v3[15];
  if (!v10)
  {
LABEL_31:
    v11 = v3 + 16;
LABEL_32:
    BOOL v9 = *v11 != 0;
    goto LABEL_33;
  }
  BOOL v9 = 1;
LABEL_33:
  BOOL *v7 = v9;
LABEL_34:
  v26 = v3;
  if (*(unsigned char *)(a1 + 8))
  {
    if (v3)
    {
      *(unsigned char *)(a1 + 8) = v3[8];
LABEL_38:
      v12 = (void *)*((void *)v3 + 5);
      goto LABEL_39;
    }
    v12 = 0;
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 8) = 0;
    if (v3) {
      goto LABEL_38;
    }
    v12 = 0;
  }
LABEL_39:
  id v13 = v12;
  v14 = v13;
  uint64_t v16 = *(void *)(a1 + 40);
  v15 = (id *)(a1 + 40);
  if (!v16 && v13) {
    objc_storeStrong(v15, v12);
  }

  objc_super v3 = v26;
LABEL_43:
}

- (BOOL)forceSync
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

- (BOOL)isInitialSync
{
  if (result) {
    return *(unsigned char *)(result + 10) != 0;
  }
  return result;
}

- (BOOL)isPeriodicSync
{
  if (result) {
    return *(unsigned char *)(result + 11) != 0;
  }
  return result;
}

- (BOOL)isTriggeredSync
{
  if (result) {
    return *(unsigned char *)(result + 12) != 0;
  }
  return result;
}

- (double)periodicSyncInterval
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)urgency
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)didActivatePeer
{
  if (result) {
    return *(unsigned char *)(result + 13) != 0;
  }
  return result;
}

- (BOOL)didReceivePush
{
  if (result) {
    return *(unsigned char *)(result + 14) != 0;
  }
  return result;
}

- (BOOL)didAddSyncedEvents
{
  if (result) {
    return *(unsigned char *)(result + 15) != 0;
  }
  return result;
}

- (BOOL)didDeleteSyncedEvents
{
  if (result) {
    return *(unsigned char *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)xpcActivity
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  int v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@ %p:", v5, self];

  if (self->_forceSync) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v6 appendFormat:@" forceSync=%@,", v7];
  if (self->_isInitialSync) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  [v6 appendFormat:@" isInitialSync=%@,", v8];
  if (self->_isPeriodicSync) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  [v6 appendFormat:@" isPeriodicSync=%@,", v9];
  if (self->_isTriggeredSync) {
    int v10 = @"YES";
  }
  else {
    int v10 = @"NO";
  }
  [v6 appendFormat:@" isTriggeredSync=%@,", v10];
  v11 = [NSNumber numberWithUnsignedInteger:self->_urgency];
  [v6 appendFormat:@" urgency=%@,", v11];

  if (self->_didActivatePeer) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v6 appendFormat:@" didActivatePeer=%@,", v12];
  if (self->_didReceivePush) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  [v6 appendFormat:@" didReceivePush=%@,", v13];
  if (self->_didAddSyncedEvents) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v6 appendFormat:@" didAddSyncedEvents=%@,", v14];
  if (self->_didDeleteSyncedEvents) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [v6 appendFormat:@" didDeleteSyncedEvents=%@,", v15];
  if (self->_isSingleDevice) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  [v6 appendFormat:@" isSingleDevice=%@,", v16];
  v17 = [NSNumber numberWithDouble:self->_periodicSyncInterval];
  [v6 appendFormat:@" periodicSyncInterval=%@,", v17];

  [v6 appendFormat:@" xpcActivity=%@", self->_xpcActivity];
  [v6 appendString:@">"];
  int v18 = (void *)[v6 copy];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isSingleDevice = self->_isSingleDevice;
  id v5 = a3;
  [v5 encodeBool:isSingleDevice forKey:@"IsSingleDevice"];
  [v5 encodeBool:self->_forceSync forKey:@"ForceSync"];
  [v5 encodeBool:self->_isInitialSync forKey:@"IsInitialSync"];
  [v5 encodeBool:self->_isPeriodicSync forKey:@"IsPeriodicSync"];
  [v5 encodeBool:self->_isTriggeredSync forKey:@"IsTriggeredSync"];
  [v5 encodeInt:LODWORD(self->_urgency) forKey:@"Urgency"];
  [v5 encodeBool:self->_didActivatePeer forKey:@"DidActivatePeer"];
  [v5 encodeBool:self->_didReceivePush forKey:@"DidReceivePush"];
  [v5 encodeBool:self->_didAddSyncedEvents forKey:@"DidAddSyncedEvents"];
  [v5 encodeBool:self->_didDeleteSyncedEvents forKey:@"DidDeleteSyncedEvents"];
  [v5 encodeDouble:@"PeriodicSyncInterval" forKey:self->_periodicSyncInterval];
}

- (_DKSyncType)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeBoolForKey:@"IsSingleDevice"];
  BOOL v6 = [_DKSyncType alloc];
  if (v6
    && (v11.receiver = v6,
        v11.super_class = (Class)_DKSyncType,
        (v7 = [(_DKSyncType *)&v11 init]) != 0))
  {
    int v8 = v7;
    v7->_BOOL isSingleDevice = v5;
    v7->_forceSync = [v4 decodeBoolForKey:@"ForceSync"];
    v8->_isInitialSync = [v4 decodeBoolForKey:@"IsInitialSync"];
    v8->_isPeriodicSync = [v4 decodeBoolForKey:@"IsPeriodicSync"];
    v8->_isTriggeredSync = [v4 decodeBoolForKey:@"IsTriggeredSync"];
    v8->_urgency = (int)[v4 decodeIntForKey:@"Urgency"];
    v8->_didActivatePeer = [v4 decodeBoolForKey:@"DidActivatePeer"];
    v8->_didReceivePush = [v4 decodeBoolForKey:@"DidReceivePush"];
    v8->_didAddSyncedEvents = [v4 decodeBoolForKey:@"DidAddSyncedEvents"];
    v8->_didDeleteSyncedEvents = [v4 decodeBoolForKey:@"DidDeleteSyncedEvents"];
    [v4 decodeDoubleForKey:@"PeriodicSyncInterval"];
    v8->_periodicSyncInterval = v9;
  }
  else
  {
    [v4 decodeBoolForKey:@"ForceSync"];
    [v4 decodeBoolForKey:@"IsInitialSync"];
    [v4 decodeBoolForKey:@"IsPeriodicSync"];
    [v4 decodeBoolForKey:@"IsTriggeredSync"];
    [v4 decodeIntForKey:@"Urgency"];
    [v4 decodeBoolForKey:@"DidActivatePeer"];
    [v4 decodeBoolForKey:@"DidReceivePush"];
    [v4 decodeBoolForKey:@"DidAddSyncedEvents"];
    [v4 decodeBoolForKey:@"DidDeleteSyncedEvents"];
    [v4 decodeDoubleForKey:@"PeriodicSyncInterval"];
    int v8 = 0;
  }

  return v8;
}

- (uint64_t)setForceSync:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 9) = a2;
  }
  return result;
}

- (uint64_t)setIsInitialSync:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 10) = a2;
  }
  return result;
}

- (uint64_t)setIsPeriodicSync:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 11) = a2;
  }
  return result;
}

- (uint64_t)setIsTriggeredSync:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 12) = a2;
  }
  return result;
}

- (uint64_t)setUrgency:(uint64_t)result
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setDidReceivePush:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 14) = a2;
  }
  return result;
}

- (uint64_t)setDidDeleteSyncedEvents:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setPeriodicSyncInterval:(uint64_t)result
{
  if (result) {
    *(double *)(result + 32) = a2;
  }
  return result;
}

- (BOOL)isEqualToSyncType:(uint64_t)a1
{
  objc_super v3 = a2;
  BOOL v4 = 0;
  if (a1 && v3) {
    BOOL v4 = *(unsigned __int8 *)(a1 + 8) == *((unsigned __int8 *)v3 + 8)
  }
      && *(unsigned __int8 *)(a1 + 9) == *((unsigned __int8 *)v3 + 9)
      && *(unsigned __int8 *)(a1 + 10) == *((unsigned __int8 *)v3 + 10)
      && *(unsigned __int8 *)(a1 + 11) == *((unsigned __int8 *)v3 + 11)
      && *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v3 + 12)
      && *(void *)(a1 + 24) == v3[3]
      && *(unsigned __int8 *)(a1 + 13) == *((unsigned __int8 *)v3 + 13)
      && *(unsigned __int8 *)(a1 + 14) == *((unsigned __int8 *)v3 + 14)
      && *(unsigned __int8 *)(a1 + 15) == *((unsigned __int8 *)v3 + 15)
      && *(unsigned __int8 *)(a1 + 16) == *((unsigned __int8 *)v3 + 16)
      && *(double *)(a1 + 32) == *((double *)v3 + 4);

  return v4;
}

- (void).cxx_destruct
{
}

@end