@interface NSURL(IconServicesInternalAdditions)
+ (id)_is_unregisteredPersonlityFileExtensions;
+ (uint64_t)__is__isNetBoot;
+ (uint64_t)__is__volumeTypeCodeFromURLProperties:()IconServicesInternalAdditions;
- (id)__is__attributeModifiedDate;
- (id)__is__contentModifiedDate;
- (id)__is__modifiedDate;
- (id)__is_canonicalURL;
- (uint64_t)__is__volumeTypeCode;
- (uint64_t)__is_packageTypeCode;
@end

@implementation NSURL(IconServicesInternalAdditions)

+ (id)_is_unregisteredPersonlityFileExtensions
{
  if (_is_unregisteredPersonlityFileExtensions_onceToken != -1) {
    dispatch_once(&_is_unregisteredPersonlityFileExtensions_onceToken, &__block_literal_global_39_0);
  }
  v0 = (void *)_is_unregisteredPersonlityFileExtensions_personalityMap;
  return v0;
}

- (id)__is_canonicalURL
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1C628];
  v11[0] = *MEMORY[0x1E4F1C520];
  uint64_t v2 = v11[0];
  v11[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v10 = 0;
  v5 = objc_msgSend(a1, "__is_resourceValuesForKeys:error:", v4, &v10);

  v6 = objc_msgSend(v5, "_IF_stringForKey:", v2);
  uint64_t v7 = objc_msgSend(v5, "_IF_BOOLForKey:", v3);
  if (v6)
  {
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__is__contentModifiedDate
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C530], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];

    id v2 = (id)v3;
  }
  return v2;
}

- (id)__is__attributeModifiedDate
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C518], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];

    id v2 = (id)v3;
  }
  return v2;
}

- (id)__is__modifiedDate
{
  id v2 = objc_msgSend(a1, "__is__attributeModifiedDate");
  uint64_t v3 = objc_msgSend(a1, "__is__contentModifiedDate");
  if ([v3 compare:v2] == -1) {
    v4 = v2;
  }
  else {
    v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (uint64_t)__is_packageTypeCode
{
  return 0;
}

+ (uint64_t)__is__isNetBoot
{
  if (__is__isNetBoot_once != -1) {
    dispatch_once(&__is__isNetBoot_once, &__block_literal_global_42);
  }
  return __is__isNetBoot_result;
}

+ (uint64_t)__is__volumeTypeCodeFromURLProperties:()IconServicesInternalAdditions
{
  return 0;
}

- (uint64_t)__is__volumeTypeCode
{
  return 0;
}

@end