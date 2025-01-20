@interface CWFUserSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserSettings:(id)a3;
- (CWFUserSettings)initWithCoder:(id)a3;
- (NSDictionary)OSSpecificAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)askToJoinMode;
- (int64_t)autoHotspotMode;
- (int64_t)compatibilityMode;
- (int64_t)syncMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAutoHotspotMode:(int64_t)a3;
- (void)setCompatibilityMode:(int64_t)a3;
- (void)setOSSpecificAttributes:(id)a3;
- (void)setSyncMode:(int64_t)a3;
@end

@implementation CWFUserSettings

- (id)description
{
  v5 = NSString;
  long long v14 = *(_OWORD *)&self->_askToJoinMode;
  int64_t syncMode = self->_syncMode;
  int64_t compatibilityMode = self->_compatibilityMode;
  v8 = objc_msgSend_OSSpecificAttributes(self, a2, v2, v3, v4);
  v12 = objc_msgSend_stringWithFormat_(v5, v9, @"askToJoinMode=%ld, autoHotspotMode=%ld, syncMode=%ld, compatibilityMode=%ld, OSSpecificAttributes=%@", v10, v11, v14, syncMode, compatibilityMode, v8);

  return v12;
}

- (BOOL)isEqualToUserSettings:(id)a3
{
  id v6 = a3;
  OSSpecificAttributes = self->_OSSpecificAttributes;
  objc_msgSend_OSSpecificAttributes(v6, v8, v9, v10, v11);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (OSSpecificAttributes != v16)
  {
    if (!self->_OSSpecificAttributes
      || (objc_msgSend_OSSpecificAttributes(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v27 = 0;
      goto LABEL_14;
    }
    uint64_t v3 = (void *)v17;
    v22 = self->_OSSpecificAttributes;
    uint64_t v4 = objc_msgSend_OSSpecificAttributes(v6, v18, v19, v20, v21);
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      BOOL v26 = 0;
LABEL_13:

      BOOL v27 = v26;
      goto LABEL_14;
    }
  }
  int64_t askToJoinMode = self->_askToJoinMode;
  if (askToJoinMode == objc_msgSend_askToJoinMode(v6, v12, v13, v14, v15)
    && (autoHotspotMode = self->_autoHotspotMode, autoHotspotMode == objc_msgSend_autoHotspotMode(v6, v29, v30, v31, v32))&& (int64_t compatibilityMode = self->_compatibilityMode, compatibilityMode == objc_msgSend_compatibilityMode(v6, v34, v35, v36, v37)))
  {
    int64_t syncMode = self->_syncMode;
    BOOL v26 = syncMode == objc_msgSend_syncMode(v6, v39, v40, v41, v42);
    BOOL v27 = v26;
  }
  else
  {
    BOOL v26 = 0;
    BOOL v27 = 0;
  }
  if (OSSpecificAttributes != v16) {
    goto LABEL_13;
  }
LABEL_14:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFUserSettings *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToUserSettings = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToUserSettings = objc_msgSend_isEqualToUserSettings_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToUserSettings = 0;
  }

  return isEqualToUserSettings;
}

- (unint64_t)hash
{
  int8x16_t v8 = *(int8x16_t *)&self->_syncMode;
  int8x16_t v9 = *(int8x16_t *)&self->_autoHotspotMode;
  uint64_t v5 = objc_msgSend_hash(self->_OSSpecificAttributes, a2, v2, v3, v4);
  int8x16_t v6 = veorq_s8(v8, v9);
  return *(void *)&veor_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = objc_msgSend_allocWithZone_(CWFUserSettings, a2, (uint64_t)a3, v3, v4);
  v12 = objc_msgSend_init(v7, v8, v9, v10, v11);
  objc_msgSend_setAskToJoinMode_(v12, v13, self->_askToJoinMode, v14, v15);
  objc_msgSend_setAutoHotspotMode_(v12, v16, self->_autoHotspotMode, v17, v18);
  objc_msgSend_setSyncMode_(v12, v19, self->_syncMode, v20, v21);
  objc_msgSend_setCompatibilityMode_(v12, v22, self->_compatibilityMode, v23, v24);
  v28 = objc_msgSend_copyWithZone_(self->_OSSpecificAttributes, v25, (uint64_t)a3, v26, v27);
  objc_msgSend_setOSSpecificAttributes_(v12, v29, (uint64_t)v28, v30, v31);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t askToJoinMode = self->_askToJoinMode;
  id v15 = a3;
  objc_msgSend_encodeInteger_forKey_(v15, v5, askToJoinMode, @"_askToJoinMode", v6);
  objc_msgSend_encodeInteger_forKey_(v15, v7, self->_autoHotspotMode, @"_autoHotspotMode", v8);
  objc_msgSend_encodeInteger_forKey_(v15, v9, self->_syncMode, @"_syncMode", v10);
  objc_msgSend_encodeInteger_forKey_(v15, v11, self->_compatibilityMode, @"_compatibilityMode", v12);
  objc_msgSend_encodeObject_forKey_(v15, v13, (uint64_t)self->_OSSpecificAttributes, @"_OSSpecificAttributes", v14);
}

- (CWFUserSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CWFUserSettings;
  uint64_t v8 = [(CWFUserSettings *)&v34 init];
  if (v8)
  {
    v8->_int64_t askToJoinMode = objc_msgSend_decodeIntegerForKey_(v4, v5, @"_askToJoinMode", v6, v7);
    v8->_int64_t autoHotspotMode = objc_msgSend_decodeIntegerForKey_(v4, v9, @"_autoHotspotMode", v10, v11);
    v8->_int64_t syncMode = objc_msgSend_decodeIntegerForKey_(v4, v12, @"_syncMode", v13, v14);
    v8->_int64_t compatibilityMode = objc_msgSend_decodeIntegerForKey_(v4, v15, @"_compatibilityMode", v16, v17);
    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v28 = objc_msgSend_setWithObjects_(v18, v25, v19, v26, v27, v20, v21, v22, v23, v24, 0);
    uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, @"_OSSpecificAttributes", v30);
    OSSpecificAttributes = v8->_OSSpecificAttributes;
    v8->_OSSpecificAttributes = (NSDictionary *)v31;
  }
  return v8;
}

- (int64_t)syncMode
{
  return self->_syncMode;
}

- (void)setSyncMode:(int64_t)a3
{
  self->_int64_t syncMode = a3;
}

- (int64_t)askToJoinMode
{
  return self->_askToJoinMode;
}

- (void)setAskToJoinMode:(int64_t)a3
{
  self->_int64_t askToJoinMode = a3;
}

- (int64_t)autoHotspotMode
{
  return self->_autoHotspotMode;
}

- (void)setAutoHotspotMode:(int64_t)a3
{
  self->_int64_t autoHotspotMode = a3;
}

- (int64_t)compatibilityMode
{
  return self->_compatibilityMode;
}

- (void)setCompatibilityMode:(int64_t)a3
{
  self->_int64_t compatibilityMode = a3;
}

- (NSDictionary)OSSpecificAttributes
{
  return self->_OSSpecificAttributes;
}

- (void)setOSSpecificAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end