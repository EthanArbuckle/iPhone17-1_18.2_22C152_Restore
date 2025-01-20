@interface BKSMutableHIDEventAuthenticationMessage
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDestinationAuditToken:(id)a3;
- (void)setEventType:(unsigned int)a3;
- (void)setHitTestInformationFromEndEvent:(id)a3;
- (void)setHitTestInformationFromStartEvent:(id)a3;
- (void)setOriginIdentifier:(unint64_t)a3;
- (void)setRegistrantEntitled:(BOOL)a3;
- (void)setSecureNameStatus:(int64_t)a3;
- (void)setTargetContextID:(unsigned int)a3;
- (void)setTargetSlotID:(unsigned int)a3;
- (void)setVersionedPID:(int64_t)a3;
@end

@implementation BKSMutableHIDEventAuthenticationMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[BKSHIDEventAuthenticationMessage _init](+[BKSHIDEventAuthenticationMessage allocWithZone:](BKSHIDEventAuthenticationMessage, "allocWithZone:", a3));
  v4[1] = self->super._versionedPID;
  *((_DWORD *)v4 + 4) = self->super._eventType;
  *((_DWORD *)v4 + 5) = self->super._targetSlotID;
  *((_DWORD *)v4 + 6) = self->super._targetContextID;
  uint64_t v5 = [(BKSHIDEventHitTestLayerInformation *)self->super._hitTestInformationFromStartEvent copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(BKSHIDEventHitTestLayerInformation *)self->super._hitTestInformationFromEndEvent copy];
  v8 = (void *)v4[5];
  v4[5] = v7;

  v4[6] = self->super._timestamp;
  v4[7] = self->super._originIdentifier;
  v4[8] = self->super._context;
  v4[9] = self->super._secureNameStatus;
  *((unsigned char *)v4 + 80) = self->super._registrantEntitled;
  uint64_t v9 = [(NSData *)self->super._signature copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (void)setRegistrantEntitled:(BOOL)a3
{
  self->super._registrantEntitled = a3;
}

- (void)setOriginIdentifier:(unint64_t)a3
{
  self->super._originIdentifier = a3;
}

- (void)setHitTestInformationFromEndEvent:(id)a3
{
  uint64_t v5 = (BKSHIDEventHitTestLayerInformation *)a3;
  hitTestInformationFromEndEvent = self->super._hitTestInformationFromEndEvent;
  p_hitTestInformationFromEndEvent = &self->super._hitTestInformationFromEndEvent;
  if (hitTestInformationFromEndEvent != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_hitTestInformationFromEndEvent, a3);
    uint64_t v5 = v8;
  }
}

- (void)setHitTestInformationFromStartEvent:(id)a3
{
  uint64_t v5 = (BKSHIDEventHitTestLayerInformation *)a3;
  hitTestInformationFromStartEvent = self->super._hitTestInformationFromStartEvent;
  p_hitTestInformationFromStartEvent = &self->super._hitTestInformationFromStartEvent;
  if (hitTestInformationFromStartEvent != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_hitTestInformationFromStartEvent, a3);
    uint64_t v5 = v8;
  }
}

- (void)setEventType:(unsigned int)a3
{
  self->super._eventType = a3;
}

- (void)setTargetContextID:(unsigned int)a3
{
  self->super._targetContextID = a3;
}

- (void)setTargetSlotID:(unsigned int)a3
{
  self->super._targetSlotID = a3;
}

- (void)setSecureNameStatus:(int64_t)a3
{
  self->super._secureNameStatus = a3;
}

- (void)setContext:(unint64_t)a3
{
  self->super._context = a3;
}

- (void)setDestinationAuditToken:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = NSString;
      v6 = (objc_class *)[v14 classForCoder];
      if (!v6) {
        v6 = (objc_class *)objc_opt_class();
      }
      uint64_t v7 = NSStringFromClass(v6);
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      v10 = [v5 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"destinationAuditToken", v7, v9];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v11 = NSStringFromSelector(a2);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138544642;
        v16 = v11;
        __int16 v17 = 2114;
        v18 = v13;
        __int16 v19 = 2048;
        v20 = self;
        __int16 v21 = 2114;
        v22 = @"BKSHIDEventAuthenticationMessage.m";
        __int16 v23 = 1024;
        int v24 = 415;
        __int16 v25 = 2114;
        v26 = v10;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5392CLL);
    }
  }

  self->super._versionedPID = [v14 versionedPID];
}

- (void)setVersionedPID:(int64_t)a3
{
  self->super._versionedPID = a3;
}

@end