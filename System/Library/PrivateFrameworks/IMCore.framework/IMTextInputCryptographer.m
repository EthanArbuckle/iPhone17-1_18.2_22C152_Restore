@interface IMTextInputCryptographer
+ (id)sharedCryptographer;
- (IMTextInputCryptographer)init;
- (NSData)deviceSalt;
- (NSString)cachedRecipientDigest;
- (NSString)cachedRecipientName;
- (OS_dispatch_queue)dispatchQueue;
- (id)stringDigestForName:(id)a3;
- (void)prewarmDeviceSalt;
- (void)setCachedRecipientDigest:(id)a3;
- (void)setCachedRecipientName:(id)a3;
@end

@implementation IMTextInputCryptographer

- (void)prewarmDeviceSalt
{
  if (!self->_deviceSalt)
  {
    v5 = objc_msgSend_dispatchQueue(self, a2, v2, v3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4AFC074;
    block[3] = &unk_1E5B7ACD0;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (IMTextInputCryptographer)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMTextInputCryptographer;
  uint64_t v2 = [(IMTextInputCryptographer *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TextInput.crypto", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSData)deviceSalt
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  deviceSalt = self->_deviceSalt;
  if (!deviceSalt)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B9A0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5D0], @"deviceSalt");
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"com.apple.TextInput");
    CFTypeRef result = 0;
    OSStatus v6 = SecItemCopyMatching(Mutable, &result);
    v7 = self->_deviceSalt;
    self->_deviceSalt = (NSData *)result;

    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = self->_deviceSalt;
      if (v12) {
        v13 = @"NO";
      }
      else {
        v13 = @"YES";
      }
      uint64_t v14 = objc_msgSend_length(v12, v9, v10, v11);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      __int16 v40 = 1024;
      OSStatus v41 = v6;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Received _deviceSalt is nil? %@, length? %lu, with status: %d", buf, 0x1Cu);
    }

    if (self->_deviceSalt) {
      goto LABEL_18;
    }
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9564(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    memset(buf, 0, 20);
    arc4random_buf(buf, 0x14uLL);
    v23 = (NSData *)CFDataCreate(v4, buf, 20);
    v24 = self->_deviceSalt;
    self->_deviceSalt = v23;

    v25 = self->_deviceSalt;
    if (v25)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v25);
      OSStatus v26 = SecItemAdd(Mutable, 0);
      if (!v26)
      {
LABEL_18:
        CFRelease(Mutable);
        deviceSalt = self->_deviceSalt;
        goto LABEL_19;
      }
      int v27 = v26;
      v28 = IMLogHandleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB94EC(v27, v28);
      }

      p_super = &self->_deviceSalt->super;
      self->_deviceSalt = 0;
    }
    else
    {
      p_super = IMLogHandleForCategory();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB94B4(p_super, v30, v31, v32, v33, v34, v35, v36);
      }
    }

    goto LABEL_18;
  }
LABEL_19:

  return deviceSalt;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

+ (id)sharedCryptographer
{
  if (qword_1E965E588 != -1) {
    dispatch_once(&qword_1E965E588, &unk_1EF8E5738);
  }
  uint64_t v2 = (void *)qword_1E965E580;

  return v2;
}

- (id)stringDigestForName:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1A4B345AC;
  uint64_t v21 = sub_1A4B343BC;
  id v22 = 0;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_dispatchQueue(self, v8, v9, v10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C3A4E0;
    block[3] = &unk_1E5B7BDD0;
    block[4] = self;
    id v15 = v4;
    uint64_t v16 = &v17;
    dispatch_sync(v11, block);
  }
  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (NSString)cachedRecipientName
{
  return self->_cachedRecipientName;
}

- (void)setCachedRecipientName:(id)a3
{
}

- (NSString)cachedRecipientDigest
{
  return self->_cachedRecipientDigest;
}

- (void)setCachedRecipientDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecipientDigest, 0);
  objc_storeStrong((id *)&self->_cachedRecipientName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_deviceSalt, 0);
}

@end