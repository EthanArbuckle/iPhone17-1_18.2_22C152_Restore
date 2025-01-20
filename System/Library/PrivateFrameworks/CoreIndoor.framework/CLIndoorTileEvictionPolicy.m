@interface CLIndoorTileEvictionPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)forceClean;
- (BOOL)tileLastModified:(double)a3 needsEvictionAt:(double)a4;
- (CLIndoorTileEvictionPolicy)init;
- (CLIndoorTileEvictionPolicy)initWithCoder:(id)a3;
- (OS_xpc_object)activity;
- (double)maxModifiedAge;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setForceClean:(BOOL)a3;
- (void)setMaxModifiedAge:(double)a3;
@end

@implementation CLIndoorTileEvictionPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorTileEvictionPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLIndoorTileEvictionPolicy;
  v2 = [(CLIndoorTileEvictionPolicy *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_forceClean = 0;
    activity = v2->_activity;
    v2->_maxModifiedAge = 604800.0;
    v2->_activity = 0;

    v5 = v3;
  }

  return v3;
}

- (CLIndoorTileEvictionPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLIndoorTileEvictionPolicy;
  v8 = [(CLIndoorTileEvictionPolicy *)&v16 init];
  if (v8)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, @"_maxModifiedAge", v6, v7);
    v8->_maxModifiedAge = v9;
    v8->_forceClean = objc_msgSend_decodeBoolForKey_(v4, v10, @"_forceClean", v11, v12);
    activity = v8->_activity;
    v8->_activity = 0;

    v14 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend_encodeDouble_forKey_(v11, v4, @"_maxModifiedAge", v5, v6, self->_maxModifiedAge);
  double v10 = 0.0;
  if (self->_forceClean) {
    double v10 = 1.0;
  }
  objc_msgSend_encodeDouble_forKey_(v11, v7, @"_forceClean", v8, v9, v10);
}

- (BOOL)tileLastModified:(double)a3 needsEvictionAt:(double)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (qword_267F741C0 != -1)
  {
    dispatch_once(&qword_267F741C0, &unk_26D46BDE8);
    uint64_t v7 = qword_267F741C8;
    if (os_log_type_enabled((os_log_t)qword_267F741C8, OS_LOG_TYPE_INFO)) {
      goto LABEL_3;
    }
LABEL_5:
    double v8 = a4 - a3;
    return v8 >= self->_maxModifiedAge;
  }
  uint64_t v7 = qword_267F741C8;
  if (!os_log_type_enabled((os_log_t)qword_267F741C8, OS_LOG_TYPE_INFO)) {
    goto LABEL_5;
  }
LABEL_3:
  double v8 = a4 - a3;
  double maxModifiedAge = self->_maxModifiedAge;
  int v11 = 134350080;
  double v12 = a4;
  __int16 v13 = 2050;
  double v14 = a3;
  __int16 v15 = 2050;
  double v16 = a4 - a3;
  __int16 v17 = 2050;
  double v18 = maxModifiedAge;
  __int16 v19 = 1024;
  BOOL v20 = a4 - a3 >= maxModifiedAge;
  _os_log_impl(&dword_221DDF000, v7, OS_LOG_TYPE_INFO, "@EvictCheck, modified, %{public}.1f, %{public}.1f, ages, %{public}.1f, %{public}.1f, evict, %d", (uint8_t *)&v11, 0x30u);
  return v8 >= self->_maxModifiedAge;
}

- (id)description
{
  id v4 = @"YES";
  if (self->_forceClean) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  if (!self->_activity) {
    id v4 = @"NO";
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLIndoorTileEvictionPolicy[maxModifiedAge=%lfs,forceClean=%@,xpc_activity=%@]", v2, v3, *(void *)&self->_maxModifiedAge, v5, v4);
}

- (double)maxModifiedAge
{
  return self->_maxModifiedAge;
}

- (void)setMaxModifiedAge:(double)a3
{
  self->_double maxModifiedAge = a3;
}

- (BOOL)forceClean
{
  return self->_forceClean;
}

- (void)setForceClean:(BOOL)a3
{
  self->_forceClean = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end