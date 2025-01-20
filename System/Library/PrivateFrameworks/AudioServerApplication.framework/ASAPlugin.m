@interface ASAPlugin
+ (id)pluginWithBundleIdentifier:(id)a3;
- (ASAPlugin)initWithBundleIdentifier:(id)a3;
- (NSArray)audioDeviceObjectIDs;
- (NSArray)audioDevices;
- (NSArray)boxObjectIDs;
- (NSArray)boxes;
- (NSArray)clockDeviceObjectIDs;
- (NSArray)clockDevices;
- (NSString)bundleID;
- (NSString)manufacturer;
- (NSURL)resourceBundleURL;
- (id)audioDeviceWithUID:(id)a3;
- (id)boxWithUID:(id)a3;
- (id)clockDeviceWithUID:(id)a3;
- (id)coreAudioClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)audioDeviceObjectIDWithUID:(id)a3;
- (unsigned)boxObjectIDWithUID:(id)a3;
- (unsigned)clockDeviceObjectIDWithUID:(id)a3;
@end

@implementation ASAPlugin

+ (id)pluginWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:v4];

  return v5;
}

- (ASAPlugin)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[ASACoreAudio sharedCoreAudioObject];
  uint64_t v6 = [v5 pluginObjectIDWithBundleID:v4];

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)ASAPlugin;
    return [(ASAObject *)&v8 initWithAudioObjectID:v6];
  }
  else
  {

    return 0;
  }
}

- (NSString)bundleID
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1885956452 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      v2 = objc_msgSend(NSString, "stringWithString:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read bundle ID property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (NSURL)resourceBundleURL
{
  if (![(ASAObject *)self hasMainGlobalProperty:1768124270]) {
    goto LABEL_7;
  }
  CFTypeRef cf = 0;
  int v6 = 8;
  if (![(ASAObject *)self getMainOutputProperty:1920168547 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read output resource bundle property\n", v5, 2u);
  }
  if (cf)
  {
    v3 = [(id)cf absoluteURL];
    CFRelease(cf);
  }
  else
  {
LABEL_7:
    v3 = 0;
  }
  return (NSURL *)v3;
}

- (NSString)manufacturer
{
  int v6 = 8;
  CFTypeRef cf = 0;
  if ([(ASAObject *)self getMainGlobalProperty:1819107691 withData:&cf ofSize:&v6 withQualifier:0 ofSize:0])
  {
    if (cf)
    {
      v2 = objc_msgSend(NSString, "stringWithString:");
      CFRelease(cf);
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2289FF000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not read manufacturer property\n", v4, 2u);
  }
  v2 = 0;
LABEL_7:
  return (NSString *)v2;
}

- (unsigned)boxObjectIDWithUID:(id)a3
{
  id v8 = a3;
  int v6 = 4;
  unsigned int v7 = 0;
  if (!v8) {
    return 0;
  }
  [(ASAObject *)self getMainGlobalProperty:1969841250 withData:&v7 ofSize:&v6 withQualifier:&v8 ofSize:8];
  unsigned int v4 = v7;

  return v4;
}

- (id)boxWithUID:(id)a3
{
  id v4 = a3;
  v5 = [ASABox alloc];
  uint64_t v6 = [(ASAPlugin *)self boxObjectIDWithUID:v4];

  unsigned int v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (unsigned)audioDeviceObjectIDWithUID:(id)a3
{
  id v8 = a3;
  int v6 = 4;
  unsigned int v7 = 0;
  if (!v8) {
    return 0;
  }
  [(ASAObject *)self getMainGlobalProperty:1969841252 withData:&v7 ofSize:&v6 withQualifier:&v8 ofSize:8];
  unsigned int v4 = v7;

  return v4;
}

- (id)audioDeviceWithUID:(id)a3
{
  id v4 = a3;
  v5 = [ASAAudioDevice alloc];
  uint64_t v6 = [(ASAPlugin *)self audioDeviceObjectIDWithUID:v4];

  unsigned int v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (unsigned)clockDeviceObjectIDWithUID:(id)a3
{
  id v8 = a3;
  int v6 = 4;
  unsigned int v7 = 0;
  if (!v8) {
    return 0;
  }
  [(ASAObject *)self getMainGlobalProperty:1969841251 withData:&v7 ofSize:&v6 withQualifier:&v8 ofSize:8];
  unsigned int v4 = v7;

  return v4;
}

- (id)clockDeviceWithUID:(id)a3
{
  id v4 = a3;
  v5 = [ASAClockDevice alloc];
  uint64_t v6 = [(ASAPlugin *)self clockDeviceObjectIDWithUID:v4];

  unsigned int v7 = [(ASAObject *)v5 initWithAudioObjectID:v6];
  return v7;
}

- (NSArray)boxObjectIDs
{
  v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1651472419 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0x575D4B6FuLL);
    if (v6)
    {
      unsigned int v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1651472419 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          unsigned int v10 = *v9++;
          v11 = [NSNumber numberWithUnsignedLong:v10];
          [v3 addObject:v11];

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)boxes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASAPlugin *)self boxObjectIDs];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASABox alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)audioDeviceObjectIDs
{
  v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1684370979 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = malloc_type_malloc(v4, 0x76A61707uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1684370979 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          if (*v9++)
          {
            v11 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
            [v3 addObject:v11];
          }
          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)audioDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASAPlugin *)self audioDeviceObjectIDs];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASAAudioDevice alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)clockDeviceObjectIDs
{
  v3 = [MEMORY[0x263EFF980] array];
  unsigned int v4 = [(ASAObject *)self sizeOfMainGlobalProperty:1668049699 withQualifier:0 ofSize:0];
  unsigned int v13 = v4;
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v6 = (unsigned int *)malloc_type_malloc(v4, 0x75203375uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      bzero(v6, v5);
      if ([(ASAObject *)self getMainGlobalProperty:1668049699 withData:v7 ofSize:&v13 withQualifier:0 ofSize:0]&& v13 >= 4)
      {
        unint64_t v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          unsigned int v10 = *v9++;
          v11 = [NSNumber numberWithUnsignedLong:v10];
          [v3 addObject:v11];

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)clockDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ASAPlugin *)self clockDeviceObjectIDs];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [ASAClockDevice alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (void)v13));
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASAPlugin;
  uint64_t v7 = [(ASAObject *)&v57 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  v44 = [v6 stringByAppendingString:@"|        "];
  id v8 = [(ASAPlugin *)self bundleID];
  [v7 appendFormat:@"%@|    Bundle ID: %s\n", v6, objc_msgSend(v8, "UTF8String")];

  v9 = [(ASAPlugin *)self resourceBundleURL];
  id v10 = [v9 absoluteString];
  [v7 appendFormat:@"%@|    Resource Bundle URL: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASAPlugin *)self manufacturer];
  v12 = v6;
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  v43 = [(ASAPlugin *)self boxObjectIDs];
  v41 = self;
  if ([v43 count])
  {
    [v7 appendFormat:@"%@|    Box Objects:\n", v6];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = v43;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v13);
          }
          if (v4)
          {
            v19 = -[ASAObject initWithAudioObjectID:]([ASABox alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v53 + 1) + 8 * i) unsignedIntValue]);
            v20 = [(ASABox *)v19 diagnosticDescriptionWithIndent:v44 walkTree:1];
            [v7 appendString:v20];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v12, v16 + i, objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "unsignedIntValue")];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v60 count:16];
        uint64_t v16 = (v16 + i);
      }
      while (v15);
    }

    self = v41;
  }
  v21 = [(ASAPlugin *)self deviceObjectIDs];
  v40 = v21;
  if ([v21 count])
  {
    [v7 appendFormat:@"%@|    Device Objects:\n", v12];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v22);
          }
          if (v4)
          {
            v28 = -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v49 + 1) + 8 * j) unsignedIntValue]);
            v29 = [(ASAAudioDevice *)v28 diagnosticDescriptionWithIndent:v44 walkTree:1];
            if (v29) {
              [v7 appendString:v29];
            }
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v12, v25 + j, objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "unsignedIntValue")];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
        uint64_t v25 = (v25 + j);
      }
      while (v24);
    }

    v21 = v40;
    self = v41;
  }
  v30 = [(ASAPlugin *)self clockDeviceObjectIDs];
  if ([v30 count])
  {
    [v7 appendFormat:@"%@|    Clock Device Objects:\n", v12];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v42 = v30;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v31);
          }
          if (v4)
          {
            v37 = -[ASAObject initWithAudioObjectID:]([ASAClockDevice alloc], "initWithAudioObjectID:", [*(id *)(*((void *)&v45 + 1) + 8 * k) unsignedIntValue]);
            v38 = [(ASAClockDevice *)v37 diagnosticDescriptionWithIndent:v44 walkTree:1];
            [v7 appendString:v38];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v12, v34 + k, objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * k), "unsignedIntValue")];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v58 count:16];
        uint64_t v34 = (v34 + k);
      }
      while (v33);
    }

    v21 = v40;
    v30 = v42;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return @"AudioPlugin";
}

@end