@interface GEOPowerAssertion
- (GEOPowerAssertion)initWithType:(int64_t)a3 identifier:(id)a4 timeout:(double)a5;
- (id)description;
- (void)dealloc;
@end

@implementation GEOPowerAssertion

- (GEOPowerAssertion)initWithType:(int64_t)a3 identifier:(id)a4 timeout:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a4;
  v20.receiver = self;
  v20.super_class = (Class)GEOPowerAssertion;
  v9 = [(GEOPowerAssertion *)&v20 init];
  if (!v9) {
    goto LABEL_16;
  }
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_16;
    }
    CFStringRef v10 = @"BackgroundTask";
  }
  else
  {
    CFStringRef v10 = @"PreventUserIdleSystemSleep";
  }
  v11 = GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = @"<unknown>";
    if (a3 == 1) {
      v12 = @"BackgroundTask";
    }
    *(_DWORD *)buf = 138543875;
    if (!a3) {
      v12 = @"PreventSystemSleep";
    }
    v22 = v12;
    __int16 v23 = 2113;
    v24 = v8;
    __int16 v25 = 2048;
    double v26 = a5;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Creating power assertion of type %{public}@ for \"%{private}@\" (timeout = %f)", buf, 0x20u);
  }

  IOReturn v13 = IOPMAssertionCreateWithDescription(v10, v8, v8, 0, 0, a5, @"TimeoutActionTurnOff", &v9->_assertion);
  if (!v13)
  {
    uint64_t v18 = [(__CFString *)v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v18;

    v9->_timeout = a5;
    v9->_type = a3;
    v16 = v9;
    goto LABEL_17;
  }
  IOReturn v14 = v13;
  v9->_assertion = 0;
  v15 = GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    __int16 v23 = 1024;
    LODWORD(v24) = v14;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Failed to create power assertion for \"%{public}@\" (%d)", buf, 0x12u);
  }

LABEL_16:
  v16 = 0;
LABEL_17:

  return v16;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_assertion)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138477827;
      v11 = identifier;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Releasing power assertion with identifier: %{private}@", buf, 0xCu);
    }

    IOReturn v5 = IOPMAssertionRelease(self->_assertion);
    if (v5)
    {
      IOReturn v6 = v5;
      v7 = GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = self->_identifier;
        *(_DWORD *)buf = 138543618;
        v11 = v8;
        __int16 v12 = 1024;
        IOReturn v13 = v6;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Failed to properly release power assertion for \"%{public}@\" (%d). Dropping it instead.", buf, 0x12u);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)GEOPowerAssertion;
  [(GEOPowerAssertion *)&v9 dealloc];
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)GEOPowerAssertion;
  uint64_t v4 = [(GEOPowerAssertion *)&v11 description];
  IOReturn v5 = (void *)v4;
  int64_t type = self->_type;
  v7 = @"<unknown>";
  if (type == 1) {
    v7 = @"BackgroundTask";
  }
  if (type) {
    v8 = v7;
  }
  else {
    v8 = @"PreventSystemSleep";
  }
  objc_super v9 = [v3 stringWithFormat:@"%@ Type: %@, Identifier: %@, timeout: %f", v4, v8, self->_identifier, *(void *)&self->_timeout];

  return v9;
}

- (void).cxx_destruct
{
}

@end