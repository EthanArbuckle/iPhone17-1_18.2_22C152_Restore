@interface BRMangledID
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateContainerID:(id)a3;
+ (BOOL)validateMangledIDString:(id)a3;
+ (BOOL)validateMangledIDString:(id)a3 strict:(BOOL)a4;
+ (BOOL)validateOwnerName:(id)a3;
+ (id)_containerIDFromSharedContainerID:(id)a3 validate:(BOOL)a4;
+ (id)_containerIDFromSharedMangledIDString:(id)a3 validate:(BOOL)a4;
+ (id)_mangledIDStringFromZoneName:(id)a3 ownerName:(id)a4 validate:(BOOL)a5;
+ (id)_ownerNameFromSharedMangledIDString:(id)a3 validate:(BOOL)a4;
+ (id)_privateMangledContainerID:(id)a3 validate:(BOOL)a4;
+ (id)_privateUnmangledContainerID:(id)a3 validate:(BOOL)a4;
+ (id)_sharedMangledIDStringWithContainerID:(id)a3 ownerName:(id)a4 validate:(BOOL)a5;
+ (id)cloudDocsMangledID;
+ (id)containerMetadataMangledID;
+ (id)desktopMangledID;
+ (id)documentsMangledID;
+ (id)sharedDatabaseMangledID;
+ (id)sideCarMangledID;
+ (id)zoneHealthMangledID;
- (BOOL)isCloudDocsMangledID;
- (BOOL)isCorporateMangledID;
- (BOOL)isDesktopMangledID;
- (BOOL)isDocumentsMangledID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMangledID:(id)a3;
- (BOOL)isPassbookMangledID;
- (BOOL)isPrivate;
- (BOOL)isShared;
- (BRMangledID)initWithAliasTargetContainerString:(id)a3;
- (BRMangledID)initWithAppLibraryName:(id)a3;
- (BRMangledID)initWithCoder:(id)a3;
- (BRMangledID)initWithMangledString:(id)a3;
- (BRMangledID)initWithRecordZoneID:(id)a3;
- (BRMangledID)initWithZoneName:(id)a3 ownerName:(id)a4;
- (NSString)aliasTargetContainerString;
- (NSString)appLibraryOrZoneName;
- (NSString)mangledIDString;
- (NSString)ownerName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRMangledID

- (void).cxx_destruct
{
}

- (BRMangledID)initWithMangledString:(id)a3
{
  id v4 = a3;
  if (!+[BRMangledID validateMangledIDString:v4])
  {
    v7 = brc_bread_crumbs((uint64_t)"-[BRMangledID initWithMangledString:]", 57);
    v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRMangledID initWithMangledString:]();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)BRMangledID;
  id v5 = [(BRMangledID *)&v10 init];
  if (v5)
  {
    id v6 = v4;
    self = (BRMangledID *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;
LABEL_7:
  }
  return (BRMangledID *)v5;
}

- (NSString)appLibraryOrZoneName
{
  BOOL v3 = [(BRMangledID *)self isShared];
  mangledIDString = self->_mangledIDString;
  if (v3) {
    +[BRMangledID _containerIDFromSharedMangledIDString:mangledIDString validate:0];
  }
  else {
  id v5 = +[BRMangledID _privateUnmangledContainerID:mangledIDString validate:0];
  }

  return (NSString *)v5;
}

- (BOOL)isShared
{
  if ([(NSString *)self->_mangledIDString containsString:@":"]) {
    return 1;
  }
  mangledIDString = self->_mangledIDString;

  return [(NSString *)mangledIDString isEqualToString:@"com~apple~SharedDocs"];
}

+ (BOOL)validateMangledIDString:(id)a3 strict:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4 && ![v5 containsString:@"~"])
  {
    v7 = 0;
    BOOL v10 = 0;
  }
  else
  {
    if ([v6 containsString:@":"])
    {
      v7 = +[BRMangledID _containerIDFromSharedMangledIDString:v6 validate:0];
      v8 = +[BRMangledID _ownerNameFromSharedMangledIDString:v6 validate:0];
      BOOL v9 = +[BRMangledID validateOwnerName:v8];

      BOOL v10 = 0;
      if (!v9) {
        goto LABEL_9;
      }
    }
    else
    {
      v7 = +[BRMangledID _privateUnmangledContainerID:v6 validate:0];
    }
    BOOL v10 = +[BRMangledID validateContainerID:v7];
  }
LABEL_9:

  return v10;
}

- (BRMangledID)initWithAppLibraryName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[BRMangledID validateContainerID:v4])
  {
    v7 = brc_bread_crumbs((uint64_t)"-[BRMangledID initWithAppLibraryName:]", 44);
    v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid library name %@%@", buf, 0x16u);
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)BRMangledID;
  id v5 = [(BRMangledID *)&v10 init];
  if (v5)
  {
    uint64_t v6 = +[BRMangledID _privateMangledContainerID:v4 validate:1];
    self = (BRMangledID *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;
LABEL_7:
  }
  return (BRMangledID *)v5;
}

+ (id)_privateMangledContainerID:(id)a3 validate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 && [v5 containsString:@"~"])
  {
    BOOL v9 = brc_bread_crumbs((uint64_t)"+[BRMangledID _privateMangledContainerID:validate:]", 349);
    objc_super v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[BRMangledID _privateMangledContainerID:validate:]();
    }
  }
  v7 = [v6 stringByReplacingOccurrencesOfString:@"." withString:@"~"];

  return v7;
}

+ (BOOL)validateContainerID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length])
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 249);
    BOOL v4 = (char *)objc_claimAutoreleasedReturnValue();
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = "empty";
      if (!v3) {
        BOOL v9 = "nil";
      }
      int v15 = 136315394;
      v16 = v9;
      __int16 v17 = 2112;
      *(void *)v18 = v4;
      uint64_t v6 = "[WARNING] invalid container name (%s)%@";
      v7 = v5;
      uint32_t v8 = 22;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((unint64_t)[v3 length] >= 0x97)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 253);
    BOOL v4 = (char *)objc_claimAutoreleasedReturnValue();
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      v16 = (const char *)v3;
      __int16 v17 = 1024;
      *(_DWORD *)v18 = 150;
      *(_WORD *)&v18[4] = 2112;
      *(void *)&v18[6] = v4;
      uint64_t v6 = "[WARNING] invalid container name '%@', max length is %u%@";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_17:
      _os_log_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, v8);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 258);
    BOOL v4 = (char *)objc_claimAutoreleasedReturnValue();
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v4;
      uint64_t v6 = "[WARNING] nil containerID%@";
      v7 = v5;
      uint32_t v8 = 12;
      goto LABEL_17;
    }
LABEL_18:

    BOOL v12 = 0;
    goto LABEL_19;
  }
  if (validateContainerID__onceToken != -1) {
    dispatch_once(&validateContainerID__onceToken, &__block_literal_global_13);
  }
  uint64_t v10 = [v3 length];
  if (objc_msgSend((id)validateContainerID____regex, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, v10)
    || v11 != v10)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 271);
    BOOL v4 = (char *)objc_claimAutoreleasedReturnValue();
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(id)validateContainerID____regex pattern];
      int v15 = 138412802;
      v16 = (const char *)v3;
      __int16 v17 = 2112;
      *(void *)v18 = v14;
      *(_WORD *)&v18[8] = 2112;
      *(void *)&v18[10] = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid container name '%@', expected regex %@%@", (uint8_t *)&v15, 0x20u);
    }
    goto LABEL_18;
  }
  BOOL v12 = 1;
LABEL_19:

  return v12;
}

+ (id)_privateUnmangledContainerID:(id)a3 validate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 && [v5 containsString:@"."])
  {
    BOOL v9 = brc_bread_crumbs((uint64_t)"+[BRMangledID _privateUnmangledContainerID:validate:]", 355);
    uint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[BRMangledID _privateUnmangledContainerID:validate:]();
    }
  }
  v7 = [v6 stringByReplacingOccurrencesOfString:@"~" withString:@"."];

  return v7;
}

+ (BOOL)validateMangledIDString:(id)a3
{
  return [a1 validateMangledIDString:a3 strict:0];
}

uint64_t __35__BRMangledID_validateContainerID___block_invoke()
{
  validateContainerID____regex = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[a-zA-Z0-9\\-]+\\.[a-zA-Z0-9\\-\\.]+" options:0 error:0];

  return MEMORY[0x1F41817F8]();
}

- (BRMangledID)initWithRecordZoneID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 zoneName];
  uint64_t v6 = [v4 ownerName];

  v7 = [(BRMangledID *)self initWithZoneName:v5 ownerName:v6];
  return v7;
}

- (BRMangledID)initWithZoneName:(id)a3 ownerName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRMangledID;
  uint32_t v8 = [(BRMangledID *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[BRMangledID _mangledIDStringFromZoneName:v6 ownerName:v7 validate:1];
    mangledIDString = v8->_mangledIDString;
    v8->_mangledIDString = (NSString *)v9;

    if (!v8->_mangledIDString)
    {

      uint32_t v8 = 0;
    }
  }

  return v8;
}

- (BRMangledID)initWithAliasTargetContainerString:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"/"])
  {
    v14 = brc_bread_crumbs((uint64_t)"-[BRMangledID initWithAliasTargetContainerString:]", 70);
    int v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRMangledID initWithAliasTargetContainerString:]();
    }
  }
  uint64_t v5 = [v4 rangeOfString:@":"];
  uint64_t v7 = v6;
  id v8 = v4;
  uint64_t v9 = v8;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v11 = [v8 substringToIndex:v5];

    uint64_t v10 = [v9 substringFromIndex:v5 + v7];
  }
  objc_super v12 = [(BRMangledID *)self initWithZoneName:v11 ownerName:v10];

  return v12;
}

+ (id)cloudDocsMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.CloudDocs"];

  return v2;
}

- (BRMangledID)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRMangledID;
  uint64_t v5 = [(BRMangledID *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mangledIDString"];
    mangledIDString = v5->_mangledIDString;
    v5->_mangledIDString = (NSString *)v6;

    if (!+[BRMangledID validateMangledIDString:v5->_mangledIDString])
    {
      id v8 = brc_bread_crumbs((uint64_t)"-[BRMangledID initWithCoder:]", 94);
      uint64_t v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(BRMangledID *)&v5->_mangledIDString initWithCoder:v9];
      }

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_mangledIDString hash];
}

- (BOOL)isEqualToMangledID:(id)a3
{
  return [(NSString *)self->_mangledIDString isEqualToString:*((void *)a3 + 1)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRMangledID *)self isEqualToMangledID:v4];

  return v5;
}

- (id)description
{
  v2 = [(BRMangledID *)self aliasTargetContainerString];
  id v3 = [v2 description];

  return v3;
}

- (BOOL)isPrivate
{
  return ![(BRMangledID *)self isShared];
}

- (BOOL)isCloudDocsMangledID
{
  return [(NSString *)self->_mangledIDString isEqualToString:@"com~apple~CloudDocs"];
}

- (BOOL)isPassbookMangledID
{
  mangledIDString = self->_mangledIDString;
  id v3 = +[BRMangledID _privateMangledContainerID:@"com.apple.shoebox" validate:1];
  LOBYTE(mangledIDString) = [(NSString *)mangledIDString isEqualToString:v3];

  return (char)mangledIDString;
}

- (BOOL)isCorporateMangledID
{
  mangledIDString = self->_mangledIDString;
  id v3 = +[BRMangledID _privateMangledContainerID:@"com.apple.icloud.applecorporate" validate:1];
  LOBYTE(mangledIDString) = [(NSString *)mangledIDString isEqualToString:v3];

  return (char)mangledIDString;
}

- (BOOL)isDesktopMangledID
{
  mangledIDString = self->_mangledIDString;
  id v3 = +[BRMangledID _privateMangledContainerID:@"com.apple.Desktop" validate:1];
  LOBYTE(mangledIDString) = [(NSString *)mangledIDString isEqualToString:v3];

  return (char)mangledIDString;
}

- (BOOL)isDocumentsMangledID
{
  mangledIDString = self->_mangledIDString;
  id v3 = +[BRMangledID _privateMangledContainerID:@"com.apple.Documents" validate:1];
  LOBYTE(mangledIDString) = [(NSString *)mangledIDString isEqualToString:v3];

  return (char)mangledIDString;
}

+ (id)desktopMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.Desktop"];

  return v2;
}

+ (id)documentsMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.Documents"];

  return v2;
}

+ (id)sideCarMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.CloudDocs.pp-metadata"];

  return v2;
}

+ (id)zoneHealthMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.CloudDocs.health"];

  return v2;
}

+ (id)containerMetadataMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.CloudDocs.container-metadata"];

  return v2;
}

+ (id)sharedDatabaseMangledID
{
  v2 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.SharedDocs"];

  return v2;
}

- (NSString)ownerName
{
  return (NSString *)+[BRMangledID _ownerNameFromSharedMangledIDString:self->_mangledIDString validate:0];
}

- (NSString)aliasTargetContainerString
{
  return [(NSString *)self->_mangledIDString stringByReplacingOccurrencesOfString:@"~" withString:@"."];
}

+ (BOOL)validateOwnerName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (validateOwnerName__onceToken != -1)
  {
    dispatch_once(&validateOwnerName__onceToken, &__block_literal_global_22);
    if (v4) {
      goto LABEL_3;
    }
LABEL_9:
    id v8 = brc_bread_crumbs((uint64_t)"+[BRMangledID validateOwnerName:]", 286);
    uint64_t v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      +[BRMangledID validateOwnerName:]((uint64_t)v8, v9);
    }
    goto LABEL_11;
  }
  if (!v3) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = [v4 length];
  if (objc_msgSend((id)validateOwnerName____regex, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5)
    || v6 != v5)
  {
    id v8 = brc_bread_crumbs((uint64_t)"+[BRMangledID validateOwnerName:]", 293);
    uint64_t v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      +[BRMangledID validateOwnerName:v9];
    }
LABEL_11:

    BOOL v7 = 0;
    goto LABEL_12;
  }
  BOOL v7 = 1;
LABEL_12:

  return v7;
}

uint64_t __33__BRMangledID_validateOwnerName___block_invoke()
{
  validateOwnerName____regex = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"_[0-9a-f]{32}" options:0 error:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_mangledIDStringFromZoneName:(id)a3 ownerName:(id)a4 validate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (_mangledIDStringFromZoneName_ownerName_validate__onceToken != -1) {
    dispatch_once(&_mangledIDStringFromZoneName_ownerName_validate__onceToken, &__block_literal_global_30);
  }
  if (!_mangledIDStringFromZoneName_ownerName_validate___defaultOwnerName
    || (objc_msgSend(v8, "isEqualToString:") & 1) == 0)
  {
    if (!+[BRMangledID validateContainerID:v7]) {
      goto LABEL_11;
    }
    if (v8)
    {
      if (+[BRMangledID validateOwnerName:v8])
      {
        uint64_t v9 = +[BRMangledID _sharedMangledIDStringWithContainerID:v7 ownerName:v8 validate:v5];

        goto LABEL_15;
      }
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v9 = +[BRMangledID _privateMangledContainerID:v7 validate:v5];
    goto LABEL_15;
  }

  if (+[BRMangledID validateContainerID:v7]) {
    goto LABEL_14;
  }
  id v8 = 0;
LABEL_11:
  uint64_t v10 = brc_bread_crumbs((uint64_t)"+[BRMangledID _mangledIDStringFromZoneName:ownerName:validate:]", 340);
  objc_super v11 = brc_default_log(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_fault_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid zone %@ or owner name %@%@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v9 = 0;
LABEL_15:

  return v9;
}

uint64_t __63__BRMangledID__mangledIDStringFromZoneName_ownerName_validate___block_invoke()
{
  v0 = getCKCurrentUserDefaultName();
  if (v0) {
    objc_storeStrong((id *)&_mangledIDStringFromZoneName_ownerName_validate___defaultOwnerName, v0);
  }

  return MEMORY[0x1F41817F8]();
}

+ (id)_sharedMangledIDStringWithContainerID:(id)a3 ownerName:(id)a4 validate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [a1 _privateMangledContainerID:a3 validate:v5];
  uint64_t v10 = (void *)v9;
  if (!v8 || !v9)
  {
    int v13 = brc_bread_crumbs((uint64_t)"+[BRMangledID _sharedMangledIDStringWithContainerID:ownerName:validate:]", 362);
    id v14 = brc_default_log(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[BRMangledID _sharedMangledIDStringWithContainerID:ownerName:validate:]();
    }
  }
  objc_super v11 = [v10 stringByAppendingFormat:@":%@", v8];

  return v11;
}

+ (id)_containerIDFromSharedMangledIDString:(id)a3 validate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_msgSend(a1, "_containerIDFromSharedContainerID:validate:", a3);
  id v7 = [a1 _privateUnmangledContainerID:v6 validate:v4];

  return v7;
}

+ (id)_ownerNameFromSharedMangledIDString:(id)a3 validate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:@":"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      uint64_t v10 = brc_bread_crumbs((uint64_t)"+[BRMangledID _ownerNameFromSharedMangledIDString:validate:]", 376);
      objc_super v11 = brc_default_log(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        +[BRMangledID _ownerNameFromSharedMangledIDString:validate:]();
      }
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 substringFromIndex:v6 + v7];
  }

  return v8;
}

+ (id)_containerIDFromSharedContainerID:(id)a3 validate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:@":"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      uint64_t v9 = brc_bread_crumbs((uint64_t)"+[BRMangledID _containerIDFromSharedContainerID:validate:]", 388);
      uint64_t v10 = brc_default_log(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        +[BRMangledID _ownerNameFromSharedMangledIDString:validate:]();
      }
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 substringToIndex:v6];
  }

  return v7;
}

- (NSString)mangledIDString
{
  return self->_mangledIDString;
}

- (void)initWithMangledString:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: invalid mangled string %@%@");
}

- (void)initWithAliasTargetContainerString:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: ![aliasTargetString containsString:@\"/\"]%@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, a2, a3, "[CRIT] UNREACHABLE: encoded object has bogus mangledID %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)validateOwnerName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(id)validateOwnerName____regex pattern];
  OUTLINED_FUNCTION_2_1();
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_19ED3F000, a2, (os_log_type_t)0x90u, "[ERROR] invalid owner name nil, expected regex %@%@", v5, 0x16u);
}

+ (void)validateOwnerName:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(id)validateOwnerName____regex pattern];
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_19ED3F000, a3, (os_log_type_t)0x90u, "[ERROR] invalid owner name '%@', expected regex %@%@", (uint8_t *)&v7, 0x20u);
}

+ (void)_privateMangledContainerID:validate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !validate || ![containerID containsString:@\"~\"]%@", v2, v3, v4, v5, v6);
}

+ (void)_privateUnmangledContainerID:validate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !validate || ![mangledContainerID containsString:@\".\"]%@", v2, v3, v4, v5, v6);
}

+ (void)_sharedMangledIDStringWithContainerID:ownerName:validate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: ownerName && mangledContainerID%@", v2, v3, v4, v5, v6);
}

+ (void)_ownerNameFromSharedMangledIDString:validate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !validate%@", v2, v3, v4, v5, v6);
}

@end