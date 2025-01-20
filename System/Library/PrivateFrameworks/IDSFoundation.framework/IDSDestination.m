@interface IDSDestination
+ (BOOL)supportsSecureCoding;
+ (NSArray)classesForStrictUnarchiving;
+ (id)defaultPairedDeviceDestination;
+ (id)destinationWithAlias:(id)a3 pushToken:(id)a4;
+ (id)destinationWithDestinations:(id)a3;
+ (id)destinationWithDeviceURI:(id)a3;
+ (id)destinationWithGroup:(id)a3;
+ (id)destinationWithRapportPublicIdentifierURI:(id)a3;
+ (id)destinationWithString:(id)a3;
+ (id)destinationWithStringURI:(id)a3 isLightWeight:(BOOL)a4;
+ (id)destinationWithStrings:(id)a3;
+ (id)destinationWithURI:(id)a3;
+ (id)sentinelSelfAliasDestination;
- (BOOL)isDevice;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDestination:(id)a3;
- (BOOL)isGuest;
- (IDSDestination)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationURIs;
- (id)normalizedURIStrings;
- (id)normalizedURIs;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDestination

- (id)normalizedURIs
{
  v4 = objc_msgSend_destinationURIs(self, a2, v2, v3);
  v7 = objc_msgSend___imSetByApplyingBlock_(v4, v5, (uint64_t)&unk_1EEFCD438, v6);

  return v7;
}

- (id)normalizedURIStrings
{
  v4 = objc_msgSend_normalizedURIs(self, a2, v2, v3);
  v7 = objc_msgSend___imSetByApplyingBlock_(v4, v5, (uint64_t)&unk_1EEFCE158, v6);

  return v7;
}

+ (NSArray)classesForStrictUnarchiving
{
  v6[9] = *MEMORY[0x1E4F143B8];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v6, v3, 9);
  return (NSArray *)v4;
}

+ (id)destinationWithAlias:(id)a3 pushToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [IDSDestinationPushToken alloc];
  v10 = objc_msgSend_initWithAlias_pushToken_(v7, v8, (uint64_t)v6, v9, v5);

  return v10;
}

+ (id)destinationWithDestinations:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v41, v8, v45, 16);
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v42;
  unint64_t v12 = 0x1E596F000uLL;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v6);
      }
      v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_destinationWithString_(a1, v15, (uint64_t)v14, v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_destinationWithGroup_(a1, v20, (uint64_t)v14, v21);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v17 = v14;
LABEL_13:
        v22 = v17;
        if (!v17) {
          goto LABEL_15;
        }
LABEL_14:
        objc_msgSend_addObject_(v5, v18, (uint64_t)v22, v19);

        goto LABEL_15;
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_destinationURIs(v14, v18, v23, v19);
        v25 = unint64_t v24 = v12;
        v22 = objc_msgSend_destinationWithStrings_(a1, v26, (uint64_t)v25, v27);

        unint64_t v12 = v24;
        if (v22) {
          goto LABEL_14;
        }
      }
LABEL_15:
      ++v13;
    }
    while (v10 != v13);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v18, (uint64_t)&v41, v19, v45, 16);
    uint64_t v10 = v28;
  }
  while (v28);
LABEL_21:

  if (objc_msgSend_count(v5, v29, v30, v31) == 1)
  {
    uint64_t v35 = objc_msgSend_firstObject(v5, v32, v33, v34);
  }
  else
  {
    v36 = [IDSDestinationComposite alloc];
    uint64_t v35 = objc_msgSend_initWithDestinations_(v36, v37, (uint64_t)v5, v38);
  }
  v39 = (void *)v35;

  return v39;
}

+ (id)destinationWithString:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isDeviceURI_(IDSDestinationDevice, v5, (uint64_t)v4, v6))
  {
    uint64_t v9 = [IDSDestinationDevice alloc];
    uint64_t v12 = objc_msgSend_initWithDeviceURI_(v9, v10, (uint64_t)v4, v11);
  }
  else if (objc_msgSend_isEqualToString_(v4, v7, @"__IDS_DEFAULT_PAIRED_DEVICE__", v8))
  {
    uint64_t v12 = objc_msgSend_defaultPairedDeviceDestination(a1, v13, v14, v15);
  }
  else if (objc_msgSend_isEqualToString_(v4, v13, @"____--SENTINEL--SELF--ALIAS--V0--____", v15))
  {
    uint64_t v12 = objc_msgSend_sentinelSelfAliasDestination(a1, v16, v17, v18);
  }
  else
  {
    double v19 = [IDSDestinationURI alloc];
    uint64_t v12 = objc_msgSend_initWithURIString_(v19, v20, (uint64_t)v4, v21);
  }
  v22 = (void *)v12;

  return v22;
}

+ (id)destinationWithURI:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, @"guest-device:", v6))
  {
    uint64_t v9 = objc_msgSend_destinationWithRapportPublicIdentifierURI_(a1, v7, (uint64_t)v4, v8);
  }
  else
  {
    uint64_t v10 = [IDSDestinationURI alloc];
    uint64_t v9 = objc_msgSend_initWithURIString_(v10, v11, (uint64_t)v4, v12);
  }
  uint64_t v13 = (void *)v9;

  return v13;
}

+ (id)destinationWithStrings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = objc_msgSend_count(v4, v6, v7, v8);
  double v12 = objc_msgSend_initWithCapacity_(v5, v10, v9, v11);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v4;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v29, v15, v33, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v13);
        }
        v22 = objc_msgSend_destinationWithString_(a1, v17, *(void *)(*((void *)&v29 + 1) + 8 * i), v18, (void)v29);
        objc_msgSend_addObject_(v12, v23, (uint64_t)v22, v24);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v29, v18, v33, 16);
    }
    while (v19);
  }

  double v27 = objc_msgSend_destinationWithDestinations_(a1, v25, (uint64_t)v12, v26);

  return v27;
}

+ (id)destinationWithGroup:(id)a3
{
  id v3 = a3;
  id v4 = [IDSDestinationEngram alloc];
  uint64_t v7 = objc_msgSend_initWithENGroup_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)destinationWithStringURI:(id)a3 isLightWeight:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [IDSDestinationGroupSessionMember alloc];
  isLightWeight = objc_msgSend_initWithURI_isLightWeight_(v6, v7, (uint64_t)v5, v8, v4);

  return isLightWeight;
}

+ (id)defaultPairedDeviceDestination
{
  uint64_t v2 = objc_alloc_init(IDSDestinationDefaultPairedDevice);
  return v2;
}

+ (id)sentinelSelfAliasDestination
{
  uint64_t v2 = objc_alloc_init(IDSDestinationSentinelSelfAlias);
  return v2;
}

+ (id)destinationWithRapportPublicIdentifierURI:(id)a3
{
  id v3 = a3;
  BOOL v4 = [IDSDestinationDevice alloc];
  uint64_t v7 = objc_msgSend_initWithRapportPublicIdentifierURI_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)destinationWithDeviceURI:(id)a3
{
  id v3 = a3;
  BOOL v4 = [IDSDestinationDevice alloc];
  uint64_t v7 = objc_msgSend_initWithIDSDeviceURI_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (id)destinationURIs
{
  return (id)objc_msgSend_set(MEMORY[0x1E4F1CAD0], a2, v2, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, v8, self, @"IDSDestination.m", 125, @"Abstract Method");

  return 0;
}

- (BOOL)isGuest
{
  return 0;
}

- (BOOL)isDevice
{
  return 0;
}

- (BOOL)isEmpty
{
  BOOL v4 = objc_msgSend_destinationURIs(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_count(v4, v5, v6, v7) == 0;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (IDSDestination)initWithCoder:(id)a3
{
  uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, v8, self, @"IDSDestination.m", 148, @"Abstract method");

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v6, (uint64_t)a2, v7, self, @"IDSDestination.m", 153, @"Abstract method");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToDestination = objc_msgSend_isEqualToDestination_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToDestination = 0;
  }

  return isEqualToDestination;
}

- (BOOL)isEqualToDestination:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  id v8 = objc_msgSend_destinationURIs(self, v5, v6, v7);
  double v12 = objc_msgSend_destinationURIs(v4, v9, v10, v11);

  LOBYTE(v4) = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);
  return (char)v4;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_destinationURIs(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

@end