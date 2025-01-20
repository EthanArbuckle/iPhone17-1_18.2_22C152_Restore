@interface MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent
- (MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent)init;
- (NSNumber)productID;
- (NSNumber)softwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setProductID:(NSNumber *)productID;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
@end

@implementation MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent

- (MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent;
  v2 = [(MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    softwareVersion = v2->_softwareVersion;
    v2->_softwareVersion = (NSNumber *)&unk_26F9C8620;

    productID = v3->_productID;
    v3->_productID = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent);
  objc_super v7 = objc_msgSend_softwareVersion(self, v5, v6);
  objc_msgSend_setSoftwareVersion_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_productID(self, v9, v10);
  objc_msgSend_setProductID_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: softwareVersion:%@; productID:%@; >",
    v5,
    self->_softwareVersion,
  objc_super v7 = self->_productID);

  return v7;
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(NSNumber *)productID
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_softwareVersion, 0);
}

@end