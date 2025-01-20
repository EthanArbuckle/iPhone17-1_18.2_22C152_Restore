@interface CLHidDevice
- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5;
- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4;
- (HIDDevice)hidDevice;
- (NSDictionary)matching;
- (void)dealloc;
- (void)setHidDevice:(id)a3;
- (void)setMatching:(id)a3;
@end

@implementation CLHidDevice

- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLHidDevice;
  result = [(CLHidDevice *)&v7 init];
  if (result)
  {
    result->_matching = (NSDictionary *)a4;
    result->_hidDevice = (HIDDevice *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHidDevice;
  [(CLHidDevice *)&v3 dealloc];
}

- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v8 = objc_msgSend_hidDevice(self, a2, a3);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19053DFB8;
  v14[3] = &unk_1E568F418;
  v14[4] = a3;
  char v10 = objc_msgSend_setReport_reportLength_withIdentifier_forType_error_timeout_callback_(v8, v9, (uint64_t)a4, a5, a3, 2, &v15, 0, v14);
  if ((v10 & 1) == 0)
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
    }
    v11 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v21 = a3;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "[CLHidManager] setReport: id=0x%lx, failed=%@", buf, 0x16u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
      }
      int v16 = 134218242;
      int64_t v17 = a3;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLHidDevice setReport:payload:length:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
  return v10;
}

- (NSDictionary)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

- (HIDDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  self->_hidDevice = (HIDDevice *)a3;
}

@end