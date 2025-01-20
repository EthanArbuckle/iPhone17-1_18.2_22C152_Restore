@interface FirmwareBundle
+ (id)defaultBundlePath;
- (FirmwareBundle)initWithBundle:(id)a3;
- (FirmwareBundle)initWithBundleName:(id)a3;
- (FirmwareBundle)initWithBundlePath:(id)a3;
- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6;
- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6;
- (NSData)certificate;
- (NSData)firmwareImage;
- (NSData)hash;
- (NSData)signature;
- (NSDictionary)buildManifest;
- (NSURL)firmwareLocalURL;
- (id)description;
- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4;
- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4;
- (id)parseResourceFileIntoData:(id)a3;
- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4;
- (unsigned)firmwareImageBaseAddress;
- (unsigned)firmwareImageSize;
- (unsigned)productIDCode;
- (void)calculateHash;
- (void)dealloc;
- (void)loadFirmwareImage;
- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5;
- (void)parseSRECLine:(id)a3 intoImage:(id)a4;
- (void)setBuildManifest:(id)a3;
- (void)setProductIDCode:(unsigned int)a3;
@end

@implementation FirmwareBundle

+ (id)defaultBundlePath
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "resourcePath");
  return (id)[v2 stringByAppendingFormat:@"/FirmwareBundles/"];
}

- (void)calculateHash
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  firmwareLocalURL = self->_firmwareLocalURL;
  if (firmwareLocalURL)
  {
    HashForDataAtLocationAsData = (NSData *)generateHashForDataAtLocationAsData((uint64_t)firmwareLocalURL, 10, (uint64_t)&v11);
    self->_hash = HashForDataAtLocationAsData;
    v5 = HashForDataAtLocationAsData;
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    uint64_t v6 = ccsha256_di();
    NSLog(&cfstr_SHashNotProvid.isa, "-[FirmwareBundle calculateHash]", self->_firmwareImageSize);
    MEMORY[0x270FA5388]();
    v8 = (char *)&v10 - v7;
    ccdigest_init();
    [(NSData *)self->_firmwareImage bytes];
    ccdigest_update();
    (*(void (**)(uint64_t, char *, _OWORD *))(v6 + 56))(v6, v8, v12);
    v9 = (NSData *)(id)[MEMORY[0x263EFF8F8] dataWithBytes:v12 length:32];
    self->_hash = v9;
    NSLog(&cfstr_HashCreated.isa, v9);
  }
}

- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  uint64_t v6 = self;
  if (a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)FirmwareBundle;
    uint64_t v6 = [(FirmwareBundle *)&v23 init];
    if (v6)
    {
      v6->_firmwareImage = (NSData *)a3;
      v6->_firmwareImageSize = [a3 length];
      v6->_hash = (NSData *)a4;
      v6->_signature = (NSData *)a5;
      v6->_certificate = (NSData *)a6;
      *(void *)&v6->_productIDCode = 0;
      v6->_bundleDescription = 0;
      v6->_buildManifest = 0;
      if (!v6->_hash) {
        [(FirmwareBundle *)v6 calculateHash];
      }
      firmwareImage = v6->_firmwareImage;
      v12 = "valid";
      if (firmwareImage) {
        uint64_t v13 = "valid";
      }
      else {
        uint64_t v13 = "nil";
      }
      uint64_t v14 = [(NSData *)firmwareImage length];
      hash = v6->_hash;
      if (hash) {
        v16 = "valid";
      }
      else {
        v16 = "nil";
      }
      uint64_t v17 = [(NSData *)hash length];
      signature = v6->_signature;
      if (signature) {
        v19 = "valid";
      }
      else {
        v19 = "nil";
      }
      uint64_t v20 = [(NSData *)signature length];
      certificate = v6->_certificate;
      if (!certificate) {
        v12 = "nil";
      }
      NSLog(&cfstr_SISLuHSLuSSLuC.isa, "-[FirmwareBundle initWithData:hashData:signatureData:certData:]", v13, v14, v16, v17, v19, v20, v12, [(NSData *)certificate length], v6->_productIDCode);
    }
    else
    {
      NSLog(&cfstr_SSuperInitFail.isa, "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
    }
  }
  else
  {
    NSLog(&cfstr_SNullPayload.isa, "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
  }
  return v6;
}

- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  uint64_t v25 = 0;
  if ([a3 checkResourceIsReachableAndReturnError:&v25])
  {
    v24.receiver = self;
    v24.super_class = (Class)FirmwareBundle;
    uint64_t v11 = [(FirmwareBundle *)&v24 init];
    if (v11)
    {
      v11->_firmwareLocalURL = (NSURL *)a3;
      v11->_hash = (NSData *)a4;
      v11->_signature = (NSData *)a5;
      v11->_certificate = (NSData *)a6;
      *(void *)&v11->_productIDCode = 0;
      v11->_bundleDescription = 0;
      v11->_buildManifest = 0;
      id v23 = 0;
      [a3 getResourceValue:&v23 forKey:*MEMORY[0x263EFF688] error:&v25];
      v11->_firmwareImageSize = [v23 unsignedIntValue];
      if (!v11->_hash) {
        [(FirmwareBundle *)v11 calculateHash];
      }
      firmwareLocalURL = v11->_firmwareLocalURL;
      uint64_t v13 = [(NSData *)v11->_firmwareImage length];
      hash = v11->_hash;
      v15 = "valid";
      if (hash) {
        v16 = "valid";
      }
      else {
        v16 = "nil";
      }
      uint64_t v17 = [(NSData *)hash length];
      signature = v11->_signature;
      if (signature) {
        v19 = "valid";
      }
      else {
        v19 = "nil";
      }
      uint64_t v20 = [(NSData *)signature length];
      certificate = v11->_certificate;
      if (!certificate) {
        v15 = "nil";
      }
      NSLog(&cfstr_SILuHSLuSSLuCS.isa, "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]", firmwareLocalURL, v13, v16, v17, v19, v20, v15, [(NSData *)certificate length], v11->_productIDCode);
    }
    else
    {
      NSLog(&cfstr_SSuperInitFail.isa, "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]");
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FirmwareBundle initWithURL:hashData:signatureData:certData:]((uint64_t)a3);
    }
    return 0;
  }
  return v11;
}

- (FirmwareBundle)initWithBundle:(id)a3
{
  id v37 = 0;
  uint64_t v38 = 0;
  v36.receiver = self;
  v36.super_class = (Class)FirmwareBundle;
  v4 = [(FirmwareBundle *)&v36 init];
  if (!v4) {
    goto LABEL_37;
  }
  uint64_t v5 = [a3 objectForInfoDictionaryKey:@"FirmwareImageBaseAddress"];
  uint64_t v6 = [a3 objectForInfoDictionaryKey:@"FirmwareImageSize"];
  uint64_t v7 = [a3 objectForInfoDictionaryKey:@"FirmwareImageFile"];
  if (!v7) {
    goto LABEL_37;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [a3 objectForInfoDictionaryKey:@"HashFile"];
  uint64_t v10 = [a3 objectForInfoDictionaryKey:@"CertificateFile"];
  uint64_t v11 = [a3 objectForInfoDictionaryKey:@"SignatureFile"];
  uint64_t v12 = [a3 objectForInfoDictionaryKey:@"CFBundleIdentifier"];
  if (!v12) {
    goto LABEL_37;
  }
  uint64_t v13 = (void *)v12;
  NSLog(&cfstr_SInfoNameKeysI.isa, "-[FirmwareBundle initWithBundle:]", v8, v9, v11, v10);
  if (v5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", v5), "scanHexInt:", &v4->_firmwareImageBaseAddress);
  }
  if (v6)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", v6), "scanHexInt:", &v4->_firmwareImageSize);
  }
  else
  {
    [(FirmwareBundle *)v4 parseFileName:v8 intoPath:&v38 andExtension:&v37];
    uint64_t v14 = [a3 pathForResource:v38 ofType:v37];
    uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", v14, 0), "fileSize");
    v4->_firmwareImageSize = v15;
    NSLog(&cfstr_SImagefilesize.isa, "-[FirmwareBundle initWithBundle:]", v15);
  }
  uint64_t v16 = [a3 objectForInfoDictionaryKey:@"DefaultFillByte"];
  if (v16)
  {
    int v35 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", v16), "scanHexInt:", &v35);
    unsigned __int8 v17 = v35;
  }
  else
  {
    unsigned __int8 v17 = -1;
  }
  [(FirmwareBundle *)v4 parseFileName:v8 intoPath:&v38 andExtension:&v37];
  if (![v37 caseInsensitiveCompare:@"s19"])
  {
    id v20 = -[FirmwareBundle parseSRECFile:withDefaultByteValue:](v4, "parseSRECFile:withDefaultByteValue:", [a3 pathForResource:v38 ofType:v37], v17);
    goto LABEL_16;
  }
  uint64_t v18 = [v37 caseInsensitiveCompare:@"bin"];
  uint64_t v19 = [a3 pathForResource:v38 ofType:v37];
  if (v18)
  {
    id v20 = [(FirmwareBundle *)v4 parseMSP430TXTFile:v19 withDefaultByteValue:v17];
LABEL_16:
    uint64_t v21 = 40;
    goto LABEL_18;
  }
  id v20 = (id)[NSURL fileURLWithPath:v19];
  uint64_t v21 = 80;
LABEL_18:
  *(Class *)((char *)&v4->super.isa + v21) = (Class)v20;
  [(FirmwareBundle *)v4 parseFileName:@"BuildManifest.plist" intoPath:&v38 andExtension:&v37];
  uint64_t v22 = [a3 pathForResource:v38 ofType:v37];
  v4->_buildManifest = (NSDictionary *)(id)[NSDictionary dictionaryWithContentsOfFile:v22];
  if (v9)
  {
    [(FirmwareBundle *)v4 parseFileName:v9 intoPath:&v38 andExtension:&v37];
    if ([v37 caseInsensitiveCompare:@"bin"]) {
      id v23 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", [a3 pathForResource:v38 ofType:v37]);
    }
    else {
      id v23 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    }
    v4->_hash = (NSData *)v23;
    if (!v10) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  [(FirmwareBundle *)v4 calculateHash];
  if (v10)
  {
LABEL_25:
    [(FirmwareBundle *)v4 parseFileName:v10 intoPath:&v38 andExtension:&v37];
    if ([v37 caseInsensitiveCompare:@"bin"]) {
      id v24 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", [a3 pathForResource:v38 ofType:v37]);
    }
    else {
      id v24 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    }
    v4->_certificate = (NSData *)v24;
  }
LABEL_29:
  if (v11)
  {
    [(FirmwareBundle *)v4 parseFileName:v11 intoPath:&v38 andExtension:&v37];
    if ([v37 caseInsensitiveCompare:@"bin"]) {
      id v25 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", [a3 pathForResource:v38 ofType:v37]);
    }
    else {
      id v25 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:", objc_msgSend(a3, "pathForResource:ofType:", v38, v37));
    }
    v4->_signature = (NSData *)v25;
  }
  v26 = (void *)[v13 componentsSeparatedByString:@"."];
  if (v26) {
    LODWORD(v26) = objc_msgSend((id)objc_msgSend(v26, "lastObject"), "intValue");
  }
  v4->_productIDCode = v26;
  v4->_bundleDescription = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "lastPathComponent");
LABEL_37:
  if ([(FirmwareBundle *)v4 firmwareImage]) {
    v27 = "valid";
  }
  else {
    v27 = "nil";
  }
  uint64_t v28 = [(FirmwareBundle *)v4 firmwareImageSize];
  if ([(FirmwareBundle *)v4 hash]) {
    v29 = "valid";
  }
  else {
    v29 = "nil";
  }
  uint64_t v30 = [(NSData *)[(FirmwareBundle *)v4 hash] length];
  if ([(FirmwareBundle *)v4 signature]) {
    v31 = "valid";
  }
  else {
    v31 = "nil";
  }
  uint64_t v32 = [(NSData *)[(FirmwareBundle *)v4 signature] length];
  if ([(FirmwareBundle *)v4 certificate]) {
    v33 = "valid";
  }
  else {
    v33 = "nil";
  }
  NSLog(&cfstr_SISLuHSLuSSLuC_0.isa, "-[FirmwareBundle initWithBundle:]", v27, v28, v29, v30, v31, v32, v33, [(NSData *)[(FirmwareBundle *)v4 certificate] length], [(FirmwareBundle *)v4 productIDCode], [(FirmwareBundle *)v4 firmwareImageBaseAddress]);
  return v4;
}

- (FirmwareBundle)initWithBundlePath:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithPath:a3];
  return [(FirmwareBundle *)self initWithBundle:v4];
}

- (FirmwareBundle)initWithBundleName:(id)a3
{
  uint64_t v4 = objc_msgSend(+[FirmwareBundle defaultBundlePath](FirmwareBundle, "defaultBundlePath"), "stringByAppendingString:", a3);
  return [(FirmwareBundle *)self initWithBundlePath:v4];
}

- (void)loadFirmwareImage
{
  if ([(NSURL *)self->_firmwareLocalURL checkResourceIsReachableAndReturnError:0])
  {
    self->_firmwareImage = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:self->_firmwareLocalURL];
  }
}

- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  firmwareFilehandle = self->_firmwareFilehandle;
  if (!firmwareFilehandle)
  {
    firmwareFilehandle = (NSFileHandle *)(id)[MEMORY[0x263F08840] fileHandleForReadingFromURL:self->_firmwareLocalURL error:a4];
    self->_firmwareFilehandle = firmwareFilehandle;
    if (!firmwareFilehandle) {
      return 0;
    }
  }
  if (![(NSFileHandle *)firmwareFilehandle uarpSeekToOffset:location error:a4]) {
    return 0;
  }
  uint64_t v9 = self->_firmwareFilehandle;
  return [(NSFileHandle *)v9 uarpReadDataUpToLength:length error:a4];
}

- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5
{
  uint64_t v8 = (void *)[a3 pathExtension];
  *a5 = v8;
  if ([v8 caseInsensitiveCompare:@"txt"]
    && [*a5 caseInsensitiveCompare:@"s19"]
    && [*a5 caseInsensitiveCompare:@"bin"]
    && [*a5 caseInsensitiveCompare:@"plist"])
  {
    *a4 = a3;
    *a5 = @"txt";
  }
  else
  {
    *a4 = (id)[a3 stringByDeletingPathExtension];
  }
}

- (id)parseResourceFileIntoData:(id)a3
{
  v3 = (void *)[NSString stringWithContentsOfFile:a3 encoding:1 error:0];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v3, "length") / 5uLL);
  uint64_t v5 = (void *)[MEMORY[0x263F08B08] scannerWithString:v3];
  int v8 = 0;
  if ([v5 scanHexInt:&v8])
  {
    do
    {
      char v7 = v8;
      [v4 appendBytes:&v7 length:1];
      objc_msgSend(v5, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @","), 0);
    }
    while (([v5 scanHexInt:&v8] & 1) != 0);
  }
  return v4;
}

- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4 = a4;
  char v7 = (void *)[MEMORY[0x263EFF990] dataWithLength:self->_firmwareImageSize];
  memset((void *)[v7 mutableBytes], v4, objc_msgSend(v7, "length"));
  int v14 = 0;
  int v8 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", objc_msgSend(NSString, "stringWithContentsOfFile:encoding:error:", a3, 1, 0));
  if (([v8 isAtEnd] & 1) == 0)
  {
    do
    {
      id v13 = 0;
      if ([v8 scanUpToString:@"\n" intoString:&v13])
      {
        int v9 = [v13 characterAtIndex:0];
        if (v9 != 113)
        {
          if (v9 == 64)
          {
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", objc_msgSend(v13, "substringFromIndex:", 1)), "scanHexInt:", &v14);
            v14 -= self->_firmwareImageBaseAddress;
          }
          else
          {
            uint64_t v10 = (void *)[MEMORY[0x263F08B08] scannerWithString:v13];
            if (([v10 isAtEnd] & 1) == 0)
            {
              do
              {
                int v12 = 0;
                [v10 scanHexInt:&v12];
                ++v14;
                objc_msgSend(v7, "replaceBytesInRange:withBytes:");
              }
              while (![v10 isAtEnd]);
            }
          }
        }
      }
    }
    while (![v8 isAtEnd]);
  }
  return v7;
}

- (void)parseSRECLine:(id)a3 intoImage:(id)a4
{
  *(void *)&v18[254] = *MEMORY[0x263EF8340];
  int v16 = 0;
  uint64_t v7 = [a3 cStringUsingEncoding:1];
  int v8 = *(unsigned __int8 *)(v7 + 1);
  sscanf((const char *)(v7 + 2), "%02x", &v16);
  uint64_t v9 = v16;
  if ([a3 length] - 4 == 2 * v9)
  {
    char v10 = v9;
    if (v9)
    {
      uint64_t v11 = (const char *)(v7 + 4);
      uint64_t v12 = (v9 - 1) + 1;
      id v13 = &v17;
      char v10 = v9;
      do
      {
        sscanf(v11, "%02x", &v16);
        v11 += 2;
        char v14 = v16;
        *(unsigned char *)id v13 = v16;
        id v13 = (unsigned __int16 *)((char *)v13 + 1);
        v10 += v14;
        --v12;
      }
      while (v12);
    }
    if (v10 == -1)
    {
      if (v8 != 48 && v8 != 57)
      {
        if (v8 == 49)
        {
          if (v9 <= 2) {
            NSLog(&cfstr_ByteCountTooLo.isa, v15);
          }
          else {
            objc_msgSend(a4, "replaceBytesInRange:withBytes:", (unsigned __int16)(_byteswap_ushort(v17) - self->_firmwareImageBaseAddress), (int)v9 - 3, v18);
          }
        }
        else
        {
          NSLog(&cfstr_UnhandledSrecR.isa, v15);
        }
      }
    }
    else
    {
      NSLog(&cfstr_ChecksumFailur.isa, v15);
    }
  }
  else
  {
    NSLog(&cfstr_ParsesreclineI.isa, v9, [a3 length] - 4);
  }
}

- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v7 = (void *)[MEMORY[0x263EFF990] dataWithLength:self->_firmwareImageSize];
  memset((void *)[v7 mutableBytes], v4, objc_msgSend(v7, "length"));
  int v8 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", objc_msgSend(NSString, "stringWithContentsOfFile:encoding:error:", a3, 1, 0));
  if (([v8 isAtEnd] & 1) == 0)
  {
    do
    {
      uint64_t v10 = 0;
      if ([v8 scanUpToString:@"\n" intoString:&v10]) {
        [(FirmwareBundle *)self parseSRECLine:v10 intoImage:v7];
      }
    }
    while (![v8 isAtEnd]);
  }
  return v7;
}

- (void)dealloc
{
  [(NSFileHandle *)self->_firmwareFilehandle uarpCloseAndReturnError:0];
  v3.receiver = self;
  v3.super_class = (Class)FirmwareBundle;
  [(FirmwareBundle *)&v3 dealloc];
}

- (id)description
{
  return self->_bundleDescription;
}

- (NSData)firmwareImage
{
  return self->_firmwareImage;
}

- (NSDictionary)buildManifest
{
  return self->_buildManifest;
}

- (void)setBuildManifest:(id)a3
{
}

- (NSData)hash
{
  return self->_hash;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (unsigned)productIDCode
{
  return self->_productIDCode;
}

- (void)setProductIDCode:(unsigned int)a3
{
  self->_productIDCode = a3;
}

- (unsigned)firmwareImageBaseAddress
{
  return self->_firmwareImageBaseAddress;
}

- (unsigned)firmwareImageSize
{
  return self->_firmwareImageSize;
}

- (NSURL)firmwareLocalURL
{
  return self->_firmwareLocalURL;
}

- (void)initWithURL:(uint64_t)a1 hashData:signatureData:certData:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_23BCED000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Invalid firmwareURL %@", (uint8_t *)&v1, 0x16u);
}

@end