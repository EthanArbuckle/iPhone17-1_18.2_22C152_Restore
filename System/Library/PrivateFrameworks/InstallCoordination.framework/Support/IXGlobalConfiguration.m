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
@end

@implementation IXGlobalConfiguration

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009AA0;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109DA0 != -1) {
    dispatch_once(&qword_100109DA0, block);
  }
  v2 = (void *)qword_100109D98;

  return v2;
}

- (IXGlobalConfiguration)init
{
  v14.receiver = self;
  v14.super_class = (Class)IXGlobalConfiguration;
  v2 = [(IXGlobalConfiguration *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_dynamicPropertyLock._os_unfair_lock_opaque = 0;
    size_t v4 = sysconf(71);
    if (v4 == -1) {
      sub_10008B6B0(&v13, v15);
    }
    memset(&v13, 0, sizeof(v13));
    v12 = 0;
    if (getpwnam_r("mobile", &v13, (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v4, &v12) || !v12) {
      sub_10008B76C(&v11, v15);
    }
    pw_dir = v13.pw_dir;
    v3->_daemonUID = v13.pw_uid;
    v3->_daemonGID = v13.pw_gid;
    uint64_t v6 = +[NSURL fileURLWithFileSystemRepresentation:pw_dir isDirectory:1 relativeToURL:0];
    daemonUserHome = v3->_daemonUserHome;
    v3->_daemonUserHome = (NSURL *)v6;

    uint64_t v8 = +[NSURL fileURLWithFileSystemRepresentation:"/" isDirectory:1 relativeToURL:0];
    rootPath = v3->_rootPath;
    v3->_rootPath = (NSURL *)v8;
  }
  return v3;
}

- (BOOL)isiPad
{
  v2 = (void *)MGGetStringAnswer();
  unsigned __int8 v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (void)createDirectories
{
  unsigned __int8 v3 = +[IXFileManager defaultManager];
  id v40 = 0;
  size_t v4 = [(IXGlobalConfiguration *)self _dataStorageHomeURLWithError:&v40];
  id v5 = v40;
  uint64_t v6 = v5;
  if (!v4) {
    sub_10008B83C(&v41, buf);
  }
  id v39 = v5;
  unsigned __int8 v7 = [v4 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v39];
  id v8 = v39;

  if ((v7 & 1) == 0)
  {
    v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 path];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to set backup exclusion on %@ : %@", buf, 0x20u);
    }
  }
  id v38 = v8;
  uint64_t v11 = [(IXGlobalConfiguration *)self dataDirectoryWithError:&v38];
  id v12 = v38;

  if (!v11) {
    sub_10008B8A8(&v41, buf);
  }
  id v37 = v12;
  unsigned __int8 v13 = [v3 createDirectoryAtURL:v11 withIntermediateDirectories:1 mode:489 class:4 error:&v37];
  id v14 = v37;

  if ((v13 & 1) == 0)
  {
    uint64_t v36 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v29 = [v11 path];
    int v41 = 138412546;
    v42 = v29;
    __int16 v43 = 2112;
    id v44 = v14;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_22;
  }
  v15 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v11 path];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Created %@", buf, 0x16u);
  }
  id v35 = v14;
  v17 = [(IXGlobalConfiguration *)self promiseStagingRootDirectoryWithError:&v35];
  id v18 = v35;

  if (!v17) {
LABEL_22:
  }
    sub_10008B914(&v41, buf);
  id v34 = v18;
  unsigned __int8 v19 = [v3 createDirectoryAtURL:v17 withIntermediateDirectories:1 mode:489 class:4 error:&v34];
  id v20 = v34;

  if ((v19 & 1) == 0)
  {
    uint64_t v36 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v30 = [v17 path];
    int v41 = 138412546;
    v42 = v30;
    __int16 v43 = 2112;
    id v44 = v20;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_24;
  }
  v21 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v17 path];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Created %@", buf, 0x16u);
  }
  id v33 = v20;
  v23 = [(IXGlobalConfiguration *)self removabilityDirectoryWithError:&v33];
  id v24 = v33;

  if (!v23) {
LABEL_24:
  }
    sub_10008B980(&v41, buf);
  id v32 = v24;
  unsigned __int8 v25 = [v3 createDirectoryAtURL:v23 withIntermediateDirectories:1 mode:489 class:4 error:&v32];
  id v26 = v32;

  if ((v25 & 1) == 0)
  {
    uint64_t v36 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v31 = [v23 path];
    int v41 = 138412546;
    v42 = v31;
    __int16 v43 = 2112;
    id v44 = v26;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  v27 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [v23 path];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: Created %@", buf, 0x16u);
  }
}

- (id)_dataStorageHomeURLWithError:(id *)a3
{
  p_dynamicPropertyLock = &self->_dynamicPropertyLock;
  os_unfair_lock_lock(&self->_dynamicPropertyLock);
  dataStorageHome = self->_dataStorageHome;
  if (dataStorageHome)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v8 = container_system_group_path_for_identifier();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSURL fileURLWithFileSystemRepresentation:v8 isDirectory:1 relativeToURL:0];
      uint64_t v11 = self->_dataStorageHome;
      self->_dataStorageHome = v10;

      free(v9);
      unsigned __int8 v7 = 0;
    }
    else
    {
      id v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10008B9EC(&v16, v12);
      }

      sub_10003DAE4((uint64_t)"-[IXGlobalConfiguration _dataStorageHomeURLWithError:]", 230, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_group_path_for_identifier returned %llu",
        v13,
      unsigned __int8 v7 = v16);
    }
    dataStorageHome = self->_dataStorageHome;
  }
  id v14 = dataStorageHome;
  os_unfair_lock_unlock(p_dynamicPropertyLock);
  if (a3 && !v14) {
    *a3 = v7;
  }

  return v14;
}

- (id)dataDirectoryWithError:(id *)a3
{
  unsigned __int8 v3 = [(IXGlobalConfiguration *)self _dataStorageHomeURLWithError:a3];
  size_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 urlByAppendingPathComponents:&off_1000F4D28 lastIsDirectory:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataDirectoryAbortingOnError
{
  id v6 = 0;
  v2 = [(IXGlobalConfiguration *)self dataDirectoryWithError:&v6];
  id v3 = v6;
  if (!v2) {
    sub_10008BA88(&v5, v7);
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
  id v6 = 0;
  v2 = [(IXGlobalConfiguration *)self promiseStagingRootDirectoryWithError:&v6];
  id v3 = v6;
  if (!v2) {
    sub_10008BAF4(&v5, v7);
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
  id v6 = 0;
  v2 = [(IXGlobalConfiguration *)self removabilityDirectoryWithError:&v6];
  id v3 = v6;
  if (!v2) {
    sub_10008B980(&v5, v7);
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
  bzero(v10, 0x400uLL);
  if (confstr(65537, v10, 0x400uLL))
  {
    size_t v4 = +[NSURL fileURLWithFileSystemRepresentation:v10 isDirectory:1 relativeToURL:0];
    uint64_t v5 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = __error();
    unint64_t v7 = *v6;
    strerror(*v6);
    uint64_t v5 = sub_10003DAE4((uint64_t)"-[IXGlobalConfiguration _userTempDirURLWithError:]", 321, NSPOSIXErrorDomain, v7, 0, 0, @"Failed to initialize temporary directory: error = %d (%s)", v8, v7);
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
  id v3 = [v2 urlByAppendingPathComponents:&off_1000F4D40 lastIsDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)userVolumeURL
{
  v2 = [(IXGlobalConfiguration *)self rootPath];
  id v3 = [v2 urlByAppendingPathComponents:&off_1000F4D58 lastIsDirectory:1];

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

@end