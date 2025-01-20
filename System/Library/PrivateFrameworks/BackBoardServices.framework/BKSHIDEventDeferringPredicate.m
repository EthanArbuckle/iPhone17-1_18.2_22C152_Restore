@interface BKSHIDEventDeferringPredicate
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDeferringPredicate)init;
- (BKSHIDEventDeferringPredicate)initWithCoder:(id)a3;
- (BKSHIDEventDeferringToken)token;
- (BKSHIDEventDisplay)display;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_initWithEnvironment:(id)a3 display:(id)a4 token:(id)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeferringPredicate

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKSHIDEventDeferringPredicate)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    uint64_t v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F281F8];
      uint64_t v22 = *MEMORY[0x1E4F28588];
      v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringPredicate: subclasses are not allowed : %@", objc_opt_class(), v22];
      v23 = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
      [v4 failWithError:v11];

LABEL_7:
      v15 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  if (!v12)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v18 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringPredicate: unknown environment : %@", 0];
    v25[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v20 = [v16 errorWithDomain:v17 code:4866 userInfo:v19];
    [v4 failWithError:v20];

    v9 = 0;
    goto LABEL_7;
  }
  v9 = (void *)v12;
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
  self = (BKSHIDEventDeferringPredicate *)[(BKSHIDEventDeferringPredicate *)self _initWithEnvironment:v9 display:v13 token:v14];

  v15 = self;
LABEL_8:

  return v15;
}

- (id)_initWithEnvironment:(id)a3 display:(id)a4 token:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if (!v12)
  {
    v26 = NSString;
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = [v26 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"environment", v28];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(a2);
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138544642;
      v66 = v30;
      __int16 v67 = 2114;
      v68 = v32;
      __int16 v69 = 2048;
      v70 = self;
      __int16 v71 = 2114;
      v72 = @"BKSHIDEventDeferringPredicate.m";
      __int16 v73 = 1024;
      int v74 = 33;
      __int16 v75 = 2114;
      v76 = v29;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1029CLL);
  }
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = NSString;
    v34 = (objc_class *)[v13 classForCoder];
    if (!v34) {
      v34 = (objc_class *)objc_opt_class();
    }
    v35 = NSStringFromClass(v34);
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = [v33 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"environment", v35, v37];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(a2);
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138544642;
      v66 = v39;
      __int16 v67 = 2114;
      v68 = v41;
      __int16 v69 = 2048;
      v70 = self;
      __int16 v71 = 2114;
      v72 = @"BKSHIDEventDeferringPredicate.m";
      __int16 v73 = 1024;
      int v74 = 33;
      __int16 v75 = 2114;
      v76 = v38;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA103D8);
  }

  id v14 = v10;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = NSString;
      v43 = (objc_class *)[v14 classForCoder];
      if (!v43) {
        v43 = (objc_class *)objc_opt_class();
      }
      v44 = NSStringFromClass(v43);
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      v47 = [v42 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v44, v46];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v48 = NSStringFromSelector(a2);
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        *(_DWORD *)buf = 138544642;
        v66 = v48;
        __int16 v67 = 2114;
        v68 = v50;
        __int16 v69 = 2048;
        v70 = self;
        __int16 v71 = 2114;
        v72 = @"BKSHIDEventDeferringPredicate.m";
        __int16 v73 = 1024;
        int v74 = 34;
        __int16 v75 = 2114;
        v76 = v47;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v47 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA10514);
    }
  }

  id v15 = v11;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v51 = NSString;
      v52 = (objc_class *)[v15 classForCoder];
      if (!v52) {
        v52 = (objc_class *)objc_opt_class();
      }
      v53 = NSStringFromClass(v52);
      v54 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v54);
      v56 = [v51 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"token", v53, v55];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v57 = NSStringFromSelector(a2);
        v58 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v58);
        *(_DWORD *)buf = 138544642;
        v66 = v57;
        __int16 v67 = 2114;
        v68 = v59;
        __int16 v69 = 2048;
        v70 = self;
        __int16 v71 = 2114;
        v72 = @"BKSHIDEventDeferringPredicate.m";
        __int16 v73 = 1024;
        int v74 = 35;
        __int16 v75 = 2114;
        v76 = v56;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v56 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA10650);
    }
  }

  uint64_t v16 = objc_opt_class();
  if (v16 != objc_opt_class())
  {
    uint64_t v17 = objc_opt_class();
    if (v17 != objc_opt_class())
    {
      v60 = [NSString stringWithFormat:@"BKSHIDEventDeferringPredicate cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v61 = NSStringFromSelector(a2);
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        *(_DWORD *)buf = 138544642;
        v66 = v61;
        __int16 v67 = 2114;
        v68 = v63;
        __int16 v69 = 2048;
        v70 = self;
        __int16 v71 = 2114;
        v72 = @"BKSHIDEventDeferringPredicate.m";
        __int16 v73 = 1024;
        int v74 = 36;
        __int16 v75 = 2114;
        v76 = v60;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v60 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA1073CLL);
    }
  }
  v64.receiver = self;
  v64.super_class = (Class)BKSHIDEventDeferringPredicate;
  v18 = [(BKSHIDEventDeferringPredicate *)&v64 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    environment = v18->_environment;
    v18->_environment = (BKSHIDEventDeferringEnvironment *)v19;

    uint64_t v21 = [v14 copy];
    display = v18->_display;
    v18->_display = (BKSHIDEventDisplay *)v21;

    uint64_t v23 = [v15 copy];
    token = v18->_token;
    v18->_token = (BKSHIDEventDeferringToken *)v23;
  }
  return v18;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDeferringPredicate *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v7 = BSEqualObjects();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__BKSHIDEventDeferringPredicate_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __62__BKSHIDEventDeferringPredicate_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:0];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0 skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:0 skipIfNil:1];
}

- (void)encodeWithCoder:(id)a3
{
  environment = self->_environment;
  id v5 = a3;
  [v5 encodeObject:environment forKey:@"environment"];
  [v5 encodeObject:self->_display forKey:@"display"];
  [v5 encodeObject:self->_token forKey:@"token"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (unint64_t)hash
{
  unint64_t v3 = [(BKSHIDEventDeferringEnvironment *)self->_environment hash];
  unint64_t v4 = [(BKSHIDEventDisplay *)self->_display hash];
  return v3 ^ v4 ^ [(BKSHIDEventDeferringToken *)self->_token hash] ^ 0x1A737;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[BKSMutableHIDEventDeferringPredicate allocWithZone:a3];
  environment = self->_environment;
  display = self->_display;
  token = self->_token;
  return [(BKSHIDEventDeferringPredicate *)v4 _initWithEnvironment:environment display:display token:token];
}

- (BKSHIDEventDeferringPredicate)init
{
  unint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeferringPredicate"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventDeferringPredicate.m";
    __int16 v17 = 1024;
    int v18 = 28;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeferringPredicate *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end