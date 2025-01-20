@interface CKEncryptedDate
- (CKEncryptedDate)initWithDate:(id)a3;
- (NSDate)date;
@end

@implementation CKEncryptedDate

- (CKEncryptedDate)initWithDate:(id)a3
{
  id v4 = a3;
  id v42 = 0;
  char v5 = _CKCheckArgument((uint64_t)"date", v4, 0, 0, 0, &v42);
  id v6 = v42;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v30 = [CKException alloc];
    uint64_t v34 = objc_msgSend_code(v7, v31, v32, v33);
    v38 = objc_msgSend_localizedDescription(v7, v35, v36, v37);
    id v40 = (id)objc_msgSend_initWithCode_format_(v30, v39, v34, @"%@", v38);

    objc_exception_throw(v40);
  }

  v8 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v9 = objc_alloc_init(CKDPDate);
  objc_msgSend_setDateValue_(v8, v10, (uint64_t)v9, v11);

  objc_msgSend_timeIntervalSinceReferenceDate(v4, v12, v13, v14);
  double v16 = v15;
  v20 = objc_msgSend_dateValue(v8, v17, v18, v19);
  objc_msgSend_setTime_(v20, v21, v22, v23, v16);

  v27 = objc_msgSend_data(v8, v24, v25, v26);
  v41.receiver = self;
  v41.super_class = (Class)CKEncryptedDate;
  v28 = [(CKEncryptedData *)&v41 initWithData:v27];

  return v28;
}

- (NSDate)date
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    char v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v9 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v13 = objc_msgSend_dateValue(v8, v10, v11, v12);
    objc_msgSend_time(v13, v14, v15, v16);
    v20 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v9, v17, v18, v19);
  }
  else
  {
    v20 = 0;
  }

  return (NSDate *)v20;
}

@end