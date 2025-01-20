@interface BBDataProviderIdentity
+ (BOOL)supportsSecureCoding;
+ (id)identityForDataProvider:(id)a3;
+ (id)identityForRemoteDataProvider:(id)a3;
- ($EF6D9B9DCA8E297880FBE6E8665EEC65)traits;
- (BBDataProviderIdentity)initWithCoder:(id)a3;
- (BBSectionIcon)sectionIcon;
- (BBSectionInfo)defaultSectionInfo;
- (BBSectionParameters)sectionParameters;
- (BOOL)syncsBulletinDismissal;
- (NSArray)defaultSubsectionInfos;
- (NSArray)sortDescriptors;
- (NSDictionary)filterDisplayNames;
- (NSDictionary)subsectionDisplayNames;
- (NSString)parentSectionIdentifier;
- (NSString)sectionBundlePath;
- (NSString)sectionDisplayName;
- (NSString)sectionIdentifier;
- (NSString)sortKey;
- (NSString)universalSectionIdentifier;
- (id)description;
- (id)initForDataProvider:(id)a3 forRemoteDataProvider:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultSectionInfo:(id)a3;
- (void)setDefaultSubsectionInfos:(id)a3;
- (void)setFilterDisplayNames:(id)a3;
- (void)setParentSectionIdentifier:(id)a3;
- (void)setSectionBundlePath:(id)a3;
- (void)setSectionDisplayName:(id)a3;
- (void)setSectionIcon:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSectionParameters:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setSortKey:(id)a3;
- (void)setSubsectionDisplayNames:(id)a3;
- (void)setUniversalSectionIdentifier:(id)a3;
@end

@implementation BBDataProviderIdentity

+ (id)identityForDataProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForDataProvider:v4 forRemoteDataProvider:0];

  return v5;
}

+ (id)identityForRemoteDataProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForDataProvider:v4 forRemoteDataProvider:1];

  return v5;
}

- (id)initForDataProvider:(id)a3 forRemoteDataProvider:(BOOL)a4
{
  BOOL v4 = a4;
  v95[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(BBDataProviderIdentity *)self init];
  if (!v7) {
    goto LABEL_112;
  }
  if (objc_opt_respondsToSelector()) {
    int v8 = 2;
  }
  else {
    int v8 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFFD | v8);
  if (objc_opt_respondsToSelector()) {
    int v9 = 4;
  }
  else {
    int v9 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFFB | v9);
  if (objc_opt_respondsToSelector()) {
    int v10 = 8;
  }
  else {
    int v10 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFF7 | v10);
  if (objc_opt_respondsToSelector()) {
    int v11 = 16;
  }
  else {
    int v11 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFEF | v11);
  if (objc_opt_respondsToSelector()) {
    int v12 = 32;
  }
  else {
    int v12 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFDF | v12);
  if (objc_opt_respondsToSelector()) {
    int v13 = 64;
  }
  else {
    int v13 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFBF | v13);
  if (objc_opt_respondsToSelector()) {
    int v14 = 128;
  }
  else {
    int v14 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFF7F | v14);
  if (objc_opt_respondsToSelector()) {
    int v15 = 256;
  }
  else {
    int v15 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFEFF | v15);
  if (objc_opt_respondsToSelector()) {
    int v16 = 4096;
  }
  else {
    int v16 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFEFFF | v16);
  if (objc_opt_respondsToSelector()) {
    int v17 = 512;
  }
  else {
    int v17 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFDFF | v17);
  if (objc_opt_respondsToSelector()) {
    int v18 = 1024;
  }
  else {
    int v18 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFBFF | v18);
  if (objc_opt_respondsToSelector()) {
    int v19 = 2048;
  }
  else {
    int v19 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFF7FF | v19);
  if (objc_opt_respondsToSelector()) {
    int v20 = 0x2000;
  }
  else {
    int v20 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFDFFF | v20);
  if (objc_opt_respondsToSelector()) {
    int v21 = 0x4000;
  }
  else {
    int v21 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFBFFF | v21);
  if (objc_opt_respondsToSelector()) {
    int v22 = 0x8000;
  }
  else {
    int v22 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFF7FFF | v22);
  if (objc_opt_respondsToSelector()) {
    int v23 = 0x10000;
  }
  else {
    int v23 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFEFFFF | v23);
  if (objc_opt_respondsToSelector()) {
    int v24 = 0x20000;
  }
  else {
    int v24 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFDFFFF | v24);
  if (objc_opt_respondsToSelector()) {
    int v25 = 0x40000;
  }
  else {
    int v25 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFBFFFF | v25);
  if (objc_opt_respondsToSelector()) {
    int v26 = 0x80000;
  }
  else {
    int v26 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFF7FFFF | v26);
  if (objc_opt_respondsToSelector()) {
    int v27 = 0x100000;
  }
  else {
    int v27 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFEFFFFF | v27);
  if (objc_opt_respondsToSelector()) {
    int v28 = 0x200000;
  }
  else {
    int v28 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFDFFFFF | v28);
  if (objc_opt_respondsToSelector()) {
    int v29 = 0x400000;
  }
  else {
    int v29 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFBFFFFF | v29);
  if (objc_opt_respondsToSelector()) {
    int v30 = 0x800000;
  }
  else {
    int v30 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFF7FFFFF | v30);
  if (objc_opt_respondsToSelector()) {
    int v31 = 0x1000000;
  }
  else {
    int v31 = 0;
  }
  v7->_$A68C08489CDB8DFD652923BB52B59B03 traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFEFFFFFF | v31);
  v32 = [v6 sectionIdentifier];
  uint64_t v33 = [v32 copy];
  sectionIdentifier = v7->_sectionIdentifier;
  v7->_sectionIdentifier = (NSString *)v33;

  if (!v7->_sectionIdentifier && v4)
  {
    v83 = (void *)MEMORY[0x263EFF940];
    uint64_t v84 = *MEMORY[0x263EFF4A0];
    v94 = @"dataProvider";
    v95[0] = v6;
    v85 = [NSDictionary dictionaryWithObjects:v95 forKeys:&v94 count:1];
    id v86 = [v83 exceptionWithName:v84 reason:@"data providers must provide a valid sectionIdentifier" userInfo:v85];

    objc_exception_throw(v86);
  }
  $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  if ((*(_DWORD *)&traits & 0x400000) != 0)
  {
    v42 = [v6 universalSectionIdentifier];
    uint64_t v43 = [v42 copy];
    universalSectionIdentifier = v7->_universalSectionIdentifier;
    v7->_universalSectionIdentifier = (NSString *)v43;

    $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
    if ((*(_WORD *)&traits & 0x200) == 0)
    {
LABEL_78:
      if ((*(_DWORD *)&traits & 0x800000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&traits & 0x200) == 0)
  {
    goto LABEL_78;
  }
  v45 = [v6 defaultSectionInfo];
  uint64_t v46 = [v45 copy];
  defaultSectionInfo = v7->_defaultSectionInfo;
  v7->_defaultSectionInfo = (BBSectionInfo *)v46;

  $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  if ((*(_DWORD *)&traits & 0x800000) == 0)
  {
LABEL_79:
    if ((*(_WORD *)&traits & 0x4000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_87:
  v48 = [v6 parentSectionIdentifier];
  uint64_t v49 = [v48 copy];
  parentSectionIdentifier = v7->_parentSectionIdentifier;
  v7->_parentSectionIdentifier = (NSString *)v49;

  $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  if ((*(_WORD *)&traits & 0x4000) != 0)
  {
LABEL_80:
    v36 = [v6 sectionDisplayName];
    uint64_t v37 = [v36 copy];
    sectionDisplayName = v7->_sectionDisplayName;
    v7->_sectionDisplayName = (NSString *)v37;

    $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  }
LABEL_81:
  if ((*(_DWORD *)&traits & 0x18000) != 0)
  {
    if ((*(_WORD *)&traits & 0x8000) != 0)
    {
      v39 = [v6 sectionIcon];
      v40 = (BBSectionIcon *)[v39 copy];
    }
    else
    {
      v39 = [v6 sectionIconData];
      if ([v39 length])
      {
        v40 = objc_alloc_init(BBSectionIcon);
        v41 = +[BBSectionIconVariant variantWithFormat:0 imageData:v39];
        [(BBSectionIcon *)v40 addVariant:v41];
      }
      else
      {
        v40 = 0;
      }
    }

    sectionIcon = v7->_sectionIcon;
    v7->_sectionIcon = v40;

    $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  }
  if ((*(_WORD *)&traits & 0x1000) != 0)
  {
    uint64_t v68 = [v6 sectionParameters];
    sectionParameters = v7->_sectionParameters;
    v7->_sectionParameters = (BBSectionParameters *)v68;

    $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
    if ((*(_WORD *)&traits & 0x400) == 0)
    {
LABEL_94:
      if ((*(_WORD *)&traits & 0x800) == 0) {
        goto LABEL_95;
      }
      goto LABEL_115;
    }
  }
  else if ((*(_WORD *)&traits & 0x400) == 0)
  {
    goto LABEL_94;
  }
  v70 = [v6 defaultSubsectionInfos];
  uint64_t v71 = [v70 copy];
  defaultSubsectionInfos = v7->_defaultSubsectionInfos;
  v7->_defaultSubsectionInfos = (NSArray *)v71;

  $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  if ((*(_WORD *)&traits & 0x800) == 0)
  {
LABEL_95:
    if ((*(_DWORD *)&traits & 0x80000) == 0) {
      goto LABEL_96;
    }
LABEL_129:
    v7->_syncsBulletinDismissal = objc_msgSend(v6, "syncsBulletinDismissal", (void)v87);
    if ((*(_DWORD *)&v7->_traits & 0x1000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_115:
  v73 = [MEMORY[0x263EFF9A0] dictionary];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v74 = v7->_defaultSubsectionInfos;
  uint64_t v75 = [(NSArray *)v74 countByEnumeratingWithState:&v87 objects:v93 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v76; ++i)
      {
        if (*(void *)v88 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * i), "subsectionID", (void)v87);
        if (v79)
        {
          v80 = [v6 displayNameForSubsectionID:v79];
          if (v80) {
            [v73 setObject:v80 forKey:v79];
          }
        }
      }
      uint64_t v76 = [(NSArray *)v74 countByEnumeratingWithState:&v87 objects:v93 count:16];
    }
    while (v76);
  }

  if ([v73 count])
  {
    uint64_t v81 = [v73 copy];
    subsectionDisplayNames = v7->_subsectionDisplayNames;
    v7->_subsectionDisplayNames = (NSDictionary *)v81;
  }
  $A68C08489CDB8DFD652923BB52B59B03 traits = v7->_traits;
  if ((*(_DWORD *)&traits & 0x80000) != 0) {
    goto LABEL_129;
  }
LABEL_96:
  if ((*(_DWORD *)&traits & 0x1000000) != 0)
  {
LABEL_97:
    uint64_t v52 = objc_msgSend(v6, "sectionBundlePath", (void)v87);
    sectionBundlePath = v7->_sectionBundlePath;
    v7->_sectionBundlePath = (NSString *)v52;
  }
LABEL_98:
  if (objc_opt_respondsToSelector())
  {
    v54 = [v6 _sortKey];
    uint64_t v55 = [v54 copy];
    sortKey = v7->_sortKey;
    v7->_sortKey = (NSString *)v55;
  }
  if (!v7->_sectionParameters)
  {
    v57 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v7->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v92 = v58;
      _os_log_impl(&dword_217675000, v57, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Data provider <%{public}@> provided no section parameters. Using default parameters.", buf, 0xCu);
    }
    v59 = objc_alloc_init(BBSectionParameters);
    v60 = v7->_sectionParameters;
    v7->_sectionParameters = v59;
  }
  if (!v7->_defaultSectionInfo)
  {
    v61 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v62 = v7->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v92 = v62;
      _os_log_impl(&dword_217675000, v61, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Data provider <%{public}@> provided no default section info. Using defaults.", buf, 0xCu);
    }
    uint64_t v63 = +[BBSectionInfo defaultSectionInfoForType:](BBSectionInfo, "defaultSectionInfoForType:", 0, (void)v87);
    v64 = v7->_defaultSectionInfo;
    v7->_defaultSectionInfo = (BBSectionInfo *)v63;
  }
  if (!v7->_sortDescriptors)
  {
    v65 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v7->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v92 = v66;
      _os_log_impl(&dword_217675000, v65, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Data provider <%{public}@> is missing sort descriptors -- section will not be sorted!", buf, 0xCu);
    }
  }
  -[BBSectionInfo setSectionID:](v7->_defaultSectionInfo, "setSectionID:", v7->_sectionIdentifier, (void)v87);
  [(BBSectionInfo *)v7->_defaultSectionInfo setDisplayName:v7->_sectionDisplayName];
  [(BBSectionInfo *)v7->_defaultSectionInfo setIcon:v7->_sectionIcon];
  [(BBSectionParameters *)v7->_sectionParameters setDisplayName:v7->_sectionDisplayName];
  [(BBSectionParameters *)v7->_sectionParameters setIcon:v7->_sectionIcon];
LABEL_112:

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; %@>",
               objc_opt_class(),
               self,
               self->_sectionIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263EFF8F8];
  p_$A68C08489CDB8DFD652923BB52B59B03 traits = &self->_traits;
  id v6 = a3;
  id v7 = [v4 dataWithBytes:p_traits length:4];
  [v6 encodeObject:v7 forKey:@"_traits"];
  [v6 encodeObject:self->_sortKey forKey:@"_sortKey"];
  [v6 encodeObject:self->_sectionIdentifier forKey:@"_sectionIdentifier"];
  [v6 encodeObject:self->_universalSectionIdentifier forKey:@"_universalSectionIdentifier"];
  [v6 encodeObject:self->_defaultSectionInfo forKey:@"_defaultSectionInfo"];
  [v6 encodeObject:self->_sectionDisplayName forKey:@"_sectionDisplayName"];
  [v6 encodeObject:self->_sectionIcon forKey:@"_sectionIcon"];
  [v6 encodeObject:self->_sortDescriptors forKey:@"_sortDescriptors"];
  [v6 encodeObject:self->_sectionParameters forKey:@"_sectionParameters"];
  [v6 encodeObject:self->_defaultSubsectionInfos forKey:@"_defaultSubsectionInfos"];
  [v6 encodeObject:self->_subsectionDisplayNames forKey:@"_subsectionDisplayNames"];
  [v6 encodeBool:self->_syncsBulletinDismissal forKey:@"_syncsBulletinDismissal"];
  [v6 encodeObject:self->_parentSectionIdentifier forKey:@"_parentSectionIdentifier"];
  [v6 encodeObject:self->_sectionBundlePath forKey:@"_sectionBundlePath"];
}

- (BBDataProviderIdentity)initWithCoder:(id)a3
{
  v45[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BBDataProviderIdentity *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traits"];
    id v7 = v6;
    if (v6) {
      [v6 getBytes:&v5->_traits length:4];
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sortKey"];
    sortKey = v5->_sortKey;
    v5->_sortKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionIdentifier"];
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_universalSectionIdentifier"];
    universalSectionIdentifier = v5->_universalSectionIdentifier;
    v5->_universalSectionIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultSectionInfo"];
    defaultSectionInfo = v5->_defaultSectionInfo;
    v5->_defaultSectionInfo = (BBSectionInfo *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionDisplayName"];
    sectionDisplayName = v5->_sectionDisplayName;
    v5->_sectionDisplayName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionIcon"];
    sectionIcon = v5->_sectionIcon;
    v5->_sectionIcon = (BBSectionIcon *)v18;

    int v20 = (void *)MEMORY[0x263EFFA08];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    int v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
    int v22 = [v20 setWithArray:v21];
    int v23 = [v4 decodeObjectOfClasses:v22 forKey:@"_sortDescriptors"];

    uint64_t v24 = +[BBBulletin validSortDescriptorsFromSortDescriptors:v23];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionParameters"];
    sectionParameters = v5->_sectionParameters;
    v5->_sectionParameters = (BBSectionParameters *)v26;

    int v28 = (void *)MEMORY[0x263EFFA08];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    int v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
    int v30 = [v28 setWithArray:v29];
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"_defaultSubsectionInfos"];
    defaultSubsectionInfos = v5->_defaultSubsectionInfos;
    v5->_defaultSubsectionInfos = (NSArray *)v31;

    uint64_t v33 = (void *)MEMORY[0x263EFFA08];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    v35 = [v33 setWithArray:v34];
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"_subsectionDisplayNames"];
    subsectionDisplayNames = v5->_subsectionDisplayNames;
    v5->_subsectionDisplayNames = (NSDictionary *)v36;

    v5->_syncsBulletinDismissal = [v4 decodeBoolForKey:@"_syncsBulletinDismissal"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_parentSectionIdentifier"];
    parentSectionIdentifier = v5->_parentSectionIdentifier;
    v5->_parentSectionIdentifier = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionBundlePath"];
    sectionBundlePath = v5->_sectionBundlePath;
    v5->_sectionBundlePath = (NSString *)v40;
  }
  return v5;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (void)setSortKey:(id)a3
{
}

- ($EF6D9B9DCA8E297880FBE6E8665EEC65)traits
{
  return ($EF6D9B9DCA8E297880FBE6E8665EEC65)self->_traits;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)universalSectionIdentifier
{
  return self->_universalSectionIdentifier;
}

- (void)setUniversalSectionIdentifier:(id)a3
{
}

- (BBSectionInfo)defaultSectionInfo
{
  return self->_defaultSectionInfo;
}

- (void)setDefaultSectionInfo:(id)a3
{
}

- (NSString)sectionDisplayName
{
  return self->_sectionDisplayName;
}

- (void)setSectionDisplayName:(id)a3
{
}

- (BBSectionIcon)sectionIcon
{
  return self->_sectionIcon;
}

- (void)setSectionIcon:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (BBSectionParameters)sectionParameters
{
  return self->_sectionParameters;
}

- (void)setSectionParameters:(id)a3
{
}

- (NSArray)defaultSubsectionInfos
{
  return self->_defaultSubsectionInfos;
}

- (void)setDefaultSubsectionInfos:(id)a3
{
}

- (NSDictionary)subsectionDisplayNames
{
  return self->_subsectionDisplayNames;
}

- (void)setSubsectionDisplayNames:(id)a3
{
}

- (NSString)parentSectionIdentifier
{
  return self->_parentSectionIdentifier;
}

- (void)setParentSectionIdentifier:(id)a3
{
}

- (NSString)sectionBundlePath
{
  return self->_sectionBundlePath;
}

- (void)setSectionBundlePath:(id)a3
{
}

- (BOOL)syncsBulletinDismissal
{
  return self->_syncsBulletinDismissal;
}

- (NSDictionary)filterDisplayNames
{
  return self->_filterDisplayNames;
}

- (void)setFilterDisplayNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDisplayNames, 0);
  objc_storeStrong((id *)&self->_sectionBundlePath, 0);
  objc_storeStrong((id *)&self->_parentSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_subsectionDisplayNames, 0);
  objc_storeStrong((id *)&self->_defaultSubsectionInfos, 0);
  objc_storeStrong((id *)&self->_sectionParameters, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionIcon, 0);
  objc_storeStrong((id *)&self->_sectionDisplayName, 0);
  objc_storeStrong((id *)&self->_defaultSectionInfo, 0);
  objc_storeStrong((id *)&self->_universalSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end