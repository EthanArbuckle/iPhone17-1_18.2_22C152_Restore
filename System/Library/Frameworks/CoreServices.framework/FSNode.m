@interface FSNode
+ (BOOL)canAccessURL:(id)a3 fromSandboxWithAuditToken:(id *)a4 operation:(const char *)a5;
+ (BOOL)canAccessURL:(id)a3 withAuditToken:(id *)a4 operation:(const char *)a5;
+ (BOOL)canReadMetadataOfURL:(id)a3 fromSandboxWithAuditToken:(id *)a4;
+ (BOOL)canReadMetadataOfURL:(id)a3 withAuditToken:(id *)a4;
+ (BOOL)canReadURL:(id)a3 fromSandboxWithAuditToken:(id *)a4;
+ (BOOL)canReadURL:(id)a3 withAuditToken:(id *)a4;
+ (BOOL)canWriteURL:(id)a3 fromSandboxWithAuditToken:(id *)a4;
+ (BOOL)canWriteURL:(id)a3 withAuditToken:(id *)a4;
+ (BOOL)getFileSystemRepresentation:(char)a3[1024] forBookmarkData:(id)a4;
+ (BOOL)getVolumeIdentifier:(unint64_t *)a3 forBookmarkData:(id)a4 error:(id *)a5;
+ (BOOL)isBookmarkDataFull:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_resolvedNodeFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
+ (id)_resolvedURLFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
+ (id)nameForBookmarkData:(id)a3 error:(id *)a4;
+ (id)pathForBookmarkData:(id)a3 error:(id *)a4;
+ (id)prebootVolumeNode;
+ (id)rootVolumeNode;
+ (id)systemDataVolumeNode;
+ (id)userDataVolumeNode;
+ (unsigned)compareBookmarkData:(id)a3 toBookmarkData:(id)a4;
- (BOOL)canIssueIO;
- (BOOL)canReadFromSandboxWithAuditToken:(id *)a3;
- (BOOL)canReadMetadataFromSandboxWithAuditToken:(id *)a3;
- (BOOL)canReadMetadataWithAuditToken:(id *)a3;
- (BOOL)canReadWithAuditToken:(id *)a3;
- (BOOL)canWriteFromSandboxWithAuditToken:(id *)a3;
- (BOOL)canWriteWithAuditToken:(id *)a3;
- (BOOL)checkResourceIsReachableAndReturnError:(id *)a3;
- (BOOL)childNodeWithRelativePathExists:(id)a3;
- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4;
- (BOOL)getCreationDate:(double *)a3 error:(id *)a4;
- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4;
- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4;
- (BOOL)getFinderInfo:(id *)a3 error:(id *)a4;
- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5;
- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getIsDirectory_NoIO:(BOOL *)a3;
- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4;
- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)getTemporaryResourceValue:(id *)a3 forKey:(id)a4;
- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getWriterBundleIdentifier:(id *)a3 error:(id *)a4;
- (BOOL)hasHiddenExtension;
- (BOOL)hasPackageBit;
- (BOOL)isAVCHDCollection;
- (BOOL)isAliasFile;
- (BOOL)isBusyDirectory;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExecutable;
- (BOOL)isExecutableModeFile;
- (BOOL)isHidden;
- (BOOL)isMountTrigger;
- (BOOL)isOnDiskImage;
- (BOOL)isOnLocalVolume;
- (BOOL)isRegularFile;
- (BOOL)isResolvable;
- (BOOL)isSecuredSystemContent;
- (BOOL)isSideFault;
- (BOOL)isSymbolicLink;
- (BOOL)isVolume;
- (BOOL)setExtendedAttribute:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6;
- (BOOL)setFinderInfo:(id *)a3 error:(id *)a4;
- (BOOL)setResourceValue:(id)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (FSNode)initWithCoder:(id)a3;
- (FSNode)initWithConfigurationString:(int)a3 flags:(unsigned int)a4 error:(id *)a5;
- (FSNode)initWithDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 lastPathComponent:(id)a5 createIntermediateDirectories:(BOOL)a6 flags:(unsigned int)a7 error:(id *)a8;
- (FSNode)initWithFileSystemRepresentation:(const char *)a3 flags:(unsigned int)a4 error:(id *)a5;
- (FSNode)initWithPath:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (FSNode)initWithURL:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (NSString)description;
- (__CFBundle)copyCFBundleWithError:(id *)a3;
- (id)URL;
- (id)bookmarkDataRelativeToNode:(id)a3 error:(id *)a4;
- (id)bookmarkDataWithOptions:(unint64_t)a3 relativeToNode:(id)a4 error:(id *)a5;
- (id)bundleIdentifierWithContext:(LSContext *)a3 error:(id *)a4;
- (id)bundleIdentifierWithError:(id *)a3;
- (id)bundleInfoDictionaryWithError:(id *)a3;
- (id)canonical:(BOOL)a3 pathWithError:(id *)a4;
- (id)canonicalPathWithError:(id *)a3;
- (id)childNodeWithRelativePath:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)diskImageURLWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)extendedAttributeWithName:(id)a3 options:(int)a4 error:(id *)a5;
- (id)extensionWithError:(id *)a3;
- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToNode:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7;
- (id)initByResolvingBookmarkData:(id)a3 relativeToNode:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6;
- (id)nameWithError:(id *)a3;
- (id)pathWithError:(id *)a3;
- (id)redactedDescription;
- (id)referringAliasNode;
- (id)resolvedNodeWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)sideFaultResourceValuesWithError:(id *)a3;
- (id)temporaryDirectoryNodeWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)volumeNodeWithFlags:(unsigned int)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)clearURLPropertyCacheIfStale;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForReuse;
- (void)removeCachedResourceValueForKey:(id)a3;
- (void)setReferringAliasNode:(id)a3;
- (void)setTemporaryResourceValue:(id)a3 forKey:(id)a4;
@end

@implementation FSNode

- (void).cxx_destruct
{
}

- (id)URL
{
  if ((*((unsigned char *)self + 24) & 0x10) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"FSUtils.mm", 484, @"Attempted to use uninitialized FSNode %p.", self);
  }
  url = self->_url;

  return url;
}

- (id)canonical:(BOOL)a3 pathWithError:(id *)a4
{
  BOOL v5 = a3;
  id v20 = 0;
  if (a3
    || !self
    || (*((unsigned char *)self + 24) & 8) == 0
    || (uint64_t v7 = __CFURLResourceInfoPtr(), v19 = 0, !v7)
    || !MEMORY[0x18530E320](v7, *MEMORY[0x1E4F1D748], &v19)
    || (id v8 = v19, (v20 = v8) == 0))
  {
    v9 = (id *)MEMORY[0x1E4F1C520];
    if (!v5) {
      v9 = (id *)MEMORY[0x1E4F1C700];
    }
    id v10 = *v9;
    if (![(FSNode *)self getResourceValue:&v20 forKey:v10 options:1 error:a4])
    {
      v11 = [(FSNode *)self URL];
      char v12 = [v11 isFileReferenceURL];

      if ((v12 & 1) == 0)
      {
        v13 = [(FSNode *)self URL];
        v14 = [v13 absoluteURL];

        if (v14)
        {
          v15 = [v14 path];
          id v16 = v20;
          id v20 = v15;
        }
      }
    }

    id v8 = v20;
  }
  id v17 = v8;

  return v17;
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id propertyValueTypeRefPtr = 0;
  if (!a4)
  {
    if (a6)
    {
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v26[0] = @"key";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]", 781, v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_32;
  }
  if ((*((unsigned char *)self + 24) & 3) != 0 && [a4 isEqual:*MEMORY[0x1E4F1C628]])
  {
    [NSNumber numberWithBool:(*((unsigned char *)self + 24) & 3) == 2];
    id propertyValueTypeRefPtr = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  [(FSNode *)self clearURLPropertyCacheIfStale];
  if (a5)
  {
    id v23 = 0;
    CFURLRef v15 = [(FSNode *)self URL];
    CFURLRef v16 = v15;
    if (a6) {
      id v17 = (CFErrorRef *)&v23;
    }
    else {
      id v17 = 0;
    }
    int v18 = CFURLCopyResourcePropertyForKey(v15, (CFStringRef)a4, &propertyValueTypeRefPtr, v17);

    if (a6 != 0 && v18 == 0)
    {
      *a6 = v23;

      goto LABEL_32;
    }

    if (!v18)
    {
LABEL_32:
      BOOL v21 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    v11 = [(FSNode *)self URL];
    BOOL v12 = _CFURLCopyResourcePropertyForKeyFromCache() == 0;

    if (v12)
    {
      if (a6)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10655, (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]", 812, 0);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
        BOOL v21 = 0;
        *a6 = v13;
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  id v19 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr
    && (*((unsigned char *)self + 24) & 3) == 0
    && [a4 isEqual:*MEMORY[0x1E4F1C628]])
  {
    if ([v19 BOOLValue]) {
      char v20 = 2;
    }
    else {
      char v20 = 1;
    }
    *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFC | v20;
  }
LABEL_23:
  if ((a5 & 2) == 0 && !propertyValueTypeRefPtr)
  {
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10813, (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]", 825, 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  if (a3) {
    objc_storeStrong(a3, propertyValueTypeRefPtr);
  }
  BOOL v21 = 1;
LABEL_33:

  return v21;
}

- (void)clearURLPropertyCacheIfStale
{
  if (self->_cacheExpiration != -1)
  {
    uint64_t v3 = mach_absolute_time();
    if (self->_cacheExpiration < v3)
    {
      uint64_t v4 = v3;
      BOOL v5 = [(FSNode *)self URL];
      [v5 removeAllCachedResourceValues];

      if (_FSNodeInfoLifetimeAbsolute(void)::once != -1) {
        dispatch_once(&_FSNodeInfoLifetimeAbsolute(void)::once, &__block_literal_global_422);
      }
      self->_cacheExpiration = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v4;
    }
  }
}

- (id)canonicalPathWithError:(id *)a3
{
  return [(FSNode *)self canonical:1 pathWithError:a3];
}

- (id)initByResolvingBookmarkData:(id)a3 relativeToNode:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  return [(FSNode *)self initByResolvingBookmarkData:a3 options:17152 relativeToNode:a4 bookmarkDataIsStale:a5 error:a6];
}

- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToNode:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (a7)
    {
      uint64_t v14 = *MEMORY[0x1E4F28228];
      CFURLRef v15 = @"bookmark";
      v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, a6);
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(BookmarkData) initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]", 3807, v11);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  if (!+[FSNode getFileSystemRepresentation:forBookmarkData:](FSNode, "getFileSystemRepresentation:forBookmarkData:", __s, a3, a5, a6))
  {
    if (a7)
    {
      uint64_t v16 = *MEMORY[0x1E4F28228];
      id v17 = @"bookmark";
      BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(BookmarkData) initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]", 3801, v12);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  size_t v9 = strlen(__s);
  if (v9) {
    uint64_t v10 = 8 * (__s[v9 - 1] == 47);
  }
  else {
    uint64_t v10 = 0;
  }
  return [(FSNode *)self initWithFileSystemRepresentation:__s flags:v10 error:a7];
}

+ (id)pathForBookmarkData:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (!a4)
    {
LABEL_11:
      v6 = 0;
      goto LABEL_12;
    }
    uint64_t v10 = *MEMORY[0x1E4F28228];
    v11 = @"bookmark";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[FSNode(BookmarkData) pathForBookmarkData:error:]", 3850, v7);
LABEL_10:
    *a4 = v8;

    goto LABEL_11;
  }
  if (![a1 getFileSystemRepresentation:__s forBookmarkData:a3])
  {
    v6 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v5 stringWithFileSystemRepresentation:__s length:strlen(__s)];

  if (a4)
  {
LABEL_8:
    if (v6) {
      goto LABEL_12;
    }
    uint64_t v12 = *MEMORY[0x1E4F28228];
    id v13 = @"invalid input parameters";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[FSNode(BookmarkData) pathForBookmarkData:error:]", 3847, v7);
    goto LABEL_10;
  }
LABEL_12:

  return v6;
}

+ (BOOL)getFileSystemRepresentation:(char)a3[1024] forBookmarkData:(id)a4
{
  id v5 = a4;
  v6 = v5;
  BOOL v7 = 0;
  if (a3 && v5)
  {
    bzero(a3, 0x400uLL);
    unint64_t v8 = [v6 length];
    if (v8 > 0x3FF)
    {
      BOOL v7 = 0;
    }
    else
    {
      [v6 getBytes:a3 length:v8];
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (FSNode)initWithFileSystemRepresentation:(const char *)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:a3 isDirectory:(a4 >> 3) & 1 relativeToURL:0];
    size_t v9 = [(FSNode *)self initWithURL:v8 flags:v7 error:a5];
  }
  else
  {
    if (a5)
    {
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"path";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode initWithFileSystemRepresentation:flags:error:]", 538, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  return v9;
}

- (FSNode)initWithURL:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)FSNode;
  size_t v9 = [(FSNode *)&v28 init];
  uint64_t v10 = v9;
  if (!v9)
  {
    if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"-[FSNode initWithURL:flags:error:]", 248, 0);
      char v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v20;
    }
    return 0;
  }
  if ((*((unsigned char *)v9 + 24) & 0x10) != 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"FSUtils.mm", 174, @"Attempted to initialize FSNode %p that was already initialized", v10);
  }
  p_url = (void **)&v10->_url;
  url = v10->_url;
  v10->_url = 0;

  v10->_cacheExpiration = -1;
  *((unsigned char *)v10 + 24) = (a4 >> 3) & 8 | *((unsigned char *)v10 + 24) & 0xE0 | 0x10;
  if (!a3 || ![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v29 = *MEMORY[0x1E4F28228];
      v30[0] = @"aURL";
      BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode initWithURL:flags:error:]", 243, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  id v13 = *p_url;
  if (*p_url)
  {
    *p_url = 0;
  }
  if ((a4 & 0x20) != 0)
  {
    id v27 = 0;
    int v14 = [a3 getResourceValue:&v27 forKey:*MEMORY[0x1E4F1C520] error:0];
    id v15 = v27;
    if (v15) {
      int v16 = v14;
    }
    else {
      int v16 = 0;
    }
    if (v16 == 1)
    {
      id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initFileURLWithPath:isDirectory:", v15, objc_msgSend(a3, "hasDirectoryPath"));
      int v18 = v17;
      if (v17 && ([v17 isEqual:a3] & 1) == 0) {
        objc_storeStrong((id *)&v10->_url, v18);
      }
    }
  }
  if (!*p_url) {
    objc_storeStrong((id *)&v10->_url, a3);
  }
  LODWORD(v19) = (a4 >> 2) & 0x10 | a4;
  if ((a4 & 8) != 0) {
    *((unsigned char *)v10 + 24) = *((unsigned char *)v10 + 24) & 0xFC | 2;
  }
  if ((a4 & 2) == 0)
  {
    char v20 = v10;
    goto LABEL_35;
  }
  uint64_t v19 = v19 | 1;
  v22 = [(FSNode *)v10 resolvedNodeWithFlags:v19 error:a5];
  id v23 = v22;
  if (!v22)
  {

    return 0;
  }
  if (v10 == v22)
  {
    char v20 = v10;
  }
  else
  {
    char v20 = v22;
  }
LABEL_35:
  if ((v19 & 1) != 0
    && ![(FSNode *)v20 checkResourceIsReachableAndReturnError:a5])
  {

    return 0;
  }
  if ((v19 & 0x10) == 0)
  {
    uint64_t v24 = mach_absolute_time();
    if (_FSNodeInfoLifetimeAbsolute(void)::once != -1) {
      dispatch_once(&_FSNodeInfoLifetimeAbsolute(void)::once, &__block_literal_global_422);
    }
    v20->_cacheExpiration = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v24;
  }
  return v20;
}

- (id)resolvedNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if ([(FSNode *)self isDirectory]
    || ![(FSNode *)self checkResourceIsReachableAndReturnError:0]
    || ![(FSNode *)self isResolvable])
  {
    unint64_t v8 = self;
    goto LABEL_14;
  }
  uint64_t v7 = [(id)objc_opt_class() _resolvedNodeFromAliasFile:self flags:v5 error:a4];
  unint64_t v8 = v7;
  if (v7) {
    BOOL v9 = v7 == self;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9;
  if (v5 & 8) == 0 || (v10)
  {
    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
    *((unsigned char *)v7 + 24) = *((unsigned char *)v7 + 24) & 0xFC | 2;
  }
  [(FSNode *)v7 setReferringAliasNode:self];
LABEL_14:

  return v8;
}

- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5
{
  v21[4] = *(const __CFNumber **)MEMORY[0x1E4F143B8];
  if ([(FSNode *)self isDirectory])
  {
    if (-[FSNode getHFSType:creator:error:]::once != -1) {
      dispatch_once(&-[FSNode getHFSType:creator:error:]::once, &__block_literal_global_128);
    }
    v21[0] = 0;
    if ([(FSNode *)self getTemporaryResourceValue:v21 forKey:@"com.apple.LSPkgInfoKey"])
    {
LABEL_17:
      if (v21[0] == (const __CFNumber *)-[FSNode getHFSType:creator:error:]::noHFSCodes)
      {
        if (a5)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10813, (uint64_t)"-[FSNode getHFSType:creator:error:]", 2513, 0);
          LOBYTE(v18) = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }
      else if (v21[0])
      {
        XCFNumberGetHFSTypeAndCreatorCodes(v21[0], (int *)a3, (int *)a4);
        LOBYTE(v18) = 1;
LABEL_23:

        return v18;
      }
      LOBYTE(v18) = 0;
      goto LABEL_23;
    }
    BOOL v9 = [(FSNode *)self URL];
    char v10 = [v9 URLByAppendingPathComponent:@"Contents/PkgInfo" isDirectory:0];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:0 maxLength:8 error:0];
      uint64_t v12 = v11;
      if (v11 && (unint64_t)[v11 length] >= 8)
      {
        id v13 = v12;
        int v14 = (unsigned int *)[v13 bytes];
        unsigned int v16 = *v14;
        unsigned int v15 = v14[1];

        CFNumberRef v17 = XCFNumberCreateWithHFSTypeAndCreatorCodes(bswap32(v16), bswap32(v15));
LABEL_16:
        CFNumberRef v19 = v21[0];
        v21[0] = v17;

        [(FSNode *)self setTemporaryResourceValue:v21[0] forKey:@"com.apple.LSPkgInfoKey"];
        goto LABEL_17;
      }
    }
    CFNumberRef v17 = (const __CFNumber *)(id)-[FSNode getHFSType:creator:error:]::noHFSCodes;
    goto LABEL_16;
  }
  BOOL v18 = [(FSNode *)self getFinderInfo:v21 error:a5];
  if (v18)
  {
    if (a3) {
      *a3 = v21[0];
    }
    if (a4) {
      *a4 = HIDWORD(v21[0]);
    }
  }
  return v18;
}

- (BOOL)isMountTrigger
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C650], 0x10000, 0);
}

- (BOOL)isVolume
{
  BOOL v3 = [(FSNode *)self isDirectory];
  if (v3)
  {
    if (_FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C6A0], 8, 0))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(FSNode *)self isMountTrigger];
    }
  }
  return v3;
}

- (BOOL)isDirectory
{
  if ((*((unsigned char *)self + 24) & 3) != 0) {
    return (*((unsigned char *)self + 24) & 3) == 2;
  }
  else {
    return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C628], 2, 0);
  }
}

- (BOOL)hasPackageBit
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(FSNode *)self isDirectory];
  if (v3)
  {
    BOOL v4 = [(FSNode *)self getFinderInfo:v6 error:0];
    return *(_DWORD *)&v4 & ((unsigned __int16)(v7 & 0x2000) >> 13);
  }
  return v3;
}

- (BOOL)getFinderInfo:(id *)a3 error:(id *)a4
{
  if (!self || (*((unsigned char *)self + 24) & 8) == 0 || !__CFURLResourceInfoPtr())
  {
LABEL_9:
    id v13 = 0;
    if (![(FSNode *)self getResourceValue:&v13 forKey:*MEMORY[0x1E4F1CDE0] options:1 error:a4])goto LABEL_17; {
    char v10 = (_OWORD *)[v13 bytes];
    }
    if (v10 && (unint64_t)[v13 length] >= 0x20)
    {
      if (a3)
      {
        long long v11 = v10[1];
        *(_OWORD *)a3->var0 = *v10;
        *(_OWORD *)a3->var2.var1 = v11;
      }
      BOOL v9 = 1;
      goto LABEL_18;
    }
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10817, (uint64_t)"-[FSNode(FinderInfo) getFinderInfo:error:]", 2590, 0);
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_17:
      BOOL v9 = 0;
    }
LABEL_18:

    return v9;
  }
  __int16 v7 = (_OWORD *)MEMORY[0x18530E2F0]();
  if (!a3 || !v7)
  {
    if (v7) {
      return 1;
    }
    goto LABEL_9;
  }
  long long v8 = v7[1];
  *(_OWORD *)a3->var0 = *v7;
  *(_OWORD *)a3->var2.var1 = v8;
  return 1;
}

- (id)extensionWithError:(id *)a3
{
  id v13 = 0;
  if (!self || (*((unsigned char *)self + 24) & 8) == 0)
  {
    uint64_t v5 = 0;
LABEL_4:
    int v6 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = __CFURLResourceInfoPtr();
  uint64_t v5 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  MEMORY[0x18530E320](v8, @"com.apple.LSExtensionKey", &v13);
  BOOL v9 = v13;
  if (v13) {
    goto LABEL_15;
  }
  int v6 = 1;
LABEL_5:
  __int16 v7 = [(FSNode *)self nameWithError:a3];
  if (v7)
  {
    _CFGetPathExtensionRangesFromPathComponent();
    id v13 = &stru_1ECB1A570;
  }

  BOOL v9 = v13;
  if (v13) {
    int v10 = v6;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    MEMORY[0x18530E330](v5, @"com.apple.LSExtensionKey");
    BOOL v9 = v13;
  }
LABEL_15:
  long long v11 = v9;

  return v11;
}

- (id)nameWithError:(id *)a3
{
  id v12 = 0;
  if (!self
    || (*((unsigned char *)self + 24) & 8) == 0
    || !__CFURLResourceInfoPtr()
    || (MEMORY[0x18530E310](), (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (![(FSNode *)self getResourceValue:&v12 forKey:*MEMORY[0x1E4F1C6E8] options:1 error:a3])
    {
      uint64_t v5 = [(FSNode *)self URL];
      char v6 = [v5 isFileReferenceURL];

      if ((v6 & 1) == 0)
      {
        __int16 v7 = [(FSNode *)self URL];
        uint64_t v8 = [v7 lastPathComponent];
        id v9 = v12;
        id v12 = v8;
      }
    }
  }
  id v10 = v12;

  return v10;
}

- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0;
  BOOL v5 = [(FSNode *)self getResourceValue:&v8 forKey:*MEMORY[0x1E4F1CEF8] options:1 error:a4];
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)isResolvable
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C610], 0x8000, 0);
}

- (BOOL)isAVCHDCollection
{
  if ([(FSNode *)self isDirectory])
  {
    BOOL v3 = [(FSNode *)self nameWithError:0];
    BOOL v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 length];
      if (v5 == 4)
      {
        char v6 = @"BDMV";
        __int16 v7 = @"INDEX.BDMV";
        id v8 = @"INDEX.BDM";
        id v9 = @"index.bdmv";
        id v10 = @"index.bdm";
      }
      else
      {
        if (v5 != 5) {
          goto LABEL_9;
        }
        char v6 = @"AVCHD";
        __int16 v7 = @"BDMV/INDEX.BDMV";
        id v8 = @"BDMV/INDEX.BDM";
        id v9 = @"BDMV/index.bdmv";
        id v10 = @"BDMV/index.bdm";
      }
      if (![v4 caseInsensitiveCompare:v6])
      {
        BOOL v11 = [(FSNode *)self childNodeWithRelativePathExists:v10]
           || [(FSNode *)self childNodeWithRelativePathExists:v8]
           || [(FSNode *)self childNodeWithRelativePathExists:v9]
           || [(FSNode *)self childNodeWithRelativePathExists:v7];
        goto LABEL_10;
      }
    }
LABEL_9:
    BOOL v11 = 0;
LABEL_10:

    return v11;
  }
  return 0;
}

- (BOOL)isRegularFile
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C670], 1, 0);
}

- (BOOL)getTemporaryResourceValue:(id *)a3 forKey:(id)a4
{
  return [(FSNode *)self getResourceValue:a3 forKey:a4 options:0 error:0];
}

- (void)setTemporaryResourceValue:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    CFURLRef v6 = [(FSNode *)self URL];
    CFURLSetTemporaryResourcePropertyForKey(v6, (CFStringRef)a4, a3);
  }
}

- (BOOL)isSymbolicLink
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C680], 4, 0);
}

- (BOOL)isExecutable
{
  if (![(FSNode *)self isRegularFile]) {
    return 0;
  }
  BOOL v3 = [(FSNode *)self extensionWithError:0];
  BOOL v4 = v3;
  if (v3 && [v3 length]
    || ![(FSNode *)self isExecutableModeFile]
    || (int v8 = 1061109567, ![(FSNode *)self getHFSType:&v8 creator:0 error:0]))
  {
    BOOL v6 = 0;
  }
  else
  {
    if (v8) {
      BOOL v5 = v8 == 1061109567;
    }
    else {
      BOOL v5 = 1;
    }
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)isAliasFile
{
  BOOL v3 = [(FSNode *)self isResolvable];
  if (v3) {
    LOBYTE(v3) = ![(FSNode *)self isSymbolicLink];
  }
  return v3;
}

- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0;
  BOOL v5 = [(FSNode *)self getResourceValue:&v8 forKey:*MEMORY[0x1E4F1CE00] options:1 error:a4];
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (id)pathWithError:(id *)a3
{
  return [(FSNode *)self canonical:0 pathWithError:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  return [(FSNode *)self getResourceValue:a3 forKey:a4 options:0 error:a5];
}

- (void)prepareForReuse
{
  if ((*((unsigned char *)self + 24) & 0x10) == 0)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"FSUtils.mm", 280, @"Attempted to prepare FSNode %p for reuse, but it was already prepared.", self object file lineNumber description];
  }
  url = self->_url;
  self->_url = 0;

  [(FSNode *)self setReferringAliasNode:0];
  *((unsigned char *)self + 24) &= ~0x10u;
}

- (void)setReferringAliasNode:(id)a3
{
  if (a3)
  {
    char v4 = 4;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0) {
      return;
    }
    char v4 = 0;
  }
  objc_setAssociatedObject(self, &_kFSNodeReferringAliasNodeKey, a3, (void *)1);
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFB | v4;
}

- (BOOL)hasHiddenExtension
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C608], 256, 0);
}

- (BOOL)isBusyDirectory
{
  return 0;
}

- (BOOL)isSideFault
{
  BOOL v3 = [(FSNode *)self nameWithError:0];
  if (v3 && _CFURLIsPromiseName())
  {
    char v4 = [(FSNode *)self URL];
    BOOL v5 = _CFURLIsItemPromiseAtURL() != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (FSNode)initWithCoder:(id)a3
{
  BOOL v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
  char v6 = v5;
  if (v5 && ([v5 isFileURL] & 1) != 0)
  {
    char v7 = [a3 decodeInt64ForKey:@"isDirectory"];
    id v8 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"referringAliasNode");
    id v13 = 0;
    id v9 = [(FSNode *)self initWithURL:v6 flags:0 error:&v13];
    id v10 = v13;
    if (v9)
    {
      *((unsigned char *)v9 + 24) = *((unsigned char *)v9 + 24) & 0xFC | v7 & 3;
      if (v8) {
        [(FSNode *)v9 setReferringAliasNode:v8];
      }
    }
    else
    {
      [a3 failWithError:v10];
    }
  }
  else
  {
    BOOL v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[FSNode initWithCoder:]", 450, 0);
    [a3 failWithError:v11];

    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(FSNode *)self URL];
  objc_msgSend(a3, "encodeObject:forKey:");

  [a3 encodeInt64:*((unsigned char *)self + 24) & 3 forKey:@"isDirectory"];
  id v6 = [(FSNode *)self referringAliasNode];
  objc_msgSend(a3, "encodeObject:forKey:");
}

- (id)referringAliasNode
{
  if ((*((unsigned char *)self + 24) & 4) != 0)
  {
    v2 = objc_getAssociatedObject(self, &_kFSNodeReferringAliasNodeKey);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)checkResourceIsReachableAndReturnError:(id *)a3
{
  uint64_t v4 = 0;
  return [(FSNode *)self getFileIdentifier:&v4 error:a3];
}

- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0;
  BOOL v5 = [(FSNode *)self getResourceValue:&v8 forKey:*MEMORY[0x1E4F1CDD0] options:1 error:a4];
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4
{
  char v6 = [(FSNode *)self pathWithError:a4];
  char v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (([v6 getFileSystemRepresentation:a3 maxLength:1024] & 1) == 0)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -2110, (uint64_t)"-[FSNode getFileSystemRepresentation:error:]", 1374, 0);
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

void __35__FSNode_getHFSType_creator_error___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  v1 = (void *)-[FSNode getHFSType:creator:error:]::noHFSCodes;
  -[FSNode getHFSType:creator:error:]::noHFSCodes = (uint64_t)v0;
}

- (BOOL)canIssueIO
{
  return 1;
}

- (id)volumeNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v9 = 0;
  if ([(FSNode *)self getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C960] options:1 error:a4])
  {
    char v6 = [FSNode alloc];
    char v7 = [(FSNode *)v6 initWithURL:v9 flags:a3 | 8 error:a4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4
{
  return _FSNodeGetTimestampValue(self, *MEMORY[0x1E4F1C530], a3, a4);
}

- (NSString)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v3 = *((unsigned char *)self + 24);
  bzero(v8, 0x400uLL);
  if (![(FSNode *)self getFileSystemRepresentation:v8 error:0]) {
    v8[0] = 63;
  }
  if ((v3 & 3) == 2) {
    unsigned int v4 = 121;
  }
  else {
    unsigned int v4 = 63;
  }
  if ((v3 & 3) == 1) {
    uint64_t v5 = 110;
  }
  else {
    uint64_t v5 = v4;
  }
  char v6 = [NSString stringWithFormat:@"<FSNode %p> { isDir = %c, path = '%s' }", self, v5, v8];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = self;
  id v6 = a3;
  char v7 = [(FSNode *)v5 URL];
  uint64_t v8 = [v6 URL];
  uint64_t v9 = (void *)v8;
  if (v7 && v8 && ([v7 isEqual:v8] & 1) != 0)
  {
    char v10 = 1;
  }
  else
  {
    id v14 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1C5A0];
    if ([(FSNode *)v5 getResourceValue:&v14 forKey:*MEMORY[0x1E4F1C5A0] options:1 error:0])
    {
      id v13 = 0;
      if ([v6 getResourceValue:&v13 forKey:v11 options:1 error:0]) {
        char v10 = [v14 isEqual:v13];
      }
      else {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  id v4 = 0;
  if ([(FSNode *)self getResourceValue:&v4 forKey:*MEMORY[0x1E4F1CDD0] options:1 error:0])
  {
    unint64_t v2 = [v4 hash];
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

- (id)redactedDescription
{
  int v2 = *((unsigned char *)self + 24) & 3;
  if (v2 == 2) {
    LODWORD(v3) = 121;
  }
  else {
    LODWORD(v3) = 63;
  }
  if (v2 == 1) {
    uint64_t v3 = 110;
  }
  else {
    uint64_t v3 = v3;
  }
  id v4 = [NSString stringWithFormat:@"<FSNode %p> { isDir = %c, path = <private> }", self, v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(FSNode *)self URL];
    if (v5)
    {
      if ([(id)__LSDefaultsGetSharedInstance() hasServer])
      {
        id v6 = v5;
        char v7 = *(void **)(v4 + 8);
        *(void *)(v4 + 8) = v6;
      }
      else
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
        char v7 = [v5 relativeString];
        uint64_t v9 = [v5 baseURL];
        uint64_t v10 = [v8 initWithString:v7 relativeToURL:v9];
        uint64_t v11 = *(void **)(v4 + 8);
        *(void *)(v4 + 8) = v10;
      }
    }

    *(void *)(v4 + 16) = self->_cacheExpiration;
    *(unsigned char *)(v4 + 24) = *(unsigned char *)(v4 + 24) & 0xFC | *((unsigned char *)self + 24) & 3;
    id v12 = [(FSNode *)self referringAliasNode];
    if (v12) {
      [(id)v4 setReferringAliasNode:v12];
    }
    *(unsigned char *)(v4 + 24) &= ~8u;
    uint64_t v13 = mach_absolute_time();
    if (_FSNodeInfoLifetimeAbsolute(void)::once != -1) {
      dispatch_once(&_FSNodeInfoLifetimeAbsolute(void)::once, &__block_literal_global_422);
    }
    *(void *)(v4 + 16) = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v13;
    *(unsigned char *)(v4 + 24) = *(unsigned char *)(v4 + 24) & 0xEF | *((unsigned char *)self + 24) & 0x10;
  }
  return (id)v4;
}

- (FSNode)initWithPath:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a3 isDirectory:(a4 >> 3) & 1];
    uint64_t v9 = [(FSNode *)self initWithURL:v8 flags:v7 error:a5];
  }
  else
  {
    if (a5)
    {
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"path";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode initWithPath:flags:error:]", 525, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  return v9;
}

- (FSNode)initWithDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 lastPathComponent:(id)a5 createIntermediateDirectories:(BOOL)a6 flags:(unsigned int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  BOOL v10 = a6;
  unsigned int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned int v16 = [v15 URLsForDirectory:a3 inDomains:a4];

  if (v16
    && [v16 count]
    && (([v16 objectAtIndexedSubscript:0], CFNumberRef v17 = objc_claimAutoreleasedReturnValue(), !a5)
     || ![a5 length]
      ? (id v18 = v17)
      : ([v17 URLByAppendingPathComponent:a5 isDirectory:(v9 >> 3) & 1],
         id v18 = (id)objc_claimAutoreleasedReturnValue()),
        CFNumberRef v19 = v18,
        v17,
        v19))
  {

    if (self && v10)
    {
      id v20 = v19;
      BOOL v21 = v20;
      v22 = v20;
      if ((v9 & 8) == 0)
      {
        uint64_t v23 = [v20 URLByDeletingLastPathComponent];

        v22 = (void *)v23;
      }
      uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v25 = [v24 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:0 error:a8];

      if ((v25 & 1) == 0)
      {

        self = 0;
      }
    }
    if (self) {
      self = [(FSNode *)self initWithURL:v19 flags:v9 error:a8];
    }
  }
  else
  {
    if (a8)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -120, (uint64_t)"-[FSNode initWithDirectory:inDomain:lastPathComponent:createIntermediateDirectories:flags:error:]", 570, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    CFNumberRef v19 = 0;
    self = 0;
  }

  return self;
}

- (FSNode)initWithConfigurationString:(int)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (confstr(a3, v10, 0x400uLL)) {
    return [(FSNode *)self initWithFileSystemRepresentation:v10 flags:v6 error:a5];
  }
  if (a5)
  {
    uint64_t v9 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v9, (uint64_t)"-[FSNode initWithConfigurationString:flags:error:]", 607, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)setResourceValue:(id)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a4 && ((a5 & 2) == 0 ? (BOOL v8 = a3 == 0) : (BOOL v8 = 0), !v8 ? (v9 = 0) : (v9 = 1), (a5 & 1) != 0 && (v9 & 1) == 0))
  {
    id v17 = 0;
    CFURLRef v11 = [(FSNode *)self URL];
    CFURLRef v12 = v11;
    if (a6) {
      uint64_t v13 = (CFErrorRef *)&v17;
    }
    else {
      uint64_t v13 = 0;
    }
    BOOL v14 = CFURLSetResourcePropertyForKey(v11, (CFStringRef)a4, a3, v13) != 0;

    if (a6 != 0 && !v14) {
      *a6 = v17;
    }
  }
  else
  {
    if (a6)
    {
      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"invalid input parameters";
      unsigned int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode setResourceValue:forKey:options:error:]", 851, v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  return v14;
}

- (void)removeCachedResourceValueForKey:(id)a3
{
  if (a3)
  {
    CFURLRef v4 = [(FSNode *)self URL];
    CFURLClearResourcePropertyCacheForKey(v4, (CFStringRef)a3);
  }
}

- (id)sideFaultResourceValuesWithError:(id *)a3
{
  uint64_t v5 = -[FSNode nameWithError:](self, "nameWithError:");
  if (!v5)
  {
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  if (!_CFURLIsPromiseName())
  {
    if (a3)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10817, (uint64_t)"-[FSNode sideFaultResourceValuesWithError:]", 897, 0);
      uint64_t v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v6 = [(FSNode *)self URL];
  uint64_t v7 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();

  if (a3 && !v7) {
    *a3 = 0;
  }

LABEL_10:

  return v7;
}

- (BOOL)childNodeWithRelativePathExists:(id)a3
{
  uint64_t v3 = [(FSNode *)self childNodeWithRelativePath:a3 flags:1 error:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)childNodeWithRelativePath:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    if ([a3 length])
    {
      if ((v6 & 8) != 0) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = [a3 hasSuffix:@"/"];
      }
      CFURLRef v12 = [(FSNode *)self URL];
      uint64_t v13 = [v12 path];
      BOOL v14 = [v13 stringByAppendingPathComponent:a3];

      if (v14)
      {
        unsigned int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v14 isDirectory:v9];

        if (v15)
        {
          unsigned int v16 = [[FSNode alloc] initWithURL:v15 flags:v6 error:a5];

          goto LABEL_17;
        }
        goto LABEL_16;
      }
      if (a5)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -2110, (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]", 954, 0);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -37, (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]", 962, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      unsigned int v16 = 0;
      *a5 = v11;
      goto LABEL_17;
    }
  }
  else if (a5)
  {
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"childPath";
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]", 966, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  unsigned int v16 = 0;
LABEL_17:

  return v16;
}

- (id)diskImageURLWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v6 = 0;
  [(FSNode *)self getResourceValue:&v6 forKey:*MEMORY[0x1E4F1CD98] options:1 error:a4];
  id v4 = v6;

  return v4;
}

+ (id)_resolvedURLFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v5 = a5;
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = [a3 URL];
    if ((a4 & 0x80) != 0) {
      uint64_t v8 = ~(a4 << 6) & 0x100;
    }
    else {
      uint64_t v8 = ~(a4 << 6) & 0x100 | 0x200;
    }
    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLByResolvingAliasFileAtURL:v7 options:v8 error:v5];
  }
  else if (a5)
  {
    uint64_t v11 = *MEMORY[0x1E4F28228];
    v12[0] = @"node";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[FSNode _resolvedURLFromAliasFile:flags:error:]", 1040, v9);
    *uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_resolvedNodeFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v9 = [a1 _resolvedURLFromAliasFile:a3 flags:*(void *)&a4 error:a5];
    BOOL v10 = v9;
    if (v9)
    {
      if ([v9 isFileURL])
      {
        uint64_t v11 = (unsigned char *)[objc_alloc((Class)a1) initWithURL:v10 flags:a4 & 0xFFFFFFFD error:a5];
        if (v11 && _CFURLGetResourcePropertyFlags()) {
          v11[24] = v11[24] & 0xFC | 1;
        }
      }
      else
      {
        uint64_t v11 = a3;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    goto LABEL_11;
  }
  if (a5)
  {
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = @"node";
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[FSNode _resolvedNodeFromAliasFile:flags:error:]", 1078, v10);
    uint64_t v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

- (id)temporaryDirectoryNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v6 temporaryDirectory];

  if (v7)
  {
    uint64_t v8 = [[FSNode alloc] initWithURL:v7 flags:a3 | 8 error:a4];
  }
  else if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -120, (uint64_t)"-[FSNode temporaryDirectoryNodeWithFlags:error:]", 1154, 0);
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)getIsDirectory_NoIO:(BOOL *)a3
{
  id v7 = 0;
  BOOL v4 = [(FSNode *)self getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C628] options:0 error:0];
  char v5 = !v4;
  if (!a3) {
    char v5 = 1;
  }
  if ((v5 & 1) == 0) {
    *a3 = [v7 BOOLValue];
  }

  return v4;
}

- (BOOL)isExecutableModeFile
{
  if (![(FSNode *)self isRegularFile]) {
    return 0;
  }
  id v5 = 0;
  if ([(FSNode *)self getResourceValue:&v5 forKey:*MEMORY[0x1E4F1CED0] options:1 error:0])
  {
    BOOL v3 = ([v5 unsignedLongLongValue] & 0x49) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isHidden
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C648], 128, 0);
}

+ (id)rootVolumeNode
{
  if (+[FSNode rootVolumeNode]::once != -1) {
    dispatch_once(&+[FSNode rootVolumeNode]::once, &__block_literal_global_0);
  }
  int v2 = (void *)+[FSNode rootVolumeNode]::result;

  return v2;
}

void __24__FSNode_rootVolumeNode__block_invoke()
{
  id v0 = [FSNode alloc];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode rootVolumeNode]::result;
  +[FSNode rootVolumeNode]::result = v1;
}

+ (id)prebootVolumeNode
{
  if (+[FSNode prebootVolumeNode]::onceToken != -1) {
    dispatch_once(&+[FSNode prebootVolumeNode]::onceToken, &__block_literal_global_75);
  }
  int v2 = (void *)+[FSNode prebootVolumeNode]::result;

  return v2;
}

void __27__FSNode_prebootVolumeNode__block_invoke()
{
  id v0 = [FSNode alloc];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/private/preboot" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode prebootVolumeNode]::result;
  +[FSNode prebootVolumeNode]::result = v1;
}

+ (id)systemDataVolumeNode
{
  if (+[FSNode systemDataVolumeNode]::once != -1) {
    dispatch_once(&+[FSNode systemDataVolumeNode]::once, &__block_literal_global_80);
  }
  int v2 = (void *)+[FSNode systemDataVolumeNode]::result;

  return v2;
}

void __30__FSNode_systemDataVolumeNode__block_invoke()
{
  id v0 = [FSNode alloc];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/private/var" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode systemDataVolumeNode]::result;
  +[FSNode systemDataVolumeNode]::result = v1;
}

+ (id)userDataVolumeNode
{
  if (+[FSNode userDataVolumeNode]::once != -1) {
    dispatch_once(&+[FSNode userDataVolumeNode]::once, &__block_literal_global_85);
  }
  int v2 = (void *)+[FSNode userDataVolumeNode]::result;

  return v2;
}

void __28__FSNode_userDataVolumeNode__block_invoke()
{
  id v0 = [FSNode alloc];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/private/var/mobile" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode userDataVolumeNode]::result;
  +[FSNode userDataVolumeNode]::result = v1;
}

- (BOOL)isSecuredSystemContent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __32__FSNode_isSecuredSystemContent__block_invoke;
  v13[3] = &unk_1E522BA28;
  v13[4] = self;
  v13[5] = a2;
  if (-[FSNode isSecuredSystemContent]::once != -1) {
    dispatch_once(&-[FSNode isSecuredSystemContent]::once, v13);
  }
  uint64_t NonFictionalDeviceNumber = _FSNodeGetNonFictionalDeviceNumber(self);
  uint64_t v4 = NonFictionalDeviceNumber;
  if (NonFictionalDeviceNumber)
  {
    id v5 = -[FSNode isSecuredSystemContent]::securedDeviceNumber;
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      BOOL v8 = v7 != 0;
      if (v7) {
        BOOL v9 = NonFictionalDeviceNumber == v6;
      }
      else {
        BOOL v9 = 1;
      }
    }
    while (!v9);
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v10 = _LSDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    CFURLRef v12 = "NO";
    *(_DWORD *)buf = 136315650;
    if (v8) {
      CFURLRef v12 = "YES";
    }
    unsigned int v15 = v12;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    CFNumberRef v19 = self;
    _os_log_debug_impl(&dword_182959000, v10, OS_LOG_TYPE_DEBUG, "FSNode.isSecuredSystemContent=%s: device number %llu for %@", buf, 0x20u);
  }

  return v8;
}

void __32__FSNode_isSecuredSystemContent__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v15[0] = +[FSNode rootVolumeNode];
  +[FSNode prebootVolumeNode];
  uint64_t v1 = 0;
  v15[1] = unsigned int v2 = 0;
  do
  {
    id v3 = (FSNode *)(id)v15[v1];
    uint64_t NonFictionalDeviceNumber = _FSNodeGetNonFictionalDeviceNumber(v3);
    -[FSNode isSecuredSystemContent]::securedDeviceNumber[v2] = NonFictionalDeviceNumber;
    if (NonFictionalDeviceNumber)
    {
      id v5 = _LSDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = -[FSNode isSecuredSystemContent]::securedDeviceNumber[v2];
        *(_DWORD *)buf = 134218242;
        uint64_t v12 = v6;
        __int16 v13 = 2112;
        BOOL v14 = v3;
        _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "Found secured device number %llu for %@", buf, 0x16u);
      }

      ++v2;
    }
    else
    {
      uint64_t v7 = _LSDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = (uint64_t)v3;
        _os_log_error_impl(&dword_182959000, v7, OS_LOG_TYPE_ERROR, "Secured device number is zero for %@", buf, 0xCu);
      }
    }
    ++v1;
  }
  while (v1 != 2);
  if (v2 > 2)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"FSUtils.mm" lineNumber:1819 description:@"Too many secure device numbers"];
  }
  for (uint64_t i = 1; i != -1; --i)
}

- (BOOL)isOnDiskImage
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1CF18], 0, 512);
}

- (BOOL)isOnLocalVolume
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E4F1C858], 0, 1);
}

- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4
{
  id v8 = 0;
  BOOL v5 = [(FSNode *)self getResourceValue:&v8 forKey:*MEMORY[0x1E4F1CEF0] options:1 error:a4];
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4
{
  id v8 = 0;
  BOOL v5 = [(FSNode *)self getResourceValue:&v8 forKey:*MEMORY[0x1E4F1CEA8] options:1 error:a4];
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (__CFBundle)copyCFBundleWithError:(id *)a3
{
  if (![(FSNode *)self canReadFromSandboxWithAuditToken:0])
  {
    if (a3)
    {
      id v8 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v9 = -10659;
      uint64_t v10 = 2329;
LABEL_10:
      _LSMakeNSErrorImpl(v8, v9, (uint64_t)"-[FSNode copyCFBundleWithError:]", v10, 0);
      Unique = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return Unique;
    }
    return 0;
  }
  BOOL v5 = [(FSNode *)self URL];
  Unique = (__CFBundle *)_CFBundleCreateUnique();

  if (!Unique)
  {
    if (a3)
    {
      id v8 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v9 = -10813;
      uint64_t v10 = 2326;
      goto LABEL_10;
    }
    return 0;
  }
  uint64_t v7 = CFBundleGetIdentifier(Unique);
  if (v7) {
    [(FSNode *)self setTemporaryResourceValue:v7 forKey:@"com.apple.LSBundleIdentifierKey"];
  }

  return Unique;
}

- (id)bundleInfoDictionaryWithError:(id *)a3
{
  CFDictionaryRef v13 = 0;
  if (![(FSNode *)self getTemporaryResourceValue:&v13 forKey:@"com.apple.LSBundleInfoDictionaryKey"])
  {
    CFURLRef v5 = [(FSNode *)self URL];
    CFDictionaryRef v6 = CFBundleCopyInfoDictionaryForURL(v5);
    CFDictionaryRef v7 = v13;
    CFDictionaryRef v13 = v6;

    if (v13) {
      CFDictionaryRef v8 = v13;
    }
    else {
      CFDictionaryRef v8 = (CFDictionaryRef)MEMORY[0x1E4F1CC08];
    }
    [(FSNode *)self setTemporaryResourceValue:v8 forKey:@"com.apple.LSBundleInfoDictionaryKey"];
  }
  if (!v13)
  {
    CFDictionaryRef v10 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v9 = [(__CFDictionary *)v13 count];
  CFDictionaryRef v10 = v13;
  if (!v9)
  {
    CFDictionaryRef v13 = 0;

    CFDictionaryRef v10 = v13;
  }
  if (a3)
  {
LABEL_12:
    if (!v10)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10813, (uint64_t)"-[FSNode bundleInfoDictionaryWithError:]", 2357, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      CFDictionaryRef v10 = v13;
    }
  }
LABEL_14:
  CFDictionaryRef v11 = v10;

  return v11;
}

- (id)bundleIdentifierWithError:(id *)a3
{
  return [(FSNode *)self bundleIdentifierWithContext:0 error:a3];
}

- (id)bundleIdentifierWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  BOOL v7 = [(FSNode *)self getTemporaryResourceValue:&v20 forKey:@"com.apple.LSBundleIdentifierKey"];
  if (v20) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    if (a3)
    {
      *(void *)buf = 0;
      if (!_LSBundleFindWithNode((uint64_t)a3, self, 0, buf) && *(void *)buf)
      {
        uint64_t v9 = _CSStringCopyCFString();
        CFDictionaryRef v10 = v20;
        uint64_t v20 = v9;
      }
    }
    else
    {
      CFDictionaryRef v11 = [(FSNode *)self copyCFBundleWithError:a4];
      uint64_t v12 = v11;
      if (v11)
      {
        CFDictionaryRef v13 = CFBundleGetIdentifier(v11);
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v14 = v13;
            unsigned int v15 = v20;
            uint64_t v20 = v14;
          }
          else
          {
            unsigned int v15 = _LSDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              __int16 v16 = [(FSNode *)self URL];
              uint64_t v17 = [v16 absoluteString];
              [(FSNode *)v17 bundleIdentifierWithContext:v15 error:v16];
            }
          }
        }
        CFRelease(v12);
      }
    }
    if (v20)
    {
      [(FSNode *)self setTemporaryResourceValue:v20 forKey:@"com.apple.LSBundleIdentifierKey"];
    }
    else if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10813, (uint64_t)"-[FSNode bundleIdentifierWithContext:error:]", 2406, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  __int16 v18 = v20;

  return v18;
}

- (BOOL)getCreationDate:(double *)a3 error:(id *)a4
{
  return _FSNodeGetTimestampValue(self, *MEMORY[0x1E4F1C540], a3, a4);
}

- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0;
  BOOL v5 = [(FSNode *)self getResourceValue:&v8 forKey:*MEMORY[0x1E4F1C5F8] options:1 error:a4];
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getWriterBundleIdentifier:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[FSNode getWriterBundleIdentifier:error:]", 2550, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setFinderInfo:(id *)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    char v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a3 length:32 freeWhenDone:0];
    if (v6)
    {
      BOOL v7 = [(FSNode *)self setResourceValue:v6 forKey:*MEMORY[0x1E4F1CDE0] options:3 error:a4];
    }
    else if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -41, (uint64_t)"-[FSNode(FinderInfo) setFinderInfo:error:]", 2613, 0);
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v10 = *MEMORY[0x1E4F28228];
      v11[0] = @"finderInfo";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(FinderInfo) setFinderInfo:error:]", 2617, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  return v7;
}

+ (BOOL)canAccessURL:(id)a3 withAuditToken:(id *)a4 operation:(const char *)a5
{
  if (a3 && (a4 || _LSGetAuditTokenForSelf()))
  {
    id v12 = 0;
    int v6 = [a3 getResourceValue:&v12 forKey:*MEMORY[0x1E4F1C520] error:0];
    id v7 = v12;
    id v8 = v7;
    if (!v6 || ![v7 length]) {
      goto LABEL_11;
    }
    uint64_t v9 = fileSystemRealPath(v8, 0);

    if (!v9)
    {
      BOOL v10 = 0;
      id v8 = 0;
      goto LABEL_12;
    }
    if (![v9 length])
    {
      BOOL v10 = 0;
      id v8 = v9;
      goto LABEL_12;
    }
    id v8 = v9;
    if ([v8 fileSystemRepresentation]) {
      BOOL v10 = sandbox_check_by_audit_token() == 0;
    }
    else {
LABEL_11:
    }
      BOOL v10 = 0;
LABEL_12:

    return v10;
  }
  return 0;
}

+ (BOOL)canAccessURL:(id)a3 fromSandboxWithAuditToken:(id *)a4 operation:(const char *)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = (uint64_t)a4;
  if (!a4)
  {
    uint64_t v6 = _LSGetAuditTokenForSelf();
    if (!v6) {
      return 0;
    }
  }
  id v8 = objc_opt_class();

  return [v8 canAccessURL:a3 withAuditToken:v6 operation:a5];
}

- (BOOL)canReadWithAuditToken:(id *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(FSNode *)self URL];
  LOBYTE(a3) = [v5 canReadURL:v6 withAuditToken:a3];

  return (char)a3;
}

- (BOOL)canWriteWithAuditToken:(id *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(FSNode *)self URL];
  LOBYTE(a3) = [v5 canWriteURL:v6 withAuditToken:a3];

  return (char)a3;
}

- (BOOL)canReadMetadataWithAuditToken:(id *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(FSNode *)self URL];
  LOBYTE(a3) = [v5 canReadMetadataOfURL:v6 withAuditToken:a3];

  return (char)a3;
}

+ (BOOL)canReadURL:(id)a3 withAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 withAuditToken:a4 operation:"file-read-data"];
}

+ (BOOL)canWriteURL:(id)a3 withAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 withAuditToken:a4 operation:"file-write-data"];
}

+ (BOOL)canReadMetadataOfURL:(id)a3 withAuditToken:(id *)a4
{
  if ([a1 canAccessURL:a3 withAuditToken:a4 operation:"file-read-metadata"]) {
    return 1;
  }
  id v8 = [a3 URLByDeletingLastPathComponent];
  if (v8) {
    char v7 = [a1 canReadURL:v8 withAuditToken:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)canReadFromSandboxWithAuditToken:(id *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(FSNode *)self URL];
  LOBYTE(a3) = [v5 canReadURL:v6 fromSandboxWithAuditToken:a3];

  return (char)a3;
}

- (BOOL)canWriteFromSandboxWithAuditToken:(id *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(FSNode *)self URL];
  LOBYTE(a3) = [v5 canWriteURL:v6 fromSandboxWithAuditToken:a3];

  return (char)a3;
}

- (BOOL)canReadMetadataFromSandboxWithAuditToken:(id *)a3
{
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(FSNode *)self URL];
  LOBYTE(a3) = [v5 canReadMetadataOfURL:v6 fromSandboxWithAuditToken:a3];

  return (char)a3;
}

+ (BOOL)canReadURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 fromSandboxWithAuditToken:a4 operation:"file-read-data"];
}

+ (BOOL)canWriteURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 fromSandboxWithAuditToken:a4 operation:"file-write-data"];
}

+ (BOOL)canReadMetadataOfURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  if ([a1 canAccessURL:a3 fromSandboxWithAuditToken:a4 operation:"file-read-metadata"]) {
    return 1;
  }
  id v8 = [a3 URLByDeletingLastPathComponent];
  if (v8) {
    char v7 = [a1 canReadURL:v8 fromSandboxWithAuditToken:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)extendedAttributeWithName:(id)a3 options:(int)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 length])
  {
    if (a5)
    {
      uint64_t v24 = *MEMORY[0x1E4F28228];
      char v25 = @"name";
      __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3495, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (![(FSNode *)self getFileSystemRepresentation:path error:a5])
  {
LABEL_12:
    id v15 = 0;
    goto LABEL_13;
  }
  if (([a3 getCString:name maxLength:128 encoding:4] & 1) == 0)
  {
    if (a5)
    {
      uint64_t v26 = *MEMORY[0x1E4F28228];
      id v27 = @"Extended attribute name too long or invalid.";
      __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3460, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  ssize_t v9 = getxattr(path, name, 0, 0, 0, a4);
  ssize_t v10 = v9;
  if (v9 < 1)
  {
    if (v9)
    {
      if (a5)
      {
        CFNumberRef v19 = __error();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v19, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3490, 0);
        id v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1C9B8] data];
      if (v15) {
        goto LABEL_13;
      }
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]"];
      [v22 handleFailureInFunction:v23 file:@"FSUtils.mm" lineNumber:3487 description:@"Failed to allocate empty NSData."];
    }
    goto LABEL_12;
  }
  CFDictionaryRef v11 = [MEMORY[0x1E4F1CA58] dataWithLength:v9];
  id v12 = v11;
  if (!v11)
  {
    if (!a5) {
      goto LABEL_30;
    }
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -41, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3482, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
    id v15 = 0;
    *a5 = v20;
    goto LABEL_31;
  }
  id v13 = v11;
  ssize_t v14 = getxattr(path, name, (void *)[v13 mutableBytes], objc_msgSend(v13, "length"), 0, a4);
  if (v14 < 0)
  {
    if (!a5) {
      goto LABEL_30;
    }
    BOOL v21 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v21, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3471, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (v14 != v10)
  {
    if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -1304, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3475, 0);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_30:
    id v15 = 0;
    goto LABEL_31;
  }
  id v15 = v13;
LABEL_31:

LABEL_13:

  return v15;
}

- (BOOL)setExtendedAttribute:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a4 || ![a4 length])
  {
    if (a6)
    {
      uint64_t v19 = *MEMORY[0x1E4F28228];
      id v20 = @"name";
      ssize_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]", 3537, v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  BOOL v11 = [(FSNode *)self getFileSystemRepresentation:path error:a6];
  if (!v11) {
    return v11;
  }
  if (([a4 getCString:name maxLength:128 encoding:4] & 1) == 0)
  {
    if (a6)
    {
      uint64_t v21 = *MEMORY[0x1E4F28228];
      uint64_t v22 = @"Extended attribute name too long or invalid.";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]", 3513, v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_9:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (a3)
  {
    id v12 = a3;
    BOOL v13 = setxattr(path, name, (const void *)[v12 bytes], objc_msgSend(v12, "length"), 0, a5) == 0;
  }
  else
  {
    if (!removexattr(path, name, a5))
    {
      LOBYTE(v11) = 1;
      return v11;
    }
    BOOL v13 = *__error() == 93;
  }
  LOBYTE(v11) = v13;
  if (a6 && !v11)
  {
    __int16 v16 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v16, (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]", 3532, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    *a6 = v17;
  }
  return v11;
}

- (id)bookmarkDataRelativeToNode:(id)a3 error:(id *)a4
{
  return [(FSNode *)self bookmarkDataWithOptions:0x20000000 relativeToNode:a3 error:a4];
}

- (id)bookmarkDataWithOptions:(unint64_t)a3 relativeToNode:(id)a4 error:(id *)a5
{
  -[FSNode canonicalPathWithError:](self, "canonicalPathWithError:", a5, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  id v8 = (void *)MEMORY[0x18530F680]();
  if ([(FSNode *)self isDirectory])
  {
    if (([v7 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v9 = [v7 stringByAppendingString:@"/"];

      id v7 = (id)v9;
    }
  }
  else
  {
    while ([v7 hasSuffix:@"/"])
    {
      uint64_t v15 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v7, "length") - 1, 1, &stru_1ECB1A570);

      id v7 = (id)v15;
    }
  }
  id v7 = v7;
  ssize_t v10 = (const char *)[v7 fileSystemRepresentation];
  if (!v10)
  {
    if (a5)
    {
      uint64_t v13 = 3722;
      uint64_t v14 = -2110;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:strlen(v10)];
  id v12 = (void *)v11;
  if (a5 && !v11)
  {
    uint64_t v13 = 3718;
    uint64_t v14 = -41;
LABEL_13:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v14, (uint64_t)"-[FSNode(BookmarkData) bookmarkDataWithOptions:relativeToNode:error:]", v13, 0);
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v12;
}

+ (unsigned)compareBookmarkData:(id)a3 toBookmarkData:(id)a4
{
  return [a3 isEqual:a4] ^ 1;
}

+ (id)nameForBookmarkData:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = [a1 pathForBookmarkData:a3 error:a4];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 lastPathComponent];
      id v8 = (void *)v7;
      if (a4 && !v7)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -37, (uint64_t)"+[FSNode(BookmarkData) nameForBookmarkData:error:]", 3868, 0);
        id v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v11 = *MEMORY[0x1E4F28228];
      v12[0] = @"bookmark";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[FSNode(BookmarkData) nameForBookmarkData:error:]", 3872, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)getVolumeIdentifier:(unint64_t *)a3 forBookmarkData:(id)a4 error:(id *)a5
{
  id v7 = [[FSNode alloc] initByResolvingBookmarkData:a4 relativeToNode:0 bookmarkDataIsStale:0 error:a5];
  id v8 = v7;
  if (v7) {
    char v9 = [v7 getVolumeIdentifier:a3 error:a5];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isBookmarkDataFull:(id)a3
{
  uint64_t v4 = [a3 length];
  if (v4) {
    LOBYTE(v4) = *(unsigned char *)[a3 bytes] != 47;
  }
  return v4;
}

- (void)bundleIdentifierWithContext:(os_log_t)log error:(void *)a4 .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "*** Malformed bundle %{public}@; CFBundleIdentifier is not a string ",
    buf,
    0xCu);
}

@end