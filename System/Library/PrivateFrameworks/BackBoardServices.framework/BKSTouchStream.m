@interface BKSTouchStream
- (BKSTouchStream)initWithContextID:(unsigned int)a3 displayUUID:(id)a4 identifier:(unsigned __int8)a5 policy:(id)a6;
- (unsigned)reference;
- (void)invalidate;
- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5;
- (void)setEventDispatchMode:(unsigned __int8)a3 lastTouchTimestamp:(double)a4;
- (void)setReference:(unsigned int)a3;
@end

@implementation BKSTouchStream

- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5
{
  mach_port_t v9 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  int v10 = [(BKSTouchStream *)self reference];
  _BKSHIDTouchStreamSetEventDispatchMode(v9, v10, a3, a4, a5);
}

- (unsigned)reference
{
  return self->_reference;
}

- (void)setReference:(unsigned int)a3
{
  self->_reference = a3;
}

- (void)invalidate
{
  int v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  int v4 = [(BKSTouchStream *)self reference];
  _BKSHIDTouchStreamInvalidate(v3, v4);
}

- (void)setEventDispatchMode:(unsigned __int8)a3 lastTouchTimestamp:(double)a4
{
}

- (BKSTouchStream)initWithContextID:(unsigned int)a3 displayUUID:(id)a4 identifier:(unsigned __int8)a5 policy:(id)a6
{
  int v7 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v10 = (__CFString *)a4;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BKSTouchStream;
  v12 = [(BKSTouchStream *)&v18 init];
  if (!v12) {
    goto LABEL_6;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  if (!v10) {
    int v10 = &stru_1ED755B00;
  }
  long long v51 = 0uLL;
  long long v52 = 0uLL;
  long long v49 = 0uLL;
  long long v50 = 0uLL;
  long long v47 = 0uLL;
  long long v48 = 0uLL;
  long long v45 = 0uLL;
  long long v46 = 0uLL;
  long long v43 = 0uLL;
  long long v44 = 0uLL;
  long long v41 = 0uLL;
  long long v42 = 0uLL;
  long long v39 = 0uLL;
  long long v40 = 0uLL;
  long long v37 = 0uLL;
  long long v38 = 0uLL;
  long long v35 = 0uLL;
  long long v36 = 0uLL;
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  long long v31 = 0uLL;
  long long v32 = 0uLL;
  long long v29 = 0uLL;
  long long v30 = 0uLL;
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  long long v25 = 0uLL;
  long long v26 = 0uLL;
  *(_OWORD *)buffer = 0uLL;
  long long v24 = 0uLL;
  if (CFStringGetCString(v10, buffer, 1024, 0x8000100u))
  {
    mach_port_name_t v13 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    int v14 = _BKSHIDTouchStreamCreate(v13, a3, buffer, v7, [v11 shouldSendAmbiguityRecommendations], &v12->_reference);
    if (!v14)
    {
LABEL_6:
      v15 = v12;
      goto LABEL_11;
    }
  }
  else
  {
    int v14 = 10;
  }
  v16 = BKLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[BKSTouchStream initWithContextID:displayUUID:identifier:policy:]";
    __int16 v21 = 1024;
    int v22 = v14;
    _os_log_error_impl(&dword_18AA0B000, v16, OS_LOG_TYPE_ERROR, "%s failed to create touch stream:%d", buf, 0x12u);
  }

  v15 = 0;
LABEL_11:

  return v15;
}

@end