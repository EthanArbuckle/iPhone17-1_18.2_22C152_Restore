@interface BDSDistributedPriceTrackingConfig
+ (BDSDistributedPriceTrackingConfig)disabledConfig;
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfig)initWithCoder:(id)a3;
- (BDSDistributedPriceTrackingConfig)initWithItemIDs:(id)a3 updateScheduleSteps:(id)a4 dealAbsoluteThreshold:(id)a5 dealRelativeThreshold:(id)a6 notification:(id)a7 cardLimit:(id)a8;
- (BDSDistributedPriceTrackingConfigNotification)notification;
- (NSArray)itemIDs;
- (NSArray)updateScheduleSteps;
- (NSNumber)cardLimit;
- (NSNumber)dealAbsoluteThreshold;
- (NSNumber)dealRelativeThreshold;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfig

+ (BDSDistributedPriceTrackingConfig)disabledConfig
{
  id v2 = objc_alloc((Class)a1);
  updated = objc_msgSend_initWithItemIDs_updateScheduleSteps_dealAbsoluteThreshold_dealRelativeThreshold_notification_cardLimit_(v2, v3, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], (uint64_t)&unk_26E98AA78, (uint64_t)&unk_26E98AA78, 0, (uint64_t)&unk_26E98AA78);
  return (BDSDistributedPriceTrackingConfig *)updated;
}

- (BDSDistributedPriceTrackingConfig)initWithItemIDs:(id)a3 updateScheduleSteps:(id)a4 dealAbsoluteThreshold:(id)a5 dealRelativeThreshold:(id)a6 notification:(id)a7 cardLimit:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v73.receiver = self;
  v73.super_class = (Class)BDSDistributedPriceTrackingConfig;
  v27 = [(BDSDistributedPriceTrackingConfig *)&v73 init];
  if (v27)
  {
    uint64_t v28 = objc_msgSend_copy(v14, v20, v21, v22, v23, v24, v25, v26);
    v29 = (void *)v28;
    v30 = (void *)MEMORY[0x263EFFA68];
    if (v28) {
      v31 = (void *)v28;
    }
    else {
      v31 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v27->_itemIDs, v31);

    uint64_t v39 = objc_msgSend_copy(v15, v32, v33, v34, v35, v36, v37, v38);
    v40 = (void *)v39;
    if (v39) {
      v41 = (void *)v39;
    }
    else {
      v41 = v30;
    }
    objc_storeStrong((id *)&v27->_updateScheduleSteps, v41);

    uint64_t v49 = objc_msgSend_copy(v16, v42, v43, v44, v45, v46, v47, v48);
    v50 = (void *)v49;
    if (v49) {
      v51 = (void *)v49;
    }
    else {
      v51 = &unk_26E98AA78;
    }
    objc_storeStrong((id *)&v27->_dealAbsoluteThreshold, v51);

    uint64_t v59 = objc_msgSend_copy(v17, v52, v53, v54, v55, v56, v57, v58);
    v60 = (void *)v59;
    if (v59) {
      v61 = (void *)v59;
    }
    else {
      v61 = &unk_26E98AA78;
    }
    objc_storeStrong((id *)&v27->_dealRelativeThreshold, v61);

    objc_storeStrong((id *)&v27->_notification, a7);
    uint64_t v69 = objc_msgSend_copy(v19, v62, v63, v64, v65, v66, v67, v68);
    v70 = (void *)v69;
    if (v69) {
      v71 = (void *)v69;
    }
    else {
      v71 = &unk_26E98AA78;
    }
    objc_storeStrong((id *)&v27->_cardLimit, v71);
  }
  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12 = objc_msgSend_itemIDs(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"itemIDs", v14, v15, v16, v17);

  uint64_t v25 = objc_msgSend_updateScheduleSteps(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"updateScheduleSteps", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_dealAbsoluteThreshold(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"dealAbsoluteThreshold", v40, v41, v42, v43);

  v51 = objc_msgSend_dealRelativeThreshold(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, @"dealRelativeThreshold", v53, v54, v55, v56);

  uint64_t v64 = objc_msgSend_notification(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"notification", v66, v67, v68, v69);

  objc_msgSend_cardLimit(self, v70, v71, v72, v73, v74, v75, v76);
  id v82 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v77, (uint64_t)v82, @"cardLimit", v78, v79, v80, v81);
}

- (BDSDistributedPriceTrackingConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_bds_decodeArrayOfObjectsOfClass_forKey_(v4, v6, v5, @"itemIDs", v7, v8, v9, v10);
  uint64_t v12 = objc_opt_class();
  id v18 = objc_msgSend_bds_decodeArrayOfObjectsOfClass_forKey_(v4, v13, v12, @"updateScheduleSteps", v14, v15, v16, v17);
  uint64_t v19 = objc_opt_class();
  uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"dealAbsoluteThreshold", v21, v22, v23, v24);
  uint64_t v26 = objc_opt_class();
  uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"dealRelativeThreshold", v28, v29, v30, v31);
  uint64_t v33 = objc_opt_class();
  uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"notification", v35, v36, v37, v38);
  uint64_t v40 = objc_opt_class();
  uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"cardLimit", v42, v43, v44, v45);

  updated = (BDSDistributedPriceTrackingConfig *)objc_msgSend_initWithItemIDs_updateScheduleSteps_dealAbsoluteThreshold_dealRelativeThreshold_notification_cardLimit_(self, v47, (uint64_t)v11, (uint64_t)v18, (uint64_t)v25, (uint64_t)v32, (uint64_t)v39, (uint64_t)v46);
  return updated;
}

- (NSArray)itemIDs
{
  return self->_itemIDs;
}

- (NSArray)updateScheduleSteps
{
  return self->_updateScheduleSteps;
}

- (NSNumber)dealAbsoluteThreshold
{
  return self->_dealAbsoluteThreshold;
}

- (NSNumber)dealRelativeThreshold
{
  return self->_dealRelativeThreshold;
}

- (BDSDistributedPriceTrackingConfigNotification)notification
{
  return self->_notification;
}

- (NSNumber)cardLimit
{
  return self->_cardLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardLimit, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_dealRelativeThreshold, 0);
  objc_storeStrong((id *)&self->_dealAbsoluteThreshold, 0);
  objc_storeStrong((id *)&self->_updateScheduleSteps, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

@end