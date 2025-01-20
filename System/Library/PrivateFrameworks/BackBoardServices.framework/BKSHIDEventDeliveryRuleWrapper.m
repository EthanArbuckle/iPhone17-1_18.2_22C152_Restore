@interface BKSHIDEventDeliveryRuleWrapper
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDeliveryRuleWrapper)initWithCoder:(id)a3;
- (BKSHIDEventDeliveryRuleWrapper)initWithReason:(id)a3 seed:(unsigned int)a4 payload:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (id)decodePayload:(id)a3;
- (id)payload;
- (unint64_t)hash;
- (unsigned)seed;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeliveryRuleWrapper

- (unint64_t)hash
{
  return BSHashPurify32();
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BKSHIDEventDeliveryRuleWrapper *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && self->_seed == v9->_seed && [(NSString *)self->_reason isEqual:v9->_reason]) {
      char v8 = [self->_payload isEqual:v9->_payload];
    }
    else {
      char v8 = 0;
    }
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (unsigned)seed
{
  return self->_seed;
}

- (id)payload
{
  return self->_payload;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v5 = a3;
  [v5 encodeObject:reason forKey:@"reason"];
  [v5 encodeObject:self->_payload forKey:@"payload"];
  [v5 encodeInt32:self->_seed forKey:@"seed"];
}

- (BKSHIDEventDeliveryRuleWrapper)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BKSHIDEventDeliveryRuleWrapper *)self init];
  v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v7 = [(BKSHIDEventDeliveryRuleWrapper *)v5 decodePayload:v4];
  id payload = v6->_payload;
  v6->_id payload = (id)v7;

  if (!v6->_payload)
  {
    v12 = BKLogEventDelivery();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:0];
      [v4 failWithError:v15];

      v11 = 0;
      goto LABEL_10;
    }
    v13 = [v4 error];
    int v17 = 138543362;
    v18 = v13;
    v14 = "payload is nil: %{public}@";
LABEL_12:
    _os_log_error_impl(&dword_18AA0B000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0xCu);

    goto LABEL_9;
  }
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
  reason = v6->_reason;
  v6->_reason = (NSString *)v9;

  if (!v6->_reason)
  {
    v12 = BKLogEventDelivery();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    v13 = [v4 error];
    int v17 = 138543362;
    v18 = v13;
    v14 = "reason is nil: %{public}@";
    goto LABEL_12;
  }
  v6->_seed = [v4 decodeInt32ForKey:@"seed"];
LABEL_5:
  v11 = v6;
LABEL_10:

  return v11;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__BKSHIDEventDeliveryRuleWrapper_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __63__BKSHIDEventDeliveryRuleWrapper_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"reason"];
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(unsigned int *)(*(void *)(a1 + 40) + 8) withName:@"seed"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:0];
}

- (BKSHIDEventDeliveryRuleWrapper)initWithReason:(id)a3 seed:(unsigned int)a4 payload:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BKSHIDEventDeliveryRuleWrapper;
  v11 = [(BKSHIDEventDeliveryRuleWrapper *)&v32 init];
  if (v11)
  {
    id v12 = v9;
    v13 = NSString;
    objc_opt_class();
    v14 = (objc_class *)objc_opt_class();
    if (!v12)
    {
      v18 = NSStringFromClass(v14);
      uint64_t v19 = [v13 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v18];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v20 = NSStringFromSelector(a2);
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138544642;
        v34 = v20;
        __int16 v35 = 2114;
        v36 = v22;
        __int16 v37 = 2048;
        v38 = v11;
        __int16 v39 = 2114;
        v40 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
        __int16 v41 = 1024;
        int v42 = 46;
        __int16 v43 = 2114;
        v44 = v19;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA34970);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = NSString;
      v24 = (objc_class *)[v12 classForCoder];
      if (!v24) {
        v24 = (objc_class *)objc_opt_class();
      }
      v25 = NSStringFromClass(v24);
      objc_opt_class();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = [v23 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v25, v27];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v29 = NSStringFromSelector(a2);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        v34 = v29;
        __int16 v35 = 2114;
        v36 = v31;
        __int16 v37 = 2048;
        v38 = v11;
        __int16 v39 = 2114;
        v40 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
        __int16 v41 = 1024;
        int v42 = 46;
        __int16 v43 = 2114;
        v44 = v28;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA34AACLL);
    }

    uint64_t v15 = [v12 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v15;

    objc_storeStrong(&v11->_payload, a5);
    v11->_seed = a4;
  }

  return v11;
}

- (id)decodePayload:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"You must have a subclass"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    char v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    id v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2114;
    v18 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
    __int16 v19 = 1024;
    int v20 = 39;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end