@interface CKDistributedTimestamp
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)unordered;
- (CKDistributedSiteIdentifier)siteIdentifierObject;
- (CKDistributedTimestamp)initWithCoder:(id)a3;
- (CKDistributedTimestamp)initWithSiteIdentifier:(id)a3 clockValue:(unint64_t)a4;
- (CKDistributedTimestamp)initWithSiteIdentifierObject:(id)a3 clockValue:(unint64_t)a4;
- (NSData)siteIdentifier;
- (id)description;
- (id)descriptionWithStringSiteIdentifiers;
- (int64_t)compareToTimestamp:(id)a3;
- (unint64_t)clockValue;
- (unint64_t)hash;
- (unsigned)modifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDistributedTimestamp

- (CKDistributedTimestamp)initWithSiteIdentifier:(id)a3 clockValue:(unint64_t)a4
{
  id v6 = a3;
  v7 = [CKDistributedSiteIdentifier alloc];
  v10 = objc_msgSend_initWithIdentifier_(v7, v8, (uint64_t)v6, v9);
  v12 = (CKDistributedTimestamp *)objc_msgSend_initWithSiteIdentifierObject_clockValue_(self, v11, (uint64_t)v10, a4);

  return v12;
}

- (CKDistributedTimestamp)initWithSiteIdentifierObject:(id)a3 clockValue:(unint64_t)a4
{
  id v7 = a3;
  if (a4 == -1) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v6, *MEMORY[0x1E4F1C3C8], @"Clock value NSUIntegerMax is reserved");
  }
  v15.receiver = self;
  v15.super_class = (Class)CKDistributedTimestamp;
  v11 = [(CKDistributedTimestamp *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10);
    siteIdentifierObject = v11->_siteIdentifierObject;
    v11->_siteIdentifierObject = (CKDistributedSiteIdentifier *)v12;

    v11->_clockValue = a4;
  }

  return v11;
}

- (NSData)siteIdentifier
{
  v4 = objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  v8 = objc_msgSend_identifier(v4, v5, v6, v7);

  return (NSData *)v8;
}

- (unsigned)modifier
{
  return 0;
}

- (BOOL)unordered
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDistributedTimestamp;
  v5 = [(CKDistributedTimestamp *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_siteIdentifierObject);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    siteIdentifierObject = v5->_siteIdentifierObject;
    v5->_siteIdentifierObject = (CKDistributedSiteIdentifier *)v9;

    v11 = NSStringFromSelector(sel_clockValue);
    v5->_clockValue = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)v11, v13);

    if (!v5->_siteIdentifierObject)
    {
      uint64_t v14 = objc_opt_class();
      objc_super v15 = NSStringFromSelector(sel_siteIdentifier);
      v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15);

      v18 = [CKDistributedSiteIdentifier alloc];
      uint64_t v20 = objc_msgSend_initWithIdentifier_modifier_(v18, v19, (uint64_t)v17, 0);
      v21 = v5->_siteIdentifierObject;
      v5->_siteIdentifierObject = (CKDistributedSiteIdentifier *)v20;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v27 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_siteIdentifierObject(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_siteIdentifierObject);
  objc_msgSend_encodeObject_forKey_(v27, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_clockValue(self, v11, v12, v13);
  objc_super v15 = NSStringFromSelector(sel_clockValue);
  objc_msgSend_encodeInteger_forKey_(v27, v16, v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_siteIdentifierObject(self, v17, v18, v19);
  v24 = objc_msgSend_identifier(v20, v21, v22, v23);
  v25 = NSStringFromSelector(sel_siteIdentifier);
  objc_msgSend_encodeObject_forKey_(v27, v26, (uint64_t)v24, (uint64_t)v25);
}

- (int64_t)compareToTimestamp:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_siteIdentifierObject(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_siteIdentifierObject(v4, v9, v10, v11);
  int isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if (isEqual)
  {
    unint64_t v19 = objc_msgSend_clockValue(self, v16, v17, v18);
    if (v19 >= objc_msgSend_clockValue(v4, v20, v21, v22))
    {
      unint64_t v27 = objc_msgSend_clockValue(self, v23, v24, v25);
      int64_t v26 = v27 > objc_msgSend_clockValue(v4, v28, v29, v30);
    }
    else
    {
      int64_t v26 = -1;
    }
  }
  else
  {
    int64_t v26 = 3;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v19 = ((v4 != 0) & objc_opt_isKindOfClass()) != 0
     && (uint64_t v8 = objc_msgSend_hash(self, v5, v6, v7), v8 == objc_msgSend_hash(v4, v9, v10, v11))
     && (uint64_t v14 = objc_msgSend_compareToTimestamp_(self, v12, (uint64_t)v4, v13),
         v14 == objc_msgSend_compareToTimestamp_(v4, v15, (uint64_t)self, v16))
     && objc_msgSend_compareToTimestamp_(self, v17, (uint64_t)v4, v18) == 0;

  return v19;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  uint64_t v14 = objc_msgSend_clockValue(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
  unint64_t v21 = objc_msgSend_hash(v17, v18, v19, v20) ^ v9;

  return v21;
}

- (id)description
{
  v5 = objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_description(v5, v6, v7, v8);

  uint64_t v10 = NSString;
  uint64_t v17 = objc_msgSend_clockValue(self, v11, v12, v13);
  if (v17 == -1)
  {
    uint64_t v22 = @"_";
    objc_msgSend_stringWithFormat_(v10, v14, @"%@:%@", v16, v9, @"_");
  }
  else
  {
    uint64_t v18 = NSNumber;
    uint64_t v19 = objc_msgSend_clockValue(self, v14, v15, v16);
    objc_msgSend_numberWithUnsignedInteger_(v18, v20, v19, v21);
    uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v23, @"%@:%@", v24, v9, v22);
  uint64_t v25 = };
  if (v17 != -1) {

  }
  return v25;
}

- (id)descriptionWithStringSiteIdentifiers
{
  v5 = objc_msgSend_siteIdentifierObject(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_descriptionWithStringSiteIdentifiers(v5, v6, v7, v8);

  uint64_t v10 = NSString;
  uint64_t v17 = objc_msgSend_clockValue(self, v11, v12, v13);
  if (v17 == -1)
  {
    uint64_t v22 = @"_";
    objc_msgSend_stringWithFormat_(v10, v14, @"%@:%@", v16, v9, @"_");
  }
  else
  {
    uint64_t v18 = NSNumber;
    uint64_t v19 = objc_msgSend_clockValue(self, v14, v15, v16);
    objc_msgSend_numberWithUnsignedInteger_(v18, v20, v19, v21);
    uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v23, @"%@:%@", v24, v9, v22);
  uint64_t v25 = };
  if (v17 != -1) {

  }
  return v25;
}

- (CKDistributedSiteIdentifier)siteIdentifierObject
{
  return self->_siteIdentifierObject;
}

- (unint64_t)clockValue
{
  return self->_clockValue;
}

- (void).cxx_destruct
{
}

@end