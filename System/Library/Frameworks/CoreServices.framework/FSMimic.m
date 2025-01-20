@interface FSMimic
+ (BOOL)supportsSecureCoding;
+ (id)basePropertyClasses;
+ (id)resourceValueClassesWithNull;
+ (void)checkSelectors;
- (BOOL)canIssueIO;
- (BOOL)childNodeWithRelativePathExists:(id)a3;
- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4;
- (BOOL)getCreationDate:(double *)a3 error:(id *)a4;
- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4;
- (BOOL)getDeviceRefNum:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4;
- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5;
- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4;
- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)hasHiddenExtension;
- (BOOL)hasObjectValueForSelector:(SEL)a3;
- (BOOL)hasPackageBit;
- (BOOL)hasResourceValueForKey:(id)a3;
- (BOOL)isAVCHDCollection;
- (BOOL)isAliasFile;
- (BOOL)isBusyDirectory;
- (BOOL)isDataContainer;
- (BOOL)isDirectory;
- (BOOL)isExecutable;
- (BOOL)isExecutableModeFile;
- (BOOL)isHidden;
- (BOOL)isInTrash;
- (BOOL)isMountTrigger;
- (BOOL)isOnDiskImage;
- (BOOL)isOnLocalVolume;
- (BOOL)isOnTimeMachineVolume;
- (BOOL)isRegularFile;
- (BOOL)isResolvable;
- (BOOL)isSecuredSystemContent;
- (BOOL)isSideFault;
- (BOOL)isSymbolicLink;
- (BOOL)isTrashFolder;
- (BOOL)isVolume;
- (FSMimic)initWithCoder:(id)a3;
- (FSMimic)initWithURL:(id)a3;
- (id)URL;
- (id)canonicalPathWithError:(id *)a3;
- (id)extensionWithError:(id *)a3;
- (id)nameWithError:(id *)a3;
- (id)pathWithError:(id *)a3;
- (id)sideFaultResourceValuesWithError:(id *)a3;
- (void)askedForMissingResourceKey:(id)a3;
- (void)askedForMissingSelector:(SEL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)noteExtantChildNodeWithRelativePath:(id)a3;
- (void)setHFSType:(unsigned int)a3 creator:(unsigned int)a4;
- (void)setHFSTypesUnavailable;
- (void)setObjectValue:(id)a3 forSelector:(SEL)a4;
- (void)setResourceValue:(id)a3 forKey:(id)a4;
@end

@implementation FSMimic

- (void)setObjectValue:(id)a3 forSelector:(SEL)a4
{
  id v8 = a3;
  baseProperties = self->_baseProperties;
  v7 = NSStringFromSelector(a4);
  [(NSMutableDictionary *)baseProperties setObject:v8 forKey:v7];
}

- (BOOL)hasObjectValueForSelector:(SEL)a3
{
  baseProperties = self->_baseProperties;
  v4 = NSStringFromSelector(a3);
  v5 = [(NSMutableDictionary *)baseProperties objectForKey:v4];
  LOBYTE(baseProperties) = v5 != 0;

  return (char)baseProperties;
}

- (BOOL)isVolume
{
  baseProperties = self->_baseProperties;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isSymbolicLink
{
  baseProperties = self->_baseProperties;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isRegularFile
{
  baseProperties = self->_baseProperties;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isDirectory
{
  baseProperties = self->_baseProperties;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isAliasFile
{
  baseProperties = self->_baseProperties;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  BOOL v9 = [(NSMutableDictionary *)self->_resourceValues objectForKey:v8];
  if (v9)
  {
    if (a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = 0;
      }
      else {
        v10 = v9;
      }
      objc_storeStrong(a3, v10);
    }
  }
  else if (a5)
  {
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = v8;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"-[FSMimic getCachedResourceValueIfPresent:forKey:error:]", 237, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9 != 0;
}

- (id)extensionWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSMutableDictionary *)baseProperties objectForKey:v7];
  v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_14;
    }
  }
  [(FSMimic *)self askedForMissingSelector:a2];
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"extension";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"-[FSMimic extensionWithError:]", 332, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (FSMimic)initWithURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSMimic;
  uint64_t v6 = [(FSMimic *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    baseProperties = v7->_baseProperties;
    v7->_baseProperties = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resourceValues = v7->_resourceValues;
    v7->_resourceValues = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    relativePathsThatExist = v7->_relativePathsThatExist;
    v7->_relativePathsThatExist = v12;

    *(unsigned char *)&v7->_flags &= 0xFCu;
  }

  return v7;
}

- (FSMimic)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FSMimic;
  id v5 = [(FSMimic *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"url");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = +[FSMimic resourceValueClassesWithNull];
    v10 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, @"baseProperties");
    uint64_t v11 = [v10 mutableCopy];
    baseProperties = v5->_baseProperties;
    v5->_baseProperties = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = +[FSMimic resourceValueClassesWithNull];
    objc_super v15 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v13, v14, @"resourceValues");
    v16 = _LSDecodeURLPropertyDictionary(v15);
    uint64_t v17 = [v16 mutableCopy];
    resourceValues = v5->_resourceValues;
    v5->_resourceValues = (NSMutableDictionary *)v17;

    v19 = objc_msgSend(v4, "ls_decodeSetWithValuesOfClass:forKey:", objc_opt_class(), @"relativePathsThatExist");
    uint64_t v20 = [v19 mutableCopy];
    relativePathsThatExist = v5->_relativePathsThatExist;
    v5->_relativePathsThatExist = (NSMutableSet *)v20;

    v5->_hfsType = [v4 decodeInt32ForKey:@"hfsType"];
    v5->_creator = [v4 decodeInt32ForKey:@"creator"];
    *(unsigned char *)&v5->_flags = *(unsigned char *)&v5->_flags & 0xFE | [v4 decodeBoolForKey:@"HFSTypesSet"];
    if ([v4 decodeBoolForKey:@"HFSTypesUnavailable"]) {
      char v22 = 2;
    }
    else {
      char v22 = 0;
    }
    *(unsigned char *)&v5->_flags = *(unsigned char *)&v5->_flags & 0xFD | v22;
  }

  return v5;
}

+ (id)resourceValueClassesWithNull
{
  if (+[FSMimic resourceValueClassesWithNull]::onceToken != -1) {
    dispatch_once(&+[FSMimic resourceValueClassesWithNull]::onceToken, &__block_literal_global_5);
  }
  v2 = (void *)+[FSMimic resourceValueClassesWithNull]::result;

  return v2;
}

- (id)URL
{
  return self->_url;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->_baseProperties forKey:@"baseProperties"];
  id v4 = _LSEncodeURLPropertyDictionary(self->_resourceValues);
  [v5 encodeObject:v4 forKey:@"resourceValues"];

  [v5 encodeObject:self->_relativePathsThatExist forKey:@"relativePathsThatExist"];
  [v5 encodeInt32:self->_hfsType forKey:@"hfsType"];
  [v5 encodeInt32:self->_creator forKey:@"creator"];
  [v5 encodeBool:*(unsigned char *)&self->_flags & 1 forKey:@"HFSTypesSet"];
  [v5 encodeBool:(*(unsigned char *)&self->_flags >> 1) & 1 forKey:@"HFSTypesUnavailable"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePathsThatExist, 0);
  objc_storeStrong((id *)&self->_resourceValues, 0);
  objc_storeStrong((id *)&self->_baseProperties, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setResourceValue:(id)a3 forKey:(id)a4
{
}

- (BOOL)hasResourceValueForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_resourceValues objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setHFSType:(unsigned int)a3 creator:(unsigned int)a4
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 1;
  self->_hfsType = a3;
  self->_creator = a4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)basePropertyClasses
{
  if (+[FSMimic basePropertyClasses]::onceToken != -1) {
    dispatch_once(&+[FSMimic basePropertyClasses]::onceToken, &__block_literal_global_31);
  }
  v2 = (void *)+[FSMimic basePropertyClasses]::result;

  return v2;
}

void __30__FSMimic_basePropertyClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)+[FSMimic basePropertyClasses]::result;
  +[FSMimic basePropertyClasses]::result = v2;
}

void __39__FSMimic_resourceValueClassesWithNull__block_invoke()
{
  id v0 = _LSGetURLPropertyClasses();
  uint64_t v1 = (void *)[v0 mutableCopy];

  [v1 addObject:objc_opt_class()];
  uint64_t v2 = (void *)+[FSMimic resourceValueClassesWithNull]::result;
  +[FSMimic resourceValueClassesWithNull]::result = (uint64_t)v1;
}

- (BOOL)canIssueIO
{
  return 0;
}

- (void)askedForMissingSelector:(SEL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    Name = sel_getName(a3);
    [(FSMimic *)(uint64_t)Name askedForMissingSelector:v4];
  }
}

- (void)askedForMissingResourceKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[FSMimic askedForMissingResourceKey:]((uint64_t)v3, v4);
  }
}

- (void)noteExtantChildNodeWithRelativePath:(id)a3
{
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  id v9 = a4;
  id v16 = 0;
  BOOL v10 = [(FSMimic *)self getCachedResourceValueIfPresent:a3 forKey:v9 error:&v16];
  id v11 = v16;
  v12 = v11;
  if (!v10)
  {
    if (a6) {
      *a6 = v11;
    }
    if ([v12 code] == 5)
    {
      uint64_t v13 = [v12 domain];
      int v14 = [v13 isEqualToString:*MEMORY[0x1E4F28798]];

      if (v14) {
        [(FSMimic *)self askedForMissingResourceKey:v9];
      }
    }
  }

  return v10;
}

- (BOOL)isBusyDirectory
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isExecutableModeFile
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isExecutable
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isResolvable
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isSideFault
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)hasPackageBit
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isHidden
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)hasHiddenExtension
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isDataContainer
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4
{
  uint64_t v6 = [(FSMimic *)self pathWithError:a4];
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (([v6 getFileSystemRepresentation:a3 maxLength:1024] & 1) == 0)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -2110, (uint64_t)"-[FSMimic getFileSystemRepresentation:error:]", 322, 0);
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (id)pathWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSMutableDictionary *)baseProperties objectForKey:v7];
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_14;
    }
  }
  [(FSMimic *)self askedForMissingSelector:a2];
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"path";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"-[FSMimic pathWithError:]", 329, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (id)canonicalPathWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSMutableDictionary *)baseProperties objectForKey:v7];
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_14;
    }
  }
  [(FSMimic *)self askedForMissingSelector:a2];
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"canonicalPath";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"-[FSMimic canonicalPathWithError:]", 330, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (id)nameWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSMutableDictionary *)baseProperties objectForKey:v7];
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_14;
    }
  }
  [(FSMimic *)self askedForMissingSelector:a2];
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"name";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"-[FSMimic nameWithError:]", 331, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)isMountTrigger
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)isSecuredSystemContent
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isOnDiskImage
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isOnLocalVolume
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isOnTimeMachineVolume
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getCreationDate:(double *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<double>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<double>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5
{
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      if (!a5) {
        return flags & 1;
      }
      uint64_t v7 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v8 = -10813;
      uint64_t v9 = 362;
    }
    else
    {
      if (!a5) {
        return flags & 1;
      }
      uint64_t v7 = (void *)*MEMORY[0x1E4F28798];
      uint64_t v8 = 5;
      uint64_t v9 = 364;
    }
    _LSMakeNSErrorImpl(v7, v8, (uint64_t)"-[FSMimic getHFSType:creator:error:]", v9, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    return flags & 1;
  }
  if (a3) {
    *a3 = self->_hfsType;
  }
  if (a4) {
    *a4 = self->_creator;
  }
  return flags & 1;
}

- (void)setHFSTypesUnavailable
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFC | 2;
}

- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v8 = self;
  uint64_t v9 = baseProperties;
  BOOL v10 = NSStringFromSelector(a2);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [(NSMutableDictionary *)v9 objectForKey:v10];
  uint64_t v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v12)
    {
LABEL_9:
      *a3 = [v13 intValue];
      BOOL v16 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  [(FSMimic *)v8 askedForMissingSelector:a2];
  if (!a4)
  {
    BOOL v16 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = *MEMORY[0x1E4F28228];
  v20[0] = v10;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"getFailableNumericFromBaseProperties", 284, v17);
  BOOL v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v17;
LABEL_13:

LABEL_14:
  return v16;
}

- (BOOL)getDeviceRefNum:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v8 = self;
  uint64_t v9 = baseProperties;
  BOOL v10 = NSStringFromSelector(a2);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [(NSMutableDictionary *)v9 objectForKey:v10];
  uint64_t v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v12)
    {
LABEL_9:
      *a3 = [v13 unsignedIntValue];
      BOOL v16 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  [(FSMimic *)v8 askedForMissingSelector:a2];
  if (!a4)
  {
    BOOL v16 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = *MEMORY[0x1E4F28228];
  v20[0] = v10;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"getFailableNumericFromBaseProperties", 284, v17);
  BOOL v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v17;
LABEL_13:

LABEL_14:
  return v16;
}

- (BOOL)childNodeWithRelativePathExists:(id)a3
{
  return [(NSMutableSet *)self->_relativePathsThatExist containsObject:a3];
}

- (BOOL)isInTrash
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isTrashFolder
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isAVCHDCollection
{
  baseProperties = self->_baseProperties;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSMutableDictionary *)baseProperties objectForKey:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0;
    [(FSMimic *)self askedForMissingSelector:a2];
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (id)sideFaultResourceValuesWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  baseProperties = self->_baseProperties;
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSMutableDictionary *)baseProperties objectForKey:v7];
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {

      goto LABEL_14;
    }
  }
  [(FSMimic *)self askedForMissingSelector:a2];
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"sideFaultResourceValues";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"-[FSMimic sideFaultResourceValuesWithError:]", 400, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

+ (void)checkSelectors
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int outCount = 0;
  uint64_t v2 = protocol_copyMethodDescriptionList((Protocol *)&unk_1ECB44FB8, 1, 1, &outCount);
  id v3 = v2;
  if (outCount)
  {
    unint64_t v4 = 0;
    id v5 = (objc_selector **)v2;
    do
    {
      uint64_t v6 = categorizeSelector(*v5);
      uint64_t v7 = _LSDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        Name = sel_getName((SEL)*v5);
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = Name;
        __int16 v14 = 1024;
        int v15 = v6;
        _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "Category for %s is %d", buf, 0x12u);
      }

      if (v6 == 6)
      {
        uint64_t v9 = _LSDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          BOOL v10 = sel_getName((SEL)*v5);
          *(_DWORD *)buf = 136315138;
          uint64_t v13 = v10;
          _os_log_fault_impl(&dword_182959000, v9, OS_LOG_TYPE_FAULT, "unknown category for %s!", buf, 0xCu);
        }
      }
      ++v4;
      v5 += 2;
    }
    while (v4 < outCount);
  }
  free(v3);
}

- (void)askedForMissingSelector:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "asked for missing selector %s", buf, 0xCu);
}

- (void)askedForMissingResourceKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_182959000, a2, OS_LOG_TYPE_FAULT, "asked for missing resource key %@", (uint8_t *)&v2, 0xCu);
}

@end