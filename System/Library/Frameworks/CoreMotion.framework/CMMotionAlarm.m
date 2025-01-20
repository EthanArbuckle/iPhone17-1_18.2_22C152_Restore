@interface CMMotionAlarm
+ (BOOL)supportsSecureCoding;
- (BOOL)acknowledgeWithError:(id *)a3;
- (BOOL)isValid;
- (BOOL)repeats;
- (BOOL)unregisterWithError:(id *)a3;
- (CMMotionAlarm)initWithCoder:(id)a3;
- (CMMotionAlarm)initWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6;
- (CMMotionAlarm)initWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6 alarmId:(unint64_t)a7 bundleId:(id)a8 state:(int)a9;
- (CMMotionAlarmManager)manager;
- (NSString)bundleId;
- (NSString)name;
- (id)description;
- (int)state;
- (unint64_t)alarmId;
- (unsigned)duration;
- (unsigned)type;
- (void)copyPropertiesFromAlarm:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmId:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setManager:(id)a3;
- (void)setState:(int)a3;
@end

@implementation CMMotionAlarm

- (CMMotionAlarm)initWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6
{
  int v7 = 1;
  return (CMMotionAlarm *)objc_msgSend_initWithName_type_duration_repeats_alarmId_bundleId_state_(self, a2, (uint64_t)a3, *(void *)&a4, *(void *)&a5, a6, 0, &stru_1EDFD5D50, v7);
}

- (CMMotionAlarm)initWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6 alarmId:(unint64_t)a7 bundleId:(id)a8 state:(int)a9
{
  BOOL v11 = a6;
  SEL v15 = a2;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (a6 && a4 != 15 && a4 != 19)
  {
    v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)v15, self, @"CMMotionAlarm.mm", 44, @"Invalid parameter not satisfying: %@", @"type == kCMMotionAlarmTypeTimer || type == kCMMotionAlarmTypeClassATimer");
  }
  if (!a3)
  {
    v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)v15, self, @"CMMotionAlarm.mm", 46, @"Invalid parameter not satisfying: %@", @"name");
  }
  if (a4 >= 0x1C)
  {
    v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)v15, self, @"CMMotionAlarm.mm", 47, @"Invalid parameter not satisfying: %@", @"type < kMotionAlarmTypeCount");
  }
  if (!a8)
  {
    if (qword_1E929D6C8 != -1) {
      dispatch_once(&qword_1E929D6C8, &unk_1EDFD2B20);
    }
    v19 = qword_1E929D6C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D6C0, OS_LOG_TYPE_FAULT))
    {
      v22 = self;
      unsigned int v23 = a5;
      unint64_t v24 = a7;
      v25 = v15;
      uint64_t v26 = objc_msgSend_UTF8String(a3, v20, v21);
      v27 = sub_1905663F8(a9);
      *(_DWORD *)buf = 136447490;
      uint64_t v62 = v26;
      SEL v15 = v25;
      a7 = v24;
      a5 = v23;
      self = v22;
      a8 = 0;
      __int16 v63 = 1026;
      unsigned int v64 = a4;
      __int16 v65 = 1026;
      unsigned int v66 = a5;
      __int16 v67 = 1026;
      BOOL v68 = v11;
      __int16 v69 = 2050;
      unint64_t v70 = a7;
      __int16 v71 = 2082;
      uint64_t v72 = objc_msgSend_UTF8String(v27, v28, v29);
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_FAULT, "Invalid CMMotionAlarm with nil bundle id! name: %{public}s, type: %{public}d, duration %{public}d, repeats: %{public}d, alarmId: %{public}llu, state: %{public}s", buf, 0x32u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6C8 != -1) {
        dispatch_once(&qword_1E929D6C8, &unk_1EDFD2B20);
      }
      uint64_t v43 = objc_msgSend_UTF8String(a3, v41, v42);
      v44 = sub_1905663F8(a9);
      int v49 = 136447490;
      uint64_t v50 = v43;
      __int16 v51 = 1026;
      unsigned int v52 = a4;
      __int16 v53 = 1026;
      unsigned int v54 = a5;
      __int16 v55 = 1026;
      BOOL v56 = v11;
      __int16 v57 = 2050;
      unint64_t v58 = a7;
      __int16 v59 = 2082;
      uint64_t v60 = objc_msgSend_UTF8String(v44, v45, v46);
      v47 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMotionAlarm initWithName:type:duration:repeats:alarmId:bundleId:state:]", "CoreLocation: %s\n", v47);
      if (v47 != (char *)buf) {
        free(v47);
      }
    }
    sub_1902BAD40();
    if (sub_1902E0024())
    {
      v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v30, v31);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)v15, self, @"CMMotionAlarm.mm", 64, @"Invalid parameter not satisfying: %@", @"false");
    }
  }
  v48.receiver = self;
  v48.super_class = (Class)CMMotionAlarm;
  v34 = [(CMMotionAlarm *)&v48 init];
  if (v34)
  {
    v35 = (NSString *)a3;
    v34->_duration = a5;
    v34->_type = a4;
    v34->_repeats = v11;
    v34->_name = v35;
    v34->_alarmId = a7;
    v34->_bundleId = (NSString *)a8;
    v34->_state = a9;
  }
  return v34;
}

- (void)dealloc
{
  self->_manager = 0;
  self->_bundleId = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMMotionAlarm;
  [(CMMotionAlarm *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionAlarm)initWithCoder:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CMMotionAlarm;
  v4 = [(CMMotionAlarm *)&v20 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMMotionAlarmName");
    v4->_type = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMMotionAlarmType");
    objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCMMotionAlarmDuration");
    v4->_duration = v9;
    v4->_repeats = objc_msgSend_decodeBoolForKey_(a3, v10, @"kCMMotionAlarmRepeats");
    uint64_t v11 = objc_opt_class();
    v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMMotionAlarmId");
    v4->_alarmId = objc_msgSend_unsignedLongLongValue(v13, v14, v15);
    uint64_t v16 = objc_opt_class();
    v4->_bundleId = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, @"kCMMotionAlarmBundleId");
    v4->_state = objc_msgSend_decodeIntegerForKey_(a3, v18, @"kCMMotionAlarmState");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_name, @"kCMMotionAlarmName");
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_type, @"kCMMotionAlarmType");
  LODWORD(v6) = self->_duration;
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMMotionAlarmDuration", (double)v6);
  objc_msgSend_encodeBool_forKey_(a3, v8, self->_repeats, @"kCMMotionAlarmRepeats");
  uint64_t v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, self->_alarmId);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, @"kCMMotionAlarmId");
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_bundleId, @"kCMMotionAlarmBundleId");
  uint64_t state = self->_state;

  objc_msgSend_encodeInteger_forKey_(a3, v13, state, @"kCMMotionAlarmState");
}

- (BOOL)isValid
{
  return self->_alarmId && self->_manager != 0;
}

- (BOOL)acknowledgeWithError:(id *)a3
{
  return MEMORY[0x1F4181798](self->_manager, sel_acknowledgeAlarm_error_, self);
}

- (BOOL)unregisterWithError:(id *)a3
{
  return MEMORY[0x1F4181798](self->_manager, sel_unregisterAlarm_error_, self);
}

- (void)copyPropertiesFromAlarm:(id)a3
{
  self->_type = objc_msgSend_type(a3, a2, (uint64_t)a3);
  self->_duration = objc_msgSend_duration(a3, v5, v6);
  self->_repeats = objc_msgSend_repeats(a3, v7, v8);
  uint64_t v11 = objc_msgSend_alarmId(a3, v9, v10);
  objc_msgSend_setAlarmId_(self, v12, v11);
  uint64_t v15 = objc_msgSend_bundleId(a3, v13, v14);
  objc_msgSend_setBundleId_(self, v16, v15);
  uint64_t v19 = objc_msgSend_state(a3, v17, v18);

  MEMORY[0x1F4181798](self, sel_setState_, v19);
}

- (id)description
{
  v2 = NSString;
  BOOL repeats = self->_repeats;
  name = self->_name;
  unint64_t alarmId = self->_alarmId;
  bundleId = self->_bundleId;
  uint64_t type = self->_type;
  uint64_t duration = self->_duration;
  double v9 = sub_1905663F8(self->_state);
  return (id)objc_msgSend_stringWithFormat_(v2, v10, @"Name: %@, Type: %d, Duration: %d, Repeats: %d, AlarmID: %llu, BundleID: %@, AlarmState: %@", name, type, duration, repeats, alarmId, bundleId, v9);
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)alarmId
{
  return self->_alarmId;
}

- (void)setAlarmId:(unint64_t)a3
{
  self->_unint64_t alarmId = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_uint64_t state = a3;
}

- (CMMotionAlarmManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

@end