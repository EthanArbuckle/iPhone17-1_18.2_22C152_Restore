@interface ABVCardCardDAVValueSetter
+ (__CFDictionary)_personToGroupPropertyMap;
+ (int)groupPropertyForPersonProperty:(int)a3;
- (ABVCardCardDAVValueSetter)initWithGroup:(void *)a3 options:(unint64_t)a4;
- (ABVCardCardDAVValueSetter)initWithPerson:(void *)a3 options:(unint64_t)a4;
- (BOOL)propertyIsValidForPerson:(unsigned int)a3;
- (BOOL)recordIsGroup;
- (BOOL)setImageData:(id)a3 cropRectX:(int)a4 cropRectY:(int)a5 cropRectWidth:(int)a6 cropRectHeight:(int)a7;
- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4;
- (id)imageData;
- (void)_drainExistingProperties;
- (void)copyParsedRecordWithSource:(void *)a3 outRecordType:(unsigned int *)a4;
- (void)setRecordIsGroup:(BOOL)a3;
- (void)valueForProperty:(unsigned int)a3;
@end

@implementation ABVCardCardDAVValueSetter

+ (__CFDictionary)_personToGroupPropertyMap
{
  result = (__CFDictionary *)_personToGroupPropertyMap_propertyMap;
  if (!_personToGroupPropertyMap_propertyMap)
  {
    _personToGroupPropertyMap_propertyMap = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonLastNameProperty, (const void *)kABGroupNameProperty);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonExternalIdentifierProperty, (const void *)kABGroupExternalIdentifierProperty);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonExternalUUIDProperty, (const void *)kABGroupExternalUUIDProperty);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonExternalRepresentationProperty, (const void *)kABGroupExternalRepresentationProperty);
    return (__CFDictionary *)_personToGroupPropertyMap_propertyMap;
  }
  return result;
}

+ (int)groupPropertyForPersonProperty:(int)a3
{
  value = (void *)-1;
  CFDictionaryGetValueIfPresent((CFDictionaryRef)[a1 _personToGroupPropertyMap], (const void *)a3, (const void **)&value);
  return (int)value;
}

- (BOOL)propertyIsValidForPerson:(unsigned int)a3
{
  return !self->_importingToExistingGroup
      || [(id)objc_opt_class() groupPropertyForPersonProperty:*(void *)&a3] != -1;
}

- (void)copyParsedRecordWithSource:(void *)a3 outRecordType:(unsigned int *)a4
{
  v16[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!self->_recordIsGroup)
  {
    CFTypeRef v7 = CFRetain(self->super._person);
    if (!a4) {
      return (void *)v7;
    }
    goto LABEL_12;
  }
  if (a3) {
    ABRecordRef v6 = ABGroupCreateInSource(a3);
  }
  else {
    ABRecordRef v6 = ABGroupCreate();
  }
  CFTypeRef v7 = v6;
  CFDictionaryRef v8 = (const __CFDictionary *)[(id)objc_opt_class() _personToGroupPropertyMap];
  CFIndex Count = CFDictionaryGetCount(v8);
  v10 = (const void **)((char *)v16 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = (ABPropertyID *)v10;
  CFDictionaryGetKeysAndValues(v8, v16, v10);
  if (Count >= 1)
  {
    do
    {
      ABPropertyID v12 = *(_DWORD *)v10++;
      CFTypeRef v13 = ABRecordCopyValue(self->super._person, v12);
      if (v13)
      {
        v14 = v13;
        ABRecordSetValue(v7, *v11, v13, 0);
        CFRelease(v14);
      }
      v11 += 2;
      --Count;
    }
    while (Count);
  }
  if (a4) {
LABEL_12:
  }
    *a4 = self->_recordIsGroup;
  return (void *)v7;
}

- (void)valueForProperty:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!-[ABVCardCardDAVValueSetter propertyIsValidForPerson:](self, "propertyIsValidForPerson:")) {
    return 0;
  }
  if (self->_importingToExistingGroup)
  {
    uint64_t v3 = [(id)objc_opt_class() groupPropertyForPersonProperty:v3];
    if (v3 == -1) {
      return 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ABVCardCardDAVValueSetter;
  return [(ABVCardPersonValueSetter *)&v6 valueForProperty:v3];
}

- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4
{
  if (self->_importingToExistingGroup)
  {
    ABPropertyID v6 = [(id)objc_opt_class() groupPropertyForPersonProperty:*(void *)&a4];
    if (v6 == -1)
    {
      return 0;
    }
    else
    {
      ABPropertyID v7 = v6;
      if (ABRecordSetValue(self->super._person, v6, a3, 0)) {
        CFArrayAppendValue(self->super._properties, (const void *)v7);
      }
      return 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ABVCardCardDAVValueSetter;
    return [(ABVCardPersonValueSetter *)&v9 setValue:a3 forProperty:*(void *)&a4];
  }
}

- (void)_drainExistingProperties
{
  CFArrayRef v3 = (const __CFArray *)[(id)objc_opt_class() supportedProperties];
  if (v3)
  {
    CFArrayRef v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      int v8 = kABGroupExternalIdentifierProperty;
      int v9 = kABGroupExternalUUIDProperty;
      int v10 = kABPersonExternalIdentifierProperty;
      int v11 = kABPersonExternalUUIDProperty;
      int v16 = kABPersonWallpaperProperty;
      int v15 = kABPersonWallpaperURIProperty;
      int v19 = kABPersonImageURIProperty;
      int v18 = kABPersonImageHashProperty;
      int v17 = kABPersonImageTypeProperty;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
        ABPropertyID v13 = (int)ValueAtIndex;
        if (self->_importingToExistingGroup)
        {
          ABPropertyID v14 = [(id)objc_opt_class() groupPropertyForPersonProperty:ValueAtIndex];
          if (v14 == v8) {
            goto LABEL_19;
          }
          ABPropertyID v13 = v14;
          if (v14 == -1 || v14 == v9) {
            goto LABEL_19;
          }
        }
        else if (v10 == ValueAtIndex {
               || v11 == ValueAtIndex
        }
               || !self->_wallpaperSupported && (v16 == ValueAtIndex || v15 == ValueAtIndex)
               || self->_isImageSyncFailedTimeSet
               && (v19 == ValueAtIndex || v18 == ValueAtIndex || v17 == ValueAtIndex))
        {
          goto LABEL_19;
        }
        ABRecordRemoveValue(self->super._person, v13, 0);
LABEL_19:
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

- (ABVCardCardDAVValueSetter)initWithPerson:(void *)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ABVCardCardDAVValueSetter;
  v5 = [(ABVCardPersonValueSetter *)&v8 initWithPerson:a3];
  CFIndex v6 = v5;
  if (v5)
  {
    v5->_wallpaperSupported = (v4 & 2) != 0;
    v5->_isImageSyncFailedTimeSet = [(ABVCardCardDAVValueSetter *)v5 valueForProperty:kABPersonImageSyncFailedTimeProperty] != 0;
    if (v4) {
      [(ABVCardCardDAVValueSetter *)v6 _drainExistingProperties];
    }
  }
  return v6;
}

- (ABVCardCardDAVValueSetter)initWithGroup:(void *)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ABVCardCardDAVValueSetter;
  v5 = [(ABVCardPersonValueSetter *)&v8 initWithPerson:a3];
  CFIndex v6 = v5;
  if (v5)
  {
    v5->_importingToExistingGroup = 1;
    if (v4) {
      [(ABVCardCardDAVValueSetter *)v5 _drainExistingProperties];
    }
  }
  return v6;
}

- (BOOL)setImageData:(id)a3 cropRectX:(int)a4 cropRectY:(int)a5 cropRectWidth:(int)a6 cropRectHeight:(int)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_recordIsGroup)
  {
    uint64_t v7 = *(void *)&a7;
    uint64_t v8 = *(void *)&a6;
    uint64_t v9 = *(void *)&a5;
    uint64_t v10 = *(void *)&a4;
    CFDataRef v13 = ABPersonCopyImageDataWithFormat(self->super._person, (ABPersonImageFormat)5u);
    CFDataRef v14 = v13;
    if (v13 && [(__CFData *)v13 isEqualToData:a3])
    {
      if (ABImageUtilsOriginalSizeCropRectMatchesSyncedCropRect((uint64_t)self->super._person, (const __CFData *)a3, (double)(int)v10, (double)(int)v9, (double)(int)v8, (double)(int)v7))
      {
        int v15 = ABOSLogGeneral();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[ABVCardCardDAVValueSetter setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:](v15);
        }
LABEL_13:

        return 1;
      }
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
    }
    int v17 = ABOSLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      int v18 = @"NO";
      if (!v16) {
        int v18 = @"YES";
      }
      v22 = v18;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 1024;
      int v26 = v9;
      __int16 v27 = 1024;
      int v28 = v8;
      __int16 v29 = 1024;
      int v30 = v7;
      __int16 v31 = 2114;
      v32 = @"YES";
      _os_log_impl(&dword_19DCDB000, v17, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Sync image changed: %{public}@, cropRect {%i, %i, %i, %i} changed: %{public}@. Updating sync image on person", buf, 0x2Eu);
    }
    v20.receiver = self;
    v20.super_class = (Class)ABVCardCardDAVValueSetter;
    [(ABVCardPersonValueSetter *)&v20 setImageData:a3 cropRectX:v10 cropRectY:v9 cropRectWidth:v8 cropRectHeight:v7];
    ABPersonSetImageDataDerivedFromFormatAndReturnError(self->super._person, 5);
    goto LABEL_13;
  }
  return 1;
}

- (id)imageData
{
  if (self->_importingToExistingGroup || self->_recordIsGroup) {
    CFDataRef v2 = 0;
  }
  else {
    CFDataRef v2 = ABPersonCopyImageDataWithFormat(self->super._person, (ABPersonImageFormat)5u);
  }
  return v2;
}

- (BOOL)recordIsGroup
{
  return self->_recordIsGroup;
}

- (void)setRecordIsGroup:(BOOL)a3
{
  self->_recordIsGroup = a3;
}

- (void)setImageData:(os_log_t)log cropRectX:cropRectY:cropRectWidth:cropRectHeight:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19DCDB000, log, OS_LOG_TYPE_DEBUG, "[Likeness Update] Not setting image on person, as it hasn't changed", v1, 2u);
}

@end