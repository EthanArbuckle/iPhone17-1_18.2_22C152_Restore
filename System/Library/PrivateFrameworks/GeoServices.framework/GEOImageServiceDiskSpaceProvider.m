@interface GEOImageServiceDiskSpaceProvider
- (BOOL)_shouldPurgeForUrgency:(int)a3;
- (GEODaemon)daemon;
- (GEOImageServicePersistence)persistence;
- (NSString)identifier;
- (int)minimumUregency;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)setDaemon:(id)a3;
- (void)setPersistence:(id)a3;
@end

@implementation GEOImageServiceDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.ImageService";
}

- (int)minimumUregency
{
  if (GEOConfigGetBOOL()) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)_shouldPurgeForUrgency:(int)a3
{
  if ([(GEOImageServiceDiskSpaceProvider *)self minimumUregency] > a3) {
    goto LABEL_8;
  }
  v3 = +[NSFileManager defaultManager];
  v4 = +[GEOFilePaths pathFor:28];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (qword_100084860 != -1) {
    dispatch_once(&qword_100084860, &stru_1000722A8);
  }
  v7 = qword_100084858;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_100084858, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ImageService DB does not exist. Nothing to purge.", v9, 2u);
LABEL_8:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  if (![(GEOImageServiceDiskSpaceProvider *)self _shouldPurgeForUrgency:*(void *)&a3]) {
    return 0;
  }
  id v4 = [(GEODaemon *)self->_daemon startServerClassIfNecessary:objc_opt_class()];
  persistence = self->_persistence;
  if (!persistence)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10004CE64();
    }
    return 0;
  }

  return [(GEOImageServicePersistence *)persistence calculateFreeableSize];
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(GEOImageServiceDiskSpaceProvider *)self _shouldPurgeForUrgency:*(void *)&a4]) {
    return 0;
  }
  id v7 = [(GEODaemon *)self->_daemon startServerClassIfNecessary:objc_opt_class()];
  if (!self->_persistence)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10004CE64();
    }
    return 0;
  }
  unint64_t v8 = [(GEOImageServiceDiskSpaceProvider *)self purgableDiskSpaceForUrgency:v4];
  if (v8 >= a3) {
    unint64_t v9 = v8 - a3;
  }
  else {
    unint64_t v9 = 0;
  }
  persistence = self->_persistence;

  return [(GEOImageServicePersistence *)persistence shrinkToSize:v9];
}

- (GEODaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (GEOImageServicePersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end