@interface IDSDestinationURI
+ (BOOL)supportsSecureCoding;
- (IDSDestinationURI)initWithCoder:(id)a3;
- (IDSDestinationURI)initWithURI:(id)a3;
- (IDSDestinationURI)initWithURIString:(id)a3;
- (IDSURI)uri;
- (id)description;
- (id)destinationLightweightStatus;
- (id)destinationURIs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDestinationURI

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDestinationURI)initWithURI:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDestinationURI;
  v6 = [(IDSDestinationURI *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uri, a3);
  }

  return v7;
}

- (IDSDestinationURI)initWithURIString:(id)a3
{
  id v4 = a3;
  v10 = v4;
  if ((objc_msgSend_containsString_(v4, v5, @":", v6) & 1) == 0)
  {
    v10 = objc_msgSend__bestGuessURI(v4, v7, v8, v9);
  }
  v11 = [IDSURI alloc];
  v14 = objc_msgSend_initWithPrefixedURI_(v11, v12, (uint64_t)v10, v13);
  v17 = (IDSDestinationURI *)objc_msgSend_initWithURI_(self, v15, (uint64_t)v14, v16);

  return v17;
}

- (IDSDestinationURI)initWithCoder:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_containsValueForKey_(v4, v5, @"kIDSDestinationURIURIObject", v6))
  {
    uint64_t v7 = objc_opt_class();
    v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, v9, @"kIDSDestinationURIURIObject");

    double v13 = objc_msgSend_initWithURI_(self, v11, (uint64_t)v10, v12);
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, v16, @"kIDSDestinationURIURI");

    double v13 = objc_msgSend_initWithURIString_(self, v17, (uint64_t)v10, v18);
  }
  v19 = v13;

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_uri(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, @"kIDSDestinationURIURIObject");
}

- (id)destinationURIs
{
  id v4 = objc_msgSend_uri(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_prefixedURI(v4, v5, v6, v7);

  if (v8) {
    objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v9, (uint64_t)v8, v11);
  }
  else {
  double v12 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v9, v10, v11);
  }

  return v12;
}

- (id)destinationLightweightStatus
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_uri(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_prefixedURI(v4, v5, v6, v7);

  if (v8)
  {
    double v13 = v8;
    v14[0] = MEMORY[0x1E4F1CC28];
    double v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v14, v10, &v13, 1);
  }
  else
  {
    double v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_uri(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p uri: %@", v10, v4, self, v8);

  return v11;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (void).cxx_destruct
{
}

@end