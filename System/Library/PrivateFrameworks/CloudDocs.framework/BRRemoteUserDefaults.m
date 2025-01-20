@interface BRRemoteUserDefaults
+ (id)defaultExcludedExtensionsWorthPreserving;
+ (id)defaultExcludedFilenamesWorthPreserving;
+ (id)defaultExcludedFilenamesWorthWarningAtLogout;
+ (id)sharedDefaults;
- (BRRemoteUserDefaults)init;
- (NSSet)excludedExtensionsWorthPreserving;
- (NSSet)excludedFilenamesWorthWarningAtLogout;
- (id)_init;
- (int64_t)minFileSizeForThumbnailTransfer;
- (void)init;
@end

@implementation BRRemoteUserDefaults

+ (id)sharedDefaults
{
  if (sharedDefaults_onceToken != -1) {
    dispatch_once(&sharedDefaults_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)g_remoteDefaults;

  return v2;
}

uint64_t __38__BRRemoteUserDefaults_sharedDefaults__block_invoke()
{
  g_remoteDefaults = [[BRRemoteUserDefaults alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)BRRemoteUserDefaults;
  v2 = [(BRRemoteUserDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    userDictionaryCache = v2->_userDictionaryCache;
    v2->_userDictionaryCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BRRemoteUserDefaults)init
{
  uint64_t v3 = brc_bread_crumbs((uint64_t)"-[BRRemoteUserDefaults init]", 39);
  v4 = brc_default_log(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    [(BRRemoteUserDefaults *)(uint64_t)v3 init];
  }

  return 0;
}

- (NSSet)excludedFilenamesWorthWarningAtLogout
{
  uint64_t v3 = [(NSMutableDictionary *)self->_userDictionaryCache objectForKeyedSubscript:@"excluded-filenames-worth-warning-at-logout"];

  if (v3) {
    goto LABEL_2;
  }
  v5 = +[BRDaemonConnection defaultConnection];
  objc_super v6 = (void *)[v5 newSyncProxy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__BRRemoteUserDefaults_excludedFilenamesWorthWarningAtLogout__block_invoke;
  v11[3] = &unk_1E59AD420;
  id v7 = v6;
  id v12 = v7;
  [v7 lookupExcludedFilenamesForLogoutWithReply:v11];
  v8 = [v7 result];
  [(NSMutableDictionary *)self->_userDictionaryCache setObject:v8 forKeyedSubscript:@"excluded-filenames-worth-warning-at-logout"];

  v9 = [v7 error];

  if (!v9)
  {

LABEL_2:
    v4 = [(NSMutableDictionary *)self->_userDictionaryCache objectForKeyedSubscript:@"excluded-filenames-worth-warning-at-logout"];
    goto LABEL_5;
  }
  v4 = +[BRRemoteUserDefaults defaultExcludedFilenamesWorthWarningAtLogout];

LABEL_5:

  return (NSSet *)v4;
}

uint64_t __61__BRRemoteUserDefaults_excludedFilenamesWorthWarningAtLogout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

- (NSSet)excludedExtensionsWorthPreserving
{
  uint64_t v3 = [(NSMutableDictionary *)self->_userDictionaryCache objectForKeyedSubscript:@"excluded-extensions-worth-preserving"];

  if (v3) {
    goto LABEL_2;
  }
  v5 = +[BRDaemonConnection defaultConnection];
  objc_super v6 = (void *)[v5 newSyncProxy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__BRRemoteUserDefaults_excludedExtensionsWorthPreserving__block_invoke;
  v11[3] = &unk_1E59AD420;
  id v7 = v6;
  id v12 = v7;
  [v7 lookupExcludedExtensionsForLogoutWithReply:v11];
  v8 = [v7 result];
  [(NSMutableDictionary *)self->_userDictionaryCache setObject:v8 forKeyedSubscript:@"excluded-extensions-worth-preserving"];

  v9 = [v7 error];

  if (!v9)
  {

LABEL_2:
    v4 = [(NSMutableDictionary *)self->_userDictionaryCache objectForKeyedSubscript:@"excluded-extensions-worth-preserving"];
    goto LABEL_5;
  }
  v4 = +[BRRemoteUserDefaults defaultExcludedExtensionsWorthPreserving];

LABEL_5:

  return (NSSet *)v4;
}

uint64_t __57__BRRemoteUserDefaults_excludedExtensionsWorthPreserving__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

- (int64_t)minFileSizeForThumbnailTransfer
{
  uint64_t v3 = [(NSMutableDictionary *)self->_userDictionaryCache objectForKeyedSubscript:@"min-file-size-for-thumb-transfer"];

  if (v3) {
    goto LABEL_2;
  }
  objc_super v6 = +[BRDaemonConnection defaultConnection];
  id v7 = (void *)[v6 newSyncProxy];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__BRRemoteUserDefaults_minFileSizeForThumbnailTransfer__block_invoke;
  v12[3] = &unk_1E59AEAA8;
  id v13 = v7;
  id v8 = v7;
  [v8 lookupMinFileSizeForThumbnailTransferWithReply:v12];
  v9 = [v8 result];
  [(NSMutableDictionary *)self->_userDictionaryCache setObject:v9 forKeyedSubscript:@"min-file-size-for-thumb-transfer"];

  v10 = [v8 error];

  if (v10) {
    return 0x100000;
  }
LABEL_2:
  v4 = [(NSMutableDictionary *)self->_userDictionaryCache objectForKeyedSubscript:@"min-file-size-for-thumb-transfer"];
  int64_t v5 = [v4 longLongValue];

  return v5;
}

uint64_t __55__BRRemoteUserDefaults_minFileSizeForThumbnailTransfer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

+ (id)defaultExcludedFilenamesWorthWarningAtLogout
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  [v2 addObject:@"Dropbox"];
  [v2 addObject:@"OneDrive"];
  [v2 addObject:@"IDrive-Sync"];

  return v2;
}

+ (id)defaultExcludedFilenamesWorthPreserving
{
  v2 = [a1 defaultExcludedFilenamesWorthWarningAtLogout];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"Microsoft User Data"];
  [v3 addObject:@"iPhoto Library"];

  return v3;
}

+ (id)defaultExcludedExtensionsWorthPreserving
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  [v2 addObject:@"photoslibrary"];
  [v2 addObject:@"photolibrary"];
  [v2 addObject:@"aplibrary"];
  [v2 addObject:@"migratedaplibrary"];
  [v2 addObject:@"migratedphotolibrary"];
  [v2 addObject:@"migratedaperturelibrary"];

  return v2;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: use sharedDefaults%@", (uint8_t *)&v2, 0xCu);
}

@end