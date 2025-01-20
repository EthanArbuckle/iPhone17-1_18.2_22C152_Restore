@interface IDSURI
+ (BOOL)supportsSecureCoding;
+ (IDSURI)URIWithPrefixedURI:(id)a3;
+ (IDSURI)URIWithPrefixedURI:(id)a3 withServiceLoggingHint:(id)a4;
+ (IDSURI)URIWithUnprefixedURI:(id)a3;
+ (IDSURI)URIWithUnprefixedURI:(id)a3 withServiceLoggingHint:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToURI:(id)a3;
- (BOOL)isTemporaryURI;
- (BOOL)isTokenURI;
- (IDSPushToken)pushToken;
- (IDSURI)initWithCoder:(id)a3;
- (IDSURI)initWithPrefixedURI:(id)a3;
- (IDSURI)initWithPrefixedURI:(id)a3 withServiceLoggingHint:(id)a4;
- (IDSURI)initWithUnprefixedURI:(id)a3;
- (IDSURI)initWithUnprefixedURI:(id)a3 withServiceLoggingHint:(id)a4;
- (IDSURI)tokenFreeURI;
- (NSString)description;
- (NSString)prefixedURI;
- (NSString)serviceLoggingHint;
- (NSString)unprefixedURI;
- (id)URIByAddingOptionalPushToken:(id)a3;
- (id)URIByAddingPushToken:(id)a3;
- (id)destinationURIs;
- (int64_t)FZIDType;
- (int64_t)IDSIDType;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPrefixedURI:(id)a3;
- (void)setServiceLoggingHint:(id)a3;
@end

@implementation IDSURI

+ (IDSURI)URIWithPrefixedURI:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(v5, v6, (uint64_t)v4, v7, 0);

  return (IDSURI *)v8;
}

+ (IDSURI)URIWithPrefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v11 = objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(v8, v9, (uint64_t)v7, v10, v6);

  return (IDSURI *)v11;
}

+ (IDSURI)URIWithUnprefixedURI:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v8 = objc_msgSend_initWithUnprefixedURI_withServiceLoggingHint_(v5, v6, (uint64_t)v4, v7, 0);

  return (IDSURI *)v8;
}

+ (IDSURI)URIWithUnprefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v11 = objc_msgSend_initWithUnprefixedURI_withServiceLoggingHint_(v8, v9, (uint64_t)v7, v10, v6);

  return (IDSURI *)v11;
}

- (IDSURI)initWithPrefixedURI:(id)a3
{
  return (IDSURI *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(self, a2, (uint64_t)a3, v3, 0);
}

- (IDSURI)initWithPrefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSURI;
    id v8 = [(IDSURI *)&v16 init];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = (NSString *)objc_msgSend_copy(v6, v9, v10, v11);
      }
      else {
        v12 = (NSString *)v6;
      }
      prefixedURI = v8->_prefixedURI;
      v8->_prefixedURI = v12;

      objc_storeStrong((id *)&v8->_serviceLoggingHint, a4);
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (IDSURI)initWithUnprefixedURI:(id)a3
{
  return (IDSURI *)objc_msgSend_initWithUnprefixedURI_withServiceLoggingHint_(self, a2, (uint64_t)a3, v3, 0);
}

- (IDSURI)initWithUnprefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3AEEF0]();
  uint64_t v24 = 0;
  id v11 = (id)objc_msgSend__stripPotentialTokenURIWithToken_(v6, v9, (uint64_t)&v24, v10);
  if (!v24)
  {
    v15 = objc_msgSend__stripFZIDPrefix(v6, v12, v13, v14);
    uint64_t v19 = objc_msgSend__bestGuessURI(v15, v16, v17, v18);

    id v6 = (id)v19;
  }
  v22 = (IDSURI *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(self, v20, (uint64_t)v6, v21, 0);

  return v22;
}

- (id)URIByAddingPushToken:(id)a3
{
  id v4 = a3;
  char isTokenURI = objc_msgSend_isTokenURI(self, v5, v6, v7);
  v12 = 0;
  if (v4 && (isTokenURI & 1) == 0)
  {
    uint64_t v13 = objc_msgSend_rawToken(v4, v9, v10, v11);
    double v14 = (void *)_IDSCopyIDForTokenWithURI(v13, self->_prefixedURI);
    v12 = objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v15, (uint64_t)v14, v16, self->_serviceLoggingHint);
  }
  return v12;
}

- (id)URIByAddingOptionalPushToken:(id)a3
{
  id v4 = a3;
  int isTokenURI = objc_msgSend_isTokenURI(self, v5, v6, v7);
  if (!v4 || isTokenURI)
  {
    double v16 = self;
  }
  else
  {
    v12 = objc_msgSend_rawToken(v4, v9, v10, v11);
    uint64_t v13 = (void *)_IDSCopyIDForTokenWithURI(v12, self->_prefixedURI);
    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v14, (uint64_t)v13, v15, self->_serviceLoggingHint);
    double v16 = (IDSURI *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (NSString)unprefixedURI
{
  id v4 = objc_msgSend_prefixedURI(self, a2, v2, v3);
  id v8 = objc_msgSend__stripFZIDPrefix(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (int64_t)IDSIDType
{
  id v4 = objc_msgSend_prefixedURI(self, a2, v2, v3);
  int64_t v7 = _IDSTypeForID(v4, v5, v6);

  return v7;
}

- (int64_t)FZIDType
{
  id v4 = objc_msgSend_prefixedURI(self, a2, v2, v3);
  int64_t v8 = objc_msgSend__FZIDType(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isTokenURI
{
  uint64_t v4 = objc_msgSend_IDSIDType(self, a2, v2, v3);
  return ((unint64_t)(v4 + 1) < 0xD) & (0x1698u >> (v4 + 1));
}

- (IDSURI)tokenFreeURI
{
  if (objc_msgSend_isTokenURI(self, a2, v2, v3))
  {
    int64_t v8 = objc_msgSend_prefixedURI(self, v5, v6, v7);
    double v11 = objc_msgSend__stripPotentialTokenURIWithToken_(v8, v9, 0, v10);

    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v12, (uint64_t)v11, v13, self->_serviceLoggingHint);
    double v14 = (IDSURI *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v14 = self;
  }
  return v14;
}

- (IDSPushToken)pushToken
{
  if (objc_msgSend_isTokenURI(self, a2, v2, v3))
  {
    int64_t v8 = objc_msgSend_prefixedURI(self, v5, v6, v7);
    id v17 = 0;
    id v11 = (id)objc_msgSend__stripPotentialTokenURIWithToken_(v8, v9, (uint64_t)&v17, v10);
    id v12 = v17;

    double v15 = objc_msgSend_pushTokenWithData_withServiceLoggingHint_(IDSPushToken, v13, (uint64_t)v12, v14, self->_serviceLoggingHint);
  }
  else
  {
    double v15 = 0;
  }
  return (IDSPushToken *)v15;
}

- (BOOL)isTemporaryURI
{
  return objc_msgSend_IDSIDType(self, a2, v2, v3) == 6 || objc_msgSend_IDSIDType(self, v5, v6, v7) == 5;
}

- (BOOL)isEqualToURI:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v5 = objc_msgSend_prefixedURI(a3, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_prefixedURI(self, v6, v7, v8);
  char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v5, v10, (uint64_t)v9, v11);

  return isEqualToIgnoringCase;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToURI = objc_msgSend_isEqualToURI_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToURI = 0;
  }

  return isEqualToURI;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_prefixedURI(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = IDSLoggableDescriptionForHandleOnService(self->_prefixedURI, self->_serviceLoggingHint);
  unint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p %@>", v7, v4, self, v5);;

  return (NSString *)v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_prefixedURI(self, v5, v6, v7);
  id v12 = objc_msgSend_prefixedURI(v4, v9, v10, v11);

  int64_t v15 = objc_msgSend_compare_(v8, v13, (uint64_t)v12, v14);
  return v15;
}

- (id)destinationURIs
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = objc_msgSend_prefixedURI(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_setWithObject_(v4, v6, (uint64_t)v5, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSURI)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"prefixedURI");
  uint64_t v9 = objc_opt_class();
  id v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"serviceHint");

  int64_t v15 = (IDSURI *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_prefixedURI(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"prefixedURI");

  objc_msgSend_serviceLoggingHint(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"serviceHint");
}

- (NSString)prefixedURI
{
  return self->_prefixedURI;
}

- (void)setPrefixedURI:(id)a3
{
}

- (NSString)serviceLoggingHint
{
  return self->_serviceLoggingHint;
}

- (void)setServiceLoggingHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLoggingHint, 0);
  objc_storeStrong((id *)&self->_prefixedURI, 0);
}

@end