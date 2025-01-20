@interface BKSHIDEventAuthenticationOriginator
- (id)buildMessage:(id)a3;
- (int64_t)validateMessage:(id)a3;
@end

@implementation BKSHIDEventAuthenticationOriginator

- (void).cxx_destruct
{
}

- (int64_t)validateMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  if (!v5)
  {
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = [v18 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"message", v20];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v22 = NSStringFromSelector(a2);
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      __dst.ctx[0] = 138544642;
      *(void *)&__dst.ctx[1] = v22;
      LOWORD(__dst.ctx[3]) = 2114;
      *(void *)((char *)&__dst.ctx[3] + 2) = v24;
      HIWORD(__dst.ctx[5]) = 2048;
      *(void *)&__dst.ctx[6] = self;
      LOWORD(__dst.ctx[8]) = 2114;
      *(void *)((char *)&__dst.ctx[8] + 2) = @"BKSHIDEventAuthenticationOriginator.m";
      HIWORD(__dst.ctx[10]) = 1024;
      __dst.ctx[11] = 49;
      LOWORD(__dst.ctx[12]) = 2114;
      *(void *)((char *)&__dst.ctx[12] + 2) = v21;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__dst, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA5D7ECLL);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = NSString;
    v26 = (objc_class *)[v6 classForCoder];
    if (!v26) {
      v26 = (objc_class *)objc_opt_class();
    }
    v27 = NSStringFromClass(v26);
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = [v25 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"message", v27, v29];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v31 = NSStringFromSelector(a2);
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      __dst.ctx[0] = 138544642;
      *(void *)&__dst.ctx[1] = v31;
      LOWORD(__dst.ctx[3]) = 2114;
      *(void *)((char *)&__dst.ctx[3] + 2) = v33;
      HIWORD(__dst.ctx[5]) = 2048;
      *(void *)&__dst.ctx[6] = self;
      LOWORD(__dst.ctx[8]) = 2114;
      *(void *)((char *)&__dst.ctx[8] + 2) = @"BKSHIDEventAuthenticationOriginator.m";
      HIWORD(__dst.ctx[10]) = 1024;
      __dst.ctx[11] = 49;
      LOWORD(__dst.ctx[12]) = 2114;
      *(void *)((char *)&__dst.ctx[12] + 2) = v30;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__dst, 0x3Au);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA5D928);
  }

  key = self->_key;
  if (!key)
  {
    v15 = BKLogEventDelivery();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      int64_t v14 = 1;
      goto LABEL_15;
    }
    LOWORD(__dst.ctx[0]) = 0;
    v16 = "message auth failure: backboardd hasn't signed any events";
LABEL_17:
    _os_log_error_impl(&dword_18AA0B000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&__dst, 2u);
    goto LABEL_14;
  }
  v8 = key;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = NSString;
    v35 = (objc_class *)[(_BKSHIDEventAuthenticationKey *)v8 classForCoder];
    if (!v35) {
      v35 = (objc_class *)objc_opt_class();
    }
    v36 = NSStringFromClass(v35);
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    v39 = [v34 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"key", v36, v38];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(sel__verifySignatureWithInternalKey_);
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      __dst.ctx[0] = 138544642;
      *(void *)&__dst.ctx[1] = v40;
      LOWORD(__dst.ctx[3]) = 2114;
      *(void *)((char *)&__dst.ctx[3] + 2) = v42;
      HIWORD(__dst.ctx[5]) = 2048;
      *(void *)&__dst.ctx[6] = v6;
      LOWORD(__dst.ctx[8]) = 2114;
      *(void *)((char *)&__dst.ctx[8] + 2) = @"BKSHIDEventAuthenticationMessage.m";
      HIWORD(__dst.ctx[10]) = 1024;
      __dst.ctx[11] = 263;
      LOWORD(__dst.ctx[12]) = 2114;
      *(void *)((char *)&__dst.ctx[12] + 2) = v39;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__dst, 0x3Au);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA5DA68);
  }

  v9 = (const void *)-[_BKSHIDEventAuthenticationKey _context]((uint64_t)v8);
  memcpy(&__dst, v9, sizeof(__dst));
  v10 = -[BKSHIDEventAuthenticationMessage _calculateSignatureWithHMACContext:]((uint64_t)v6, &__dst);
  size_t v11 = [v6[11] length];
  if (v11 != [v10 length])
  {

    goto LABEL_13;
  }
  id v12 = v10;
  int v13 = timingsafe_bcmp((const void *)[v12 bytes], (const void *)objc_msgSend(v6[11], "bytes"), v11);

  if (v13)
  {
LABEL_13:
    v15 = BKLogEventDelivery();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    LOWORD(__dst.ctx[0]) = 0;
    v16 = "message auth failure: contents failed to verify; message is corrupt";
    goto LABEL_17;
  }
  if ([v6 registrantEntitled]) {
    int64_t v14 = 2;
  }
  else {
    int64_t v14 = 3;
  }
LABEL_15:

  return v14;
}

- (id)buildMessage:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"BKSHIDEventAuthenticationOriginator.m", 31, @"Invalid parameter not satisfying: %@", @"builder != nil" object file lineNumber description];
  }
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  key = self->_key;
  if (!key)
  {
    self;
    CCRandomGenerateBytes(&bytes, 0x20uLL);
    v8 = [_BKSHIDEventAuthenticationKey alloc];
    if (v8)
    {
      v45.receiver = v8;
      v45.super_class = (Class)_BKSHIDEventAuthenticationKey;
      v9 = [(BKSHIDEventAuthenticationOriginator *)&v45 init];
      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&bytes length:32];
        size_t v11 = v9->_key;
        v9->_key = (_BKSHIDEventAuthenticationKey *)v10;
      }
    }
    else
    {
      v9 = 0;
    }
    id v12 = self->_key;
    self->_key = (_BKSHIDEventAuthenticationKey *)v9;

    key = self->_key;
  }
  self->_keyLastAccessTime = (double)v6 / 1000000000.0;
  int v13 = key;
  int64_t v14 = (void (**)(id, void *))v5;
  uint64_t v15 = self;
  v16 = v13;
  if (!v16)
  {
    v28 = NSString;
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = [v28 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"key", v30];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v32 = NSStringFromSelector(sel__withInternalKey_buildMessage_);
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      bytes.ctx[0] = 138544642;
      *(void *)&bytes.ctx[1] = v32;
      LOWORD(bytes.ctx[3]) = 2114;
      *(void *)((char *)&bytes.ctx[3] + 2) = v34;
      HIWORD(bytes.ctx[5]) = 2048;
      *(void *)&bytes.ctx[6] = v15;
      LOWORD(bytes.ctx[8]) = 2114;
      *(void *)((char *)&bytes.ctx[8] + 2) = @"BKSHIDEventAuthenticationMessage.m";
      HIWORD(bytes.ctx[10]) = 1024;
      bytes.ctx[11] = 249;
      LOWORD(bytes.ctx[12]) = 2114;
      *(void *)((char *)&bytes.ctx[12] + 2) = v31;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&bytes, 0x3Au);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA5DDFCLL);
  }
  v17 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = NSString;
    v36 = (objc_class *)[(_BKSHIDEventAuthenticationKey *)v17 classForCoder];
    if (!v36) {
      v36 = (objc_class *)objc_opt_class();
    }
    v37 = NSStringFromClass(v36);
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    v40 = [v35 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"key", v37, v39];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v41 = NSStringFromSelector(sel__withInternalKey_buildMessage_);
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      bytes.ctx[0] = 138544642;
      *(void *)&bytes.ctx[1] = v41;
      LOWORD(bytes.ctx[3]) = 2114;
      *(void *)((char *)&bytes.ctx[3] + 2) = v43;
      HIWORD(bytes.ctx[5]) = 2048;
      *(void *)&bytes.ctx[6] = v15;
      LOWORD(bytes.ctx[8]) = 2114;
      *(void *)((char *)&bytes.ctx[8] + 2) = @"BKSHIDEventAuthenticationMessage.m";
      HIWORD(bytes.ctx[10]) = 1024;
      bytes.ctx[11] = 249;
      LOWORD(bytes.ctx[12]) = 2114;
      *(void *)((char *)&bytes.ctx[12] + 2) = v40;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&bytes, 0x3Au);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA5DF38);
  }

  if (!v5)
  {
    uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:sel__withInternalKey_buildMessage_, v15, @"BKSHIDEventAuthenticationMessage.m", 250, @"Invalid parameter not satisfying: %@", @"builder != nil" object file lineNumber description];
  }
  v18 = -[BKSHIDEventAuthenticationMessage _init]([BKSMutableHIDEventAuthenticationMessage alloc]);
  v14[2](v14, v18);
  uint64_t v19 = mach_continuous_time();
  if (v18)
  {
    v18[6] = v19;
    v20 = v17;
    v21 = (void *)[v18 copy];
    v22 = (const void *)-[_BKSHIDEventAuthenticationKey _context]((uint64_t)v20);

    memcpy(&bytes, v22, sizeof(bytes));
    v23 = -[BKSHIDEventAuthenticationMessage _calculateSignatureWithHMACContext:]((uint64_t)v21, &bytes);
    uint64_t v24 = [v23 copy];
    v25 = (void *)v21[11];
    v21[11] = v24;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end