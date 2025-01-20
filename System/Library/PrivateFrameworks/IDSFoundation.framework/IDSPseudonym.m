@interface IDSPseudonym
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPseudonym:(id)a3;
- (IDSPseudonym)initWithCoder:(id)a3;
- (IDSPseudonym)initWithDictionaryRepresentation:(id)a3;
- (IDSPseudonym)initWithURI:(id)a3 maskedURI:(id)a4 properties:(id)a5;
- (IDSPseudonymProperties)properties;
- (IDSURI)URI;
- (IDSURI)maskedURI;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (id)destinationURIs;
- (id)withUpdatedProperties:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPseudonym

- (IDSPseudonym)initWithURI:(id)a3 maskedURI:(id)a4 properties:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v14 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, v24, self, @"IDSPseudonym.m", 147, @"Invalid parameter not satisfying: %@", @"maskedURI");

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v15);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v21, self, @"IDSPseudonym.m", 146, @"Invalid parameter not satisfying: %@", @"URI");

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v15);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, v27, self, @"IDSPseudonym.m", 148, @"Invalid parameter not satisfying: %@", @"properties");

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)IDSPseudonym;
  v16 = [(IDSPseudonym *)&v28 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_URI, a3);
    objc_storeStrong((id *)&v17->_maskedURI, a4);
    objc_storeStrong((id *)&v17->_properties, a5);
  }

  return v17;
}

- (id)withUpdatedProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend_initWithURI_maskedURI_properties_(v5, v6, (uint64_t)self->_URI, v7, self->_maskedURI, v4);

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p URI:%@, maskedURI:%@, properties: %@>", *(double *)&self->_URI, v5, self, self->_URI, self->_maskedURI, self->_properties);

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToPseudonym = objc_msgSend_isEqualToPseudonym_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToPseudonym = 0;
  }

  return isEqualToPseudonym;
}

- (BOOL)isEqualToPseudonym:(id)a3
{
  double v6 = (IDSPseudonym *)a3;
  if (self == v6)
  {
    char isEqualToURI = 1;
  }
  else
  {
    v8 = objc_msgSend_URI(self, v4, v5, v7);
    v12 = objc_msgSend_URI(v6, v9, v10, v11);
    if (objc_msgSend_isEqualToURI_(v8, v13, (uint64_t)v12, v14))
    {
      v18 = objc_msgSend_properties(self, v15, v16, v17);
      v22 = objc_msgSend_properties(v6, v19, v20, v21);
      if (objc_msgSend_isEqualToPseudonymProperties_(v18, v23, (uint64_t)v22, v24))
      {
        objc_super v28 = objc_msgSend_maskedURI(self, v25, v26, v27);
        v32 = objc_msgSend_maskedURI(v6, v29, v30, v31);
        char isEqualToURI = objc_msgSend_isEqualToURI_(v28, v33, (uint64_t)v32, v34);
      }
      else
      {
        char isEqualToURI = 0;
      }
    }
    else
    {
      char isEqualToURI = 0;
    }
  }
  return isEqualToURI;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_URI(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_properties(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)destinationURIs
{
  id v4 = objc_msgSend_URI(self, a2, v2, v3);
  double v8 = objc_msgSend_destinationURIs(v4, v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPseudonym)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  double v7 = objc_msgSend__stringForKey_(v4, v5, @"u", v6);
  uint64_t v10 = objc_msgSend_URIWithPrefixedURI_(IDSURI, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend__stringForKey_(v4, v11, @"m", v12);
  double v16 = objc_msgSend_URIWithPrefixedURI_(IDSURI, v14, (uint64_t)v13, v15);

  unint64_t v17 = [IDSPseudonymProperties alloc];
  uint64_t v20 = objc_msgSend__dictionaryForKey_(v4, v18, @"p", v19);

  v23 = objc_msgSend_initWithDictionaryRepresentation_(v17, v21, (uint64_t)v20, v22);
  uint64_t v26 = 0;
  if (v10 && v16 && v23)
  {
    self = (IDSPseudonym *)(id)objc_msgSend_initWithURI_maskedURI_properties_(self, v24, (uint64_t)v10, v25, v16, v23);
    uint64_t v26 = self;
  }

  return v26;
}

- (IDSPseudonym)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"u");
  uint64_t v9 = objc_opt_class();
  double v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"m");
  uint64_t v13 = objc_opt_class();
  double v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, @"p");

  if (v8) {
    BOOL v19 = v12 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || v16 == 0)
  {
    double v21 = 0;
  }
  else
  {
    self = (IDSPseudonym *)(id)objc_msgSend_initWithURI_maskedURI_properties_(self, v17, (uint64_t)v8, v18, v12, v16);
    double v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  URI = self->_URI;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)URI, v6, @"u");
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_maskedURI, v8, @"m");
  objc_msgSend_encodeObject_forKey_(v11, v9, (uint64_t)self->_properties, v10, @"p");
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v7 = objc_msgSend_prefixedURI(self->_URI, v4, v5, v6);
  if (v7)
  {
    CFDictionarySetValue(v3, @"u", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB829C4();
  }

  id v11 = objc_msgSend_prefixedURI(self->_maskedURI, v8, v9, v10);
  if (v11)
  {
    CFDictionarySetValue(v3, @"m", v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB8293C();
  }

  double v15 = objc_msgSend_dictionaryRepresentation(self->_properties, v12, v13, v14);
  if (v15)
  {
    CFDictionarySetValue(v3, @"p", v15);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB8282C();
  }

  BOOL v19 = objc_msgSend_copy(v3, v16, v17, v18);
  return (NSDictionary *)v19;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (IDSURI)maskedURI
{
  return self->_maskedURI;
}

- (IDSPseudonymProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_maskedURI, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

@end