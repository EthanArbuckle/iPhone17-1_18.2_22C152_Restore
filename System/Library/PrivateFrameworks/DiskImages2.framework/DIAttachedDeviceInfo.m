@interface DIAttachedDeviceInfo
+ (id)DI1URLWithData:(id)a3 error:(id *)a4;
+ (id)copyAllMountPoints;
+ (id)newDI1DevicesArrayWithError:(id *)a3;
+ (id)newDI2DevicesArrayWithError:(id *)a3;
+ (id)newDevicesArrayWithError:(id *)a3;
+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4;
- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4;
- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4;
- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4;
- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4;
- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4;
- (DIIOMedia)ioMedia;
- (NSNumber)blockSize;
- (NSNumber)mediaSize;
- (NSNumber)pid;
- (NSString)BSDName;
- (NSString)instanceId;
- (NSURL)cacheURL;
- (NSURL)imageURL;
- (NSURL)shadowURL;
- (id)copyEntitiesList;
- (id)description;
- (id)toDictionary;
- (int64_t)frameworkNum;
- (void)setIoMedia:(id)a3;
@end

@implementation DIAttachedDeviceInfo

- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIAttachedDeviceInfo;
  v7 = [(DIAttachedDeviceInfo *)&v20 init];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [v6 copyIOMediaWithError:a4];
  ioMedia = v7->_ioMedia;
  v7->_ioMedia = (DIIOMedia *)v8;

  v10 = v7->_ioMedia;
  if (!v10)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [(DIIOObject *)v10 copyPropertyWithClass:objc_opt_class() key:@"Size"];
  mediaSize = v7->_mediaSize;
  v7->_mediaSize = (NSNumber *)v11;

  uint64_t v13 = [(DIIOObject *)v7->_ioMedia copyPropertyWithClass:objc_opt_class() key:@"Preferred Block Size"];
  blockSize = v7->_blockSize;
  v7->_blockSize = (NSNumber *)v13;

  uint64_t v15 = [(DIIOMedia *)v7->_ioMedia BSDName];
  BSDName = v7->_BSDName;
  v7->_BSDName = (NSString *)v15;

  if (!v7->_mediaSize || !v7->_blockSize || !v7->_BSDName)
  {
    v17 = +[DIError nilWithEnumValue:153 verboseInfo:@"Basic information about the IOMedia device is missing" error:a4];
    goto LABEL_10;
  }
  if (![v6 diskImageDevice])
  {
    if (!IOObjectConformsTo([v6 ioObj], "IOHDIXHDDriveNub"))
    {
      v17 = +[DIError nilWithEnumValue:157 description:@"Device is not a disk image" error:a4];
      goto LABEL_10;
    }
    if ([(DIAttachedDeviceInfo *)v7 fillDI1InfoWithDevice:v6 error:a4]) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (![(DIAttachedDeviceInfo *)v7 fillDI2InfoWithDevice:v6 error:a4]) {
    goto LABEL_13;
  }
LABEL_8:
  v17 = v7;
LABEL_10:
  v18 = v17;
LABEL_14:

  return v18;
}

- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"DiskImageURL"];
  if (v7)
  {
    uint64_t v8 = (NSURL *)[objc_alloc(NSURL) initWithString:v7];
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = v8;
  }
  else
  {
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = 0;
  }

  if (*p_imageURL)
  {
    uint64_t v11 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"ShadowURL"];
    if (v11)
    {
      v12 = (NSURL *)[objc_alloc(NSURL) initWithString:v11];
      shadowURL = self->_shadowURL;
      self->_shadowURL = v12;
    }
    else
    {
      shadowURL = self->_shadowURL;
      self->_shadowURL = 0;
    }

    uint64_t v15 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"CacheURL"];
    if (v15)
    {
      v16 = (NSURL *)[objc_alloc(NSURL) initWithString:v15];
      cacheURL = self->_cacheURL;
      self->_cacheURL = v16;
    }
    else
    {
      cacheURL = self->_cacheURL;
      self->_cacheURL = 0;
    }

    v18 = (NSString *)[v6 copyPropertyWithClass:objc_opt_class() key:@"InstanceID"];
    instanceId = self->_instanceId;
    self->_instanceId = v18;

    self->_frameworkNum = 2;
    BOOL v14 = [(DIAttachedDeviceInfo *)self setDI2PIDWithDevice:v6 error:a4]
       || +[DIError failWithEnumValue:153 verboseInfo:@"Failed to get Daemon PID" error:a4];
  }
  else
  {
    BOOL v14 = +[DIError failWithEnumValue:153 verboseInfo:@"Invalid or missing image URL key" error:a4];
  }

  return v14;
}

- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v18 = -1;
  v5 = (void *)[a3 newIteratorWithOptions:0 error:a4];
  id v6 = [[DIIOObject alloc] initWithIteratorNext:v5];
  if (v6)
  {
    v7 = v6;
    while (1)
    {
      if (IOObjectConformsTo([(DIIOObject *)v7 ioObj], "DIDeviceIOUserClient"))
      {
        uint64_t v8 = [(DIIOObject *)v7 copyPropertyWithClass:objc_opt_class() key:@"IOUserClientCreator"];
        if (v8) {
          break;
        }
      }
      v9 = [[DIIOObject alloc] initWithIteratorNext:v5];

      v7 = v9;
      if (!v9) {
        goto LABEL_6;
      }
    }
    uint64_t v11 = (void *)v8;
    v12 = [MEMORY[0x263F08B08] scannerWithString:v8];
    uint64_t v13 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    int v14 = [v12 scanUpToCharactersFromSet:v13 intoString:0];

    if (v14 && [v12 scanInteger:&v18])
    {
      uint64_t v15 = [NSNumber numberWithInteger:v18];
      pid = self->_pid;
      self->_pid = v15;

      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
LABEL_6:
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)DI1URLWithData:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithData:v6 encoding:4];

  if (v7)
  {
    uint64_t v8 = (void *)[objc_alloc(NSURL) initWithString:v7];
    v9 = v8;
    if (v8)
    {
      BOOL v10 = [v8 scheme];

      if (v10) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = [objc_alloc(NSURL) initFileURLWithPath:v7];

    v9 = (void *)v11;
    if (v11) {
      goto LABEL_8;
    }
    v12 = @"Invalid path property (not a path or URL)";
  }
  else
  {
    v12 = @"Invalid path property (not UTF8)";
  }
  v9 = +[DIError nilWithEnumValue:153 verboseInfo:v12 error:a4];
LABEL_8:

  return v9;
}

- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = (void *)[a3 copyParentWithError:a4];
  if (v6)
  {
    v7 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"image-path"];
    if (v7)
    {
      uint64_t v8 = +[DIAttachedDeviceInfo DI1URLWithData:v7 error:a4];
      imageURL = self->_imageURL;
      self->_imageURL = v8;

      if (self->_imageURL)
      {
        BOOL v10 = (void *)[v6 copyPropertyWithClass:objc_opt_class() key:@"shadow-path"];
        if (v10
          && (+[DIAttachedDeviceInfo DI1URLWithData:v10 error:a4], uint64_t v11 = (NSURL *)objc_claimAutoreleasedReturnValue(), shadowURL = self->_shadowURL, self->_shadowURL = v11, shadowURL, !self->_shadowURL))
        {
          BOOL v13 = 0;
        }
        else
        {
          BOOL v13 = 1;
          self->_frameworkNum = 1;
          int v14 = (NSNumber *)[v6 copyPropertyWithClass:objc_opt_class() key:@"hdid-pid"];
          pid = self->_pid;
          self->_pid = v14;

          if (!self->_pid)
          {
            self->_pid = (NSNumber *)&unk_26CF4FC98;

            BOOL v13 = 1;
          }
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = +[DIError failWithEnumValue:153 verboseInfo:@"Missing image path property" error:a4];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[DIIOMedia alloc] initWithDevName:v6 error:a4];

  if (v7)
  {
    id v8 = [(DIIOMedia *)v7 copyBlockDeviceWithError:a4];
    if (v8)
    {
      self = [(DIAttachedDeviceInfo *)self initWithDevice:v8 error:a4];
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newDI1DevicesArrayWithError:(id *)a3
{
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [[DIIOObject alloc] initWithClassName:@"IOHDIXController" error:0];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(DIIOObject *)v5 newIteratorWithOptions:0 error:a3];
    if (v7)
    {
      id v8 = [[DIIOObject alloc] initWithIteratorNext:v7];
      if (v8)
      {
        v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }
          BOOL v10 = [(DIIOObject *)v9 ioObjectWithClassName:@"IOHDIXHDDriveNub" iterateParent:0 error:a3];
          if (v10)
          {
            uint64_t v11 = [(DIIOObject *)[DIBlockDevice alloc] initWithDIIOObject:v10];
            v12 = [[DIAttachedDeviceInfo alloc] initWithDevice:v11 error:0];
            if (v12) {
              [v4 addObject:v12];
            }
          }
          BOOL v13 = [[DIIOObject alloc] initWithIteratorNext:v7];

          v9 = v13;
        }
        while (v13);
      }
      id v14 = v4;
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = v4;
  }

  return v14;
}

+ (id)newDI2DevicesArrayWithError:(id *)a3
{
  v4 = [MEMORY[0x263EFF980] array];
  id v5 = +[DIIOObject copyDiskImagesControllerWithError:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)[v5 newIteratorWithOptions:0 error:a3];
    if (v7)
    {
      id v8 = [(DIIOObject *)[DIBlockDevice alloc] initWithIteratorNext:v7];
      if (v8)
      {
        v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }
          if ([(DIBlockDevice *)v9 diskImageDevice])
          {
            BOOL v10 = [[DIAttachedDeviceInfo alloc] initWithDevice:v9 error:0];
            if (v10) {
              [v4 addObject:v10];
            }
          }
          uint64_t v11 = [(DIIOObject *)[DIBlockDevice alloc] initWithIteratorNext:v7];

          v9 = v11;
        }
        while (v11);
      }
      id v12 = v4;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)newDevicesArrayWithError:(id *)a3
{
  id v5 = objc_msgSend(a1, "newDI2DevicesArrayWithError:");
  if (v5)
  {
    id v6 = (void *)[a1 newDI1DevicesArrayWithError:a3];
    if (v6)
    {
      id v7 = [MEMORY[0x263EFF980] arrayWithArray:v5];
      [v7 addObjectsFromArray:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(DIAttachedDeviceInfo *)self BSDName];
  id v5 = [(DIAttachedDeviceInfo *)self imageURL];
  id v6 = [v3 stringWithFormat:@"Attached disk image device info: BSD Name [%@], image URL [%@]", v4, v5];

  return v6;
}

+ (id)copyAllMountPoints
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v15 = 0;
  int v3 = getmntinfo_r_np(&v15, 2);
  if (v3)
  {
    if (v3 >= 1)
    {
      unint64_t v4 = 0;
      uint64_t v5 = 2168 * v3;
      do
      {
        id v6 = +[DIHelpers copyDevicePathWithStatfs:&v15[v4 / 0x878]];
        id v7 = [NSString stringWithUTF8String:v15[v4 / 0x878].f_mntonname];
        if (v6)
        {
          if ([v6 hasPrefix:@"/dev/disk"]) {
            BOOL v8 = v7 == 0;
          }
          else {
            BOOL v8 = 1;
          }
          if (!v8)
          {
            v9 = [v6 lastPathComponent];
            [v2 setObject:v7 forKeyedSubscript:v9];
          }
        }

        v4 += 2168;
      }
      while (v5 != v4);
    }
    free(v15);
  }
  else
  {
    int v10 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v11 = getDIOSLog();
      os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v17 = 42;
      __int16 v18 = 2080;
      v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      BOOL v13 = getDIOSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v17 = 42;
        __int16 v18 = 2080;
        v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
        _os_log_impl(&dword_21E237000, v13, OS_LOG_TYPE_ERROR, "%.*s: Failed getting mounts list", buf, 0x12u);
      }
    }
    *__error() = v10;
  }
  return v2;
}

+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 BSDName];
  BOOL v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v15 = @"BSD Name";
    v16[0] = v7;
    int v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v11 = [v9 dictionaryWithDictionary:v10];

    id v12 = [v6 objectForKeyedSubscript:v8];
    [v11 setObject:v12 forKeyedSubscript:@"Mount Point"];

    BOOL v13 = (void *)[v5 copyPropertyWithClass:objc_opt_class() key:@"Content"];
    [v11 setObject:v13 forKeyedSubscript:@"Content"];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)copyEntitiesList
{
  int v3 = [MEMORY[0x263EFF980] array];
  id v4 = +[DIAttachedDeviceInfo copyAllMountPoints];
  id v5 = [(DIAttachedDeviceInfo *)self ioMedia];
  id v6 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:v5 mountPoints:v4];

  if (v6) {
    [v3 addObject:v6];
  }
  uint64_t v7 = [(DIAttachedDeviceInfo *)self ioMedia];
  BOOL v8 = (void *)[v7 newIteratorWithOptions:1 error:0];

  if (v8)
  {
    v9 = [(DIIOObject *)[DIIOMedia alloc] initWithIteratorNext:v8];
    if (v9)
    {
      int v10 = v9;
      do
      {
        if ([v8 startedOver])
        {
          [v3 removeAllObjects];
          [v8 setStartedOver:0];
        }
        if (IOObjectConformsTo([(DIIOObject *)v10 ioObj], "IOMedia"))
        {
          id v11 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:v10 mountPoints:v4];
          if (v11) {
            [v3 addObject:v11];
          }
        }
        id v12 = [(DIIOObject *)[DIIOMedia alloc] initWithIteratorNext:v8];

        int v10 = v12;
      }
      while (v12);
    }
  }

  return v3;
}

- (id)toDictionary
{
  v24[7] = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263EFF9A0];
  v23[0] = @"BSD Name";
  v22 = [(DIAttachedDeviceInfo *)self BSDName];
  v24[0] = v22;
  v23[1] = @"DiskImages Framework";
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[DIAttachedDeviceInfo frameworkNum](self, "frameworkNum"));
  v24[1] = v4;
  v23[2] = @"DiskImageURL";
  id v5 = [(DIAttachedDeviceInfo *)self imageURL];
  id v6 = [v5 description];
  v24[2] = v6;
  v23[3] = @"Size";
  uint64_t v7 = [(DIAttachedDeviceInfo *)self mediaSize];
  v24[3] = v7;
  v23[4] = @"Preferred Block Size";
  BOOL v8 = [(DIAttachedDeviceInfo *)self blockSize];
  v24[4] = v8;
  v23[5] = @"System Entities";
  id v9 = [(DIAttachedDeviceInfo *)self copyEntitiesList];
  v24[5] = v9;
  v23[6] = @"Daemon PID";
  int v10 = [(DIAttachedDeviceInfo *)self pid];
  v24[6] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];
  id v12 = [v3 dictionaryWithDictionary:v11];

  BOOL v13 = [(DIAttachedDeviceInfo *)self shadowURL];

  if (v13)
  {
    id v14 = [(DIAttachedDeviceInfo *)self shadowURL];
    uint64_t v15 = [v14 description];
    [v12 setObject:v15 forKeyedSubscript:@"ShadowURL"];
  }
  v16 = [(DIAttachedDeviceInfo *)self cacheURL];

  if (v16)
  {
    int v17 = [(DIAttachedDeviceInfo *)self cacheURL];
    __int16 v18 = [v17 description];
    [v12 setObject:v18 forKeyedSubscript:@"CacheURL"];
  }
  v19 = [(DIAttachedDeviceInfo *)self instanceId];

  if (v19)
  {
    uint64_t v20 = [(DIAttachedDeviceInfo *)self instanceId];
    [v12 setObject:v20 forKeyedSubscript:@"InstanceID"];
  }
  return v12;
}

- (NSString)BSDName
{
  return self->_BSDName;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)shadowURL
{
  return self->_shadowURL;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (int64_t)frameworkNum
{
  return self->_frameworkNum;
}

- (NSNumber)mediaSize
{
  return self->_mediaSize;
}

- (NSNumber)blockSize
{
  return self->_blockSize;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (DIIOMedia)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioMedia, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_blockSize, 0);
  objc_storeStrong((id *)&self->_mediaSize, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_shadowURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end