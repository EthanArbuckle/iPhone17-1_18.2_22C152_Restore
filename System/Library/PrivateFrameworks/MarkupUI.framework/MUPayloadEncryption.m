@interface MUPayloadEncryption
+ (id)sharedInstance;
- (MUPayloadEncryption)init;
- (id)decryptData:(id)a3;
- (id)encryptData:(id)a3;
- (void)initializeKey;
@end

@implementation MUPayloadEncryption

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__MUPayloadEncryption_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)_sharedInstance;
  return v2;
}

uint64_t __37__MUPayloadEncryption_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _sharedInstance;
  _sharedInstance = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (MUPayloadEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)MUPayloadEncryption;
  result = [(MUPayloadEncryption *)&v3 init];
  if (result) {
    *(_WORD *)&result->_keyInitialized = 0;
  }
  return result;
}

- (id)encryptData:(id)a3
{
  __buf[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  if (!self->_keyInitialized) {
    [(MUPayloadEncryption *)self initializeKey];
  }
  if (self->_haveKey)
  {
    dataOut = (void *)[v4 length];
    AKLog();
    generateRandomKey(__buf);
    v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", __buf, 16, dataOut);
    uint64_t v6 = [v4 length];
    size_t v7 = [v5 length] + v6;
    v8 = [MEMORY[0x263EFF990] dataWithCapacity:(v7 + 31) & 0xFFFFFFFFFFFFFFF0];
    [v8 appendData:v5];
    [v8 appendData:v4];
    [v8 setLength:(v7 + 31) & 0xFFFFFFFFFFFFFFF0];
    size_t v17 = 0;
    key = self->_key;
    id v10 = v8;
    v11 = (const void *)[v10 mutableBytes];
    id v12 = v10;
    CCCryptorStatus v13 = CCCrypt(0, 0, 1u, key, 0x10uLL, 0, v11, v7, (void *)[v12 mutableBytes], (v7 + 31) & 0xFFFFFFFFFFFFFFF0, &v17);
    if (v13)
    {
      NSLog(&cfstr_Mupayloadencry_2.isa, v13);
      id v14 = 0;
    }
    else
    {
      [v12 length];
      AKLog();
      id v14 = v12;
    }
  }
  else
  {
LABEL_7:
    AKLog();
    id v14 = 0;
  }

  return v14;
}

- (id)decryptData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 length]) {
    goto LABEL_8;
  }
  if (!self->_keyInitialized) {
    [(MUPayloadEncryption *)self initializeKey];
  }
  if (self->_haveKey)
  {
    dataOut = (void *)[v5 length];
    AKLog();
    size_t v12 = 0;
    uint64_t v6 = (char *)malloc_type_malloc(objc_msgSend(v5, "length", dataOut), 0x29A200FFuLL);
    id v7 = v5;
    CCCryptorStatus v8 = CCCrypt(1u, 0, 1u, self->_key, 0x10uLL, 0, (const void *)[v7 bytes], objc_msgSend(v7, "length") - 16, v6, objc_msgSend(v7, "length") - 16, &v12);
    if (v8)
    {
      NSLog(&cfstr_Mupayloadencry_6.isa, v8);
      v9 = 0;
    }
    else
    {
      v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 + 16 length:v12 - 16];
      [v9 length];
      AKLog();
    }
    free(v6);
  }
  else
  {
LABEL_8:
    AKLog();
    v9 = 0;
  }

  return v9;
}

- (void)initializeKey
{
  v32[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_keyInitialized)
  {
    v2->_haveKey = 0;
    CFTypeRef result = 0;
    uint64_t v3 = *MEMORY[0x263F171B8];
    uint64_t v4 = *MEMORY[0x263F171C8];
    uint64_t v5 = *MEMORY[0x263F17518];
    v31[0] = *MEMORY[0x263F171B8];
    v31[1] = v5;
    uint64_t v6 = *MEMORY[0x263EFFB40];
    v32[0] = v4;
    v32[1] = v6;
    uint64_t v7 = *MEMORY[0x263F16E80];
    uint64_t v8 = *MEMORY[0x263F170B0];
    v31[2] = *MEMORY[0x263F16E80];
    v31[3] = v8;
    v32[2] = @"com.apple.Markup";
    v32[3] = v6;
    uint64_t v9 = *MEMORY[0x263F17090];
    uint64_t v10 = *MEMORY[0x263F16ED8];
    v31[4] = *MEMORY[0x263F17090];
    v31[5] = v10;
    uint64_t v25 = v10;
    v32[4] = @"Sketch Service Privacy";
    v32[5] = @"Sketch Service";
    uint64_t v11 = *MEMORY[0x263F17400];
    v31[6] = *MEMORY[0x263F17400];
    uint64_t v12 = *MEMORY[0x263F17410];
    v32[6] = *MEMORY[0x263F17410];
    CFDictionaryRef query = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:7];
    OSStatus v13 = SecItemCopyMatching(query, &result);
    if (v13 == -25300)
    {
      generateRandomKey(v2->_key);
      v16 = [MEMORY[0x263EFF8F8] dataWithBytes:v2->_key length:16];
      v24 = [v16 base64EncodedDataWithOptions:0];

      v29[0] = v3;
      v29[1] = v9;
      v30[0] = v4;
      v30[1] = @"Sketch Service Privacy";
      v29[2] = *MEMORY[0x263F17000];
      v29[3] = v7;
      v30[2] = @"Sketch Service Privacy";
      v30[3] = @"com.apple.Markup";
      v30[4] = v6;
      uint64_t v17 = *MEMORY[0x263F16F08];
      v29[4] = v8;
      v29[5] = v17;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"Used for the encryption of image edit state metadata for the Markup service. Deletion will make it impossible for Markup to modify annotations that were previously placed on an image using Markup." value:&stru_26E1811C8 table:@"MUPayloadEncryption"];
      v30[5] = v19;
      v30[6] = @"Sketch Service";
      uint64_t v20 = *MEMORY[0x263F175A8];
      v29[6] = v25;
      v29[7] = v20;
      v30[7] = v24;
      CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:8];

      CFTypeRef cf = 0;
      OSStatus v21 = SecItemAdd(v14, &cf);
      if (v21) {
        NSLog(&cfstr_CouldnTAddKeyT.isa, v21);
      }
      else {
        v2->_haveKey = 1;
      }
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      if (v13)
      {
        NSLog(&cfstr_Secitemcopymat.isa, v13, &stru_26E1811C8);
LABEL_16:
        v2->_keyInitialized = 1;

        goto LABEL_17;
      }
      v24 = (void *)[(id)result mutableCopy];
      CFDictionaryRef v14 = [v24 objectForKey:v25];
      v15 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:query];
      [v15 removeObjectForKey:v5];
      [v15 setObject:v6 forKey:*MEMORY[0x263F17520]];
      [v15 setObject:v12 forKey:v11];
      [v15 setObject:v4 forKey:v3];
      [v15 setValue:v14 forKey:v25];
      CFTypeRef cf = 0;
      if (!SecItemCopyMatching((CFDictionaryRef)v15, &cf))
      {
        v22 = (void *)cf;
        if (cf)
        {
          v23 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:cf options:0];

          if (v23)
          {
            [v23 getBytes:v2->_key length:16];
            v2->_haveKey = 1;
          }
        }
      }
    }
    goto LABEL_16;
  }
LABEL_17:
  objc_sync_exit(v2);
}

@end