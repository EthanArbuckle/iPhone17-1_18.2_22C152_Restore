@interface MTRApplicationLauncherClusterApplicationStruct
- (MTRApplicationLauncherClusterApplicationStruct)init;
- (NSNumber)catalogVendorID;
- (NSString)applicationID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setApplicationID:(NSString *)applicationID;
- (void)setCatalogVendorID:(NSNumber *)catalogVendorID;
@end

@implementation MTRApplicationLauncherClusterApplicationStruct

- (MTRApplicationLauncherClusterApplicationStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRApplicationLauncherClusterApplicationStruct;
  v2 = [(MTRApplicationLauncherClusterApplicationStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    catalogVendorID = v2->_catalogVendorID;
    v2->_catalogVendorID = (NSNumber *)&unk_26F9C8620;

    applicationID = v3->_applicationID;
    v3->_applicationID = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRApplicationLauncherClusterApplicationStruct);
  objc_super v7 = objc_msgSend_catalogVendorID(self, v5, v6);
  objc_msgSend_setCatalogVendorID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_applicationID(self, v9, v10);
  objc_msgSend_setApplicationID_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: catalogVendorID:%@; applicationID:%@; >",
    v5,
    self->_catalogVendorID,
  objc_super v7 = self->_applicationID);

  return v7;
}

- (NSNumber)catalogVendorID
{
  return self->_catalogVendorID;
}

- (void)setCatalogVendorID:(NSNumber *)catalogVendorID
{
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setApplicationID:(NSString *)applicationID
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);

  objc_storeStrong((id *)&self->_catalogVendorID, 0);
}

@end