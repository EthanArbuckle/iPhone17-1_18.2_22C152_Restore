@interface DNDSContactRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSContactRecord)init;
- (NSSet)emailAddresses;
- (NSSet)phoneNumbers;
- (NSString)contactIdentifier;
- (NSString)description;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)nickName;
- (NSString)organizationName;
- (id)_initWithContactIdentifier:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 nickName:(id)a7 organizationName:(id)a8 phoneNumbers:(id)a9 emailAddresses:(id)a10;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSContactRecord

- (DNDSContactRecord)init
{
  return (DNDSContactRecord *)[(DNDSContactRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 contactIdentifier];
  v6 = [v4 firstName];
  v7 = [v4 middleName];
  v8 = [v4 lastName];
  v9 = [v4 nickName];
  v10 = [v4 organizationName];
  v11 = [v4 phoneNumbers];
  v12 = [v4 emailAddresses];

  id v13 = [(DNDSContactRecord *)self _initWithContactIdentifier:v5 firstName:v6 middleName:v7 lastName:v8 nickName:v9 organizationName:v10 phoneNumbers:v11 emailAddresses:v12];
  return v13;
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
  v42.super_class = (Class)DNDSContactRecord;
  v24 = [(DNDSContactRecord *)&v42 init];
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
  v3 = [(DNDSContactRecord *)self contactIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSContactRecord *)self firstName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSContactRecord *)self middleName];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSContactRecord *)self lastName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(DNDSContactRecord *)self nickName];
  uint64_t v12 = [v11 hash];
  id v13 = [(DNDSContactRecord *)self organizationName];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(DNDSContactRecord *)self phoneNumbers];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  id v17 = [(DNDSContactRecord *)self emailAddresses];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSContactRecord *)a3;
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
  uint64_t v6 = [(DNDSContactRecord *)self contactIdentifier];
  v7 = [(DNDSContactRecord *)v5 contactIdentifier];
  if (v6 != v7)
  {
    uint64_t v8 = [(DNDSContactRecord *)self contactIdentifier];
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
    uint64_t v10 = [(DNDSContactRecord *)v5 contactIdentifier];
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
    v11 = [(DNDSContactRecord *)self contactIdentifier];
    [(DNDSContactRecord *)v5 contactIdentifier];
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
  uint64_t v19 = [(DNDSContactRecord *)self firstName];
  uint64_t v20 = [(DNDSContactRecord *)v5 firstName];
  BOOL v21 = v19 != v20;
  HIDWORD(v124[4]) = v6 != v7;
  v120 = (void *)v20;
  v121 = (void *)v19;
  if (v19 != v20)
  {
    uint64_t v22 = [(DNDSContactRecord *)self firstName];
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
    uint64_t v23 = [(DNDSContactRecord *)v5 firstName];
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
    v24 = [(DNDSContactRecord *)self firstName];
    v108 = [(DNDSContactRecord *)v5 firstName];
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
  uint64_t v25 = [(DNDSContactRecord *)self middleName];
  uint64_t v26 = [(DNDSContactRecord *)v5 middleName];
  BOOL v27 = v25 != v26;
  LODWORD(v124[4]) = v21;
  v116 = (void *)v26;
  v117 = (void *)v25;
  if (v25 != v26)
  {
    uint64_t v28 = [(DNDSContactRecord *)self middleName];
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
    uint64_t v29 = [(DNDSContactRecord *)v5 middleName];
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
    v30 = [(DNDSContactRecord *)self middleName];
    v102 = [(DNDSContactRecord *)v5 middleName];
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
  uint64_t v31 = [(DNDSContactRecord *)self lastName];
  uint64_t v32 = [(DNDSContactRecord *)v5 lastName];
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
    uint64_t v36 = [(DNDSContactRecord *)self lastName];
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
    uint64_t v37 = [(DNDSContactRecord *)v5 lastName];
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
    v38 = [(DNDSContactRecord *)self lastName];
    v96 = [(DNDSContactRecord *)v5 lastName];
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
  uint64_t v41 = [(DNDSContactRecord *)self nickName];
  v104 = [(DNDSContactRecord *)v5 nickName];
  DWORD2(v125) = v41 != (void)v104;
  v105 = (void *)v41;
  if ((void *)v41 != v104)
  {
    uint64_t v42 = [(DNDSContactRecord *)self nickName];
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
    uint64_t v43 = [(DNDSContactRecord *)v5 nickName];
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
    v44 = [(DNDSContactRecord *)self nickName];
    v90 = [(DNDSContactRecord *)v5 nickName];
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
  uint64_t v47 = [(DNDSContactRecord *)self organizationName];
  uint64_t v48 = [(DNDSContactRecord *)v5 organizationName];
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
    uint64_t v51 = [(DNDSContactRecord *)self organizationName];
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
    uint64_t v52 = [(DNDSContactRecord *)v5 organizationName];
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
    v53 = [(DNDSContactRecord *)self organizationName];
    v85 = [(DNDSContactRecord *)v5 organizationName];
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
  uint64_t v56 = [(DNDSContactRecord *)self phoneNumbers];
  v92 = [(DNDSContactRecord *)v5 phoneNumbers];
  LODWORD(v125) = v56 != (void)v92;
  v93 = (void *)v56;
  if ((void *)v56 != v92)
  {
    uint64_t v57 = [(DNDSContactRecord *)self phoneNumbers];
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
    uint64_t v58 = [(DNDSContactRecord *)v5 phoneNumbers];
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
    v59 = [(DNDSContactRecord *)self phoneNumbers];
    v81 = [(DNDSContactRecord *)v5 phoneNumbers];
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
  uint64_t v62 = [(DNDSContactRecord *)self emailAddresses];
  uint64_t v63 = [(DNDSContactRecord *)v5 emailAddresses];
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
    uint64_t v64 = [(DNDSContactRecord *)self emailAddresses];
    if (v64)
    {
      v83 = (void *)v64;
      uint64_t v65 = [(DNDSContactRecord *)v5 emailAddresses];
      if (v65)
      {
        v80 = (void *)v65;
        v66 = [(DNDSContactRecord *)self emailAddresses];
        v78 = [(DNDSContactRecord *)v5 emailAddresses];
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

- (NSString)description
{
  int v14 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(DNDSContactRecord *)self contactIdentifier];
  v5 = [(DNDSContactRecord *)self firstName];
  uint64_t v6 = [(DNDSContactRecord *)self middleName];
  v7 = [(DNDSContactRecord *)self lastName];
  uint64_t v8 = [(DNDSContactRecord *)self nickName];
  uint64_t v9 = [(DNDSContactRecord *)self organizationName];
  uint64_t v10 = [(DNDSContactRecord *)self phoneNumbers];
  v11 = [(DNDSContactRecord *)self emailAddresses];
  objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; contactIdentifier: %@; firstName: '%@'; middleName: %@; lastName: %@; nickName: %@; organizationName: %@; phoneNumbers: %@; emailAddresses: %@>",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  int v12 = v11);

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableContactRecord alloc];
  return [(DNDSContactRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void *)[v7 mutableCopy];
  if (a4 <= 1 && a5 >= 2)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_msgSend(v7, "bs_safeArrayForKey:", @"phoneNumbers");
    v11 = [v9 setWithArray:v10];

    int v12 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          char v18 = objc_msgSend(MEMORY[0x1E4F5F5C0], "normalizePhoneNumber:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    uint64_t v19 = [v12 allObjects];
    objc_msgSend(v8, "bs_setSafeObject:forKey:", v19, @"phoneNumbers");
  }
  return v8;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v48 = a4;
  id v5 = a3;
  BOOL v50 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"contactIdentifier", objc_opt_class());
  v49 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"firstName", objc_opt_class());
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"middleName", objc_opt_class());
  uint64_t v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"lastName", objc_opt_class());
  uint64_t v47 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"nickName", objc_opt_class());
  uint64_t v46 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"organizationName", objc_opt_class());
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_msgSend(v5, "bs_safeArrayForKey:", @"phoneNumbers");
  uint64_t v10 = [v8 setWithArray:v9];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  int v12 = objc_msgSend(v5, "bs_safeArrayForKey:", @"emailAddresses");
  id v13 = [v11 setWithArray:v12];

  uint64_t v14 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"type", objc_opt_class());
  uint64_t v15 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"value", objc_opt_class());

  uint64_t v16 = v14;
  BOOL v45 = (void *)v15;
  if (!v14 || !v15)
  {
    uint64_t v20 = (void *)v46;
    uint64_t v19 = (void *)v47;
    goto LABEL_6;
  }
  if ([v14 unsignedIntegerValue] != 1)
  {
    uint64_t v22 = [v14 unsignedIntegerValue];
    uint64_t v20 = (void *)v46;
    uint64_t v19 = (void *)v47;
    if (v22 == 2)
    {
      uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
      char v18 = v10;
      uint64_t v10 = (void *)v23;
      goto LABEL_9;
    }
LABEL_6:
    long long v21 = (objc_class *)a1;
    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  char v18 = v13;
  id v13 = (void *)v17;
  uint64_t v20 = (void *)v46;
  uint64_t v19 = (void *)v47;
LABEL_9:
  long long v21 = (objc_class *)a1;

LABEL_10:
  if (v50)
  {
    long long v24 = (void *)[[v21 alloc] _initWithContactIdentifier:v50 firstName:v49 middleName:v6 lastName:v7 nickName:v19 organizationName:v20 phoneNumbers:v10 emailAddresses:v13];
  }
  else
  {
    BOOL v40 = v16;
    id v25 = objc_alloc_init(MEMORY[0x1E4F5F6F0]);
    [v25 setFirstName:v49];
    [v25 setLastName:v7];
    [v25 setMiddleName:v6];
    [v25 setNickName:v19];
    [v25 setOrganizationName:v20];
    [v25 setPhoneNumbers:v10];
    [v25 setEmailAddresses:v13];
    uint64_t v26 = [v48 contactProvider];
    [v26 contactForContact:v25];
    BOOL v27 = v41 = v10;

    id v38 = [v21 alloc];
    uint64_t v37 = [v27 contactIdentifier];
    uint64_t v36 = [v27 firstName];
    uint64_t v28 = [v27 middleName];
    uint64_t v29 = [v27 lastName];
    [v27 nickName];
    v30 = Class v44 = v6;
    [v27 organizationName];
    uint64_t v31 = v42 = v7;
    [v27 phoneNumbers];
    v32 = BOOL v39 = v13;
    uint64_t v33 = [v27 emailAddresses];
    BOOL v34 = (void *)v28;
    long long v24 = (void *)[v38 _initWithContactIdentifier:v37 firstName:v36 middleName:v28 lastName:v29 nickName:v30 organizationName:v31 phoneNumbers:v32 emailAddresses:v33];

    uint64_t v20 = (void *)v46;
    id v13 = v39;
    uint64_t v19 = (void *)v47;

    id v7 = v42;
    uint64_t v6 = v44;

    uint64_t v10 = v41;
    uint64_t v16 = v40;
  }

  return v24;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = objc_msgSend(v4, "arrayHealingSource", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v12 = (void *)[(id)objc_opt_class() newWithDictionaryRepresentation:v11 context:v4];
        if ([(DNDSContactRecord *)self isEqual:v12])
        {
          uint64_t v13 = [v11 mutableCopy];

          id v5 = (void *)v13;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v14 = [(DNDSContactRecord *)self firstName];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v14, @"firstName");

  uint64_t v15 = [(DNDSContactRecord *)self middleName];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v15, @"middleName");

  uint64_t v16 = [(DNDSContactRecord *)self lastName];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v16, @"lastName");

  uint64_t v17 = [(DNDSContactRecord *)self nickName];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v17, @"nickName");

  char v18 = [(DNDSContactRecord *)self organizationName];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v18, @"organizationName");

  uint64_t v19 = [(DNDSContactRecord *)self phoneNumbers];
  uint64_t v20 = [v19 allObjects];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v20, @"phoneNumbers");

  long long v21 = [(DNDSContactRecord *)self emailAddresses];
  uint64_t v22 = [v21 allObjects];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v22, @"emailAddresses");

  if ([v4 destination] == 1)
  {
    uint64_t v23 = [(DNDSContactRecord *)self contactIdentifier];
    objc_msgSend(v5, "bs_setSafeObject:forKey:", v23, @"contactIdentifier");
  }
  return v5;
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

@end