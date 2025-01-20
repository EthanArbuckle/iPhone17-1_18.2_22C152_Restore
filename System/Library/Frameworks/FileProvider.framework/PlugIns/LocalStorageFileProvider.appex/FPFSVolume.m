@interface FPFSVolume
+ (id)eventStreamUUIDForDevice:(int)a3;
- (BOOL)setupForPath:(id)a3 error:(id *)a4;
- (NSString)mountPath;
- (NSUUID)eventStreamUUID;
- (id)description;
- (id)freeSize;
- (id)totalSize;
- (int)deviceID;
- (unint64_t)rootFileID;
@end

@implementation FPFSVolume

- (BOOL)setupForPath:(id)a3 error:(id *)a4
{
  [a3 fileSystemRepresentation];
  int v5 = fpfs_open();
  int v6 = v5;
  if (a4 && v5 < 0)
  {
    *a4 = +[NSError fp_errorWithPOSIXCode:*__error()];
  }
  return v6 >= 0;
}

- (id)freeSize
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(FPFSVolume *)self mountPath];
  int v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  if (v5)
  {
    int v6 = [v5 objectForKeyedSubscript:NSFileSystemFreeSize];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)totalSize
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(FPFSVolume *)self mountPath];
  int v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  if (v5)
  {
    int v6 = [v5 objectForKeyedSubscript:NSFileSystemSize];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (NSString)mountPath
{
  return +[NSString stringWithFormat:@"%s", self->_stfs.f_mntonname];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p>, device:'%s' mounted-on:'%s' fstype:%s", objc_opt_class(), self, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename];
}

- (NSUUID)eventStreamUUID
{
  return (NSUUID *)+[FPFSVolume eventStreamUUIDForDevice:self->_deviceID];
}

+ (id)eventStreamUUIDForDevice:(int)a3
{
  CFUUIDRef v3 = FSEventsCopyUUIDForDevice(a3);
  if (v3)
  {
    CFUUIDRef v4 = v3;
    CFStringRef v5 = CFUUIDCreateString(0, v3);
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
    CFRelease(v5);
    CFRelease(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (unint64_t)rootFileID
{
  return self->_rootFileID;
}

@end