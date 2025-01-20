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
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 >= 0;
}

uint64_t __33__FPFSVolume_setupForPath_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  long long v9 = xmmword_24DCCEB08;
  if ((FPStatVFS() & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 72);
  if ((v3 & 0x1000) == 0) {
    goto LABEL_3;
  }
  if (v3)
  {
    v4 = __error();
    int v5 = 30;
    goto LABEL_10;
  }
  if ((getattrlist((const char *)(v2 + 96), &v9, v7, 0x28uLL, 0x21u) & 0x80000000) == 0)
  {
    if ((~DWORD2(v7[0]) & 0x180000) == 0 && (~HIDWORD(v7[0]) & 0x90000) == 0)
    {
      uint64_t result = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 2176) = DWORD1(v7[0]);
      return result;
    }
LABEL_3:
    v4 = __error();
    int v5 = 19;
LABEL_10:
    int *v4 = v5;
  }
  return 0xFFFFFFFFLL;
}

- (id)freeSize
{
  int v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(FPFSVolume *)self mountPath];
  int v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  if (v5)
  {
    int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)totalSize
{
  int v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(FPFSVolume *)self mountPath];
  int v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  if (v5)
  {
    int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F080D0]];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (NSString)mountPath
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%s", self->_stfs.f_mntonname);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p>, device:'%s' mounted-on:'%s' fstype:%s", objc_opt_class(), self, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename];
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
    int v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
    CFRelease(v5);
    CFRelease(v4);
  }
  else
  {
    int v6 = 0;
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