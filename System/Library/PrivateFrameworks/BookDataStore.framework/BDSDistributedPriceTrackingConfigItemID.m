@interface BDSDistributedPriceTrackingConfigItemID
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfigItemID)initWithAdamID:(id)a3 isAudiobook:(BOOL)a4;
- (BDSDistributedPriceTrackingConfigItemID)initWithCoder:(id)a3;
- (BOOL)isAudiobook;
- (NSString)adamID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfigItemID

- (BDSDistributedPriceTrackingConfigItemID)initWithAdamID:(id)a3 isAudiobook:(BOOL)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BDSDistributedPriceTrackingConfigItemID;
  v14 = [(BDSDistributedPriceTrackingConfigItemID *)&v19 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11, v12, v13);
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v14->_adamID, v17);

    v14->_isAudiobook = a4;
  }

  return v14;
}

- (id)description
{
  uint64_t v9 = NSString;
  if (objc_msgSend_isAudiobook(self, a2, v2, v3, v4, v5, v6, v7)) {
    v17 = @"A";
  }
  else {
    v17 = @"B";
  }
  v18 = objc_msgSend_adamID(self, v10, v11, v12, v13, v14, v15, v16);
  v25 = objc_msgSend_stringWithFormat_(v9, v19, @"%@.%@", v20, v21, v22, v23, v24, v17, v18);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  uint64_t v11 = objc_msgSend_adamID(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v30, v12, (uint64_t)v11, @"adamID", v13, v14, v15, v16);

  uint64_t isAudiobook = objc_msgSend_isAudiobook(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v30, v25, isAudiobook, @"isAudiobook", v26, v27, v28, v29);
}

- (BDSDistributedPriceTrackingConfigItemID)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"adamID", v7, v8, v9, v10);
  uint64_t v18 = objc_msgSend_decodeBoolForKey_(v4, v12, @"isAudiobook", v13, v14, v15, v16, v17);

  uint64_t isAudiobook = (BDSDistributedPriceTrackingConfigItemID *)objc_msgSend_initWithAdamID_isAudiobook_(self, v19, (uint64_t)v11, v18, v20, v21, v22, v23);
  return isAudiobook;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void).cxx_destruct
{
}

@end