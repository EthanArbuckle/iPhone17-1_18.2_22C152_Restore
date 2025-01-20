@interface _MDLabel
- ($DCF20CAD073027CB89FDEFA7A9A33809)_getUUIDBytesForUserUUID:(__CFUUID *)a3;
- (BOOL)isEqual:(id)a3;
- (_MDLabel)initWithUUID:(__CFUUID *)a3 attributes:(__CFDictionary *)a4 forUserUUID:(__CFUUID *)a5;
- (id)description;
- (id)getAttrFallback:(const __CFString *)a3;
- (unint64_t)_cfTypeID;
- (unint64_t)hash;
- (void)_copyXattrUpdatesKey;
- (void)dealloc;
- (void)getAttr:(__CFString *)a3;
- (void)updateAttrs:(__CFDictionary *)a3;
@end

@implementation _MDLabel

- ($DCF20CAD073027CB89FDEFA7A9A33809)_getUUIDBytesForUserUUID:(__CFUUID *)a3
{
  CFUUIDBytes v7 = CFUUIDGetUUIDBytes(self->_uuid);
  uint64_t v6 = *(void *)&v7.byte8;
  uint64_t v5 = *(void *)&v7.byte0;
  CFUUIDBytes data = v7;
  if ((*(unsigned char *)&self->_attrBits.var0 & 2) == 0)
  {
    memset(&v8, 0, sizeof(v8));
    CC_MD5_Init(&v8);
    CC_MD5_Update(&v8, &data, 0x10u);
    CFUUIDBytes data = CFUUIDGetUUIDBytes(a3);
    CC_MD5_Update(&v8, &data, 0x10u);
    CC_MD5_Final(&data.byte0, &v8);
    uint64_t v6 = *(void *)&data.byte8;
    uint64_t v5 = *(void *)&data.byte0;
  }
  result.var8 = v6;
  result.var9 = BYTE1(v6);
  result.var10 = BYTE2(v6);
  result.var11 = BYTE3(v6);
  result.var12 = BYTE4(v6);
  result.var13 = BYTE5(v6);
  result.var14 = BYTE6(v6);
  result.var15 = HIBYTE(v6);
  result.var0 = v5;
  result.var1 = BYTE1(v5);
  result.var2 = BYTE2(v5);
  result.var3 = BYTE3(v5);
  result.var4 = BYTE4(v5);
  result.var5 = BYTE5(v5);
  result.var6 = BYTE6(v5);
  result.var7 = HIBYTE(v5);
  return result;
}

- (_MDLabel)initWithUUID:(__CFUUID *)a3 attributes:(__CFDictionary *)a4 forUserUUID:(__CFUUID *)a5
{
  v15.receiver = self;
  v15.super_class = (Class)_MDLabel;
  CC_MD5_CTX v8 = [(_MDLabel *)&v15 init];
  if (v8)
  {
    if (a4)
    {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a4);
      v8->_attrs = MutableCopy;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, kMDLabelAttributeBits);
      if ((!Value || !CFNumberGetValue(Value, kCFNumberSInt64Type, &v8->_attrBits))
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10000F774((uint64_t)a4);
      }
    }
    else
    {
      v8->_attrs = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    v8->_uuid = (__CFUUID *)CFRetain(a3);
    v8->_userUUID = (__CFUUID *)CFRetain(a5);
    id v11 = [(_MDLabel *)v8 _getUUIDBytesForUserUUID:a5];
    _MDLabelUUIDEncode((unint64_t)v11, v12, (uint64_t)byte_10001A3E8);
    CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, byte_10001A3E8, 0x8000100u);
    CFDictionarySetValue(v8->_attrs, kMDLabelID, v13);
    CFRelease(v13);
  }
  return v8;
}

- (void)dealloc
{
  CFRelease(self->_attrs);
  CFRelease(self->_uuid);
  CFRelease(self->_userUUID);
  v3.receiver = self;
  v3.super_class = (Class)_MDLabel;
  [(_MDLabel *)&v3 dealloc];
}

- (unint64_t)_cfTypeID
{
  if (qword_10001A3E0 != -1) {
    dispatch_once(&qword_10001A3E0, &stru_100014CA0);
  }
  return qword_10001A3D8;
}

- (id)description
{
  CFStringRef v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"<MDLabel %p [%@]>", self, self->_uuid);
  objc_super v3 = (id)CFMakeCollectable(v2);
  return v3;
}

- (unint64_t)hash
{
  return CFHash(self->_uuid);
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && CFEqual(self->_uuid, *((CFTypeRef *)a3 + 2)) != 0;
}

- (void)_copyXattrUpdatesKey
{
  return 0;
}

- (id)getAttrFallback:(const __CFString *)a3
{
  return 0;
}

- (void)getAttr:(__CFString *)a3
{
  $DCF20CAD073027CB89FDEFA7A9A33809 result = (void *)CFDictionaryGetValue(self->_attrs, a3);
  if (!result)
  {
    return [(_MDLabel *)self getAttrFallback:a3];
  }
  return result;
}

- (void)updateAttrs:(__CFDictionary *)a3
{
  CFIndex Count = CFDictionaryGetCount(a3);
  uint64_t v6 = (const void **)((char *)&v11 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v6, 8 * Count);
  CFUUIDBytes v7 = v6;
  bzero(v6, 8 * Count);
  CFDictionaryGetKeysAndValues(a3, v6, v6);
  if (Count >= 1)
  {
    do
    {
      v9 = *v6++;
      CC_MD5_CTX v8 = v9;
      v10 = *v7++;
      CFDictionarySetValue(self->_attrs, v8, v10);
      --Count;
    }
    while (Count);
  }
  [(_MDLabel *)self cleanAttrs];
}

@end