@interface IDSDestinationGroupSessionMember
+ (BOOL)supportsSecureCoding;
- (BOOL)isDevice;
- (BOOL)isLightWeight;
- (IDSDestinationGroupSessionMember)initWithCoder:(id)a3;
- (IDSDestinationGroupSessionMember)initWithURI:(id)a3;
- (IDSDestinationGroupSessionMember)initWithURI:(id)a3 isLightWeight:(BOOL)a4;
- (IDSDestinationGroupSessionMember)initWithURIObject:(id)a3 isLightWeight:(BOOL)a4;
- (IDSURI)URIObject;
- (NSString)uri;
- (id)description;
- (id)destinationLightweightStatus;
- (id)destinationURIs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDestinationGroupSessionMember

- (IDSDestinationGroupSessionMember)initWithURI:(id)a3 isLightWeight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [IDSURI alloc];
  v10 = objc_msgSend_initWithPrefixedURI_(v7, v8, (uint64_t)v6, v9);

  isLightWeight = (IDSDestinationGroupSessionMember *)objc_msgSend_initWithURIObject_isLightWeight_(self, v11, (uint64_t)v10, v12, v4);
  return isLightWeight;
}

- (IDSDestinationGroupSessionMember)initWithURIObject:(id)a3 isLightWeight:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSDestinationGroupSessionMember;
  v8 = [(IDSDestinationGroupSessionMember *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URIObject, a3);
    v9->_isLightWeight = a4;
  }

  return v9;
}

- (IDSDestinationGroupSessionMember)initWithURI:(id)a3
{
  return (IDSDestinationGroupSessionMember *)objc_msgSend_initWithURI_isLightWeight_(self, a2, (uint64_t)a3, v3, 0);
}

- (NSString)uri
{
  BOOL v4 = objc_msgSend_URIObject(self, a2, v2, v3);
  v8 = objc_msgSend_prefixedURI(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (IDSDestinationGroupSessionMember)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kURIKey");
  uint64_t v11 = objc_msgSend_decodeBoolForKey_(v4, v9, @"kIsLightWeight", v10);

  isLightWeight = (IDSDestinationGroupSessionMember *)objc_msgSend_initWithURIObject_isLightWeight_(self, v12, (uint64_t)v8, v13, v11);
  return isLightWeight;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  double v7 = objc_msgSend_URIObject(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v16, v8, (uint64_t)v7, v9, @"kURIKey");

  uint64_t isLightWeight = objc_msgSend_isLightWeight(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v16, v14, isLightWeight, v15, @"kIsLightWeight");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v5 = NSString;
  double v6 = objc_msgSend_uri(self, a2, v2, v3);
  if (objc_msgSend_isLightWeight(self, v7, v8, v9)) {
    objc_msgSend_stringWithFormat_(v5, v10, @"<URI:%@ isLightweight: %@>", v11, v6, @"YES");
  }
  else {
  double v12 = objc_msgSend_stringWithFormat_(v5, v10, @"<URI:%@ isLightweight: %@>", v11, v6, @"NO");
  }

  return v12;
}

- (BOOL)isDevice
{
  return 1;
}

- (id)destinationURIs
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_msgSend_uri(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_setWithObject_(v4, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)destinationLightweightStatus
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  double v6 = NSNumber;
  uint64_t isLightWeight = objc_msgSend_isLightWeight(self, a2, v2, v3);
  double v10 = objc_msgSend_numberWithBool_(v6, v8, isLightWeight, v9);
  v14 = objc_msgSend_uri(self, v11, v12, v13);
  v17 = objc_msgSend_dictionaryWithObject_forKey_(v5, v15, (uint64_t)v10, v16, v14);

  return v17;
}

- (IDSURI)URIObject
{
  return self->_URIObject;
}

- (BOOL)isLightWeight
{
  return self->_isLightWeight;
}

- (void).cxx_destruct
{
}

@end