@interface IXGlobalConfiguration
+ (id)sharedInstance;
- (BOOL)isiPad;
- (IXGlobalConfiguration)init;
- (NSURL)daemonUserHome;
- (NSURL)dataStorageHome;
- (NSURL)frameworkURL;
- (NSURL)rootPath;
- (NSURL)userVolumeURL;
- (id)_dataStorageHomeURLWithError:(id *)a3;
- (id)_userTempDirURLWithError:(id *)a3;
- (id)dataDirectoryAbortingOnError;
- (id)dataDirectoryWithError:(id *)a3;
- (id)extractedInstallableStagingDirectory:(id *)a3;
- (id)iconStagingDirectoryWithError:(id *)a3;
- (id)promiseStagingRootDirectoryAbortingOnError;
- (id)promiseStagingRootDirectoryWithError:(id *)a3;
- (id)remoteInstallationStagingDirectory:(id *)a3;
- (id)removabilityDirectoryAbortingOnError;
- (id)removabilityDirectoryWithError:(id *)a3;
- (unsigned)daemonGID;
- (unsigned)daemonUID;
- (void)createDirectories;
- (void)dataDirectoryAbortingOnError;
- (void)init;
- (void)promiseStagingRootDirectoryAbortingOnError;
@end

@implementation IXGlobalConfiguration

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__IXGlobalConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

uint64_t __39__IXGlobalConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_shared = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (IXGlobalConfiguration)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)IXGlobalConfiguration;
  v2 = [(IXGlobalConfiguration *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_dynamicPropertyLock._os_unfair_lock_opaque = 0;
    size_t v4 = sysconf(71);
    if (v4 == -1) {
      [(IXGlobalConfiguration *)&v13 init];
    }
    memset(&v13, 0, sizeof(v13));
    v12 = 0;
    if (getpwnam_r("mobile", &v13, (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v4, &v12) || !v12) {
      [(IXGlobalConfiguration *)&v11 init];
    }
    pw_dir = v13.pw_dir;
    v3->_daemonUID = v13.pw_uid;
    v3->_daemonGID = v13.pw_gid;
    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:pw_dir isDirectory:1 relativeToURL:0];
    daemonUserHome = v3->_daemonUserHome;
    v3->_daemonUserHome = (NSURL *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:"/" isDirectory:1 relativeToURL:0];
    rootPath = v3->_rootPath;
    v3->_rootPath = (NSURL *)v8;
  }
  return v3;
}

- (BOOL)isiPad
{
  v2 = (void *)MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (void)createDirectories
{
}

- (id)_dataStorageHomeURLWithError:(id *)a3
{
  p_dynamicPropertyLock = &self->_dynamicPropertyLock;
  os_unfair_lock_lock(&self->_dynamicPropertyLock);
  dataStorageHome = self->_dataStorageHome;
  if (dataStorageHome)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v8 = container_system_group_path_for_identifier();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v8 isDirectory:1 relativeToURL:0];
      uint64_t v11 = self->_dataStorageHome;
      self->_dataStorageHome = v10;

      free(v9);
      v7 = 0;
    }
    else
    {
      v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[IXGlobalConfiguration _dataStorageHomeURLWithError:](&v16, v12);
      }

      _CreateError((uint64_t)"-[IXGlobalConfiguration _dataStorageHomeURLWithError:]", 230, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_group_path_for_identifier returned %llu",
        v13,
      v7 = v16);
    }
    dataStorageHome = self->_dataStorageHome;
  }
  objc_super v14 = dataStorageHome;
  os_unfair_lock_unlock(p_dynamicPropertyLock);
  if (a3 && !v14) {
    *a3 = v7;
  }

  return v14;
}

- (id)dataDirectoryWithError:(id *)a3
{
  char v3 = [(IXGlobalConfiguration *)self _dataStorageHomeURLWithError:a3];
  size_t v4 = v3;
  if (v3)
  {
    v5 = [v3 urlByAppendingPathComponents:&unk_1EFE06DC8 lastIsDirectory:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataDirectoryAbortingOnError
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v2 = [(IXGlobalConfiguration *)self dataDirectoryWithError:&v6];
  id v3 = v6;
  if (!v2) {
    [(IXGlobalConfiguration *)&v5 dataDirectoryAbortingOnError];
  }

  return v2;
}

- (id)promiseStagingRootDirectoryWithError:(id *)a3
{
  id v3 = [(IXGlobalConfiguration *)self dataDirectoryWithError:a3];
  size_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 URLByAppendingPathComponent:@"PromiseStaging" isDirectory:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)promiseStagingRootDirectoryAbortingOnError
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v2 = [(IXGlobalConfiguration *)self promiseStagingRootDirectoryWithError:&v6];
  id v3 = v6;
  if (!v2) {
    [(IXGlobalConfiguration *)&v5 promiseStagingRootDirectoryAbortingOnError];
  }

  return v2;
}

- (id)removabilityDirectoryWithError:(id *)a3
{
  id v3 = [(IXGlobalConfiguration *)self dataDirectoryWithError:a3];
  size_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 URLByAppendingPathComponent:@"Removability" isDirectory:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)removabilityDirectoryAbortingOnError
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v2 = [(IXGlobalConfiguration *)self removabilityDirectoryWithError:&v6];
  id v3 = v6;
  if (!v2) {
    [(IXGlobalConfiguration *)&v5 createDirectories];
  }

  return v2;
}

- (id)remoteInstallationStagingDirectory:(id *)a3
{
  id v3 = [(IXGlobalConfiguration *)self dataDirectoryWithError:a3];
  size_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 URLByAppendingPathComponent:@"RemoteInstallStaging" isDirectory:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_userTempDirURLWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  bzero(v11, 0x400uLL);
  if (confstr(65537, v11, 0x400uLL))
  {
    size_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
    uint64_t v5 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = __error();
    unint64_t v7 = *v6;
    uint64_t v8 = (void *)*MEMORY[0x1E4F28798];
    strerror(*v6);
    uint64_t v5 = _CreateError((uint64_t)"-[IXGlobalConfiguration _userTempDirURLWithError:]", 321, v8, v7, 0, 0, @"Failed to initialize temporary directory: error = %d (%s)", v9, v7);
    size_t v4 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v4) {
    *a3 = v5;
  }
LABEL_7:

  return v4;
}

- (id)iconStagingDirectoryWithError:(id *)a3
{
  id v8 = 0;
  size_t v4 = [(IXGlobalConfiguration *)self _userTempDirURLWithError:&v8];
  id v5 = v8;
  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"TempIcons" isDirectory:1];
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = v5;
  }
LABEL_7:

  return v6;
}

- (id)extractedInstallableStagingDirectory:(id *)a3
{
  id v8 = 0;
  size_t v4 = [(IXGlobalConfiguration *)self _userTempDirURLWithError:&v8];
  id v5 = v8;
  if (v4)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"ExtractedApps" isDirectory:1];
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = v5;
  }
LABEL_7:

  return v6;
}

- (NSURL)frameworkURL
{
  v2 = [(IXGlobalConfiguration *)self rootPath];
  id v3 = [v2 urlByAppendingPathComponents:&unk_1EFE06DE0 lastIsDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)userVolumeURL
{
  v2 = [(IXGlobalConfiguration *)self rootPath];
  id v3 = [v2 urlByAppendingPathComponents:&unk_1EFE06DF8 lastIsDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)dataStorageHome
{
  return self->_dataStorageHome;
}

- (unsigned)daemonUID
{
  return self->_daemonUID;
}

- (unsigned)daemonGID
{
  return self->_daemonGID;
}

- (NSURL)daemonUserHome
{
  return self->_daemonUserHome;
}

- (NSURL)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_daemonUserHome, 0);

  objc_storeStrong((id *)&self->_dataStorageHome, 0);
}

- (void)init
{
  int v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3_2();
  strerror(v4);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)_dataStorageHomeURLWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315650;
  int v4 = "-[IXGlobalConfiguration _dataStorageHomeURLWithError:]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_grou"
    "p_path_for_identifier returned %llu : %@",
    (uint8_t *)&v3,
    0x20u);
}

- (void)dataDirectoryAbortingOnError
{
}

- (void)promiseStagingRootDirectoryAbortingOnError
{
}

@end