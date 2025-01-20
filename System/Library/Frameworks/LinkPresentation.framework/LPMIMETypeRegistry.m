@interface LPMIMETypeRegistry
+ (BOOL)isARAssetType:(id)a3;
+ (BOOL)isAudioType:(id)a3;
+ (BOOL)isHLSType:(id)a3;
+ (BOOL)isImageType:(id)a3;
+ (BOOL)isJSONType:(id)a3;
+ (BOOL)isLosslessImageType:(id)a3;
+ (BOOL)isMediaType:(id)a3;
+ (BOOL)isNonAnimatedMultiframeImageType:(id)a3;
+ (BOOL)isVideoType:(id)a3;
+ (BOOL)isWebPageType:(id)a3;
+ (id)MIMETypeForUTI:(id)a3;
+ (id)UTIForFileExtension:(id)a3;
+ (id)UTIForMIMEType:(id)a3;
+ (id)fileExtensionForMIMEType:(id)a3;
+ (id)fileExtensionForUTI:(id)a3;
@end

@implementation LPMIMETypeRegistry

+ (BOOL)isWebPageType:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"text/html") & 1) != 0
    || (objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"application/xhtml+xml") & 1) != 0
    || (objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"text/xml") & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"application/xml");
  }

  return v4;
}

+ (BOOL)isImageType:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (isImageType__onceToken != -1)
  {
    dispatch_once(&isImageType__onceToken, &__block_literal_global_12);
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    char v5 = 0;
    goto LABEL_9;
  }
  if (!v3) {
    goto LABEL_8;
  }
LABEL_3:
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"image/x-icon") & 1) != 0
    || (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"image/jpg") & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", isImageType__validImageMIMETypes);
  }
LABEL_9:

  return v5;
}

void __34__LPMIMETypeRegistry_isImageType___block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)isImageType__validImageMIMETypes;
  isImageType__validImageMIMETypes = (uint64_t)v0;

  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  CFArrayRef v2 = CGImageSourceCopyTypeIdentifiers();
  uint64_t v3 = [(__CFArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = +[LPMIMETypeRegistry MIMETypeForUTI:](LPMIMETypeRegistry, "MIMETypeForUTI:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        if (v6) {
          [(id)isImageType__validImageMIMETypes addObject:v6];
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(__CFArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (BOOL)isVideoType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && ((objc_msgSend(v4, "_lp_hasCaseInsensitivePrefix:", @"video/") & 1) != 0
     || (objc_msgSend(v5, "_lp_hasCaseInsensitivePrefix:", @"application/") & 1) != 0))
  {
    char v6 = [a1 isMediaType:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isMediaType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "_lp_hasCaseInsensitivePrefix:", @"video/") & 1) == 0
    && (objc_msgSend(v4, "_lp_hasCaseInsensitivePrefix:", @"audio/") & 1) == 0
    && (objc_msgSend(v4, "_lp_hasCaseInsensitivePrefix:", @"application/") & 1) == 0)
  {
    goto LABEL_8;
  }
  if (knownUnavailableMediaMIMETypes_onceToken != -1) {
    dispatch_once(&knownUnavailableMediaMIMETypes_onceToken, &__block_literal_global_98);
  }
  if ((objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", knownUnavailableMediaMIMETypes_types) & 1) == 0)
  {
    if (knownAvailableMediaMIMETypes_onceToken != -1) {
      dispatch_once(&knownAvailableMediaMIMETypes_onceToken, &__block_literal_global_124);
    }
    if (objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", knownAvailableMediaMIMETypes_types))
    {
      char v5 = 1;
    }
    else
    {
      if (avFoundationMIMETypes_onceToken != -1) {
        dispatch_once(&avFoundationMIMETypes_onceToken, &__block_literal_global_207);
      }
      char v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", avFoundationMIMETypes_types);
    }
  }
  else
  {
LABEL_8:
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isAudioType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    char v5 = objc_msgSend(v3, "_lp_hasCaseInsensitivePrefix:", @"audio/");
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isJSONType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualIgnoringCase:", @"application/json");
}

+ (BOOL)isLosslessImageType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualIgnoringCase:", @"image/png");
}

+ (BOOL)isHLSType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712990);
}

+ (BOOL)isARAssetType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF7129A8);
}

+ (BOOL)isNonAnimatedMultiframeImageType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF7129C0);
}

+ (id)MIMETypeForUTI:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 _lp_isEqualIgnoringCase:@"com.pixar.universal-scene-description-mobile"])
  {
    id v4 = @"model/vnd.usdz+zip";
  }
  else if ([(__CFString *)v3 _lp_isEqualIgnoringCase:@"com.apple.watchface"])
  {
    id v4 = @"application/vnd.apple.watchface";
  }
  else if ([(__CFString *)v3 _lp_isEqualIgnoringCase:@"com.apple.coreaudio-format"])
  {
    id v4 = @"audio/x-caf";
  }
  else
  {
    id v4 = (__CFString *)UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x1E4F22500]);
  }

  return v4;
}

+ (id)UTIForMIMEType:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 _lp_isEqualIgnoringCase:@"application/vnd.apple.watchface"]) {
    PreferredIdentifierForTag = @"com.apple.watchface";
  }
  else {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], v3, 0);
  }

  return PreferredIdentifierForTag;
}

+ (id)UTIForFileExtension:(id)a3
{
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], (CFStringRef)a3, 0);

  return PreferredIdentifierForTag;
}

+ (id)fileExtensionForUTI:(id)a3
{
  id v3 = (__CFString *)UTTypeCopyPreferredTagWithClass((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F224F8]);

  return v3;
}

+ (id)fileExtensionForMIMEType:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", @"application/vnd.apple.watchface"))
  {
    char v5 = @"watchface";
  }
  else
  {
    char v6 = [a1 UTIForMIMEType:v4];
    char v5 = [a1 fileExtensionForUTI:v6];
  }

  return v5;
}

@end