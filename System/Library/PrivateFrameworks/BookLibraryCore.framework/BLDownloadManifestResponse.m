@interface BLDownloadManifestResponse
+ (BOOL)supportsSecureCoding;
- (BLDownloadManifestResponse)initWithCoder:(id)a3;
- (NSArray)validDownloadIDs;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setValidDownloadIDs:(id)a3;
@end

@implementation BLDownloadManifestResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLDownloadManifestResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BLDownloadManifestResponse;
  v5 = [(BLDownloadManifestResponse *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v11 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v8, 0);
    uint64_t v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"validDownloadIDs");
    validDownloadIDs = v5->_validDownloadIDs;
    v5->_validDownloadIDs = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_validDownloadIDs(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v9, @"validDownloadIDs");
}

- (id)description
{
  id v4 = NSString;
  v5 = objc_msgSend_validDownloadIDs(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"Valid Download Ids: %@", v7, v5);

  return v8;
}

- (NSArray)validDownloadIDs
{
  return self->_validDownloadIDs;
}

- (void)setValidDownloadIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end