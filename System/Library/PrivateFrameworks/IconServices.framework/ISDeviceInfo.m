@interface ISDeviceInfo
+ (id)sharedInstance;
- (CGSize)homeScreenIconSize;
- (CGSize)largeHomeScreenIconSize;
- (CGSize)messagesLauncherIconSize;
- (ISDeviceInfo)init;
- (double)screenScale;
- (int)deviceClass;
- (int)screenClass;
- (int64_t)rawDeviceIdiom;
- (unint64_t)deviceSubtype;
- (unint64_t)ideom;
@end

@implementation ISDeviceInfo

- (CGSize)homeScreenIconSize
{
  int v3 = [(ISDeviceInfo *)self deviceClass];
  int v4 = [(ISDeviceInfo *)self screenClass];
  double v5 = 128.0;
  double v6 = 128.0;
  switch(v3)
  {
    case 1:
      if (v4 > 0x19 || ((1 << v4) & 0x20C0000) == 0) {
        goto LABEL_5;
      }
      uint64_t v7 = 0x4050000000000000;
      goto LABEL_6;
    case 3:
      double v8 = 60.0;
      if (v4 == 20) {
        double v8 = 68.0;
      }
      if (v4 == 11) {
        double v5 = 68.0;
      }
      else {
        double v5 = v8;
      }
      if (v4 == 11) {
        double v6 = 68.0;
      }
      else {
        double v6 = v8;
      }
      goto LABEL_17;
    case 4:
      double v6 = 400.0;
      double v5 = 240.0;
      goto LABEL_17;
    case 6:
      if (v4 > 25)
      {
        switch(v4)
        {
          case 26:
            double v5 = 51.0;
            goto LABEL_7;
          case 27:
            uint64_t v7 = 0x4047000000000000;
            goto LABEL_6;
          case 29:
            uint64_t v7 = 0x404B000000000000;
            goto LABEL_6;
        }
      }
      else
      {
        if ((v4 - 12) < 2)
        {
          uint64_t v7 = 0x4044000000000000;
          goto LABEL_6;
        }
        if (v4 == 16)
        {
          uint64_t v7 = 0x4046000000000000;
          goto LABEL_6;
        }
        if (v4 == 17)
        {
          uint64_t v7 = 0x4049000000000000;
LABEL_6:
          double v5 = *(double *)&v7;
LABEL_7:
          double v6 = v5;
          goto LABEL_17;
        }
      }
      v11 = (double *)MEMORY[0x1E4F1DB30];
      v12 = _ISDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1AE771000, v12, OS_LOG_TYPE_DEFAULT, "No known home screen icon size", v13, 2u);
      }
      double v6 = *v11;
      double v5 = v11[1];

LABEL_17:
      double v9 = v6;
      double v10 = v5;
      result.height = v10;
      result.width = v9;
      return result;
    case 11:
      goto LABEL_17;
    default:
LABEL_5:
      uint64_t v7 = 0x404E000000000000;
      goto LABEL_6;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_30);
  }
  v2 = (void *)sharedInstance_sharedInstance_6;
  return v2;
}

- (unint64_t)ideom
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = [(ISDeviceInfo *)self deviceClass] - 1;
  if v3 < 0xB && ((0x42Fu >> v3)) {
    return qword_1AE7C4EB0[v3];
  }
  int v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(ISDeviceInfo *)self deviceClass];
    _os_log_impl(&dword_1AE771000, v4, OS_LOG_TYPE_DEFAULT, "Unknown device class: %d", (uint8_t *)v6, 8u);
  }

  return 2;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (int)screenClass
{
  return self->_screenClass;
}

uint64_t __30__ISDeviceInfo_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_6 = objc_alloc_init(ISDeviceInfo);
  return MEMORY[0x1F41817F8]();
}

- (ISDeviceInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)ISDeviceInfo;
  v2 = [(ISDeviceInfo *)&v10 init];
  if (v2)
  {
    int v3 = (void *)MGCopyAnswer();
    v2->_deviceClass = [v3 intValue];
    MGGetFloat32Answer();
    v2->_screenScale = v4;
    v2->_screenClass = MGGetSInt32Answer();
    double v5 = MGCopyAnswer();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = [v5 objectForKey:@"ArtworkDeviceSubType"];
      v2->_deviceSubtype = [v6 integerValue];
    }
    else
    {
      v2->_deviceSubtype = 0;
    }
    uint64_t v7 = [v5 objectForKey:@"ArtworkDeviceIdiom"];

    uint64_t v8 = [v7 length];
    if (v8) {
      uint64_t v8 = [v7 integerValue];
    }
    v2->_rawDeviceIdiom = v8;
  }
  return v2;
}

- (CGSize)largeHomeScreenIconSize
{
  int v3 = [(ISDeviceInfo *)self deviceClass];
  int v4 = [(ISDeviceInfo *)self screenClass];
  if (v3 == 3)
  {
    double v5 = 83.5;
    double v6 = 76.0;
    if (v4 == 20) {
      double v6 = 83.5;
    }
    if (v4 != 11) {
      double v5 = v6;
    }
    double v7 = v5;
  }
  else
  {
    [(ISDeviceInfo *)self homeScreenIconSize];
  }
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGSize)messagesLauncherIconSize
{
  int v3 = [(ISDeviceInfo *)self deviceClass];
  int v4 = [(ISDeviceInfo *)self screenClass];
  if (v3 == 3)
  {
    double v5 = 55.0;
    double v6 = 74.0;
    if (v4 != 11 && v4 != 20)
    {
      double v5 = 50.0;
      double v6 = 67.0;
    }
  }
  else
  {
    double v5 = 45.0;
    double v6 = 60.0;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (int64_t)rawDeviceIdiom
{
  return self->_rawDeviceIdiom;
}

- (unint64_t)deviceSubtype
{
  return self->_deviceSubtype;
}

@end