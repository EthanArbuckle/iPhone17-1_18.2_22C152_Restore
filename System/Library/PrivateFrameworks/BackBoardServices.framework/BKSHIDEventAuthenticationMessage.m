@interface BKSHIDEventAuthenticationMessage
+ (BKSHIDEventAuthenticationMessage)new;
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (BKSHIDEventAuthenticationMessage)init;
- (BKSHIDEventAuthenticationMessage)initWithBSXPCCoder:(id)a3;
- (BKSHIDEventAuthenticationMessage)initWithCoder:(id)a3;
- (BKSHIDEventAuthenticationMessage)initWithXPCDictionary:(id)a3;
- (BKSHIDEventHitTestLayerInformation)hitTestInformationFromEndEvent;
- (BKSHIDEventHitTestLayerInformation)hitTestInformationFromStartEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)registrantEntitled;
- (NSString)description;
- (id)_calculateSignatureWithHMACContext:(uint64_t)a1;
- (id)_dataProtobufEncoded;
- (id)_init;
- (id)_protobufDecodedMessageFromData:(uint64_t)a1;
- (int64_t)secureNameStatus;
- (int64_t)versionedPID;
- (unint64_t)context;
- (unint64_t)hash;
- (unint64_t)originIdentifier;
- (unint64_t)timestamp;
- (unsigned)eventType;
- (unsigned)targetContextID;
- (unsigned)targetSlotID;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BKSHIDEventAuthenticationMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_hitTestInformationFromEndEvent, 0);
  objc_storeStrong((id *)&self->_hitTestInformationFromStartEvent, 0);
}

- (BOOL)registrantEntitled
{
  return self->_registrantEntitled;
}

- (int64_t)secureNameStatus
{
  return self->_secureNameStatus;
}

- (unint64_t)context
{
  return self->_context;
}

- (unint64_t)originIdentifier
{
  return self->_originIdentifier;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BKSHIDEventHitTestLayerInformation)hitTestInformationFromEndEvent
{
  return self->_hitTestInformationFromEndEvent;
}

- (BKSHIDEventHitTestLayerInformation)hitTestInformationFromStartEvent
{
  return self->_hitTestInformationFromStartEvent;
}

- (unsigned)targetContextID
{
  return self->_targetContextID;
}

- (unsigned)targetSlotID
{
  return self->_targetSlotID;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (id)_init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        v4 = [NSString stringWithFormat:@"BKSHIDEventAuthenticationMessage cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v5 = NSStringFromSelector(sel__init);
          v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          __int16 v11 = 2114;
          v12 = v7;
          __int16 v13 = 2048;
          v14 = v1;
          __int16 v15 = 2114;
          v16 = @"BKSHIDEventAuthenticationMessage.m";
          __int16 v17 = 1024;
          int v18 = 122;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v4 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA53580);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSHIDEventAuthenticationMessage;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BKSHIDEventAuthenticationMessage_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_7484 != -1) {
    dispatch_once(&protobufSchema_onceToken_7484, block);
  }
  uint64_t v2 = (void *)protobufSchema_schema_7485;
  return v2;
}

uint64_t __50__BKSHIDEventAuthenticationMessage_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_7487];
  uint64_t v2 = protobufSchema_schema_7485;
  protobufSchema_schema_7485 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __50__BKSHIDEventAuthenticationMessage_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_signature"];
  [v2 addField:"_hitTestInformationFromStartEvent"];
  [v2 addField:"_hitTestInformationFromEndEvent"];
  [v2 addField:"_originIdentifier"];
  [v2 addField:"_timestamp"];
  [v2 addField:"_context"];
  [v2 addField:"_secureNameStatus"];
  [v2 addField:"_eventType"];
  [v2 addField:"_targetSlotID"];
  [v2 addField:"_targetContextID"];
  [v2 addField:"_versionedPID"];
  [v2 addField:"_registrantEntitled"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BKSHIDEventAuthenticationMessage)new
{
  v4 = [NSString stringWithFormat:@"cannot allocate one of these"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BKSHIDEventAuthenticationMessage.m";
    __int16 v17 = 1024;
    int v18 = 116;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventAuthenticationMessage *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  -[BKSHIDEventAuthenticationMessage _dataProtobufEncoded]((uint64_t)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"self"];
}

- (id)_dataProtobufEncoded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v9 = 0;
    id v2 = [MEMORY[0x1E4F4F808] encodeObject:a1 error:&v9];
    id v3 = v9;
    if (!v2)
    {
      id v5 = [NSString stringWithFormat:@"auth message encode error: %@", v3];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v6 = NSStringFromSelector(sel__dataProtobufEncoded);
        v7 = (objc_class *)objc_opt_class();
        objc_super v8 = NSStringFromClass(v7);
        *(_DWORD *)buf = 138544642;
        __int16 v11 = v6;
        __int16 v12 = 2114;
        __int16 v13 = v8;
        __int16 v14 = 2048;
        uint64_t v15 = a1;
        __int16 v16 = 2114;
        __int16 v17 = @"BKSHIDEventAuthenticationMessage.m";
        __int16 v18 = 1024;
        int v19 = 347;
        __int16 v20 = 2114;
        uint64_t v21 = v5;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA53E3CLL);
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (BKSHIDEventAuthenticationMessage)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"self"];

  -[BKSHIDEventAuthenticationMessage _protobufDecodedMessageFromData:]((uint64_t)self, v5);
  v6 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_protobufDecodedMessageFromData:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v9 = 0;
      id v5 = [MEMORY[0x1E4F4F808] decodeObjectOfClass:objc_opt_class() fromData:v3 error:&v9];
      v6 = v9;
      if (v5)
      {
LABEL_10:

        goto LABEL_11;
      }
      v7 = BKLogEventDelivery();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v11 = v6;
        _os_log_error_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_ERROR, "auth message protobuf decode failure: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v6 = BKLogEventDelivery();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "auth message data decode failure", buf, 2u);
      }
    }
    id v5 = 0;
    goto LABEL_10;
  }
  id v5 = 0;
LABEL_11:

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  -[BKSHIDEventAuthenticationMessage _dataProtobufEncoded]((uint64_t)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeDataToXPCDictionaryWithKey();
}

- (BKSHIDEventAuthenticationMessage)initWithXPCDictionary:(id)a3
{
  id v4 = BSDeserializeDataFromXPCDictionaryWithKey();
  -[BKSHIDEventAuthenticationMessage _protobufDecodedMessageFromData:]((uint64_t)self, v4);
  id v5 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[BKSHIDEventAuthenticationMessage _dataProtobufEncoded]((uint64_t)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"self"];
}

- (BKSHIDEventAuthenticationMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"self"];

  -[BKSHIDEventAuthenticationMessage _protobufDecodedMessageFromData:]((uint64_t)self, v5);
  v6 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v16 = a3;
  unint64_t originIdentifier = self->_originIdentifier;
  if (originIdentifier == 0xC181BADB23D8497BLL)
  {
    id v5 = @"originIdentifier (backboardd)";
    v6 = v16;
    unint64_t originIdentifier = 0xC181BADB23D8497BLL;
  }
  else
  {
    id v5 = @"originIdentifier";
    v6 = v16;
  }
  id v7 = (id)[v6 appendUInt64:originIdentifier withName:v5 format:1];
  id v8 = (id)[v16 appendUInt64:self->_context withName:@"context" format:1];
  id v9 = NSStringFromBSVersionedPID();
  [v16 appendString:v9 withName:@"pid"];

  v10 = NSStringFromBKSHIDEventSecureNameStatus(self->_secureNameStatus);
  [v16 appendString:v10 withName:@"secureNameStatus"];

  id v11 = (id)[v16 appendBool:self->_registrantEntitled withName:@"registrantEntitled"];
  [v16 appendString:IOHIDEventTypeGetName() withName:@"eventType"];
  id v12 = (id)[v16 appendUInt64:self->_targetSlotID withName:@"targetSlotID" format:1];
  id v13 = (id)[v16 appendUInt64:self->_targetContextID withName:@"targetContextID" format:1];
  id v14 = (id)[v16 appendObject:self->_hitTestInformationFromStartEvent withName:@"hitTestInformationFromStartEvent" skipIfNil:1];
  id v15 = (id)[v16 appendObject:self->_hitTestInformationFromEndEvent withName:@"hitTestInformationFromEndEvent" skipIfNil:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_eventType == v4[4]
    && self->_targetSlotID == v4[5]
    && self->_targetContextID == v4[6]
    && BSEqualObjects()
    && BSEqualObjects()
    && self->_timestamp == *((void *)v4 + 6)
    && self->_context == *((void *)v4 + 8)
    && self->_secureNameStatus == *((void *)v4 + 9)
    && self->_registrantEntitled == *((unsigned __int8 *)v4 + 80)
    && self->_versionedPID == *((void *)v4 + 1)
    && self->_originIdentifier == *((void *)v4 + 7);

  return v5;
}

- (unint64_t)hash
{
  id v2 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __47__BKSHIDEventAuthenticationMessage_description__block_invoke;
  v10 = &unk_1E5441BB0;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  BOOL v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __47__BKSHIDEventAuthenticationMessage_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (BKSHIDEventAuthenticationMessage)init
{
  id v4 = [NSString stringWithFormat:@"cannot allocate one of these"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BKSHIDEventAuthenticationMessage.m";
    __int16 v17 = 1024;
    int v18 = 111;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventAuthenticationMessage *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_calculateSignatureWithHMACContext:(uint64_t)a1
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = (id *)a1;
    CCHmacUpdate(ctx, (const void *)(a1 + 48), 8uLL);
    CCHmacUpdate(ctx, v3 + 8, 8uLL);
    CCHmacUpdate(ctx, v3 + 2, 4uLL);
    CCHmacUpdate(ctx, (char *)v3 + 20, 4uLL);
    CCHmacUpdate(ctx, v3 + 3, 4uLL);
    [v3[4] _updateCCHmacContext:ctx];
    [v3[5] _updateCCHmacContext:ctx];
    CCHmacUpdate(ctx, v3 + 1, 8uLL);
    CCHmacUpdate(ctx, v3 + 9, 8uLL);
    CCHmacUpdate(ctx, v3 + 10, 1uLL);
    CCHmacFinal(ctx, macOut);
    a1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:32];
  }
  return (id)a1;
}

@end