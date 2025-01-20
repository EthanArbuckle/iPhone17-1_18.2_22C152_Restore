@interface COConstituent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPowerRisk;
- (BOOL)isThermalRisk;
- (BOOL)isWired;
- (BOOL)supportsBackoff;
- (COConstituent)init;
- (COConstituent)initWithCoder:(id)a3;
- (COConstituent)initWithType:(unint64_t)a3;
- (NSString)software;
- (NSUUID)identifier;
- (id)_timeAwareUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int)device;
- (int64_t)compare:(id)a3;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDevice:(int)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setSoftware:(id)a3;
@end

@implementation COConstituent

- (COConstituent)initWithType:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)COConstituent;
  v4 = [(COConstituent *)&v23 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [(COConstituent *)v4 _timeAwareUUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    software = v5->_software;
    v5->_software = (NSString *)@"234";

    v5->_flags = 0xFFFFFFFF80000000;
    uint64_t v9 = MGCopyAnswer();
    if (v9)
    {
      v10 = (void *)v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = [v10 intValue];
        v5->_device = v11 & ~(v11 >> 31);
      }
      CFRelease(v10);
    }
    uint64_t v12 = MGCopyAnswer();
    if (v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v13 BOOLValue] & 1) == 0) {
        v5->_flags |= 1uLL;
      }
      CFRelease(v13);
    }
    v14 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v15 = [v14 thermalState];

    if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      v5->_flags |= 2uLL;
    }
    mach_port_t mainPort = 0;
    if (!MEMORY[0x223C8AEC0](0, &mainPort))
    {
      v17 = IOServiceMatching("IOEthernetInterface");
      if (v17)
      {
        CFDictionaryRef v18 = v17;
        CFDictionarySetValue(v17, @"IOPropertyMatch", &unk_26D3EB8F8);
        io_service_t MatchingService = IOServiceGetMatchingService(mainPort, v18);
        if (MatchingService)
        {
          io_object_t v20 = MatchingService;
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IO80211SSID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          if (CFProperty) {
            CFRelease(CFProperty);
          }
          else {
            v5->_flags |= 4uLL;
          }
          IOObjectRelease(v20);
        }
      }
    }
  }
  return v5;
}

- (COConstituent)init
{
  return [(COConstituent *)self initWithType:-1];
}

- (COConstituent)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)COConstituent;
    v5 = [(COConstituent *)&v20 init];
    if (v5)
    {
      v5->_type = [v4 decodeInt64ForKey:@"type"];
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sw"];
      software = v5->_software;
      v5->_software = (NSString *)v8;

      int v10 = [v4 decodeIntForKey:@"dc"];
      if (v10 < 0) {
        int v11 = -1;
      }
      else {
        int v11 = v10;
      }
      if (v11 >= 9) {
        int v11 = 9;
      }
      if (!v11) {
        int v11 = -1;
      }
      v5->_device = v11;
      uint64_t v12 = [v4 decodeBoolForKey:@"pr"] ^ 1;
      int v13 = [v4 decodeBoolForKey:@"tr"];
      int v14 = [v4 decodeBoolForKey:@"wn"];
      uint64_t v15 = 2;
      if (v13) {
        uint64_t v15 = 0;
      }
      uint64_t v16 = 4;
      if (!v14) {
        uint64_t v16 = 0;
      }
      v5->_flags = v15 | v16 | v12;
      if ([v4 containsValueForKey:@"bo"])
      {
        int v17 = [v4 decodeBoolForKey:@"bo"];
        unint64_t v18 = 0xFFFFFFFF80000000;
        if (!v17) {
          unint64_t v18 = 0;
        }
        v5->_flags |= v18;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:1 forKey:@"version"];
  objc_msgSend(v6, "encodeInt64:forKey:", -[COConstituent type](self, "type"), @"type");
  id v4 = [(COConstituent *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  v5 = [(COConstituent *)self software];
  [v6 encodeObject:v5 forKey:@"sw"];

  objc_msgSend(v6, "encodeInt:forKey:", -[COConstituent device](self, "device"), @"dc");
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent isPowerRisk](self, "isPowerRisk") ^ 1, @"pr");
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent isThermalRisk](self, "isThermalRisk") ^ 1, @"tr");
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent isWired](self, "isWired"), @"wn");
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent supportsBackoff](self, "supportsBackoff"), @"bo");
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(COConstituent *)self type];
  v5 = [(COConstituent *)self identifier];
  id v6 = [v3 stringWithFormat:@"%016llX-%@-%08llX", v4, v5, -[COConstituent flags](self, "flags")];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPowerRisk
{
  return [(COConstituent *)self flags] & 1;
}

- (BOOL)isThermalRisk
{
  return ([(COConstituent *)self flags] >> 1) & 1;
}

- (BOOL)isWired
{
  return ([(COConstituent *)self flags] >> 2) & 1;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (COConstituent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(COConstituent *)self compare:v4] == 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(COConstituent *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)supportsBackoff
{
  return ([(COConstituent *)self flags] & 0xFFFFFFFF80000000) != 0;
}

- (id)dictionaryRepresentation
{
  v14[8] = *MEMORY[0x263EF8340];
  v13[0] = @"type";
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[COConstituent type](self, "type"));
  v14[0] = v3;
  v13[1] = @"identifier";
  unint64_t v4 = [(COConstituent *)self identifier];
  v14[1] = v4;
  v13[2] = @"sw";
  BOOL v5 = [(COConstituent *)self software];
  v14[2] = v5;
  v13[3] = @"dc";
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[COConstituent device](self, "device"));
  v14[3] = v6;
  v13[4] = @"pr";
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[COConstituent isPowerRisk](self, "isPowerRisk") ^ 1);
  v14[4] = v7;
  v13[5] = @"tr";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[COConstituent isThermalRisk](self, "isThermalRisk") ^ 1);
  v14[5] = v8;
  v13[6] = @"wn";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[COConstituent isWired](self, "isWired"));
  v14[6] = v9;
  v13[7] = @"bo";
  int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[COConstituent supportsBackoff](self, "supportsBackoff"));
  v14[7] = v10;
  int v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(COConstituent *)self type];
  unint64_t v6 = [v4 type];
  if (v5 == v6)
  {
    v7 = [(COConstituent *)self software];
    uint64_t v8 = [v4 software];
    uint64_t v9 = [v7 componentsSeparatedByString:@"."];
    v36 = v8;
    int v10 = [v8 componentsSeparatedByString:@"."];
    unint64_t v11 = [v9 count];
    unint64_t v12 = [v10 count];
    if (v11 <= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      unint64_t v14 = v12;
      v34 = v7;
      v35 = self;
      unint64_t v15 = 0;
      while (1)
      {
        if (v15 >= v11)
        {
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v16 = [v9 objectAtIndex:v15];
          uint64_t v17 = [v16 integerValue];
        }
        if (v15 >= v14)
        {
          uint64_t v19 = 0;
        }
        else
        {
          unint64_t v18 = [v10 objectAtIndex:v15];
          uint64_t v19 = [v18 integerValue];
        }
        if (v17 != v19) {
          break;
        }
        if (v13 == ++v15)
        {
          int64_t v20 = 0;
          goto LABEL_23;
        }
      }
      if (v17 < v19) {
        int64_t v20 = 1;
      }
      else {
        int64_t v20 = -1;
      }
LABEL_23:
      v7 = v34;
      self = v35;
    }
    else
    {
      int64_t v20 = 0;
    }

    if (!v20)
    {
      int v21 = [(COConstituent *)self device];
      int v22 = [v4 device];
      int v23 = _COConstituentCompareDeviceClasses_rankings[v21 + 1];
      int v24 = _COConstituentCompareDeviceClasses_rankings[v22 + 1];
      int64_t v20 = v23 < v24 ? -1 : 1;
      if (v23 == v24)
      {
        unint64_t v25 = [(COConstituent *)self flags];
        unint64_t v26 = [v4 flags];
        unint64_t v27 = v26 & 1;
        unsigned int v28 = (v25 >> 1) & 1;
        uint64_t v29 = (v26 >> 1) & 1;
        if ((v25 & 1) == (v26 & 1) && ((v26 >> 2) & 1) == ((v25 >> 2) & 1) && v28 == v29)
        {
          v30 = [(COConstituent *)self identifier];
          v31 = [v4 identifier];
          int64_t v20 = objc_msgSend(v30, "co_compare:", v31);
        }
        else
        {
          if (v28 == v29)
          {
            if ((v25 & 1) == v27) {
              BOOL v32 = (v25 & 4) == 0;
            }
            else {
              BOOL v32 = v27 == 0;
            }
          }
          else
          {
            BOOL v32 = (v26 & 2) == 0;
          }
          if (v32) {
            int64_t v20 = 1;
          }
          else {
            int64_t v20 = -1;
          }
        }
      }
    }
  }
  else if (v5 < v6)
  {
    int64_t v20 = -1;
  }
  else
  {
    int64_t v20 = 1;
  }

  return v20;
}

- (id)_timeAwareUUID
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v3 = v2;
  if (v2 < 0.0)
  {
    id v4 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "Clock not synchronized, going to poll.", v14, 2u);
    }
  }
  if (v3 < 0.0)
  {
    uint64_t v5 = 14;
    do
    {
      sleep(2u);
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    }
    while (v6 < 0.0 && v5-- != 0);
    double v3 = v6;
  }
  if (v3 >= 0.0)
  {
    int v10 = COCoreLogForCategory(0);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)unint64_t v14 = 134217984;
    *(void *)&v14[4] = (unint64_t)v3;
    unint64_t v11 = "Clock synchronized. time = %llu";
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF910] distantFuture];
    [v8 timeIntervalSinceReferenceDate];
    double v3 = v9;

    int v10 = COCoreLogForCategory(0);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)unint64_t v14 = 134217984;
    *(void *)&v14[4] = (unint64_t)v3;
    unint64_t v11 = "Clock not synchronized. Using distant future %llu";
  }
  _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, v11, v14, 0xCu);
LABEL_19:

  if ([MEMORY[0x263F33F80] isFastFoldEnabled])
  {
    *(void *)unint64_t v14 = bswap64((unint64_t)v3);
    *(_DWORD *)&v14[8] = bswap32(arc4random());
    unsigned int v15 = bswap32(arc4random());
    unint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v14];
  }
  else
  {
    unint64_t v12 = [MEMORY[0x263F08C38] UUID];
  }
  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)software
{
  return self->_software;
}

- (void)setSoftware:(id)a3
{
}

- (int)device
{
  return self->_device;
}

- (void)setDevice:(int)a3
{
  self->_device = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_software, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end