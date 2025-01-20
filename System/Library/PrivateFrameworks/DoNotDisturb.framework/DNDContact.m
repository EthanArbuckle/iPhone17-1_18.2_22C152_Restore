@interface DNDContact
+ (BOOL)supportsSecureCoding;
+ (id)normalizePhoneNumber:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesContact:(id)a3;
- (BOOL)matchesContactHandle:(id)a3;
- (DNDContact)initWithCoder:(id)a3;
- (DNDContact)initWithContactIdentifier:(id)a3;
- (NSSet)emailAddresses;
- (NSSet)phoneNumbers;
- (NSString)contactIdentifier;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)nickName;
- (NSString)organizationName;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)_initWithContactIdentifier:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 nickName:(id)a7 organizationName:(id)a8 phoneNumbers:(id)a9 emailAddresses:(id)a10;
- (id)_redactedDescriptionsForStrings:(id)a3;
- (id)description;
- (id)diffDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)normalizedPhoneNumbers;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDContact

+ (id)normalizePhoneNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543619;
    id v16 = a1;
    __int16 v17 = 2113;
    id v18 = v4;
    _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ normalizing phonenumber %{private}@", (uint8_t *)&v15, 0x16u);
  }
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = [v6 objectForKey:*MEMORY[0x1E4F1C400]];

  uint64_t v8 = CFPhoneNumberCreate();
  if (!v8
    || (v9 = (const void *)v8, String = (void *)CFPhoneNumberCreateString(), CFRelease(v9), (v11 = String) == 0))
  {
    v12 = DNDLogModeConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      +[DNDContact normalizePhoneNumber:v12];
    }
    v11 = 0;
    String = v4;
  }
  id v13 = String;

  return v13;
}

- (DNDContact)initWithContactIdentifier:(id)a3
{
  return (DNDContact *)[(DNDContact *)self _initWithContactIdentifier:a3 firstName:0 middleName:0 lastName:0 nickName:0 organizationName:0 phoneNumbers:0 emailAddresses:0];
}

- (id)_initWithContactIdentifier:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 nickName:(id)a7 organizationName:(id)a8 phoneNumbers:(id)a9 emailAddresses:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)DNDContact;
  v24 = [(DNDContact *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    contactIdentifier = v24->_contactIdentifier;
    v24->_contactIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    firstName = v24->_firstName;
    v24->_firstName = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    middleName = v24->_middleName;
    v24->_middleName = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    lastName = v24->_lastName;
    v24->_lastName = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    nickName = v24->_nickName;
    v24->_nickName = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    organizationName = v24->_organizationName;
    v24->_organizationName = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    phoneNumbers = v24->_phoneNumbers;
    v24->_phoneNumbers = (NSSet *)v37;

    uint64_t v39 = [v23 copy];
    emailAddresses = v24->_emailAddresses;
    v24->_emailAddresses = (NSSet *)v39;
  }
  return v24;
}

- (unint64_t)hash
{
  v3 = [(DNDContact *)self contactIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDContact *)self firstName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDContact *)self middleName];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDContact *)self lastName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(DNDContact *)self nickName];
  uint64_t v12 = [v11 hash];
  id v13 = [(DNDContact *)self organizationName];
  uint64_t v14 = v12 ^ [v13 hash];
  int v15 = [(DNDContact *)self phoneNumbers];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  id v17 = [(DNDContact *)self emailAddresses];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDContact *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_124;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = 0;
    goto LABEL_124;
  }
  v5 = v4;
  uint64_t v6 = [(DNDContact *)self contactIdentifier];
  v7 = [(DNDContact *)v5 contactIdentifier];
  if (v6 != v7)
  {
    uint64_t v8 = [(DNDContact *)self contactIdentifier];
    if (!v8)
    {
      v122 = 0;
      long long v125 = 0uLL;
      int v12 = 0;
      int v13 = 0;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, sizeof(v124));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      goto LABEL_64;
    }
    v122 = (void *)v8;
    uint64_t v10 = [(DNDContact *)v5 contactIdentifier];
    if (!v10)
    {
      v119 = 0;
      int v12 = 0;
      int v13 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 36);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[4]) = 1;
      goto LABEL_64;
    }
    v119 = (void *)v10;
    v11 = [(DNDContact *)self contactIdentifier];
    [(DNDContact *)v5 contactIdentifier];
    v114 = v115 = v11;
    if (!objc_msgSend(v11, "isEqual:"))
    {
      v124[3] = 0;
      int v12 = 0;
      int v13 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      v124[4] = 0x100000000;
      HIDWORD(v124[2]) = 1;
      goto LABEL_64;
    }
  }
  uint64_t v19 = [(DNDContact *)self firstName];
  uint64_t v20 = [(DNDContact *)v5 firstName];
  BOOL v21 = v19 != v20;
  HIDWORD(v124[4]) = v6 != v7;
  v120 = (void *)v20;
  v121 = (void *)v19;
  if (v19 != v20)
  {
    uint64_t v22 = [(DNDContact *)self firstName];
    if (!v22)
    {
      v118 = 0;
      int v12 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      LODWORD(v124[3]) = 1;
      *(void *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      int v13 = 0;
      goto LABEL_64;
    }
    v118 = (void *)v22;
    uint64_t v23 = [(DNDContact *)v5 firstName];
    if (!v23)
    {
      v113 = 0;
      v124[0] = 0;
      v124[1] = 0;
      int v12 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      LODWORD(v124[3]) = 1;
      *(void *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      int v13 = 0;
      LODWORD(v124[2]) = 1;
      goto LABEL_64;
    }
    v113 = (void *)v23;
    v24 = [(DNDContact *)self firstName];
    v108 = [(DNDContact *)v5 firstName];
    v109 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      int v12 = 0;
      v124[0] = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      LODWORD(v124[3]) = 1;
      *(void *)((char *)&v124[3] + 4) = 0x100000000;
      LODWORD(v124[2]) = 1;
      HIDWORD(v124[2]) = v6 != v7;
      int v13 = 0;
      v124[1] = 1;
      goto LABEL_64;
    }
  }
  uint64_t v25 = [(DNDContact *)self middleName];
  uint64_t v26 = [(DNDContact *)v5 middleName];
  BOOL v27 = v25 != v26;
  LODWORD(v124[4]) = v21;
  v116 = (void *)v26;
  v117 = (void *)v25;
  if (v25 != v26)
  {
    uint64_t v28 = [(DNDContact *)self middleName];
    if (!v28)
    {
      v112 = 0;
      uint64_t v9 = 0;
      v124[0] = 0;
      long long v125 = 0uLL;
      BOOL v40 = v21;
      int v12 = 0;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      int v13 = 0;
      LODWORD(v124[2]) = v40;
      v124[1] = v40 | 0x100000000;
      goto LABEL_64;
    }
    v112 = (void *)v28;
    uint64_t v29 = [(DNDContact *)v5 middleName];
    if (!v29)
    {
      v107 = 0;
      uint64_t v9 = 0;
      v124[0] = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      int v13 = 0;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = 1;
      goto LABEL_64;
    }
    v107 = (void *)v29;
    v30 = [(DNDContact *)self middleName];
    v102 = [(DNDContact *)v5 middleName];
    v103 = v30;
    if (!objc_msgSend(v30, "isEqual:"))
    {
      v124[0] = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = 1;
      int v13 = 1;
      goto LABEL_64;
    }
  }
  uint64_t v31 = [(DNDContact *)self lastName];
  uint64_t v32 = [(DNDContact *)v5 lastName];
  uint64_t v33 = (void *)v31;
  v110 = (void *)v32;
  BOOL v34 = v31 == v32;
  BOOL v35 = v31 != v32;
  HIDWORD(v124[3]) = v27;
  v111 = v33;
  if (v34)
  {
    HIDWORD(v125) = v35;
  }
  else
  {
    uint64_t v36 = [(DNDContact *)self lastName];
    if (!v36)
    {
      v106 = 0;
      *(void *)((char *)&v125 + 4) = 0;
      BOOL v46 = v27;
      memset(v123, 0, sizeof(v123));
      LODWORD(v125) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v46;
      int v13 = v46;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      goto LABEL_64;
    }
    v106 = (void *)v36;
    uint64_t v37 = [(DNDContact *)v5 lastName];
    if (!v37)
    {
      v101 = 0;
      *(void *)((char *)&v125 + 4) = 0;
      BOOL v54 = v27;
      memset(v123, 0, 28);
      LODWORD(v125) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v54;
      int v13 = v54;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_OWORD *)&v123[28] = 1uLL;
      goto LABEL_64;
    }
    HIDWORD(v125) = v35;
    v101 = (void *)v37;
    v38 = [(DNDContact *)self lastName];
    v96 = [(DNDContact *)v5 lastName];
    v97 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(void *)&v123[36] = 0;
      *(void *)((char *)&v125 + 4) = 0;
      BOOL v39 = v27;
      memset(v123, 0, 24);
      LODWORD(v125) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v39;
      int v13 = v39;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 0;
      *(void *)&v123[24] = 0x100000001;
      goto LABEL_64;
    }
  }
  uint64_t v41 = [(DNDContact *)self nickName];
  v104 = [(DNDContact *)v5 nickName];
  DWORD2(v125) = v41 != (void)v104;
  v105 = (void *)v41;
  if ((void *)v41 != v104)
  {
    uint64_t v42 = [(DNDContact *)self nickName];
    if (!v42)
    {
      v100 = 0;
      *(void *)&long long v125 = 0;
      BOOL v55 = v27;
      memset(v123, 0, 24);
      *(void *)&v123[32] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v55;
      int v13 = v55;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      goto LABEL_64;
    }
    v100 = (void *)v42;
    uint64_t v43 = [(DNDContact *)v5 nickName];
    if (!v43)
    {
      v95 = 0;
      *(void *)&v123[12] = 0;
      *(_DWORD *)&v123[20] = 0;
      *(void *)&long long v125 = 0;
      BOOL v60 = v27;
      *(void *)v123 = 0;
      *(void *)&v123[32] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v60;
      int v13 = v60;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_DWORD *)&v123[8] = 1;
      goto LABEL_64;
    }
    v95 = (void *)v43;
    v44 = [(DNDContact *)self nickName];
    v90 = [(DNDContact *)v5 nickName];
    v91 = v44;
    if (!objc_msgSend(v44, "isEqual:"))
    {
      *(void *)&long long v125 = 0;
      BOOL v45 = v27;
      *(void *)v123 = 0;
      *(void *)&v123[32] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v45;
      int v13 = v45;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_OWORD *)&v123[8] = 0x100000001uLL;
      goto LABEL_64;
    }
  }
  uint64_t v47 = [(DNDContact *)self organizationName];
  uint64_t v48 = [(DNDContact *)v5 organizationName];
  v49 = (void *)v47;
  BOOL v34 = v47 == v48;
  BOOL v50 = v47 != v48;
  v98 = (void *)v48;
  v99 = v49;
  if (v34)
  {
    DWORD1(v125) = v50;
  }
  else
  {
    uint64_t v51 = [(DNDContact *)self organizationName];
    if (!v51)
    {
      v94 = 0;
      BOOL v61 = v27;
      *(void *)v123 = 0;
      *(void *)&v123[16] = 0x100000000;
      *(void *)&v123[32] = 0;
      *(void *)&long long v125 = 0x100000000;
      uint64_t v9 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v61;
      int v13 = v61;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[8] = DWORD2(v125);
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      goto LABEL_64;
    }
    v94 = (void *)v51;
    uint64_t v52 = [(DNDContact *)v5 organizationName];
    if (!v52)
    {
      v89 = 0;
      *(void *)&v123[16] = 0x100000000;
      *(void *)&v123[32] = 0;
      *(void *)&long long v125 = 0x100000000;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(void *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
    DWORD1(v125) = v50;
    v89 = (void *)v52;
    v53 = [(DNDContact *)self organizationName];
    v85 = [(DNDContact *)v5 organizationName];
    v86 = v53;
    if (!objc_msgSend(v53, "isEqual:"))
    {
      *(void *)&v123[32] = 0;
      *(void *)&long long v125 = 0x100000000;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(void *)&v123[12] = DWORD2(v125) | 0x100000000;
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
  }
  uint64_t v56 = [(DNDContact *)self phoneNumbers];
  v92 = [(DNDContact *)v5 phoneNumbers];
  LODWORD(v125) = v56 != (void)v92;
  v93 = (void *)v56;
  if ((void *)v56 != v92)
  {
    uint64_t v57 = [(DNDContact *)self phoneNumbers];
    if (!v57)
    {
      v88 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[32] = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      goto LABEL_64;
    }
    v88 = (void *)v57;
    uint64_t v58 = [(DNDContact *)v5 phoneNumbers];
    if (!v58)
    {
      v84 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 1;
      goto LABEL_64;
    }
    v84 = (void *)v58;
    v59 = [(DNDContact *)self phoneNumbers];
    v81 = [(DNDContact *)v5 phoneNumbers];
    v82 = v59;
    if (!objc_msgSend(v59, "isEqual:"))
    {
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[32] = 1;
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      v124[0] = 0x100000001;
      goto LABEL_64;
    }
  }
  uint64_t v62 = [(DNDContact *)self emailAddresses];
  uint64_t v63 = [(DNDContact *)v5 emailAddresses];
  uint64_t v9 = v62;
  if (v62 == v63)
  {
    int v16 = 0;
    int v17 = 0;
    HIDWORD(v124[2]) = v6 != v7;
    LODWORD(v124[3]) = 1;
    LODWORD(v124[2]) = v21;
    v124[1] = v21 | 0x100000000;
    int v12 = v27;
    int v13 = v27;
    int v15 = 0;
    *(_DWORD *)&v123[24] = HIDWORD(v125);
    *(_DWORD *)&v123[28] = HIDWORD(v125);
    *(_DWORD *)&v123[40] = 1;
    *(_DWORD *)&v123[12] = DWORD2(v125);
    *(_DWORD *)&v123[20] = 1;
    *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
    *(_DWORD *)&v123[16] = DWORD1(v125);
    *(_DWORD *)&v123[36] = 1;
    *(_DWORD *)&v123[32] = v125;
    v124[0] = v125 | 0x100000000;
    v87 = (void *)v62;
    int v14 = 1;
    v123[0] = 1;
  }
  else
  {
    v87 = (void *)v63;
    uint64_t v64 = [(DNDContact *)self emailAddresses];
    if (v64)
    {
      v83 = (void *)v64;
      uint64_t v65 = [(DNDContact *)v5 emailAddresses];
      if (v65)
      {
        v80 = (void *)v65;
        v66 = [(DNDContact *)self emailAddresses];
        v78 = [(DNDContact *)v5 emailAddresses];
        v79 = v66;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        int v12 = v27;
        int v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[36] = 1;
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        v123[0] = objc_msgSend(v66, "isEqual:");
        *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
        *(_DWORD *)&v123[32] = v125;
        v124[0] = v125 | 0x100000000;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
        int v17 = 1;
      }
      else
      {
        v80 = 0;
        int v17 = 0;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        int v12 = v27;
        int v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        v123[0] = 0;
        *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[32] = v125;
        *(_DWORD *)&v123[36] = 1;
        v124[0] = v125 | 0x100000000;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
      }
    }
    else
    {
      v83 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v123[0] = 0;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[32] = v125;
      *(_DWORD *)&v123[36] = 1;
      v124[0] = v125 | 0x100000000;
      int v14 = 1;
      int v15 = 1;
    }
    uint64_t v9 = v62;
  }
LABEL_64:
  uint64_t v67 = v9;
  if (v17)
  {
    v68 = v5;
    int v69 = v13;
    v70 = v7;
    v71 = v6;
    int v72 = v14;
    int v73 = v12;
    int v74 = v15;
    int v75 = v16;

    uint64_t v9 = v67;
    int v16 = v75;
    int v15 = v74;
    int v12 = v73;
    int v14 = v72;
    uint64_t v6 = v71;
    v7 = v70;
    int v13 = v69;
    v5 = v68;
  }
  if (v16)
  {

    uint64_t v9 = v67;
  }
  if (v15)
  {

    uint64_t v9 = v67;
  }
  if (v14)
  {
    v76 = (void *)v9;
  }
  if (LODWORD(v124[0]))
  {
  }
  if (*(_DWORD *)&v123[32]) {

  }
  if (v125) {
  if (*(_DWORD *)&v123[36])
  }
  {
  }
  if (*(_DWORD *)&v123[16])
  {
  }
  if (*(_DWORD *)&v123[4]) {

  }
  if (DWORD1(v125)) {
  if (*(_DWORD *)&v123[20])
  }
  {
  }
  if (*(_DWORD *)&v123[12])
  {
  }
  if (*(_DWORD *)&v123[8]) {

  }
  if (DWORD2(v125)) {
  if (*(_DWORD *)&v123[40])
  }
  {
  }
  if (*(_DWORD *)&v123[24])
  {
  }
  if (*(_DWORD *)&v123[28]) {

  }
  if (HIDWORD(v125)) {
  if (HIDWORD(v124[0]))
  }
  {

    if (!v13)
    {
LABEL_104:
      if (!v12) {
        goto LABEL_105;
      }
LABEL_127:

      if (!HIDWORD(v124[3])) {
        goto LABEL_107;
      }
      goto LABEL_106;
    }
  }
  else if (!v13)
  {
    goto LABEL_104;
  }

  if (v12) {
    goto LABEL_127;
  }
LABEL_105:
  if (HIDWORD(v124[3])) {
LABEL_106:
  }

LABEL_107:
  if (HIDWORD(v124[1]))
  {
  }
  if (LODWORD(v124[1]))
  {
  }
  if (LODWORD(v124[2])) {

  }
  if (LODWORD(v124[4])) {
  if (LODWORD(v124[3]))
  }
  {
  }
  if (HIDWORD(v124[2]))
  {
  }
  if (HIDWORD(v124[4])) {

  }
  if (v6 != v7) {
  char v18 = v123[0];
  }
LABEL_124:

  return v18;
}

- (id)normalizedPhoneNumbers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_phoneNumbers;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[DNDContact normalizePhoneNumber:](DNDContact, "normalizePhoneNumber:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)matchesContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DNDContact *)self contactIdentifier];
  if (v5)
  {
    uint64_t v6 = [(DNDContact *)self contactIdentifier];
    uint64_t v7 = [v4 contactIdentifier];
    if (v6 == v7)
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v8 = [(DNDContact *)self contactIdentifier];
      if (v8)
      {
        uint64_t v9 = [v4 contactIdentifier];
        if (v9)
        {
          uint64_t v10 = [(DNDContact *)self contactIdentifier];
          long long v11 = [v4 contactIdentifier];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  long long v13 = [(DNDContact *)self firstName];
  long long v14 = [v4 firstName];
  if (v13 != v14)
  {
    uint64_t v15 = [(DNDContact *)self firstName];
    if (!v15)
    {
      char v28 = 0;
      goto LABEL_99;
    }
    uint64_t v16 = (void *)v15;
    int v17 = [v4 firstName];
    if (!v17)
    {
      char v28 = 0;
LABEL_98:

      goto LABEL_99;
    }
    char v18 = [(DNDContact *)self firstName];
    uint64_t v19 = [v4 firstName];
    if (![v18 isEqual:v19])
    {
      char v28 = 0;
LABEL_97:

      goto LABEL_98;
    }
    v95 = v16;
    v96 = v19;
    v97 = v18;
    v98 = v17;
  }
  uint64_t v20 = [(DNDContact *)self middleName];
  BOOL v21 = [v4 middleName];
  if (v20 == v21)
  {
    char v94 = v12;
    goto LABEL_25;
  }
  uint64_t v22 = [(DNDContact *)self middleName];
  if (!v22)
  {
LABEL_38:

    char v28 = 0;
    char v18 = v97;
    int v17 = v98;
    uint64_t v16 = v95;
    uint64_t v19 = v96;
    if (v13 == v14) {
      goto LABEL_99;
    }
    goto LABEL_97;
  }
  uint64_t v23 = (void *)v22;
  uint64_t v24 = [v4 middleName];
  if (!v24)
  {

    goto LABEL_38;
  }
  uint64_t v25 = (void *)v24;
  char v94 = v12;
  uint64_t v26 = [(DNDContact *)self middleName];
  BOOL v27 = [v4 middleName];
  if (([v26 isEqual:v27] & 1) == 0)
  {

    goto LABEL_94;
  }
  v90 = v27;
  v91 = v26;
  v88 = v25;
  v89 = v23;
LABEL_25:
  uint64_t v29 = [(DNDContact *)self lastName];
  v30 = [v4 lastName];
  if (v29 == v30) {
    goto LABEL_32;
  }
  uint64_t v31 = [(DNDContact *)self lastName];
  if (!v31)
  {
LABEL_48:

    if (v20 == v21)
    {

LABEL_95:
      char v28 = 0;
      goto LABEL_96;
    }
    goto LABEL_93;
  }
  v92 = (void *)v31;
  uint64_t v32 = [v4 lastName];
  if (!v32)
  {
LABEL_47:

    goto LABEL_48;
  }
  v87 = (void *)v32;
  uint64_t v33 = [(DNDContact *)self lastName];
  BOOL v34 = [v4 lastName];
  if (([v33 isEqual:v34] & 1) == 0)
  {

    goto LABEL_47;
  }
  v81 = v34;
  v83 = v33;
LABEL_32:
  BOOL v35 = [(DNDContact *)self nickName];
  v93 = [v4 nickName];
  if (v35 != v93)
  {
    uint64_t v36 = [(DNDContact *)self nickName];
    if (!v36)
    {

      if (v29 == v30)
      {
      }
      else
      {
      }
      if (v20 == v21) {
        goto LABEL_94;
      }
      goto LABEL_93;
    }
    v82 = (void *)v36;
    uint64_t v37 = [v4 nickName];
    if (!v37)
    {

      if (v29 == v30)
      {

LABEL_91:
        goto LABEL_92;
      }
LABEL_89:

LABEL_90:
      goto LABEL_91;
    }
    v85 = v30;
    v38 = v29;
    BOOL v39 = v35;
    v79 = (void *)v37;
    BOOL v40 = [(DNDContact *)self nickName];
    uint64_t v41 = [v4 nickName];
    if (([v40 isEqual:v41] & 1) == 0)
    {

      if (v38 == v85)
      {
      }
      else
      {
      }
LABEL_92:
      if (v20 != v21)
      {
LABEL_93:
      }
LABEL_94:

      goto LABEL_95;
    }
    int v73 = v40;
    v80 = v41;
    BOOL v35 = v39;
    uint64_t v29 = v38;
    v30 = v85;
  }
  uint64_t v42 = [(DNDContact *)self organizationName];
  v84 = [v4 organizationName];
  v86 = (void *)v42;
  if ((void *)v42 != v84)
  {
    uint64_t v43 = [(DNDContact *)self organizationName];
    if (v43)
    {
      int v74 = (void *)v43;
      uint64_t v44 = [v4 organizationName];
      if (v44)
      {
        int v75 = v35;
        int v72 = (void *)v44;
        BOOL v45 = [(DNDContact *)self organizationName];
        BOOL v46 = [v4 organizationName];
        if ([v45 isEqual:v46])
        {
          v71 = v45;
          v68 = v46;
          BOOL v35 = v75;
          goto LABEL_52;
        }

        if (v75 == v93)
        {
        }
        else
        {
        }
        BOOL v57 = v29 == v30;
LABEL_103:
        if (!v57)
        {
        }
        if (v20 == v21) {
          goto LABEL_94;
        }
        goto LABEL_93;
      }
      BOOL v50 = v29;
      uint64_t v51 = v80;
    }
    else
    {
      BOOL v50 = v29;
      uint64_t v51 = v80;
    }

    if (v35 == v93)
    {
    }
    else
    {
    }
    uint64_t v29 = v50;
    BOOL v57 = v50 == v30;
    goto LABEL_103;
  }
LABEL_52:
  uint64_t v47 = [(DNDContact *)self normalizedPhoneNumbers];
  v78 = [v4 normalizedPhoneNumbers];
  if (v47 == v78)
  {
    v76 = v47;
    goto LABEL_63;
  }
  uint64_t v48 = [(DNDContact *)self normalizedPhoneNumbers];
  if (!v48)
  {
    uint64_t v58 = v71;
    v77 = v35;
    goto LABEL_84;
  }
  v70 = (void *)v48;
  v49 = [v4 normalizedPhoneNumbers];
  if (!v49)
  {
LABEL_83:
    uint64_t v58 = v71;
    v77 = v35;

LABEL_84:
    if (v86 != v84)
    {
    }
    if (v77 != v93)
    {
    }
    if (v29 == v30) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  id v67 = v49;
  int v69 = [(DNDContact *)self normalizedPhoneNumbers];
  v66 = [v4 normalizedPhoneNumbers];
  if ((objc_msgSend(v69, "isEqual:") & 1) == 0)
  {

    v49 = v67;
    goto LABEL_83;
  }
  v76 = v47;
LABEL_63:
  uint64_t v52 = [(DNDContact *)self emailAddresses];
  uint64_t v53 = [v4 emailAddresses];
  if (v52 == (void *)v53)
  {

    char v28 = 1;
  }
  else
  {
    uint64_t v64 = v52;
    uint64_t v65 = (void *)v53;
    uint64_t v54 = [(DNDContact *)self emailAddresses];
    if (v54)
    {
      uint64_t v63 = (void *)v54;
      BOOL v55 = [v4 emailAddresses];
      if (v55)
      {
        uint64_t v62 = v55;
        BOOL v61 = [(DNDContact *)self emailAddresses];
        uint64_t v56 = [v4 emailAddresses];
        char v28 = objc_msgSend(v61, "isEqual:");

        BOOL v55 = v62;
      }
      else
      {
        char v28 = 0;
      }
    }
    else
    {

      char v28 = 0;
    }
  }
  BOOL v60 = v78;
  if (v76 != v78)
  {

    BOOL v60 = v78;
  }

  if (v86 != v84)
  {
  }
  if (v35 != v93)
  {
  }
  if (v29 != v30)
  {
  }
  if (v20 != v21)
  {
  }
LABEL_96:
  char v18 = v97;
  int v17 = v98;
  uint64_t v16 = v95;
  uint64_t v19 = v96;
  char v12 = v94;
  if (v13 != v14) {
    goto LABEL_97;
  }
LABEL_99:

  return v12 | v28;
}

- (BOOL)matchesContactHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DNDContact *)self contactIdentifier];
  if (v5)
  {
    uint64_t v6 = [(DNDContact *)self contactIdentifier];
    uint64_t v7 = [v4 contactIdentifier];
    if (v6 == v7)
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v8 = [(DNDContact *)self contactIdentifier];
      if (v8)
      {
        uint64_t v9 = [v4 contactIdentifier];
        if (v9)
        {
          uint64_t v10 = [(DNDContact *)self contactIdentifier];
          long long v11 = [v4 contactIdentifier];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  uint64_t v13 = [v4 normalizedValue];
  long long v14 = (void *)v13;
  if (v13) {
    LOBYTE(v13) = [(NSSet *)self->_phoneNumbers containsObject:v13]
  }
               || [(NSSet *)self->_emailAddresses containsObject:v14];
  char v15 = v12 | v13;

  return v15;
}

- (id)description
{
  return [(DNDContact *)self _descriptionForRedacted:0];
}

- (id)redactedDescription
{
  return [(DNDContact *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  contactIdentifier = self->_contactIdentifier;
  firstName = self->_firstName;
  if (a3)
  {
    uint64_t v9 = [(NSString *)firstName dnd_privacyObfuscatedString];
    uint64_t v10 = [(NSString *)self->_middleName dnd_privacyObfuscatedString];
    [(NSString *)self->_lastName dnd_privacyObfuscatedString];
    v11 = char v18 = v5;
    char v12 = [(NSString *)self->_nickName dnd_privacyObfuscatedString];
    uint64_t v13 = [(NSString *)self->_nickName dnd_privacyObfuscatedString];
    long long v14 = [(DNDContact *)self _redactedDescriptionsForStrings:self->_phoneNumbers];
    char v15 = [(DNDContact *)self _redactedDescriptionsForStrings:self->_emailAddresses];
    objc_msgSend(v18, "stringWithFormat:", @"<%@: %p; contactIdentifier: %@; firstName: %@; middleName: %@; lastName: %@; nickName: %@; organizationName: %@; phoneNumbers: %@; emailAddresses: %@;>",
      v6,
      self,
      contactIdentifier,
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
    uint64_t v16 = v15);
  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; contactIdentifier: %@; firstName: %@; middleName: %@; lastName: %@; nickName: %@; organizationName: %@; phoneNumbers: %@; emailAddresses: %@;>",
      v6,
      self,
      contactIdentifier,
      firstName,
      self->_middleName,
      self->_lastName,
      self->_nickName,
      self->_organizationName,
      self->_phoneNumbers,
    uint64_t v16 = self->_emailAddresses);
  }
  return v16;
}

- (id)_redactedDescriptionsForStrings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dnd_privacyObfuscatedString", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)diffDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  if ([(NSString *)self->_contactIdentifier length]) {
    [v3 appendFormat:@"contactIdentifier:%@;", self->_contactIdentifier];
  }
  if ([(NSString *)self->_firstName length]) {
    [v3 appendFormat:@"firstName:%@;", self->_firstName];
  }
  if ([(NSString *)self->_middleName length]) {
    [v3 appendFormat:@"middleName:%@;", self->_middleName];
  }
  if ([(NSString *)self->_lastName length]) {
    [v3 appendFormat:@"lastName:%@;", self->_lastName];
  }
  if ([(NSString *)self->_nickName length]) {
    [v3 appendFormat:@"nickName:%@;", self->_nickName];
  }
  if ([(NSString *)self->_organizationName length]) {
    [v3 appendFormat:@"organizationName:%@;", self->_organizationName];
  }
  if ([(NSSet *)self->_phoneNumbers count]) {
    [v3 appendFormat:@"phoneNumbers:%@;", self->_phoneNumbers];
  }
  if ([(NSSet *)self->_emailAddresses count]) {
    [v3 appendFormat:@"emailAddresses:%@;", self->_emailAddresses];
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(DNDContact *)[DNDMutableContact alloc] _initWithContactIdentifier:self->_contactIdentifier firstName:self->_firstName middleName:self->_middleName lastName:self->_lastName nickName:self->_nickName organizationName:self->_organizationName phoneNumbers:self->_phoneNumbers emailAddresses:self->_emailAddresses];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDContact)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"middleName"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nickName"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  long long v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  long long v12 = [v3 decodeObjectOfClasses:v11 forKey:@"phoneNumbers"];

  long long v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  long long v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  uint64_t v16 = [v3 decodeObjectOfClasses:v15 forKey:@"emailAddresses"];

  uint64_t v17 = [(DNDContact *)self _initWithContactIdentifier:v19 firstName:v4 middleName:v5 lastName:v6 nickName:v7 organizationName:v8 phoneNumbers:v12 emailAddresses:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_middleName forKey:@"middleName"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeObject:self->_nickName forKey:@"nickName"];
  [v5 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

+ (void)normalizePhoneNumber:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543619;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "%{public}@ couldnt normalize phonenumber %{private}@", (uint8_t *)&v3, 0x16u);
}

@end