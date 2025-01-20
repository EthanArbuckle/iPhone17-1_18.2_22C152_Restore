@interface IDSDestinationDevice
+ (BOOL)isDeviceURI:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isDevice;
- (BOOL)isGuest;
- (IDSDestinationDevice)initWithCoder:(id)a3;
- (IDSDestinationDevice)initWithDeviceURI:(id)a3;
- (IDSDestinationDevice)initWithIDSDeviceURI:(id)a3;
- (IDSDestinationDevice)initWithRapportPublicIdentifierURI:(id)a3;
- (IDSDestinationDevice)initWithURI:(id)a3 isGuest:(BOOL)a4;
- (IDSURI)destinationURI;
- (id)description;
- (id)destinationURIs;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationURI:(id)a3;
- (void)setIsGuest:(BOOL)a3;
@end

@implementation IDSDestinationDevice

+ (BOOL)isDeviceURI:(id)a3
{
  return objc_msgSend_hasPrefix_(a3, a2, @"guest-device:", v3);
}

- (IDSDestinationDevice)initWithRapportPublicIdentifierURI:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, @"guest-device:", v6))
  {
    v7 = [IDSURI alloc];
    v10 = objc_msgSend_initWithPrefixedURI_(v7, v8, (uint64_t)v4, v9);
    self = (IDSDestinationDevice *)(id)objc_msgSend_initWithURI_isGuest_(self, v11, (uint64_t)v10, v12, 1);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (IDSDestinationDevice)initWithIDSDeviceURI:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_hasPrefix_(v4, v5, @"device:", v6) & 1) != 0
    || objc_msgSend_hasPrefix_(v4, v7, @"self-token:", v8))
  {
    double v9 = [IDSURI alloc];
    double v12 = objc_msgSend_initWithPrefixedURI_(v9, v10, (uint64_t)v4, v11);
    self = (IDSDestinationDevice *)(id)objc_msgSend_initWithURI_isGuest_(self, v13, (uint64_t)v12, v14, 0);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (IDSDestinationDevice)initWithDeviceURI:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, @"guest-device:", v6))
  {
    self = (IDSDestinationDevice *)(id)objc_msgSend_initWithRapportPublicIdentifierURI_(self, v7, (uint64_t)v4, v8);
    double v9 = self;
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (IDSDestinationDevice)initWithURI:(id)a3 isGuest:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSDestinationDevice;
  double v8 = [(IDSDestinationDevice *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destinationURI, a3);
    v9->_isGuest = a4;
  }

  return v9;
}

- (IDSDestinationDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kURIKey");
  uint64_t v11 = objc_msgSend_decodeBoolForKey_(v4, v9, @"kIsGuestKey", v10);

  isGuest = (IDSDestinationDevice *)objc_msgSend_initWithURI_isGuest_(self, v12, (uint64_t)v8, v13, v11);
  return isGuest;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  double v7 = objc_msgSend_destinationURI(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v16, v8, (uint64_t)v7, v9, @"kURIKey");

  uint64_t isGuest = objc_msgSend_isGuest(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v16, v14, isGuest, v15, @"kIsGuestKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double v9 = objc_msgSend_destinationURI(self, v6, v7, v8);
  if (objc_msgSend_isGuest(self, v10, v11, v12)) {
    objc_msgSend_stringWithFormat_(v3, v13, @"<%@:%p uri: %@ isGuest: %@>", v14, v5, self, v9, @"YES");
  }
  else {
  double v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@:%p uri: %@ isGuest: %@>", v14, v5, self, v9, @"NO");
  }

  return v15;
}

- (BOOL)isDevice
{
  return 1;
}

- (id)destinationURIs
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_msgSend_destinationURI(self, a2, v2, v3);
  double v9 = objc_msgSend_prefixedURI(v5, v6, v7, v8);
  double v12 = objc_msgSend_setWithObject_(v4, v10, (uint64_t)v9, v11);

  return v12;
}

- (IDSURI)destinationURI
{
  return self->_destinationURI;
}

- (void)setDestinationURI:(id)a3
{
}

- (BOOL)isGuest
{
  return self->_isGuest;
}

- (void)setIsGuest:(BOOL)a3
{
  self->_uint64_t isGuest = a3;
}

- (void).cxx_destruct
{
}

@end