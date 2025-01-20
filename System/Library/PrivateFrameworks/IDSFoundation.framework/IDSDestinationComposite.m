@interface IDSDestinationComposite
+ (BOOL)supportsSecureCoding;
- (IDSDestinationComposite)initWithCoder:(id)a3;
- (IDSDestinationComposite)initWithDestinations:(id)a3;
- (NSArray)destinations;
- (id)description;
- (id)destinationLightweightStatus;
- (id)destinationURIs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDestinationComposite

- (IDSDestinationComposite)initWithDestinations:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSDestinationComposite;
  v7 = [(IDSDestinationComposite *)&v12 init];
  if (v7)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v8);
    destinations = v7->_destinations;
    v7->_destinations = (NSArray *)v9;
  }
  return v7;
}

- (IDSDestinationComposite)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend_setWithObject_(v4, v7, v6, v8);
  v13 = objc_msgSend_classesForStrictUnarchiving(IDSDestination, v10, v11, v12);
  objc_msgSend_addObjectsFromArray_(v9, v14, (uint64_t)v13, v15);

  v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v16, (uint64_t)v9, v17, @"kIDSCompositeDestinationDestinations");

  v21 = (IDSDestinationComposite *)objc_msgSend_initWithDestinations_(self, v19, (uint64_t)v18, v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_destinations(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, @"kIDSCompositeDestinationDestinations");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)destinationURIs
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = objc_msgSend_destinations(self, v4, v5, 0.0, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, v8, v30, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v6);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v17 = objc_msgSend_destinationURIs(v16, v10, v11, v12);
        uint64_t v21 = objc_msgSend_count(v17, v18, v19, v20);

        if (v21)
        {
          v22 = objc_msgSend_destinationURIs(v16, v10, v11, v12);
          objc_msgSend_unionSet_(v3, v23, (uint64_t)v22, v24);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v26, v12, v30, 16);
    }
    while (v13);
  }

  return v3;
}

- (id)destinationLightweightStatus
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = objc_msgSend_destinations(self, v4, v5, 0.0, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, v8, v26, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = objc_msgSend_destinationLightweightStatus(v14, v15, v16, v17);

          objc_msgSend_addEntriesFromDictionary_(v3, v19, v18, v20);
          uint64_t v11 = (void *)v18;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v22, v17, v26, 16);
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_destinations(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p destinations: %@>", v10, v4, self, v8);

  return v11;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void).cxx_destruct
{
}

@end