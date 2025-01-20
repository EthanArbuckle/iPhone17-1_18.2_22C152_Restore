@interface IDSOpportunisticOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)destinationsMustBeInContacts;
- (IDSOpportunisticOptions)init;
- (IDSOpportunisticOptions)initWithBlocklistedDestinations:(id)a3 expiryDate:(id)a4 destinationsMustBeInContacts:(BOOL)a5;
- (IDSOpportunisticOptions)initWithCoder:(id)a3;
- (IDSOpportunisticOptions)initWithDictionary:(id)a3;
- (NSArray)blocklistedDestinations;
- (NSDate)expiryDate;
- (NSDictionary)dictionaryRepresentation;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBlocklistedDestinations:(id)a3;
- (void)setDestinationsMustBeInContacts:(BOOL)a3;
- (void)setExpiryDate:(id)a3;
@end

@implementation IDSOpportunisticOptions

- (IDSOpportunisticOptions)init
{
  return (IDSOpportunisticOptions *)objc_msgSend_initWithBlocklistedDestinations_expiryDate_destinationsMustBeInContacts_(self, a2, 0, v2, 0, 0);
}

- (IDSOpportunisticOptions)initWithBlocklistedDestinations:(id)a3 expiryDate:(id)a4 destinationsMustBeInContacts:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSOpportunisticOptions;
  v11 = [(IDSOpportunisticOptions *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_blocklistedDestinations, a3);
    objc_storeStrong((id *)&v12->_expiryDate, a4);
    v12->_destinationsMustBeInContacts = a5;
  }

  return v12;
}

- (IDSOpportunisticOptions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"IDSOpportunisticOptionsBlocklistedDestinationsKey", v6);
  id v10 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"IDSOpportunisticOptionsExpiryDateKey", v9);
  v13 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"IDSOpportunisticOptionsDestinationsMustBeInContactsKey", v12);

  uint64_t v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);
  MustBeInContacts = (IDSOpportunisticOptions *)objc_msgSend_initWithBlocklistedDestinations_expiryDate_destinationsMustBeInContacts_(self, v18, (uint64_t)v7, v19, v10, v17);

  return MustBeInContacts;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_blocklistedDestinations(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, v9, @"IDSOpportunisticOptionsBlocklistedDestinationsKey");

  v13 = objc_msgSend_expiryDate(self, v10, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, v15, @"IDSOpportunisticOptionsExpiryDateKey");

  double v16 = NSNumber;
  uint64_t MustBeInContacts = objc_msgSend_destinationsMustBeInContacts(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithBool_(v16, v21, MustBeInContacts, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, v25, @"IDSOpportunisticOptionsDestinationsMustBeInContactsKey");

  return (NSDictionary *)v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_blocklistedDestinations(self, v5, v6, v7);
  double v12 = objc_msgSend_expiryDate(self, v9, v10, v11);
  if (objc_msgSend_destinationsMustBeInContacts(self, v13, v14, v15)) {
    objc_msgSend_stringWithFormat_(v3, v16, @"<%@:%p blocklist: %@, expiry: %@, mustBeContact: %@>", v17, v4, self, v8, v12, @"YES");
  }
  else {
  uint64_t v18 = objc_msgSend_stringWithFormat_(v3, v16, @"<%@:%p blocklist: %@, expiry: %@, mustBeContact: %@>", v17, v4, self, v8, v12, @"NO");
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOpportunisticOptions)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v11, (uint64_t)v10, v12, @"IDSOpportunisticOptionsBlocklistedDestinationsKey");

  uint64_t v14 = objc_opt_class();
  double v17 = objc_msgSend_decodeObjectOfClass_forKey_(v5, v15, v14, v16, @"IDSOpportunisticOptionsExpiryDateKey");
  uint64_t v20 = objc_msgSend_decodeBoolForKey_(v5, v18, @"IDSOpportunisticOptionsDestinationsMustBeInContactsKey", v19);

  uint64_t MustBeInContacts = (IDSOpportunisticOptions *)objc_msgSend_initWithBlocklistedDestinations_expiryDate_destinationsMustBeInContacts_(self, v21, (uint64_t)v13, v22, v17, v20);
  return MustBeInContacts;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  uint64_t v7 = objc_msgSend_blocklistedDestinations(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v22, v8, (uint64_t)v7, v9, @"IDSOpportunisticOptionsBlocklistedDestinationsKey");

  v13 = objc_msgSend_expiryDate(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v22, v14, (uint64_t)v13, v15, @"IDSOpportunisticOptionsExpiryDateKey");

  uint64_t MustBeInContacts = objc_msgSend_destinationsMustBeInContacts(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v22, v20, MustBeInContacts, v21, @"IDSOpportunisticOptionsDestinationsMustBeInContactsKey");
}

- (NSArray)blocklistedDestinations
{
  return self->_blocklistedDestinations;
}

- (void)setBlocklistedDestinations:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (BOOL)destinationsMustBeInContacts
{
  return self->_destinationsMustBeInContacts;
}

- (void)setDestinationsMustBeInContacts:(BOOL)a3
{
  self->_destinationsuint64_t MustBeInContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_blocklistedDestinations, 0);
}

@end