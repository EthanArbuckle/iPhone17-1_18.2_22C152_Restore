@interface BDSReadingHistoryServiceStatusInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryServiceStatus)status;
- (BDSReadingHistoryServiceStatusInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryServiceStatusInfo)initWithIsLoaded:(BOOL)a3;
- (BOOL)isLoaded;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSReadingHistoryServiceStatusInfo

- (BDSReadingHistoryServiceStatusInfo)initWithIsLoaded:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BDSReadingHistoryServiceStatusInfo;
  v4 = [(BDSReadingHistoryServiceStatusInfo *)&v15 init];
  if (v4)
  {
    v5 = [BDSReadingHistoryServiceStatus alloc];
    uint64_t IsLoaded = objc_msgSend_initWithIsLoaded_(v5, v6, v3, v7, v8, v9, v10, v11);
    status = v4->_status;
    v4->_status = (BDSReadingHistoryServiceStatus *)IsLoaded;
  }
  return v4;
}

- (BOOL)isLoaded
{
  uint64_t v8 = objc_msgSend_status(self, a2, v2, v3, v4, v5, v6, v7);
  char isLoaded = objc_msgSend_isLoaded(v8, v9, v10, v11, v12, v13, v14, v15);

  return isLoaded;
}

+ (BOOL)supportsSecureCoding
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x270F9A6D0])(BDSReadingHistoryServiceStatus, sel_supportsSecureCoding);
}

- (BDSReadingHistoryServiceStatusInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = (BDSReadingHistoryServiceStatusInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = [BDSReadingHistoryServiceStatus alloc];
    uint64_t v20 = objc_msgSend_initWithCoder_(v13, v14, (uint64_t)v4, v15, v16, v17, v18, v19);
    status = v12->_status;
    v12->_status = (BDSReadingHistoryServiceStatus *)v20;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_status(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeWithCoder_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BDSReadingHistoryServiceStatusInfo alloc];
  uint64_t isLoaded = objc_msgSend_isLoaded(self, v5, v6, v7, v8, v9, v10, v11);
  return (id)objc_msgSend_initWithIsLoaded_(v4, v12, isLoaded, v14, v15, v16, v17, v18);
}

- (id)description
{
  uint64_t v8 = objc_msgSend_status(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_description(v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (BDSReadingHistoryServiceStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end