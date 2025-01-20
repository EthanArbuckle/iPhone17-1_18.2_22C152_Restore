@interface BKSHIDEventDeliveryChain
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)protobufSchema;
- (BKSEventDeferringChainIdentity)identity;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDeliveryChain)init;
- (BKSHIDEventDeliveryChain)initWithCoder:(id)a3;
- (BKSHIDEventDeliveryChain)initWithIdentity:(id)a3 compatibilityDisplay:(id)a4 path:(id)a5;
- (BKSHIDEventDisplay)compatibilityDisplay;
- (BKSHIDEventDisplay)display;
- (BOOL)isEqual:(id)a3;
- (NSArray)deferringPath;
- (NSString)description;
- (id)_dataProtobufEncoded;
- (id)_protobufDecodedFromData:(id)a3;
- (id)didFinishProtobufDecodingWithError:(id *)a3;
- (id)initForProtobufDecoding;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeliveryChain

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __57__BKSHIDEventDeliveryChain_appendDescriptionToFormatter___block_invoke;
  v10 = &unk_1E5441BB0;
  id v11 = v4;
  v12 = self;
  id v5 = v4;
  [v5 appendProem:0 block:&v7];
  id v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_deferringPath, 0, v7, v8, v9, v10);
}

void __57__BKSHIDEventDeliveryChain_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:0];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 16);
  if (v4)
  {
    id v5 = [*(id *)(v3 + 8) display];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0) {
      id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"compatibilityDisplay"];
    }
  }
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return [(BKSEventDeferringChainIdentity *)self->_identity environment];
}

- (NSArray)deferringPath
{
  return self->_deferringPath;
}

- (BKSHIDEventDisplay)compatibilityDisplay
{
  return self->_compatibilityDisplay;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BKSHIDEventDisplay)display
{
  return [(BKSEventDeferringChainIdentity *)self->_identity display];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringPath, 0);
  objc_storeStrong((id *)&self->_compatibilityDisplay, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (BKSHIDEventDeliveryChain)initWithIdentity:(id)a3 compatibilityDisplay:(id)a4 path:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BKSHIDEventDeliveryChain;
  v12 = [(BKSHIDEventDeliveryChain *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identity, a3);
    uint64_t v14 = [v11 copy];
    deferringPath = v13->_deferringPath;
    v13->_deferringPath = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_compatibilityDisplay, a4);
  }

  return v13;
}

- (BKSEventDeferringChainIdentity)identity
{
  return self->_identity;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  if (self->_identity)
  {
    uint64_t v3 = self;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:&unk_1ED76C9D0];
    uint64_t v3 = 0;
    *a3 = v5;
  }
  return v3;
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeliveryChain;
  return [(BKSHIDEventDeliveryChain *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSHIDEventDeliveryChain *)self _dataProtobufEncoded];
  [v4 encodeObject:v5 forKey:@"self"];
}

- (BKSHIDEventDeliveryChain)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"self"];

  char v6 = [(BKSHIDEventDeliveryChain *)self _protobufDecodedFromData:v5];

  return v6;
}

- (id)_dataProtobufEncoded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  id v4 = [MEMORY[0x1E4F4F808] encodeObject:self error:&v11];
  id v5 = v11;
  if (!v4)
  {
    id v7 = [NSString stringWithFormat:@"delivery chain encode error: %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      objc_super v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKSHIDEventDeliveryChain.m";
      __int16 v20 = 1024;
      int v21 = 84;
      __int16 v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA47FA0);
  }

  return v4;
}

- (id)_protobufDecodedFromData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F4F808] decodeObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (v4) {
      goto LABEL_9;
    }
    char v6 = BKLogEventDelivery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "delivery chain protobuf decode failure: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = BKLogEventDelivery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_ERROR, "auth message data decode failure", buf, 2u);
    }
  }
  id v4 = 0;
LABEL_9:

  return v4;
}

- (unint64_t)hash
{
  return [(BKSEventDeferringChainIdentity *)self->_identity hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDeliveryChain *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    char v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v9 = v7;

    if (v9 && BSEqualObjects() && BSEqualObjects()) {
      char v8 = BSEqualObjects();
    }
    else {
      char v8 = 0;
    }
  }
  return v8;
}

- (BKSHIDEventDeliveryChain)init
{
  id v4 = [NSString stringWithFormat:@"cannot -init"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDEventDeliveryChain.m";
    __int16 v17 = 1024;
    int v18 = 25;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeliveryChain *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__BKSHIDEventDeliveryChain_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_4780 != -1) {
    dispatch_once(&protobufSchema_onceToken_4780, block);
  }
  id v2 = (void *)protobufSchema_schema_4781;
  return v2;
}

uint64_t __42__BKSHIDEventDeliveryChain_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_4782];
  uint64_t v2 = protobufSchema_schema_4781;
  protobufSchema_schema_4781 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __42__BKSHIDEventDeliveryChain_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_identity"];
  [v2 addField:"_compatibilityDisplay"];
  [v2 addRepeatingField:"_deferringPath" containsClass:objc_opt_class()];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  id v4 = [NSString stringWithFormat:@"cannot +new"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDEventDeliveryChain.m";
    __int16 v17 = 1024;
    int v18 = 30;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end