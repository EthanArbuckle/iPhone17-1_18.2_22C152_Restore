@interface DNDSModeRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSModeRecord)init;
- (NSArray)placeholderExcludedPlatforms;
- (NSArray)symbolDescriptorTintColorNames;
- (NSString)description;
- (NSString)modeIdentifier;
- (NSString)name;
- (NSString)symbolDescriptorImageName;
- (NSString)symbolImageName;
- (NSString)tintColorName;
- (NSUUID)identifier;
- (id)_initWithRecord:(id)a3;
- (id)_initWithSymbolImageName:(id)a3 tintColorName:(id)a4 symbolDescriptorTintStyle:(unint64_t)a5 symbolDescriptorTintColorNames:(id)a6 symbolDescriptorImageName:(id)a7 name:(id)a8 modeIdentifier:(id)a9 semanticType:(int64_t)a10 visibility:(unint64_t)a11 identifier:(id)a12 placeholderExcludedPlatforms:(id)a13;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)semanticType;
- (unint64_t)hash;
- (unint64_t)symbolDescriptorTintStyle;
- (unint64_t)visibility;
@end

@implementation DNDSModeRecord

- (DNDSModeRecord)init
{
  return (DNDSModeRecord *)[(DNDSModeRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v3 = a3;
  v16 = [v3 symbolImageName];
  v4 = [v3 tintColorName];
  uint64_t v15 = [v3 symbolDescriptorTintStyle];
  v5 = [v3 symbolDescriptorTintColorNames];
  v6 = [v3 symbolDescriptorImageName];
  v7 = [v3 name];
  v8 = [v3 modeIdentifier];
  uint64_t v9 = [v3 semanticType];
  uint64_t v10 = [v3 visibility];
  v11 = [v3 identifier];
  v12 = [v3 placeholderExcludedPlatforms];

  id v13 = [(DNDSModeRecord *)self _initWithSymbolImageName:v16 tintColorName:v4 symbolDescriptorTintStyle:v15 symbolDescriptorTintColorNames:v5 symbolDescriptorImageName:v6 name:v7 modeIdentifier:v8 semanticType:v9 visibility:v10 identifier:v11 placeholderExcludedPlatforms:v12];
  return v13;
}

- (id)_initWithSymbolImageName:(id)a3 tintColorName:(id)a4 symbolDescriptorTintStyle:(unint64_t)a5 symbolDescriptorTintColorNames:(id)a6 symbolDescriptorImageName:(id)a7 name:(id)a8 modeIdentifier:(id)a9 semanticType:(int64_t)a10 visibility:(unint64_t)a11 identifier:(id)a12 placeholderExcludedPlatforms:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a12;
  id v25 = a13;
  v45.receiver = self;
  v45.super_class = (Class)DNDSModeRecord;
  v26 = [(DNDSModeRecord *)&v45 init];
  if (v26)
  {
    uint64_t v27 = [v18 copy];
    symbolImageName = v26->_symbolImageName;
    v26->_symbolImageName = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    tintColorName = v26->_tintColorName;
    v26->_tintColorName = (NSString *)v29;

    v26->_symbolDescriptorTintStyle = a5;
    uint64_t v31 = [v20 copy];
    symbolDescriptorTintColorNames = v26->_symbolDescriptorTintColorNames;
    v26->_symbolDescriptorTintColorNames = (NSArray *)v31;

    uint64_t v33 = [v21 copy];
    symbolDescriptorImageName = v26->_symbolDescriptorImageName;
    v26->_symbolDescriptorImageName = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    name = v26->_name;
    v26->_name = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    modeIdentifier = v26->_modeIdentifier;
    v26->_modeIdentifier = (NSString *)v37;

    v26->_semanticType = a10;
    v26->_visibility = a11;
    if (v24) {
      v39 = (NSUUID *)v24;
    }
    else {
      v39 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    identifier = v26->_identifier;
    v26->_identifier = v39;

    uint64_t v41 = [v25 copy];
    placeholderExcludedPlatforms = v26->_placeholderExcludedPlatforms;
    v26->_placeholderExcludedPlatforms = (NSArray *)v41;
  }
  return v26;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_symbolImageName hash];
  NSUInteger v4 = [(NSString *)self->_tintColorName hash] ^ v3;
  unint64_t symbolDescriptorTintStyle = self->_symbolDescriptorTintStyle;
  uint64_t v6 = v4 ^ symbolDescriptorTintStyle ^ [(NSArray *)self->_symbolDescriptorTintColorNames hash];
  NSUInteger v7 = [(NSString *)self->_symbolDescriptorImageName hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_name hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_modeIdentifier hash];
  unint64_t v10 = self->_semanticType ^ self->_visibility;
  uint64_t v11 = v10 ^ [(NSUUID *)self->_identifier hash];
  return v9 ^ v11 ^ [(NSArray *)self->_placeholderExcludedPlatforms hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (DNDSModeRecord *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = 0;
    goto LABEL_119;
  }
  v5 = v4;
  uint64_t v6 = [(DNDSModeRecord *)self symbolImageName];
  NSUInteger v7 = [(DNDSModeRecord *)v5 symbolImageName];
  if (v6 != v7)
  {
    uint64_t v8 = [(DNDSModeRecord *)self symbolImageName];
    if (!v8)
    {
      v120 = 0;
      long long v121 = 0uLL;
      memset(v125, 0, 20);
      long long v124 = 0uLL;
      int v12 = 0;
      long long v122 = 0uLL;
      memset(v123, 0, sizeof(v123));
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      goto LABEL_58;
    }
    v120 = (void *)v8;
    uint64_t v10 = [(DNDSModeRecord *)v5 symbolImageName];
    if (!v10)
    {
      v117 = 0;
      long long v124 = 0uLL;
      *(void *)((char *)v125 + 4) = 0;
      *(void *)((char *)&v125[1] + 4) = 0;
      int v12 = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      memset(v123, 0, sizeof(v123));
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v125[0]) = 1;
      goto LABEL_58;
    }
    v117 = (void *)v10;
    uint64_t v11 = [(DNDSModeRecord *)self symbolImageName];
    v114 = [(DNDSModeRecord *)v5 symbolImageName];
    v115 = v11;
    if (!objc_msgSend(v11, "isEqual:"))
    {
      long long v124 = 1uLL;
      *(_OWORD *)((char *)v125 + 4) = 0uLL;
      int v12 = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      memset(v123, 0, sizeof(v123));
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v125[0]) = 1;
      goto LABEL_58;
    }
  }
  uint64_t v19 = [(DNDSModeRecord *)self tintColorName];
  v118 = [(DNDSModeRecord *)v5 tintColorName];
  v119 = (void *)v19;
  BOOL v20 = v19 != (void)v118;
  LODWORD(v125[0]) = v6 != v7;
  if ((void *)v19 != v118)
  {
    uint64_t v21 = [(DNDSModeRecord *)self tintColorName];
    if (!v21)
    {
      v116 = 0;
      *(void *)((char *)v125 + 4) = 0;
      *(void *)((char *)&v125[1] + 4) = 0;
      uint64_t v9 = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      memset(v123, 0, sizeof(v123));
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      int v12 = 0;
      *((void *)&v124 + 1) = 1;
      goto LABEL_58;
    }
    id v22 = (void *)v21;
    uint64_t v23 = [(DNDSModeRecord *)v5 tintColorName];
    v116 = v22;
    if (!v23)
    {
      v113 = 0;
      *(void *)((char *)v125 + 4) = 0;
      *(void *)((char *)&v125[1] + 4) = 0;
      uint64_t v9 = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      memset(v123, 0, 24);
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      int v12 = 0;
      *((void *)&v124 + 1) = 1;
      *(_DWORD *)&v123[24] = 1;
      goto LABEL_58;
    }
    v113 = (void *)v23;
    id v24 = [(DNDSModeRecord *)self tintColorName];
    v109 = [(DNDSModeRecord *)v5 tintColorName];
    v110 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      *(_DWORD *)&v123[20] = 0;
      *(void *)((char *)v125 + 4) = 0;
      *(void *)((char *)&v125[1] + 4) = 0;
      *(void *)v123 = 0;
      *(void *)&v123[8] = 0;
      uint64_t v9 = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      int v12 = 0;
      *((void *)&v124 + 1) = 1;
      *(_DWORD *)&v123[24] = 1;
      int v25 = 1;
LABEL_24:
      *(_DWORD *)&v123[16] = v25;
      goto LABEL_58;
    }
  }
  unint64_t v26 = [(DNDSModeRecord *)self symbolDescriptorTintStyle];
  DWORD2(v124) = v20;
  if (v26 != [(DNDSModeRecord *)v5 symbolDescriptorTintStyle])
  {
    *(_DWORD *)&v123[20] = 0;
    *(void *)((char *)v125 + 4) = 0;
    *(void *)((char *)&v125[1] + 4) = 0;
    *(void *)v123 = 0;
    *(void *)&v123[8] = 0;
    long long v122 = 0uLL;
    long long v121 = 0uLL;
    int v25 = v20;
    HIDWORD(v124) = 0;
    BOOL v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    uint64_t v9 = 1;
    LODWORD(v124) = v6 != v7;
    DWORD1(v124) = 1;
    int v12 = 0;
    *(_DWORD *)&v123[24] = v25;
    goto LABEL_24;
  }
  uint64_t v27 = [(DNDSModeRecord *)self symbolDescriptorTintColorNames];
  uint64_t v28 = [(DNDSModeRecord *)v5 symbolDescriptorTintColorNames];
  BOOL v29 = v27 != v28;
  v112 = (void *)v27;
  v111 = (void *)v28;
  if (v27 != v28)
  {
    uint64_t v30 = [(DNDSModeRecord *)self symbolDescriptorTintColorNames];
    if (!v30)
    {
      v108 = 0;
      *(void *)v123 = 0;
      *(void *)&v123[8] = 0;
      *(void *)((char *)v125 + 4) = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      BOOL v43 = v20;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      uint64_t v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      int v12 = 0;
      *(_DWORD *)&v123[24] = v43;
      *(_DWORD *)&v123[16] = v43;
      *(_DWORD *)&v123[20] = 1;
      HIDWORD(v125[1]) = 0;
      LODWORD(v125[2]) = 1;
      goto LABEL_58;
    }
    v108 = (void *)v30;
    uint64_t v31 = [(DNDSModeRecord *)v5 symbolDescriptorTintColorNames];
    if (!v31)
    {
      v105 = 0;
      *(void *)&v123[4] = 0;
      *(void *)((char *)v125 + 4) = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      BOOL v48 = v20;
      HIDWORD(v124) = 0;
      *(_DWORD *)v123 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      uint64_t v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      int v12 = 0;
      *(_DWORD *)&v123[24] = v48;
      *(_DWORD *)&v123[16] = v48;
      *(_DWORD *)&v123[20] = 1;
      HIDWORD(v125[1]) = 0;
      LODWORD(v125[2]) = 1;
      *(_DWORD *)&v123[12] = 1;
      goto LABEL_58;
    }
    v105 = (void *)v31;
    v32 = [(DNDSModeRecord *)self symbolDescriptorTintColorNames];
    v100 = [(DNDSModeRecord *)v5 symbolDescriptorTintColorNames];
    v101 = v32;
    if (!objc_msgSend(v32, "isEqual:"))
    {
      *(void *)((char *)v125 + 4) = 0;
      long long v122 = 0uLL;
      long long v121 = 0uLL;
      BOOL v33 = v20;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      uint64_t v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      int v12 = 0;
      *(_DWORD *)&v123[24] = v33;
      *(_DWORD *)&v123[16] = v33;
      *(_DWORD *)&v123[20] = 1;
      HIDWORD(v125[1]) = 0;
      LODWORD(v125[2]) = 1;
      *(void *)&v123[8] = 0x100000001;
      goto LABEL_58;
    }
  }
  uint64_t v34 = [(DNDSModeRecord *)self symbolDescriptorImageName];
  uint64_t v35 = [(DNDSModeRecord *)v5 symbolDescriptorImageName];
  v36 = (void *)v34;
  v106 = (void *)v35;
  BOOL v37 = v34 == v35;
  BOOL v38 = v34 != v35;
  LODWORD(v125[2]) = v29;
  v107 = v36;
  if (!v37)
  {
    uint64_t v39 = [(DNDSModeRecord *)self symbolDescriptorImageName];
    if (!v39)
    {
      v104 = 0;
      long long v122 = 0uLL;
      v125[1] = 0;
      long long v121 = 0uLL;
      BOOL v49 = v20;
      uint64_t v9 = v29;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v49;
      *(_DWORD *)&v123[12] = v9;
      *(_DWORD *)&v123[16] = v49;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v9;
      int v12 = 1;
      HIDWORD(v125[0]) = 1;
      goto LABEL_58;
    }
    v104 = (void *)v39;
    uint64_t v40 = [(DNDSModeRecord *)v5 symbolDescriptorImageName];
    if (!v40)
    {
      v99 = 0;
      *(void *)((char *)&v122 + 4) = 0;
      v125[1] = 0;
      long long v121 = 0uLL;
      BOOL v55 = v20;
      LODWORD(v122) = 0;
      uint64_t v9 = v29;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v55;
      *(_DWORD *)&v123[12] = v9;
      *(_DWORD *)&v123[16] = v55;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v9;
      int v12 = 1;
      HIDWORD(v125[0]) = 1;
      HIDWORD(v122) = 1;
      goto LABEL_58;
    }
    v99 = (void *)v40;
    uint64_t v41 = [(DNDSModeRecord *)self symbolDescriptorImageName];
    v94 = [(DNDSModeRecord *)v5 symbolDescriptorImageName];
    v95 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      *((void *)&v122 + 1) = 0x100000000;
      v125[1] = 0;
      long long v121 = 0uLL;
      BOOL v42 = v20;
      *(void *)&long long v122 = 0x100000000;
      uint64_t v9 = LODWORD(v125[2]);
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v42;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v42;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v125[0]) = 1;
      goto LABEL_58;
    }
  }
  uint64_t v44 = [(DNDSModeRecord *)self name];
  v102 = [(DNDSModeRecord *)v5 name];
  HIDWORD(v125[1]) = v44 != (void)v102;
  HIDWORD(v125[0]) = v38;
  v103 = (void *)v44;
  if ((void *)v44 != v102)
  {
    uint64_t v45 = [(DNDSModeRecord *)self name];
    if (!v45)
    {
      v98 = 0;
      long long v121 = 0uLL;
      BOOL v56 = v20;
      LODWORD(v122) = 0;
      v125[1] = 0x100000000;
      uint64_t v9 = LODWORD(v125[2]);
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v56;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v56;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v122) = v38;
      *(void *)((char *)&v122 + 4) = v38 | 0x100000000;
      goto LABEL_58;
    }
    v98 = (void *)v45;
    uint64_t v46 = [(DNDSModeRecord *)v5 name];
    if (!v46)
    {
      v93 = 0;
      BOOL v62 = v20;
      *(void *)((char *)&v121 + 4) = 0;
      LODWORD(v122) = 0;
      v125[1] = 0x100000000;
      uint64_t v9 = LODWORD(v125[2]);
      LODWORD(v121) = 0;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v62;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v62;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v122) = v38;
      *(void *)((char *)&v122 + 4) = v38 | 0x100000000;
      HIDWORD(v121) = 1;
      goto LABEL_58;
    }
    v93 = (void *)v46;
    v47 = [(DNDSModeRecord *)self name];
    v90 = [(DNDSModeRecord *)v5 name];
    v91 = v47;
    if (!objc_msgSend(v47, "isEqual:"))
    {
      LODWORD(v122) = 0;
      v125[1] = 0x100000000;
      *(void *)&long long v121 = 0;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      uint64_t v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      int v15 = 0;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      *(void *)((char *)&v122 + 4) = v38 | 0x100000000;
      HIDWORD(v122) = v38;
      *((void *)&v121 + 1) = 0x100000001;
      goto LABEL_58;
    }
  }
  uint64_t v50 = [(DNDSModeRecord *)self modeIdentifier];
  uint64_t v51 = [(DNDSModeRecord *)v5 modeIdentifier];
  LODWORD(v125[1]) = v50 != v51;
  v96 = (void *)v51;
  v97 = (void *)v50;
  if (v50 != v51)
  {
    uint64_t v52 = [(DNDSModeRecord *)self modeIdentifier];
    if (!v52)
    {
      v92 = 0;
      *(void *)&long long v121 = 0;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      uint64_t v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v122) = v38;
      DWORD2(v121) = HIDWORD(v125[1]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      int v15 = 0;
      LODWORD(v122) = 1;
      *(void *)((char *)&v122 + 4) = v38 | 0x100000000;
      LODWORD(v125[1]) = 1;
      goto LABEL_58;
    }
    v92 = (void *)v52;
    uint64_t v53 = [(DNDSModeRecord *)v5 modeIdentifier];
    if (!v53)
    {
      v89 = 0;
      *(void *)&long long v121 = 0x100000000;
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      uint64_t v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v122) = v38;
      DWORD2(v121) = HIDWORD(v125[1]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      int v15 = 0;
      LODWORD(v122) = 1;
      *(void *)((char *)&v122 + 4) = v38 | 0x100000000;
      LODWORD(v125[1]) = 1;
      goto LABEL_58;
    }
    v89 = (void *)v53;
    v54 = [(DNDSModeRecord *)self modeIdentifier];
    v87 = [(DNDSModeRecord *)v5 modeIdentifier];
    v88 = v54;
    if (!objc_msgSend(v54, "isEqual:"))
    {
      *(void *)v123 = 0;
      HIDWORD(v124) = 0;
      BOOL v13 = 0;
      int v14 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v122) = v38;
      DWORD2(v121) = HIDWORD(v125[1]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      int v15 = 0;
      LODWORD(v122) = 1;
      *(void *)((char *)&v122 + 4) = v38 | 0x100000000;
      LODWORD(v125[1]) = 1;
      *(void *)&long long v121 = 0x100000001;
      goto LABEL_58;
    }
  }
  int64_t v57 = [(DNDSModeRecord *)self semanticType];
  if (v57 != [(DNDSModeRecord *)v5 semanticType]
    || (unint64_t v58 = [(DNDSModeRecord *)self visibility], v58 != [(DNDSModeRecord *)v5 visibility]))
  {
    *(void *)v123 = 0;
    HIDWORD(v124) = 0;
    int v14 = 0;
    uint64_t v9 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v124) = v6 != v7;
    DWORD1(v124) = 1;
    *(_DWORD *)&v123[20] = 1;
    *(_DWORD *)&v123[24] = v20;
    *(_DWORD *)&v123[12] = v125[2];
    *(_DWORD *)&v123[16] = v20;
    *(_DWORD *)&v123[8] = v125[2];
    int v12 = 1;
    HIDWORD(v122) = HIDWORD(v125[0]);
    *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
    HIDWORD(v121) = HIDWORD(v125[1]);
    int v15 = 0;
    LODWORD(v122) = 1;
    LODWORD(v121) = v125[1];
    *(void *)((char *)&v121 + 4) = v125[1];
    BOOL v13 = 0;
    goto LABEL_58;
  }
  uint64_t v59 = [(DNDSModeRecord *)self identifier];
  v85 = [(DNDSModeRecord *)v5 identifier];
  BOOL v13 = v59 != (void)v85;
  v86 = (void *)v59;
  if ((void *)v59 != v85)
  {
    uint64_t v60 = [(DNDSModeRecord *)self identifier];
    if (!v60)
    {
      v83 = 0;
      HIDWORD(v122) = HIDWORD(v125[0]);
      *(void *)v123 = 0x100000000;
      int v14 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      HIDWORD(v121) = HIDWORD(v125[1]);
      int v15 = 0;
      LODWORD(v122) = 1;
      LODWORD(v121) = v125[1];
      *(void *)((char *)&v121 + 4) = v125[1];
      BOOL v13 = 0;
      HIDWORD(v124) = 1;
      goto LABEL_58;
    }
    v83 = (void *)v60;
    v82 = [(DNDSModeRecord *)v5 identifier];
    if (!v82)
    {
      v82 = 0;
      int v14 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      int v12 = 1;
      HIDWORD(v122) = HIDWORD(v125[0]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      int v15 = 0;
      LODWORD(v122) = 1;
      *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      LODWORD(v121) = v125[1];
      *(void *)((char *)&v121 + 4) = v125[1];
      BOOL v13 = 0;
      HIDWORD(v124) = 1;
      *(void *)v123 = 0x100000001;
      goto LABEL_58;
    }
    v61 = [(DNDSModeRecord *)self identifier];
    [(DNDSModeRecord *)v5 identifier];
    v77 = v78 = v61;
    if (![v61 isEqual:v77])
    {
      int v14 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      int v12 = 1;
      HIDWORD(v122) = HIDWORD(v125[0]);
      *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      HIDWORD(v121) = HIDWORD(v125[1]);
      int v15 = 0;
      LODWORD(v122) = 1;
      LODWORD(v121) = v125[1];
      *(void *)((char *)&v121 + 4) = v125[1];
      *(_DWORD *)&v123[8] = v125[2];
      HIDWORD(v124) = 1;
      *(void *)v123 = 0x100000001;
      BOOL v13 = 1;
      goto LABEL_58;
    }
  }
  uint64_t v72 = [(DNDSModeRecord *)self placeholderExcludedPlatforms];
  v84 = [(DNDSModeRecord *)v5 placeholderExcludedPlatforms];
  HIDWORD(v124) = v13;
  v81 = (void *)v72;
  if ((void *)v72 == v84)
  {
    int v16 = 0;
    int v17 = 0;
    LODWORD(v124) = v6 != v7;
    DWORD1(v124) = 1;
    *(_DWORD *)&v123[20] = 1;
    *(_DWORD *)&v123[24] = v20;
    *(_DWORD *)&v123[12] = v125[2];
    *(_DWORD *)&v123[16] = v20;
    int v12 = 1;
    HIDWORD(v122) = HIDWORD(v125[0]);
    *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
    HIDWORD(v121) = HIDWORD(v125[1]);
    int v15 = 0;
    LODWORD(v122) = 1;
    LODWORD(v121) = v125[1];
    *(void *)((char *)&v121 + 4) = v125[1];
    uint64_t v9 = 1;
    *(_DWORD *)&v123[4] = 1;
    *(_DWORD *)&v123[8] = v125[2];
    *(_DWORD *)v123 = v13;
    v84 = (void *)v72;
    int v14 = 1;
    char v18 = 1;
  }
  else
  {
    uint64_t v73 = [(DNDSModeRecord *)self placeholderExcludedPlatforms];
    if (v73)
    {
      v80 = (void *)v73;
      v79 = [(DNDSModeRecord *)v5 placeholderExcludedPlatforms];
      if (v79)
      {
        v74 = [(DNDSModeRecord *)self placeholderExcludedPlatforms];
        uint64_t v75 = [(DNDSModeRecord *)v5 placeholderExcludedPlatforms];
        v76 = v74;
        char v18 = [v74 isEqual:v75];
        uint64_t v9 = v75;
        LODWORD(v124) = v6 != v7;
        DWORD1(v124) = 1;
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[24] = v20;
        *(_DWORD *)&v123[12] = v125[2];
        *(_DWORD *)&v123[16] = v20;
        int v12 = 1;
        HIDWORD(v122) = HIDWORD(v125[0]);
        *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
        HIDWORD(v121) = HIDWORD(v125[1]);
        LODWORD(v122) = 1;
        LODWORD(v121) = v125[1];
        *(void *)((char *)&v121 + 4) = v125[1];
        *(_DWORD *)&v123[4] = 1;
        *(_DWORD *)&v123[8] = v125[2];
        *(_DWORD *)v123 = v13;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
        int v17 = 1;
      }
      else
      {
        v79 = 0;
        int v17 = 0;
        char v18 = 0;
        LODWORD(v124) = v6 != v7;
        DWORD1(v124) = 1;
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[24] = v20;
        uint64_t v9 = LODWORD(v125[2]);
        *(_DWORD *)&v123[12] = v125[2];
        *(_DWORD *)&v123[16] = v20;
        int v12 = 1;
        HIDWORD(v122) = HIDWORD(v125[0]);
        *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
        HIDWORD(v121) = HIDWORD(v125[1]);
        LODWORD(v122) = 1;
        LODWORD(v121) = v125[1];
        *(void *)((char *)&v121 + 4) = v125[1];
        *(_DWORD *)&v123[4] = 1;
        *(_DWORD *)&v123[8] = v125[2];
        *(_DWORD *)v123 = v13;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
      }
    }
    else
    {
      v80 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      uint64_t v9 = LODWORD(v125[2]);
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      int v12 = 1;
      HIDWORD(v122) = HIDWORD(v125[0]);
      *(void *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      HIDWORD(v121) = HIDWORD(v125[1]);
      LODWORD(v122) = 1;
      LODWORD(v121) = v125[1];
      *(void *)((char *)&v121 + 4) = v125[1];
      *(_DWORD *)&v123[4] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      *(_DWORD *)v123 = v13;
      int v14 = 1;
      int v15 = 1;
    }
  }
LABEL_58:
  if (v17)
  {
    v63 = v5;
    int v64 = v12;
    v65 = v7;
    v66 = v6;
    BOOL v67 = v13;
    int v68 = v14;
    int v69 = v15;
    int v70 = v16;

    int v16 = v70;
    int v15 = v69;
    int v14 = v68;
    BOOL v13 = v67;
    uint64_t v6 = v66;
    NSUInteger v7 = v65;
    int v12 = v64;
    v5 = v63;
  }
  if (v16) {

  }
  if (v15)
  {

    if (!v14) {
      goto LABEL_64;
    }
LABEL_121:

    if (!v13) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  if (v14) {
    goto LABEL_121;
  }
LABEL_64:
  if (v13)
  {
LABEL_65:
  }
LABEL_66:
  if (*(_DWORD *)v123) {

  }
  if (HIDWORD(v124)) {
  if (*(_DWORD *)&v123[4])
  }
  {
  }
  if (v121)
  {
  }
  if (DWORD1(v121)) {

  }
  if (LODWORD(v125[1])) {
  if (v122)
  }
  {
  }
  if (DWORD2(v121))
  {
  }
  if (HIDWORD(v121)) {

  }
  if (HIDWORD(v125[1])) {
  if (DWORD2(v122))
  }
  {
  }
  if (DWORD1(v122))
  {
  }
  if (HIDWORD(v122)) {

  }
  if (HIDWORD(v125[0])) {
  if (v12)
  }
  {
  }
  if (*(_DWORD *)&v123[8])
  {
  }
  if (*(_DWORD *)&v123[12]) {

  }
  if (LODWORD(v125[2])) {
  if (*(_DWORD *)&v123[20])
  }
  {
  }
  if (*(_DWORD *)&v123[16])
  {
  }
  if (*(_DWORD *)&v123[24]) {

  }
  if (DWORD2(v124)) {
  if (DWORD1(v124))
  }
  {
  }
  if (v124)
  {
  }
  if (LODWORD(v125[0])) {

  }
  if (v6 != v7) {
LABEL_119:
  }

  return v18;
}

- (NSString)description
{
  char v18 = NSString;
  uint64_t v17 = objc_opt_class();
  int v16 = [(DNDSModeRecord *)self symbolImageName];
  int v15 = [(DNDSModeRecord *)self tintColorName];
  unint64_t v14 = [(DNDSModeRecord *)self symbolDescriptorTintStyle];
  NSUInteger v3 = [(DNDSModeRecord *)self symbolDescriptorTintColorNames];
  NSUInteger v4 = [(DNDSModeRecord *)self symbolDescriptorImageName];
  v5 = [(DNDSModeRecord *)self name];
  uint64_t v6 = [(DNDSModeRecord *)self modeIdentifier];
  int64_t v7 = [(DNDSModeRecord *)self semanticType];
  unint64_t v8 = [(DNDSModeRecord *)self visibility];
  uint64_t v9 = [(DNDSModeRecord *)self identifier];
  uint64_t v10 = [v9 UUIDString];
  uint64_t v11 = [(DNDSModeRecord *)self placeholderExcludedPlatforms];
  objc_msgSend(v18, "stringWithFormat:", @"<%@: %p; symbolImageName: %@; tintColorName: %@; symbolDescriptorTintStyle: %lu; symbolDescriptorTintColorNames: %@; symbolDescriptorImageName: %@; name: %@; modeIdentifier: %@; semanticType: %zd; visibility: %lu; identifier: %@; placeholderExcludedPlatforms; %@>",
    v17,
    self,
    v16,
    v15,
    v14,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
  int v12 = v11);

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [DNDSMutableModeRecord alloc];
  return [(DNDSModeRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v22 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"symbolImageName", objc_opt_class());
  uint64_t v21 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"tintColorName", objc_opt_class());
  BOOL v20 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"symbolDescriptorTintStyle", objc_opt_class());
  uint64_t v6 = [v20 integerValue];
  uint64_t v19 = objc_msgSend(v5, "bs_safeArrayForKey:", @"symbolDescriptorTintColorNames");
  char v18 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"symbolDescriptorImageName", objc_opt_class());
  uint64_t v17 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"name", objc_opt_class());
  int64_t v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"modeIdentifier", objc_opt_class());
  int v16 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"semanticType", objc_opt_class());
  uint64_t v8 = [v16 integerValue];
  int v15 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"visibility", objc_opt_class());
  uint64_t v9 = [v15 integerValue];
  uint64_t v10 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"identifier", objc_opt_class());
  if (v10) {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = objc_msgSend(v5, "bs_safeArrayForKey:", @"excludedPlatforms");
  unint64_t v14 = (void *)[objc_alloc((Class)a1) _initWithSymbolImageName:v22 tintColorName:v21 symbolDescriptorTintStyle:v6 symbolDescriptorTintColorNames:v19 symbolDescriptorImageName:v18 name:v17 modeIdentifier:v7 semanticType:v8 visibility:v9 identifier:v11 placeholderExcludedPlatforms:v12];

  return v14;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  NSUInteger v4 = [a3 healingSource];
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v8 = v7;

  [v8 setObject:self->_name forKeyedSubscript:@"name"];
  [v8 setObject:self->_modeIdentifier forKeyedSubscript:@"modeIdentifier"];
  uint64_t v9 = [NSNumber numberWithInteger:self->_semanticType];
  [v8 setObject:v9 forKeyedSubscript:@"semanticType"];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_visibility];
  [v8 setObject:v10 forKeyedSubscript:@"visibility"];

  uint64_t v11 = [(NSUUID *)self->_identifier UUIDString];
  [v8 setObject:v11 forKeyedSubscript:@"identifier"];

  [v8 setObject:self->_tintColorName forKeyedSubscript:@"tintColorName"];
  [v8 setObject:self->_symbolImageName forKeyedSubscript:@"symbolImageName"];
  int v12 = [NSNumber numberWithUnsignedInteger:self->_symbolDescriptorTintStyle];
  [v8 setObject:v12 forKeyedSubscript:@"symbolDescriptorTintStyle"];

  BOOL v13 = [(DNDSModeRecord *)self symbolDescriptorTintColorNames];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v13, @"symbolDescriptorTintColorNames");

  [v8 setObject:self->_symbolDescriptorImageName forKeyedSubscript:@"symbolDescriptorImageName"];
  return v8;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (unint64_t)symbolDescriptorTintStyle
{
  return self->_symbolDescriptorTintStyle;
}

- (NSArray)symbolDescriptorTintColorNames
{
  return self->_symbolDescriptorTintColorNames;
}

- (NSString)symbolDescriptorImageName
{
  return self->_symbolDescriptorImageName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (int64_t)semanticType
{
  return self->_semanticType;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)placeholderExcludedPlatforms
{
  return self->_placeholderExcludedPlatforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderExcludedPlatforms, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_symbolDescriptorImageName, 0);
  objc_storeStrong((id *)&self->_symbolDescriptorTintColorNames, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
}

@end