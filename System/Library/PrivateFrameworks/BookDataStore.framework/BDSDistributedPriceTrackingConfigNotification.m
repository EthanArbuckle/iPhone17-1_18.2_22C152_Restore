@interface BDSDistributedPriceTrackingConfigNotification
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfigNotification)initWithCoder:(id)a3;
- (BDSDistributedPriceTrackingConfigNotification)initWithTitle:(id)a3 subtitleSingle:(id)a4 bodySingleAudiobook:(id)a5 bodySingleBook:(id)a6 bodyMultiple:(id)a7;
- (BDSDistributedPriceTrackingConfigNotification)initWithTitleSingleAudiobook:(id)a3 titleSingleBook:(id)a4 titleMultiple:(id)a5 bodySingleAudiobook:(id)a6 bodySingleBook:(id)a7 bodyMultiple:(id)a8;
- (NSString)bodyMultiple;
- (NSString)bodySingleAudiobook;
- (NSString)bodySingleBook;
- (NSString)subtitleSingle;
- (NSString)title;
- (NSString)titleMultiple;
- (NSString)titleSingleAudiobook;
- (NSString)titleSingleBook;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfigNotification

- (BDSDistributedPriceTrackingConfigNotification)initWithTitleSingleAudiobook:(id)a3 titleSingleBook:(id)a4 titleMultiple:(id)a5 bodySingleAudiobook:(id)a6 bodySingleBook:(id)a7 bodyMultiple:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v82.receiver = self;
  v82.super_class = (Class)BDSDistributedPriceTrackingConfigNotification;
  v27 = [(BDSDistributedPriceTrackingConfigNotification *)&v82 init];
  if (v27)
  {
    uint64_t v28 = objc_msgSend_copy(v14, v20, v21, v22, v23, v24, v25, v26);
    v29 = (void *)v28;
    if (v28) {
      v30 = (__CFString *)v28;
    }
    else {
      v30 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v27->_titleSingleAudiobook, v30);

    uint64_t v38 = objc_msgSend_copy(v15, v31, v32, v33, v34, v35, v36, v37);
    v39 = (void *)v38;
    if (v38) {
      v40 = (__CFString *)v38;
    }
    else {
      v40 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v27->_titleSingleBook, v40);

    uint64_t v48 = objc_msgSend_copy(v16, v41, v42, v43, v44, v45, v46, v47);
    v49 = (void *)v48;
    if (v48) {
      v50 = (__CFString *)v48;
    }
    else {
      v50 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v27->_titleMultiple, v50);

    uint64_t v58 = objc_msgSend_copy(v17, v51, v52, v53, v54, v55, v56, v57);
    v59 = (void *)v58;
    if (v58) {
      v60 = (__CFString *)v58;
    }
    else {
      v60 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v27->_bodySingleAudiobook, v60);

    uint64_t v68 = objc_msgSend_copy(v18, v61, v62, v63, v64, v65, v66, v67);
    v69 = (void *)v68;
    if (v68) {
      v70 = (__CFString *)v68;
    }
    else {
      v70 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v27->_bodySingleBook, v70);

    uint64_t v78 = objc_msgSend_copy(v19, v71, v72, v73, v74, v75, v76, v77);
    v79 = (void *)v78;
    if (v78) {
      v80 = (__CFString *)v78;
    }
    else {
      v80 = &stru_26E976C40;
    }
    objc_storeStrong((id *)&v27->_bodyMultiple, v80);
  }
  return v27;
}

- (NSString)title
{
  return (NSString *)&stru_26E976C40;
}

- (NSString)subtitleSingle
{
  return (NSString *)&stru_26E976C40;
}

- (BDSDistributedPriceTrackingConfigNotification)initWithTitle:(id)a3 subtitleSingle:(id)a4 bodySingleAudiobook:(id)a5 bodySingleBook:(id)a6 bodyMultiple:(id)a7
{
  return (BDSDistributedPriceTrackingConfigNotification *)objc_msgSend_initWithTitleSingleAudiobook_titleSingleBook_titleMultiple_bodySingleAudiobook_bodySingleBook_bodyMultiple_(self, a2, (uint64_t)&stru_26E976C40, (uint64_t)&stru_26E976C40, (uint64_t)&stru_26E976C40, (uint64_t)&stru_26E976C40, (uint64_t)&stru_26E976C40, (uint64_t)&stru_26E976C40);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12 = objc_msgSend_titleSingleAudiobook(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"titleSingleAudiobook", v14, v15, v16, v17);

  uint64_t v25 = objc_msgSend_titleSingleBook(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"titleSingleBook", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_titleMultiple(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"titleMultiple", v40, v41, v42, v43);

  v51 = objc_msgSend_bodySingleAudiobook(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, @"bodySingleAudiobook", v53, v54, v55, v56);

  uint64_t v64 = objc_msgSend_bodySingleBook(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"bodySingleBook", v66, v67, v68, v69);

  objc_msgSend_bodyMultiple(self, v70, v71, v72, v73, v74, v75, v76);
  id v82 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v77, (uint64_t)v82, @"bodyMultiple", v78, v79, v80, v81);
}

- (BDSDistributedPriceTrackingConfigNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"titleSingleAudiobook", v7, v8, v9, v10);
  uint64_t v12 = objc_opt_class();
  id v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"titleSingleBook", v14, v15, v16, v17);
  uint64_t v19 = objc_opt_class();
  uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"titleMultiple", v21, v22, v23, v24);
  uint64_t v26 = objc_opt_class();
  uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"bodySingleAudiobook", v28, v29, v30, v31);
  uint64_t v33 = objc_opt_class();
  v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"bodySingleBook", v35, v36, v37, v38);
  uint64_t v40 = objc_opt_class();
  uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"bodyMultiple", v42, v43, v44, v45);

  uint64_t v48 = (BDSDistributedPriceTrackingConfigNotification *)objc_msgSend_initWithTitleSingleAudiobook_titleSingleBook_titleMultiple_bodySingleAudiobook_bodySingleBook_bodyMultiple_(self, v47, (uint64_t)v11, (uint64_t)v18, (uint64_t)v25, (uint64_t)v32, (uint64_t)v39, (uint64_t)v46);
  return v48;
}

- (NSString)titleSingleAudiobook
{
  return self->_titleSingleAudiobook;
}

- (NSString)titleSingleBook
{
  return self->_titleSingleBook;
}

- (NSString)titleMultiple
{
  return self->_titleMultiple;
}

- (NSString)bodySingleAudiobook
{
  return self->_bodySingleAudiobook;
}

- (NSString)bodySingleBook
{
  return self->_bodySingleBook;
}

- (NSString)bodyMultiple
{
  return self->_bodyMultiple;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyMultiple, 0);
  objc_storeStrong((id *)&self->_bodySingleBook, 0);
  objc_storeStrong((id *)&self->_bodySingleAudiobook, 0);
  objc_storeStrong((id *)&self->_titleMultiple, 0);
  objc_storeStrong((id *)&self->_titleSingleBook, 0);
  objc_storeStrong((id *)&self->_titleSingleAudiobook, 0);
}

@end