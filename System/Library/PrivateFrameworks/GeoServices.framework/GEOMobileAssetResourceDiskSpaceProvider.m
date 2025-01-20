@interface GEOMobileAssetResourceDiskSpaceProvider
- (GEODaemon)daemon;
- (NSString)identifier;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)setDaemon:(id)a3;
@end

@implementation GEOMobileAssetResourceDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.MAResource";
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(GEODaemon *)self->_daemon startServerClassIfNecessary:objc_opt_class()];
  id v5 = [v4 purgableDiskSpaceForUrgency:v3];

  return (unint64_t)v5;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [(GEODaemon *)self->_daemon startServerClassIfNecessary:objc_opt_class()];
  id v7 = [v6 freePurgableDiskSpace:a3 urgency:v4];

  return (unint64_t)v7;
}

- (GEODaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end