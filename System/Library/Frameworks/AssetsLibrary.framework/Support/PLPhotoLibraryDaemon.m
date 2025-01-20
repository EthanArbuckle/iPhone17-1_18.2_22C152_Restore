@interface PLPhotoLibraryDaemon
- (PLPhotoLibraryDaemon)init;
- (int)setup;
- (void)run;
@end

@implementation PLPhotoLibraryDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoModeUtilities, 0);
  objc_storeStrong((id *)&self->_termSignalSource, 0);
  objc_storeStrong((id *)&self->_infoSignalSource, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_daemonServices, 0);
}

- (void)run
{
  id v2 = +[NSRunLoop currentRunLoop];
  [v2 run];
}

- (int)setup
{
  v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = getpid();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "assetsd starting up [%d]", (uint8_t *)v5, 8u);
  }

  if (self)
  {
    PLAssertMinimumCoreDataVersion();
    PLDebugEnableCoreDataMultithreadedAsserts();
    +[PLPhotoLibraryPathManager enableMultiLibraryMode];
    sub_100005658((uint64_t)self);
    GSInitialize();
    sub_1000057B8((uint64_t)self);
    +[PLKeepDaemonAliveAssertionServer start];
    sub_1000058B4((uint64_t)self);
    sub_10000596C((uint64_t)self);
    sub_100005A24((uint64_t)self);
  }
  else
  {
    +[PLPhotoLibraryPathManager enableMultiLibraryMode];
  }
  DCIM_IS_PAD();
  return 0;
}

- (PLPhotoLibraryDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLPhotoLibraryDaemon;
  id v2 = [(PLPhotoLibraryDaemon *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(PLDefaultDaemonServices);
    daemonServices = v2->_daemonServices;
    v2->_daemonServices = v3;

    v5 = v2;
  }

  return v2;
}

@end