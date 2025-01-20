@interface ICCameraFile
+ (id)fingerprintForFileAtURL:(id)a3;
- (BOOL)burstFavorite;
- (BOOL)burstPicked;
- (BOOL)convertedFamily;
- (BOOL)firstPicked;
- (BOOL)highFramerate;
- (BOOL)isAudio;
- (BOOL)isConverted;
- (BOOL)isData;
- (BOOL)isDataUniversal;
- (BOOL)isEdited:(unint64_t)a3;
- (BOOL)isEditedConverted;
- (BOOL)isEditedOriginal;
- (BOOL)isEditedUniversal;
- (BOOL)isHEIC;
- (BOOL)isImage;
- (BOOL)isJPEG;
- (BOOL)isLegacy;
- (BOOL)isMovie;
- (BOOL)isNonRawImage;
- (BOOL)isOriginal;
- (BOOL)isSidecar;
- (BOOL)isUniversal;
- (BOOL)isUntouched:(unint64_t)a3;
- (BOOL)orientationOverridden;
- (BOOL)originalFamily;
- (BOOL)partOfFamily:(unint64_t)a3;
- (BOOL)privHasMetadata;
- (BOOL)privHasThumbnail;
- (BOOL)retrievedMetadata;
- (BOOL)retrievedThumbnail;
- (BOOL)setMetadata:(id)a3;
- (BOOL)timeLapse;
- (BOOL)universalFamily;
- (BOOL)useExtensionIcon;
- (CGImage)thumbnail;
- (ICCameraFile)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5;
- (ICCameraFile)pairedRawImage;
- (NSArray)sidecarFiles;
- (NSData)thumbnailData;
- (NSDate)exifCreationDate;
- (NSDate)exifModificationDate;
- (NSDate)fileCreationDate;
- (NSDate)fileModificationDate;
- (NSDictionary)mediaData;
- (NSInteger)height;
- (NSInteger)width;
- (NSMutableDictionary)subImages;
- (NSProgress)progress;
- (NSProgress)requestDownloadWithOptions:(NSDictionary *)options completion:(void *)completion;
- (NSString)burstUUID;
- (NSString)createdFilename;
- (NSString)gpsString;
- (NSString)groupUUID;
- (NSString)mediaBase;
- (NSString)mediaItemType;
- (NSString)originalFilename;
- (NSString)originatingAssetID;
- (NSString)privFingerprint;
- (NSString)privMediaBase;
- (NSString)privSpatialOverCaptureGroupID;
- (NSString)relatedUUID;
- (double)duration;
- (double)lastImportSpeed;
- (id)base;
- (id)debugBadge;
- (id)debugIdentity;
- (id)debugType;
- (id)description;
- (id)metadata;
- (id)thumbnailDataUsingOrientation:(id)a3 andSourceThumbnailData:(id)a4;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)compareDate:(id)a3;
- (int64_t)compareUUID:(id)a3;
- (off_t)fileSize;
- (unint64_t)mediaMetadata;
- (unint64_t)oUUID;
- (unint64_t)privOrientation;
- (unint64_t)uTime;
- (unsigned)objectHandle;
- (void)addSidecarFile:(id)a3;
- (void)flagAsSidecar;
- (void)flagMediaMetadata:(unint64_t)a3;
- (void)flushThumbnailCache;
- (void)handleObjectInfoUpdate:(id)a3;
- (void)requestCloseStreamData;
- (void)requestFingerprintWithCompletion:(id)a3;
- (void)requestMetadata;
- (void)requestMetadataDictionaryWithOptions:(NSDictionary *)options completion:(void *)completion;
- (void)requestMetadataWithOptions:(id)a3 completion:(id)a4;
- (void)requestOpenStreamData;
- (void)requestReadDataAtOffset:(off_t)offset length:(off_t)length completion:(void *)completion;
- (void)requestRefreshObjectHandleInfo:(id)a3;
- (void)requestSecurityScopedURLWithCompletion:(void *)completion;
- (void)requestStreamDataAtOffset:(int64_t)a3 length:(int64_t)a4 completion:(id)a5;
- (void)requestThumbnail;
- (void)requestThumbnailDataWithOptions:(NSDictionary *)options completion:(void *)completion;
- (void)requestThumbnailWithOptions:(id)a3 completion:(id)a4;
- (void)setBurstFavorite:(BOOL)a3;
- (void)setBurstPicked:(BOOL)a3;
- (void)setBurstUUID:(id)a3;
- (void)setCreatedFilename:(id)a3;
- (void)setDuration:(double)a3;
- (void)setExifCreationDate:(id)a3;
- (void)setExifModificationDate:(id)a3;
- (void)setFileCreationDate:(id)a3;
- (void)setFileModificationDate:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setFirstPicked:(BOOL)a3;
- (void)setGpsString:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setHeight:(int64_t)a3;
- (void)setHighFramerate:(BOOL)a3;
- (void)setKeywordPropertiesFromDict:(id)a3;
- (void)setLastImportSpeed:(double)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaMetadata:(unint64_t)a3;
- (void)setOUUID:(unint64_t)a3;
- (void)setOrientation:(ICEXIFOrientationType)orientation;
- (void)setOrientationOverridden:(BOOL)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setOriginatingAssetID:(id)a3;
- (void)setPairedRawImage:(id)a3;
- (void)setPrivFingerprint:(id)a3;
- (void)setPrivHasMetadata:(BOOL)a3;
- (void)setPrivHasThumbnail:(BOOL)a3;
- (void)setPrivMediaBase:(id)a3;
- (void)setPrivOrientation:(unint64_t)a3;
- (void)setPrivSpatialOverCaptureGroupID:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRelatedUUID:(id)a3;
- (void)setSidecarFiles:(id)a3;
- (void)setSubImages:(id)a3;
- (void)setThumbnailData:(id)a3;
- (void)setTimeLapse:(BOOL)a3;
- (void)setUTI:(id)a3;
- (void)setUTime:(unint64_t)a3;
- (void)setUseExtensionIcon:(BOOL)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation ICCameraFile

- (NSString)mediaItemType
{
  return (NSString *)@"file";
}

- (int64_t)compareUUID:(id)a3
{
  unint64_t v4 = [a3 oUUID];
  if (v4 == [(ICCameraFile *)self oUUID]) {
    return 0;
  }
  if (v4 > [(ICCameraFile *)self oUUID]) {
    return -1;
  }
  return 1;
}

- (int64_t)compareDate:(id)a3
{
  unint64_t v4 = [a3 uTime];
  if (v4 == [(ICCameraFile *)self uTime]) {
    return 0;
  }
  if (v4 > [(ICCameraFile *)self uTime]) {
    return -1;
  }
  return 1;
}

- (void)flushThumbnailCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ICCameraFile_flushThumbnailCache__block_invoke;
  block[3] = &unk_1E63D72A8;
  block[4] = self;
  ICPerformBlockOnMainThread(block);
}

uint64_t __35__ICCameraFile_flushThumbnailCache__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"thumbnail"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"thumbnailIfAvailable"];
  v2 = [*(id *)(a1 + 32) thumbnailData];

  if (v2) {
    [*(id *)(a1 + 32) setThumbnailData:0];
  }
  [*(id *)(a1 + 32) setThumbnailState:1];
  [*(id *)(a1 + 32) didChangeValueForKey:@"thumbnailIfAvailable"];
  v3 = *(void **)(a1 + 32);

  return [v3 didChangeValueForKey:@"thumbnail"];
}

- (void)setOrientation:(ICEXIFOrientationType)orientation
{
  v5 = [(ICCameraItem *)self UTI];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F442D8];
    v7 = [(ICCameraItem *)self UTI];
    id v8 = [v6 typeWithIdentifier:v7];

    if ([(ICCameraFile *)self orientation] != orientation
      && [v8 conformsToType:*MEMORY[0x1E4F44400]])
    {
      [(ICCameraFile *)self setOrientationOverridden:1];
      [(ICCameraFile *)self setPrivOrientation:orientation];
    }
  }
}

- (void)addSidecarFile:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(ICCameraFile *)self willChangeValueForKey:@"sidecarFiles"];
    [(NSMutableArray *)self->_sidecarFiles addObject:v4];
    objc_msgSend(v4, "setOwnerID:", -[ICCameraItem objectID](self, "objectID"));

    [(ICCameraFile *)self didChangeValueForKey:@"sidecarFiles"];
  }
}

- (NSArray)sidecarFiles
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_sidecarFiles];
}

- (id)debugBadge
{
  if (!self->_debugBadge)
  {
    self->_debugBadge = (NSString *)@"　 　";

    if ([(ICCameraItem *)self isRaw])
    {
      v3 = @"🅁";
    }
    else if ([(ICCameraFile *)self isJPEG])
    {
      v3 = @"🄹";
    }
    else
    {
      if (![(ICCameraFile *)self isHEIC]) {
        goto LABEL_9;
      }
      v3 = @"🄷";
    }
    debugBadge = self->_debugBadge;
    self->_debugBadge = &v3->isa;
  }
LABEL_9:
  v5 = self->_debugBadge;

  return v5;
}

- (id)debugType
{
  if (!self->_debugType)
  {
    self->_debugType = (NSString *)@"　 　";

    if ([(ICCameraFile *)self isOriginal])
    {
      v3 = @"🄾 　";
    }
    else if ([(ICCameraFile *)self isEditedOriginal])
    {
      v3 = @"🄾 🄔";
    }
    else if ([(ICCameraFile *)self isConverted])
    {
      v3 = @"🅒 　";
    }
    else
    {
      if (![(ICCameraFile *)self isEditedConverted]) {
        goto LABEL_11;
      }
      v3 = @"🅒 🄔";
    }
    debugType = self->_debugType;
    self->_debugType = &v3->isa;
  }
LABEL_11:
  v5 = self->_debugType;

  return v5;
}

- (id)debugIdentity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICCameraFile *)self description];
  [v3 addObject:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(ICCameraFile *)self sidecarFiles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = [(NSMutableArray *)self->_sidecarFiles count];
  if ([(ICCameraItem *)self twinID]
    && ([(ICCameraItem *)self device],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "cameraFileWithObjectID:", -[ICCameraItem twinID](self, "twinID")),
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    uint64_t v6 = [v5 name];
  }
  else
  {
    uint64_t v6 = &stru_1F1A1D6A8;
  }
  uint64_t v7 = NSString;
  uint64_t v8 = [(ICCameraFile *)self debugType];
  v9 = [(ICCameraFile *)self debugBadge];
  id v10 = [(ICCameraItem *)self name];
  uint64_t v11 = [v10 UTF8String];
  long long v12 = v6;
  long long v13 = [v7 stringWithFormat:@"%@ %@ | %15s | %1lu | %15s", v8, v9, v11, v3, -[__CFString UTF8String](v12, "UTF8String")];

  return v13;
}

- (NSString)mediaBase
{
  if (self->_privMediaBase) {
    goto LABEL_10;
  }
  uint64_t v3 = [(ICCameraItem *)self name];
  id v4 = [v3 stringByDeletingPathExtension];
  [(ICCameraFile *)self setPrivMediaBase:v4];

  v5 = [(ICCameraFile *)self privMediaBase];
  unint64_t v6 = [v5 length];

  if (v6 >= 9)
  {
    uint64_t v7 = [(ICCameraFile *)self privMediaBase];
    int v8 = [v7 hasPrefix:@"IMG_O"];

    v9 = [(ICCameraFile *)self privMediaBase];
    id v10 = v9;
    if (v8)
    {
      uint64_t v11 = @"IMG_O";
    }
    else
    {
      int v12 = [v9 hasPrefix:@"IMG_A"];

      if (!v12) {
        goto LABEL_8;
      }
      v9 = [(ICCameraFile *)self privMediaBase];
      id v10 = v9;
      uint64_t v11 = @"IMG_A";
    }
    long long v13 = [v9 stringByReplacingOccurrencesOfString:v11 withString:@"IMG_"];
    [(ICCameraFile *)self setPrivMediaBase:v13];
  }
LABEL_8:
  long long v14 = [(ICCameraFile *)self privMediaBase];
  uint64_t v15 = [v14 length];

  if (v15 == 8)
  {
    v16 = [(ICCameraFile *)self privMediaBase];
    uint64_t v17 = [v16 stringByAppendingString:@" "];
    [(ICCameraFile *)self setPrivMediaBase:v17];
  }
LABEL_10:

  return [(ICCameraFile *)self privMediaBase];
}

- (BOOL)isUntouched:(unint64_t)a3
{
  return ([(ICCameraFile *)self mediaMetadata] & (a3 | 8)) == a3;
}

- (BOOL)isOriginal
{
  return [(ICCameraFile *)self isUntouched:2];
}

- (BOOL)isConverted
{
  return [(ICCameraFile *)self isUntouched:4];
}

- (BOOL)isUniversal
{
  return [(ICCameraFile *)self isUntouched:1];
}

- (BOOL)isEdited:(unint64_t)a3
{
  unint64_t v4 = a3 | 8;
  BOOL v5 = ([(ICCameraFile *)self mediaMetadata] & 0xE0) != 0;
  return (v4 & ~[(ICCameraFile *)self mediaMetadata]) == 0 && v5;
}

- (BOOL)isEditedOriginal
{
  return [(ICCameraFile *)self isEdited:2];
}

- (BOOL)isEditedConverted
{
  return [(ICCameraFile *)self isEdited:4];
}

- (BOOL)isEditedUniversal
{
  return [(ICCameraFile *)self isEdited:1];
}

- (BOOL)partOfFamily:(unint64_t)a3
{
  return (a3 & ~[(ICCameraFile *)self mediaMetadata]) == 0;
}

- (BOOL)convertedFamily
{
  return [(ICCameraFile *)self partOfFamily:4];
}

- (BOOL)originalFamily
{
  return [(ICCameraFile *)self partOfFamily:2];
}

- (BOOL)universalFamily
{
  return [(ICCameraFile *)self partOfFamily:1];
}

- (BOOL)isDataUniversal
{
  return (~[(ICCameraFile *)self mediaMetadata] & 0x11) == 0;
}

- (void)flagAsSidecar
{
  unint64_t v3 = [(ICCameraFile *)self mediaMetadata] | 0x400;

  [(ICCameraFile *)self setMediaMetadata:v3];
}

- (BOOL)isSidecar
{
  return ([(ICCameraFile *)self mediaMetadata] >> 10) & 1;
}

- (BOOL)isLegacy
{
  return ([(ICCameraFile *)self mediaMetadata] >> 9) & 1;
}

- (id)base
{
  v2 = [(ICCameraItem *)self name];
  unint64_t v3 = [v2 stringByDeletingPathExtension];

  return v3;
}

- (BOOL)isMovie
{
  unint64_t v3 = [(ICCameraItem *)self UTI];
  unint64_t v4 = [(id)*MEMORY[0x1E4F44448] identifier];
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = [(ICCameraItem *)self UTI];
    uint64_t v7 = [(id)*MEMORY[0x1E4F44420] identifier];
    char v5 = [v6 isEqualToString:v7];
  }
  return v5;
}

- (BOOL)isImage
{
  v2 = [(ICCameraItem *)self UTI];
  unint64_t v3 = [(id)*MEMORY[0x1E4F44400] identifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isNonRawImage
{
  unint64_t v3 = [(ICCameraItem *)self UTI];
  char v4 = [(id)*MEMORY[0x1E4F44400] identifier];
  if ([v3 isEqualToString:v4]) {
    BOOL v5 = ![(ICCameraItem *)self isRaw];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isAudio
{
  v2 = [(ICCameraItem *)self UTI];
  unint64_t v3 = [(id)*MEMORY[0x1E4F44330] identifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isData
{
  v2 = [(ICCameraItem *)self UTI];
  unint64_t v3 = [(id)*MEMORY[0x1E4F44378] identifier];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isJPEG
{
  if (!self->_fileIsJPEG)
  {
    uint64_t v7 = NSNumber;
    BOOL v8 = [(ICCameraFile *)self isImage];
    if (v8)
    {
      v2 = [(ICCameraItem *)self name];
      unint64_t v3 = [v2 pathExtension];
      if ([v3 caseInsensitiveCompare:@"JPG"])
      {
        char v4 = [(ICCameraItem *)self name];
        BOOL v5 = [v4 pathExtension];
        BOOL v9 = [v5 caseInsensitiveCompare:@"JPEG"] == 0;
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
        BOOL v9 = 1;
      }
    }
    else
    {
      int v10 = 0;
      BOOL v9 = 0;
    }
    uint64_t v11 = [v7 numberWithInt:v9];
    fileIsJPEG = self->_fileIsJPEG;
    self->_fileIsJPEG = v11;

    if (v10)
    {
    }
    if (v8)
    {
    }
  }
  long long v13 = self->_fileIsJPEG;

  return [(NSNumber *)v13 BOOLValue];
}

- (BOOL)isHEIC
{
  if (!self->_fileIsHEIC)
  {
    BOOL v5 = NSNumber;
    BOOL v6 = [(ICCameraFile *)self isImage];
    if (v6)
    {
      v2 = [(ICCameraItem *)self name];
      unint64_t v3 = [v2 pathExtension];
      BOOL v7 = [v3 caseInsensitiveCompare:@"HEIC"] == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    BOOL v8 = [v5 numberWithInt:v7];
    fileIsHEIC = self->_fileIsHEIC;
    self->_fileIsHEIC = v8;

    if (v6)
    {
    }
  }
  int v10 = self->_fileIsHEIC;

  return [(NSNumber *)v10 BOOLValue];
}

- (id)thumbnailDataUsingOrientation:(id)a3 andSourceThumbnailData:(id)a4
{
  id v6 = a3;
  CFDataRef v7 = (const __CFData *)a4;
  CFDataRef v8 = v7;
  if (v7)
  {
    BOOL v9 = CGImageSourceCreateWithData(v7, 0);
    if (v9)
    {
      int v10 = v9;
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
      CFRelease(v10);
      if (ImageAtIndex)
      {
        BOOL v12 = [(ICCameraFile *)self orientationOverridden];
        if (v6)
        {
          if (!v12)
          {
            uint64_t v13 = [v6 unsignedIntegerValue];
            if (v13 != [(ICCameraFile *)self orientation])
            {
              [(ICCameraFile *)self willChangeValueForKey:@"orientation"];
              [(ICCameraFile *)self setOrientation:v13];
              [(ICCameraFile *)self didChangeValueForKey:@"orientation"];
            }
          }
        }
        if ([v6 unsignedIntegerValue] == 1)
        {
          CFDataRef v14 = 0;
LABEL_21:
          [(ICCameraFile *)self setHasThumbnail:1];
          [(ICCameraItem *)self setThumbnailState:16];
          CFRelease(ImageAtIndex);
          if (v14) {
            CFDataRef v23 = v14;
          }
          else {
            CFDataRef v23 = v8;
          }
          CFDataRef v15 = v23;

          goto LABEL_25;
        }
        CFDataRef v14 = (const __CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
        v16 = ICCreateRotatedImageFromCGImage([v6 unsignedIntegerValue], ImageAtIndex);
        uint64_t v17 = [(id)*MEMORY[0x1E4F44410] identifier];
        v18 = CGImageDestinationCreateWithData(v14, v17, 1uLL, 0);

        if (v18 && v16)
        {
          CGImageDestinationAddImage(v18, v16, 0);
          if (!CGImageDestinationFinalize(v18))
          {
            __ICOSLogCreate();
            v19 = NSString;
            v20 = [(ICCameraItem *)self name];
            v21 = [v19 stringWithFormat:@"Thumb Rotate Failed: %@", v20];

            v22 = _gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
              +[ICPrefManager defaultAuthManager];
            }
          }
        }
        else if (!v16)
        {
          goto LABEL_19;
        }
        CFRelease(v16);
LABEL_19:
        if (v18) {
          CFRelease(v18);
        }
        goto LABEL_21;
      }
    }
  }
  CFDataRef v15 = 0;
LABEL_25:

  return v15;
}

- (CGImage)thumbnail
{
  CGImageRef ImageAtIndex = [(ICCameraFile *)self thumbnailData];
  if (ImageAtIndex)
  {
    CFDataRef v4 = [(ICCameraFile *)self thumbnailData];
    BOOL v5 = CGImageSourceCreateWithData(v4, 0);

    if (v5)
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
      CFRelease(v5);
    }
    else
    {
      CGImageRef ImageAtIndex = 0;
    }
  }

  return (CGImage *)ImageAtIndex;
}

- (void)setKeywordPropertiesFromDict:(id)a3
{
  id v38 = a3;
  [(ICCameraFile *)self duration];
  if (v4 == 0.0)
  {
    BOOL v5 = [v38 objectForKeyedSubscript:@"Duration"];

    if (v5)
    {
      id v6 = [v38 objectForKeyedSubscript:@"Duration"];
      [v6 doubleValue];
      -[ICCameraFile setDuration:](self, "setDuration:");
    }
  }
  CFDataRef v7 = [(ICCameraFile *)self burstUUID];
  if (!v7)
  {
    CFDataRef v8 = [v38 objectForKeyedSubscript:@"BurstUUID"];

    if (!v8) {
      goto LABEL_8;
    }
    CFDataRef v7 = [v38 objectForKeyedSubscript:@"BurstUUID"];
    [(ICCameraFile *)self setBurstUUID:v7];
  }

LABEL_8:
  BOOL v9 = [(ICCameraFile *)self originatingAssetID];
  if (v9)
  {
LABEL_11:

    goto LABEL_12;
  }
  int v10 = [v38 objectForKeyedSubscript:@"OriginatingAssetID"];

  if (v10)
  {
    BOOL v9 = [v38 objectForKeyedSubscript:@"OriginatingAssetID"];
    [(ICCameraFile *)self setOriginatingAssetID:v9];
    goto LABEL_11;
  }
LABEL_12:
  if (![(ICCameraFile *)self burstPicked])
  {
    uint64_t v11 = [v38 objectForKeyedSubscript:@"BurstPicked"];

    if (v11)
    {
      BOOL v12 = [v38 objectForKeyedSubscript:@"BurstPicked"];
      -[ICCameraFile setBurstPicked:](self, "setBurstPicked:", [v12 BOOLValue]);
    }
  }
  if (![(ICCameraFile *)self burstFavorite])
  {
    uint64_t v13 = [v38 objectForKeyedSubscript:@"BurstFavorite"];

    if (v13)
    {
      CFDataRef v14 = [v38 objectForKeyedSubscript:@"BurstFavorite"];
      -[ICCameraFile setBurstFavorite:](self, "setBurstFavorite:", [v14 BOOLValue]);
    }
  }
  if (![(ICCameraFile *)self highFramerate])
  {
    CFDataRef v15 = [v38 objectForKeyedSubscript:@"HighFramerate"];

    if (v15)
    {
      v16 = [v38 objectForKeyedSubscript:@"HighFramerate"];
      -[ICCameraFile setHighFramerate:](self, "setHighFramerate:", [v16 BOOLValue]);
    }
  }
  if (![(ICCameraFile *)self timeLapse])
  {
    uint64_t v17 = [v38 objectForKeyedSubscript:@"TimeLapse"];

    if (v17)
    {
      v18 = [v38 objectForKeyedSubscript:@"TimeLapse"];
      -[ICCameraFile setTimeLapse:](self, "setTimeLapse:", [v18 BOOLValue]);
    }
  }
  v19 = [(ICCameraFile *)self originalFilename];
  if (!v19)
  {
    v20 = [v38 objectForKeyedSubscript:@"OriginalFilename"];

    if (!v20) {
      goto LABEL_28;
    }
    v19 = [v38 objectForKeyedSubscript:@"OriginalFilename"];
    [(ICCameraFile *)self setOriginalFilename:v19];
  }

LABEL_28:
  v21 = [(ICCameraFile *)self createdFilename];
  if (v21)
  {
LABEL_31:

    goto LABEL_32;
  }
  v22 = [v38 objectForKeyedSubscript:@"CreatedFilename"];

  if (v22)
  {
    v21 = [v38 objectForKeyedSubscript:@"CreatedFilename"];
    [(ICCameraFile *)self setCreatedFilename:v21];
    goto LABEL_31;
  }
LABEL_32:
  if (![(ICCameraFile *)self firstPicked])
  {
    CFDataRef v23 = [v38 objectForKeyedSubscript:@"FirstPicked"];

    if (v23)
    {
      v24 = [v38 objectForKeyedSubscript:@"FirstPicked"];
      -[ICCameraFile setFirstPicked:](self, "setFirstPicked:", [v24 BOOLValue]);
    }
  }
  v25 = [(ICCameraFile *)self groupUUID];
  if (!v25)
  {
    v26 = [v38 objectForKeyedSubscript:@"GroupUUID"];

    if (!v26) {
      goto LABEL_39;
    }
    v25 = [v38 objectForKeyedSubscript:@"GroupUUID"];
    [(ICCameraFile *)self setGroupUUID:v25];
  }

LABEL_39:
  v27 = [(ICCameraFile *)self relatedUUID];
  if (!v27)
  {
    v28 = [v38 objectForKeyedSubscript:@"RelatedUUID"];

    if (!v28) {
      goto LABEL_43;
    }
    v27 = [v38 objectForKeyedSubscript:@"RelatedUUID"];
    [(ICCameraFile *)self setRelatedUUID:v27];
  }

LABEL_43:
  v29 = [(ICCameraFile *)self spatialOverCaptureGroupID];
  if (!v29)
  {
    v30 = [v38 objectForKeyedSubscript:@"SpatialOverCaptureGroupID"];

    if (!v30) {
      goto LABEL_47;
    }
    v29 = [v38 objectForKeyedSubscript:@"SpatialOverCaptureGroupID"];
    [(ICCameraFile *)self setSpatialOverCaptureGroupID:v29];
  }

LABEL_47:
  v31 = [(ICCameraFile *)self gpsString];
  if (!v31)
  {
    v32 = [v38 objectForKeyedSubscript:@"GPSString"];

    if (!v32) {
      goto LABEL_51;
    }
    v31 = [v38 objectForKeyedSubscript:@"GPSString"];
    [(ICCameraFile *)self setGpsString:v31];
  }

LABEL_51:
  v33 = [(ICCameraFile *)self groupUUID];
  if (!v33)
  {
    v34 = [v38 objectForKeyedSubscript:@"{MakerApple}"];
    v35 = [v34 objectForKeyedSubscript:@"17"];

    v36 = v38;
    if (!v35) {
      goto LABEL_55;
    }
    v33 = [v38 objectForKeyedSubscript:@"{MakerApple}"];
    v37 = [v33 objectForKeyedSubscript:@"17"];
    [(ICCameraFile *)self setGroupUUID:v37];
  }
  v36 = v38;
LABEL_55:
}

- (ICCameraFile)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)ICCameraFile;
  BOOL v5 = [(ICCameraItem *)&v17 initWithName:a3 parentFolder:a4 device:a5];
  id v6 = v5;
  if (v5)
  {
    [(ICCameraFile *)v5 setHasMetadata:1];
    [(ICCameraItem *)v6 setMetadataState:1];
    [(ICCameraItem *)v6 setThumbnailState:1];
    v6->_privOrientation = 1;
    [(ICCameraFile *)v6 setOrientationOverridden:0];
    CFDataRef v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sidecarFiles = v6->_sidecarFiles;
    v6->_sidecarFiles = v7;

    BOOL v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subImages = v6->_subImages;
    v6->_subImages = v9;

    debugBadge = v6->_debugBadge;
    v6->_debugBadge = 0;

    debugType = v6->_debugType;
    v6->_debugType = 0;

    fileIsJPEG = v6->_fileIsJPEG;
    v6->_fileIsJPEG = 0;

    fileIsHEIC = v6->_fileIsHEIC;
    v6->_fileIsHEIC = 0;

    CFDataRef v15 = v6;
  }

  return v6;
}

- (void)flagMediaMetadata:(unint64_t)a3
{
  self->_mediaMetadata |= a3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"children"])
  {
    uint64_t v5 = [(ICCameraFile *)self sidecarFiles];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICCameraFile;
    uint64_t v5 = [(ICCameraItem *)&v8 valueForUndefinedKey:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (BOOL)setMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    [(ICCameraFile *)self willChangeValueForKey:@"metadata"];
    id v6 = (NSMutableDictionary *)[v5 copy];
    metadata = self->_metadata;
    self->_metadata = v6;

    [(ICCameraFile *)self setKeywordPropertiesFromDict:v5];
    [(ICCameraFile *)self didChangeValueForKey:@"metadata"];
    if (![(ICCameraFile *)self orientationOverridden])
    {
      objc_super v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
      BOOL v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 unsignedIntegerValue];
        if (v10 != [(ICCameraFile *)self orientation])
        {
          [(ICCameraFile *)self willChangeValueForKey:@"orientation"];
          [(ICCameraFile *)self setOrientation:v10];
          [(ICCameraFile *)self didChangeValueForKey:@"orientation"];
        }
      }
    }
    uint64_t v11 = [(ICCameraItem *)self device];
    BOOL v12 = [v11 transportType];
    int v13 = [v12 isEqualToString:@"ICTransportTypeMassStorage"];

    if (v13) {
      [(ICCameraFile *)self setKeywordPropertiesFromDict:v5];
    }
  }
  BOOL v14 = [(ICCameraFile *)self hasMetadata];

  return v14;
}

- (void)requestThumbnail
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ICCameraItem *)self device];
  id v4 = [v3 delegate];

  BOOL v9 = @"kCGImageSourceShouldCache";
  v10[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ICCameraFile_requestThumbnail__block_invoke;
  v7[3] = &unk_1E63D7788;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICCameraFile *)self requestThumbnailDataWithOptions:v5 completion:v7];
}

void __32__ICCameraFile_requestThumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) device];
  if (v5)
  {
    id v6 = (void *)v5;
    CFDataRef v7 = [*(id *)(a1 + 32) device];
    if ([v7 hasOpenSession] && *(void *)(a1 + 40))
    {
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __32__ICCameraFile_requestThumbnail__block_invoke_2;
        block[3] = &unk_1E63D7700;
        id v9 = *(id *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 32);
        id v12 = v9;
        uint64_t v13 = v10;
        id v14 = v4;
        ICPerformBlockOnMainThread(block);
      }
    }
    else
    {
    }
  }
}

void __32__ICCameraFile_requestThumbnail__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) device];
  objc_msgSend(v2, "cameraDevice:didReceiveThumbnail:forItem:error:", v3, objc_msgSend(*(id *)(a1 + 40), "thumbnail"), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (BOOL)retrievedThumbnail
{
  return [(ICCameraItem *)self thumbnailState] == 16;
}

- (void)requestThumbnailDataWithOptions:(NSDictionary *)options completion:(void *)completion
{
  id v6 = options;
  CFDataRef v7 = completion;
  uint64_t v8 = [(ICCameraFile *)self thumbnailData];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(NSDictionary *)v6 objectForKeyedSubscript:@"kCGImageSourceThumbnailMaxPixelSize"];
    uint64_t v11 = [v10 integerValue];

    if (v11 <= 160)
    {
      id v12 = [(ICCameraFile *)self thumbnailData];
      v7[2](v7, v12, 0);
LABEL_16:

      goto LABEL_17;
    }
  }
  if (![(ICCameraFile *)self hasThumbnail]
    || [(ICCameraItem *)self thumbnailState] == 4)
  {
    goto LABEL_10;
  }
  uint64_t v13 = [(ICCameraItem *)self device];
  if (([v13 hasOpenSession] & 1) == 0)
  {

    goto LABEL_10;
  }
  id v14 = [(ICCameraItem *)self device];
  char v15 = [v14 beingEjected];

  if (v15)
  {
LABEL_10:
    if ([(ICCameraItem *)self thumbnailState] == 4)
    {
      uint64_t v17 = -20149;
    }
    else
    {
      v18 = [(ICCameraItem *)self device];
      int v19 = [v18 hasOpenSession];

      if (v19)
      {
        [(ICCameraItem *)self setThumbnailState:8];
        uint64_t v17 = -21000;
      }
      else
      {
        uint64_t v17 = -9958;
      }
    }
    v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v17 userInfo:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_172;
    block[3] = &unk_1E63D77D8;
    id v22 = v20;
    CFDataRef v23 = v7;
    id v12 = v20;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_16;
  }
  v16 = [(ICCameraItem *)self device];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke;
  v24[3] = &unk_1E63D7750;
  v24[4] = self;
  v25 = v6;
  v26 = v7;
  [v16 dispatchAsyncForOperationType:2 block:v24];

LABEL_17:
}

void __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) device];
  id v3 = [v2 delegate];

  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v4 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v4 length] >= 0x15)
    {
      uint64_t v5 = objc_msgSend(v4, "substringWithRange:", 0, 18);
      uint64_t v6 = [v5 stringByAppendingString:@".."];

      id v4 = (void *)v6;
    }
    CFDataRef v7 = [NSString stringWithFormat:@"-> req thumb"];
    uint64_t v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v4;
      uint64_t v10 = v8;
      *(_DWORD *)buf = 136446466;
      uint64_t v49 = [v9 UTF8String];
      __int16 v50 = 2114;
      v51 = v7;
      _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 32) device],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v3 cameraDevice:v11 shouldGetThumbnailOfItem:*(void *)(a1 + 32)],
        v11,
        !v12))
  {
    [*(id *)(a1 + 32) setThumbnailState:1];
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-20098 userInfo:0];
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v32 = [*(id *)(a1 + 32) name];
      if ((unint64_t)[v32 length] >= 0x15)
      {
        v33 = objc_msgSend(v32, "substringWithRange:", 0, 18);
        uint64_t v34 = [v33 stringByAppendingString:@".."];

        v32 = (void *)v34;
      }
      v35 = [NSString stringWithFormat:@"<- recv thumb: Client Canceled Request"];
      v36 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v32;
        id v38 = v36;
        uint64_t v39 = [v37 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v49 = v39;
        __int16 v50 = 2114;
        v51 = v35;
        _os_log_impl(&dword_1BEEFF000, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    id v14 = v13;
    if (*(void *)(a1 + 40)) {
      objc_msgSend(v13, "addEntriesFromDictionary:");
    }
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = [*(id *)(a1 + 32) device];
    uint64_t v17 = [v16 deviceManager];
    v18 = *(void **)(a1 + 32);
    int v19 = [v18 device];
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_148;
    v43 = &unk_1E63D77B0;
    v20 = v15;
    v44 = v20;
    id v21 = v14;
    uint64_t v22 = *(void *)(a1 + 32);
    id v45 = v21;
    uint64_t v46 = v22;
    id v47 = *(id *)(a1 + 48);
    [v17 getFileThumbnail:v18 fromDevice:v19 withOptions:v21 completion:&v40];

    dispatch_time_t v23 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v20, v23))
    {
      __ICOSLogCreate();
      v24 = objc_msgSend(*(id *)(a1 + 32), "name", v40, v41, v42, v43, v44, v45, v46);
      if ((unint64_t)[v24 length] >= 0x15)
      {
        v25 = objc_msgSend(v24, "substringWithRange:", 0, 18);
        uint64_t v26 = [v25 stringByAppendingString:@".."];

        v24 = (void *)v26;
      }
      v27 = [NSString stringWithFormat:@"-- recv thumb, queue pause timeout, will continue with next operation to unblock"];
      v28 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v24;
        v30 = v28;
        uint64_t v31 = [v29 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v49 = v31;
        __int16 v50 = 2114;
        v51 = v27;
        _os_log_impl(&dword_1BEEFF000, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
}

void __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  CFDataRef v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  id v8 = [v6 objectForKeyedSubscript:@"thumb"];
  id v9 = [v6 objectForKeyedSubscript:@"ICThumbnailRotated"];

  uint64_t v10 = v8;
  if (!v9)
  {
    uint64_t v10 = [v5 thumbnailDataUsingOrientation:v7 andSourceThumbnailData:v8];
  }
  uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kCGImageSourceShouldCache"];
  int v12 = v11;
  if (v11) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
  }
  else
  {
    uint64_t v14 = [v10 length];

    if (v14) {
      [v5 cacheThumbnailData:v10];
    }
  }
  dispatch_semaphore_t v15 = [v6 objectForKeyedSubscript:@"errCode"];
  int v16 = [v15 intValue];

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-21000 userInfo:0];
    uint64_t v18 = 8;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 16;
  }
  [*(id *)(a1 + 48) setThumbnailState:v18];
  if (v7) {
    objc_msgSend(*(id *)(a1 + 48), "setOrientation:", (int)objc_msgSend(v7, "intValue"));
  }
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    int v19 = [*(id *)(a1 + 48) name];
    if ((unint64_t)[v19 length] >= 0x15)
    {
      v20 = objc_msgSend(v19, "substringWithRange:", 0, 18);
      uint64_t v21 = [v20 stringByAppendingString:@".."];

      int v19 = (void *)v21;
    }
    uint64_t v22 = @"SUCCESS";
    if (v17) {
      uint64_t v22 = v17;
    }
    dispatch_time_t v23 = [NSString stringWithFormat:@"<- recv thumb: %@", v22];
    v24 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = a1;
      v25 = v10;
      id v26 = v6;
      v27 = v7;
      id v28 = v8;
      id v29 = v5;
      id v30 = v19;
      uint64_t v31 = v24;
      v32 = v30;
      id v5 = v29;
      id v8 = v28;
      CFDataRef v7 = v27;
      id v6 = v26;
      uint64_t v10 = v25;
      a1 = v33;
      *(_DWORD *)buf = 136446466;
      uint64_t v35 = [v32 UTF8String];
      __int16 v36 = 2114;
      id v37 = v23;
      _os_log_impl(&dword_1BEEFF000, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)requestThumbnailWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ICCameraFile_requestThumbnailWithOptions_completion___block_invoke;
  v8[3] = &unk_1E63D7800;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ICCameraFile *)self requestThumbnailDataWithOptions:a3 completion:v8];
}

uint64_t __55__ICCameraFile_requestThumbnailWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)metadata
{
  return self->_metadata;
}

- (void)requestMetadata
{
  id v3 = [(ICCameraItem *)self device];
  id v4 = [v3 delegate];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__ICCameraFile_requestMetadata__block_invoke;
  v6[3] = &unk_1E63D7828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICCameraFile *)self requestMetadataDictionaryWithOptions:MEMORY[0x1E4F1CC08] completion:v6];
}

void __31__ICCameraFile_requestMetadata__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ICCameraFile_requestMetadata__block_invoke_2;
  block[3] = &unk_1E63D7700;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v4;
  id v6 = v4;
  ICPerformBlockOnMainThread(block);
}

void __31__ICCameraFile_requestMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) device];
  if (v2)
  {
    id v6 = (id)v2;
    id v3 = [*(id *)(a1 + 32) device];
    if ([v3 hasOpenSession])
    {
      uint64_t v4 = *(void *)(a1 + 40);

      if (!v4 || (objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v5 = *(void **)(a1 + 40);
      id v6 = [*(id *)(a1 + 32) device];
      id v3 = [*(id *)(a1 + 32) metadata];
      [v5 cameraDevice:v6 didReceiveMetadata:v3 forItem:*(void *)(a1 + 32) error:*(void *)(a1 + 48)];
    }
  }
}

- (void)requestMetadataDictionaryWithOptions:(NSDictionary *)options completion:(void *)completion
{
  id v6 = options;
  id v7 = completion;
  id v8 = [(ICCameraFile *)self metadata];

  if (v8)
  {
    id v9 = [(ICCameraFile *)self metadata];
    v7[2](v7, v9, 0);
LABEL_15:

    goto LABEL_16;
  }
  if (![(ICCameraFile *)self hasMetadata] || [(ICCameraItem *)self metadataState] == 4) {
    goto LABEL_9;
  }
  uint64_t v10 = [(ICCameraItem *)self device];
  if (([v10 hasOpenSession] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v11 = [(ICCameraItem *)self device];
  char v12 = [v11 beingEjected];

  if (v12)
  {
LABEL_9:
    if ([(ICCameraItem *)self metadataState] == 4)
    {
      uint64_t v14 = -20149;
    }
    else
    {
      dispatch_semaphore_t v15 = [(ICCameraItem *)self device];
      int v16 = [v15 hasOpenSession];

      if (v16)
      {
        [(ICCameraItem *)self setMetadataState:8];
        uint64_t v14 = -20150;
      }
      else
      {
        uint64_t v14 = -9958;
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v14 userInfo:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_191;
    block[3] = &unk_1E63D77D8;
    id v19 = v17;
    v20 = v7;
    id v9 = v17;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_15;
  }
  [(ICCameraItem *)self setMetadataState:4];
  BOOL v13 = [(ICCameraItem *)self device];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke;
  v21[3] = &unk_1E63D7750;
  v21[4] = self;
  uint64_t v22 = v6;
  dispatch_time_t v23 = v7;
  [v13 dispatchAsyncForOperationType:3 block:v21];

LABEL_16:
}

void __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) device];
  id v3 = [v2 delegate];

  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v4 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v4 length] >= 0x15)
    {
      id v5 = objc_msgSend(v4, "substringWithRange:", 0, 18);
      uint64_t v6 = [v5 stringByAppendingString:@".."];

      uint64_t v4 = (void *)v6;
    }
    id v7 = [NSString stringWithFormat:@"-> req meta"];
    id v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v4;
      uint64_t v10 = v8;
      *(_DWORD *)buf = 136446466;
      uint64_t v45 = [v9 UTF8String];
      __int16 v46 = 2114;
      id v47 = v7;
      _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 32) device],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v3 cameraDevice:v11 shouldGetMetadataOfItem:*(void *)(a1 + 32)],
        v11,
        !v12))
  {
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-20148 userInfo:0];
    [*(id *)(a1 + 32) setMetadataState:1];
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      uint64_t v31 = [*(id *)(a1 + 32) name];
      if ((unint64_t)[v31 length] >= 0x15)
      {
        v32 = objc_msgSend(v31, "substringWithRange:", 0, 18);
        uint64_t v33 = [v32 stringByAppendingString:@".."];

        uint64_t v31 = (void *)v33;
      }
      uint64_t v34 = [NSString stringWithFormat:@"<- recv meta: Client Canceled Request"];
      uint64_t v35 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = v31;
        id v37 = v35;
        uint64_t v38 = [v36 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v45 = v38;
        __int16 v46 = 2114;
        id v47 = v34;
        _os_log_impl(&dword_1BEEFF000, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    uint64_t v39 = *(void *)(a1 + 48);
    id v30 = [*(id *)(a1 + 32) metadata];
    (*(void (**)(uint64_t, void *, NSObject *))(v39 + 16))(v39, v30, v19);
  }
  else
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v14 = [*(id *)(a1 + 32) device];
    dispatch_semaphore_t v15 = [v14 deviceManager];
    int v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v16 device];
    uint64_t v18 = *(void *)(a1 + 40);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_181;
    v40[3] = &unk_1E63D7850;
    id v19 = v13;
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v41 = v19;
    uint64_t v42 = v20;
    id v43 = *(id *)(a1 + 48);
    [v15 getFileMetadata:v16 fromDevice:v17 withOptions:v18 completion:v40];

    dispatch_time_t v21 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v19, v21))
    {
      __ICOSLogCreate();
      uint64_t v22 = [*(id *)(a1 + 32) name];
      if ((unint64_t)[v22 length] >= 0x15)
      {
        dispatch_time_t v23 = objc_msgSend(v22, "substringWithRange:", 0, 18);
        uint64_t v24 = [v23 stringByAppendingString:@".."];

        uint64_t v22 = (void *)v24;
      }
      v25 = [NSString stringWithFormat:@"-- recv meta, queue pause timeout, will continue with next operation to unblock"];
      id v26 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v22;
        id v28 = v26;
        uint64_t v29 = [v27 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v45 = v29;
        __int16 v46 = 2114;
        id v47 = v25;
        _os_log_impl(&dword_1BEEFF000, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }

    id v30 = v41;
  }
}

void __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_181(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = a3;
  dispatch_semaphore_signal(v4);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"metadata"];
  id v7 = [v5 objectForKeyedSubscript:@"errCode"];

  LODWORD(v5) = [v7 intValue];
  if (v5)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-20150 userInfo:0];
    id v9 = (id *)(a1 + 40);
  }
  else
  {
    id v9 = (id *)(a1 + 40);
    if ([*(id *)(a1 + 40) setMetadata:v6])
    {
      id v8 = 0;
      uint64_t v10 = 16;
      goto LABEL_7;
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-20147 userInfo:0];
  }
  uint64_t v10 = 8;
LABEL_7:
  [*v9 setMetadataState:v10];
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v11 = [*(id *)(a1 + 40) name];
    if ((unint64_t)[v11 length] >= 0x15)
    {
      int v12 = objc_msgSend(v11, "substringWithRange:", 0, 18);
      uint64_t v13 = [v12 stringByAppendingString:@".."];

      uint64_t v11 = (void *)v13;
    }
    uint64_t v14 = @"SUCCESS";
    if (v8) {
      uint64_t v14 = v8;
    }
    dispatch_semaphore_t v15 = [NSString stringWithFormat:@"<- recv meta: %@", v14];
    int v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v11;
      uint64_t v18 = v16;
      *(_DWORD *)buf = 136446466;
      uint64_t v22 = [v17 UTF8String];
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1BEEFF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = [*(id *)(a1 + 40) metadata];
  (*(void (**)(uint64_t, void *, __CFString *))(v19 + 16))(v19, v20, v8);
}

uint64_t __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)requestMetadataWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__ICCameraFile_requestMetadataWithOptions_completion___block_invoke;
  v8[3] = &unk_1E63D7878;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ICCameraFile *)self requestMetadataDictionaryWithOptions:a3 completion:v8];
}

uint64_t __54__ICCameraFile_requestMetadataWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSProgress)requestDownloadWithOptions:(NSDictionary *)options completion:(void *)completion
{
  id v6 = options;
  id v7 = completion;
  id v8 = [(NSDictionary *)v6 objectForKeyedSubscript:@"ICSidecarDownload"];
  id v9 = [(ICCameraItem *)self device];
  char v10 = [v9 hasOpenSession];

  if (v10)
  {
    uint64_t v11 = [(ICCameraItem *)self device];
    if ([v11 hasOpenSession])
    {
      int v12 = [(ICCameraItem *)self device];
      char v13 = [v12 beingEjected];

      if ((v13 & 1) == 0)
      {
        if (v8)
        {
          uint64_t v14 = 0;
        }
        else
        {
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[ICCameraFile fileSize](self, "fileSize"));
          [v14 setCancellable:1];
          [v14 setPausable:0];
        }
        __int16 v23 = [(ICCameraItem *)self device];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke;
        v26[3] = &unk_1E63D7938;
        v26[4] = self;
        id v27 = v8;
        id v24 = v14;
        id v28 = v24;
        uint64_t v29 = v6;
        id v30 = v7;
        [v23 dispatchAsyncForOperationType:4 block:v26];

        uint64_t v25 = v30;
        id v21 = v24;

        goto LABEL_10;
      }
    }
    else
    {
    }
    int v16 = [MEMORY[0x1E4F1CA60] dictionary];
    id v17 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [(ICCameraItem *)self device];
    objc_msgSend(v17, "addTruth:code:", objc_msgSend(v18, "hasOpenSession") ^ 1, -9958);

    uint64_t v19 = [(ICCameraItem *)self device];
    objc_msgSend(v17, "addTruth:code:", objc_msgSend(v19, "beingEjected"), -21346);

    [v16 setObject:v17 forKeyedSubscript:@"errors"];
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-30000 userInfo:v16];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v20);
  }
  else
  {
    dispatch_semaphore_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9958 userInfo:0];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v15);
  }
  id v21 = 0;
LABEL_10:

  return (NSProgress *)v21;
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke(id *a1)
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = a1[4];
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_2;
  v142[3] = &unk_1E63D7280;
  dispatch_semaphore_t dsema = v2;
  dispatch_semaphore_t v143 = dsema;
  [v3 requestRefreshObjectHandleInfo:v142];
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(dsema, v4);
  if (!a1[5])
  {
    id v5 = a1[6];
    id v6 = [a1[4] device];
    [v6 setDownloadProgress:v5];

    id v7 = [a1[4] device];
    id v8 = [v7 downloadProgress];
    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(a1[4], "fileSize"));
  }
  v102 = [a1[7] objectForKeyedSubscript:@"ICDownloadsDirectoryURL"];
  id v9 = [a1[7] objectForKeyedSubscript:@"ICSaveAsFilename"];
  char v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [a1[4] name];
  }
  int v12 = v11;

  v103 = [a1[7] objectForKeyedSubscript:@"ICAppendedDuplicateNumber"];
  v101 = [v12 stringByDeletingPathExtension];
  v100 = [v12 pathExtension];
  id v97 = v12;
  uint64_t v99 = [a1[4] fileSize];
  if (v103)
  {
    char v13 = [NSString stringWithFormat:@"%@ %d.%@", v101, objc_msgSend(v103, "intValue"), v100];

    __ICOSLogCreate();
    uint64_t v14 = [a1[4] name];
    if ((unint64_t)[v14 length] >= 0x15)
    {
      dispatch_semaphore_t v15 = objc_msgSend(v14, "substringWithRange:", 0, 18);
      uint64_t v16 = [v15 stringByAppendingString:@".."];

      uint64_t v14 = (void *)v16;
    }
    id v17 = [NSString stringWithFormat:@"Main asset filename is already on disk, appending %d", objc_msgSend(v103, "intValue")];
    uint64_t v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v14;
      uint64_t v20 = v18;
      uint64_t v21 = [v19 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1BEEFF000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (a1[5])
  {
    char v13 = [NSString stringWithFormat:@"%@.%@", v101, v100];
    uint64_t v14 = v97;
LABEL_14:

    uint64_t v22 = [v102 path];
    id v23 = [v22 stringByAppendingPathComponent:v13];
    int v24 = open((const char *)[v23 UTF8String], 2562, 33152);

    goto LABEL_15;
  }
  v103 = 0;
  uint64_t v74 = 1;
  char v13 = v97;
  while (1)
  {
    v75 = [v102 path];
    id v76 = [v75 stringByAppendingPathComponent:v13];
    int v24 = open((const char *)[v76 UTF8String], 2562, 33152);
    BOOL v77 = v24 != -1 || v74 >= 0x14;
    BOOL v78 = !v77;

    if (!v78) {
      break;
    }
    uint64_t v79 = [NSString stringWithFormat:@"%@ %d.%@", v101, v74, v100];

    __ICOSLogCreate();
    v80 = [a1[4] name];
    if ((unint64_t)[v80 length] >= 0x15)
    {
      v81 = objc_msgSend(v80, "substringWithRange:", 0, 18);
      uint64_t v82 = [v81 stringByAppendingString:@".."];

      v80 = (void *)v82;
    }
    v83 = [NSString stringWithFormat:@"Filename is already on disk, trying %@", v79];
    v84 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v85 = v80;
      v86 = v84;
      uint64_t v87 = [v85 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v87;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v83;
      _os_log_impl(&dword_1BEEFF000, v86, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v88 = [NSNumber numberWithInt:v74];

    uint64_t v74 = (v74 + 1);
    char v13 = (void *)v79;
    v103 = (void *)v88;
  }
LABEL_15:
  uint64_t v25 = [v102 path];
  id v96 = [v25 stringByAppendingPathComponent:v13];

  if (!v13 || !v99)
  {
    __ICOSLogCreate();
    if ((unint64_t)[@"download fail" length] < 0x15)
    {
      uint64_t v49 = @"download fail";
    }
    else
    {
      uint64_t v48 = objc_msgSend(@"download fail", "substringWithRange:", 0, 18);
      uint64_t v49 = [v48 stringByAppendingString:@".."];
    }
    v65 = [NSString stringWithFormat:@"filename: %@, fileSize: %llu", v13, v99];
    v66 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v67 = v49;
      v68 = v66;
      uint64_t v69 = [(__CFString *)v67 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v69;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v65;
      _os_log_impl(&dword_1BEEFF000, v68, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    v70 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9934 userInfo:0];
    (*((void (**)(void))a1[8] + 2))();
    if (!a1[5])
    {
      v71 = [a1[4] device];
      [v71 setDownloadProgress:0];
    }
    goto LABEL_72;
  }
  uint64_t v95 = [v96 fileSystemRepresentation];
  __ICOSLogCreate();
  if (v24 == -1)
  {
    if ((unint64_t)[@"download fail" length] < 0x15)
    {
      v73 = @"download fail";
    }
    else
    {
      v72 = objc_msgSend(@"download fail", "substringWithRange:", 0, 18);
      v73 = [v72 stringByAppendingString:@".."];
    }
    v89 = [NSString stringWithFormat:@"filename: %@, fileSize: %llu", v13, v99];
    v90 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v91 = v73;
      v92 = v90;
      uint64_t v93 = [(__CFString *)v91 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v93;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v89;
      _os_log_impl(&dword_1BEEFF000, v92, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    v70 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9934 userInfo:0];
    (*((void (**)(void))a1[8] + 2))();
    if (!a1[5])
    {
      v94 = [a1[4] device];
      [v94 setDownloadProgress:0];
    }
LABEL_72:

    goto LABEL_73;
  }
  id v26 = [a1[4] name];
  if ((unint64_t)[v26 length] >= 0x15)
  {
    id v27 = objc_msgSend(v26, "substringWithRange:", 0, 18);
    uint64_t v28 = [v27 stringByAppendingString:@".."];

    id v26 = (void *)v28;
  }
  uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Downloading to: %s", v95);
  id v30 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = v26;
    v32 = v30;
    uint64_t v33 = [v31 UTF8String];
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v33;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v29;
    _os_log_impl(&dword_1BEEFF000, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v148 = v99;
  uint64_t v138 = 0;
  v139 = &v138;
  uint64_t v140 = 0x2020000000;
  uint64_t v141 = 0;
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x2020000000;
  v137[3] = 0;
  uint64_t v34 = [a1[4] device];
  if ([v34 isAppleDevice]) {
    uint64_t v35 = 50331648;
  }
  else {
    uint64_t v35 = 0x400000;
  }

  uint64_t v133 = 0;
  v134 = &v133;
  uint64_t v135 = 0x2020000000;
  char v136 = 0;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x2020000000;
  uint64_t v132 = 0;
  [a1[4] requestOpenStreamData];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  _gBenchmarkStartMachTime = 0;
  *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
  while (*(uint64_t *)(*(void *)&buf[8] + 24) >= 1
       && !*((unsigned char *)v134 + 24)
       && ([a1[6] isCancelled] & 1) == 0)
  {
    id v36 = (void *)MEMORY[0x1C189FFC0]();
    if (v35 >= *(void *)(*(void *)&buf[8] + 24)) {
      uint64_t v37 = *(void *)(*(void *)&buf[8] + 24);
    }
    else {
      uint64_t v37 = v35;
    }
    __ICOSLogCreate();
    uint64_t v38 = [a1[4] name];
    if ((unint64_t)[v38 length] >= 0x15)
    {
      uint64_t v39 = objc_msgSend(v38, "substringWithRange:", 0, 18);
      uint64_t v40 = [v39 stringByAppendingString:@".."];

      uint64_t v38 = (void *)v40;
    }
    uint64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"Requesting: %llu at offset: %llu", v37, v139[3]);
    uint64_t v42 = (id)_gICOSLog;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = [v38 UTF8String];
      *(_DWORD *)v144 = 136446466;
      *(void *)&v144[4] = v43;
      __int16 v145 = 2114;
      v146 = v41;
      _os_log_impl(&dword_1BEEFF000, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v144, 0x16u);
    }

    dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
    *(void *)v144 = 0;
    mach_timebase_info((mach_timebase_info_t)v144);
    _gBenchmarkStartMachTime = 0;
    *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
    id v45 = a1[4];
    uint64_t v46 = v139[3];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_224;
    v117[3] = &unk_1E63D78C8;
    v121 = &v129;
    v117[4] = v45;
    int v127 = v24;
    v122 = &v133;
    v123 = v137;
    id v118 = a1[5];
    id v119 = a1[6];
    v124 = buf;
    v125 = &v138;
    uint64_t v126 = v99;
    id v47 = v44;
    v120 = v47;
    [v45 requestStreamDataAtOffset:v46 length:v37 completion:v117];
    dispatch_semaphore_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
  }
  double v50 = 0.0;
  if (!a1[5])
  {
    unint64_t v51 = v130[3];
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v54 = *(void *)(*(void *)&buf[8] + 24);
    __ICOSLogCreate();
    v55 = [a1[4] name];
    if ((unint64_t)[v55 length] >= 0x15)
    {
      v56 = objc_msgSend(v55, "substringWithRange:", 0, 18);
      uint64_t v57 = [v56 stringByAppendingString:@".."];

      v55 = (void *)v57;
    }
    double v50 = (float)-(float)((float)v54
                        - (float)((float)(1000.0
                                        / (float)((float)((float)((float)v51 * (float)numer) / (float)denom) / 1000000.0))
                                * (float)v99))
        * 0.000000953674316;
    v58 = objc_msgSend(NSString, "stringWithFormat:", @"icDatarate: %07.2f", *(void *)&v50);
    v59 = (id)_gICOSLog;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = [v55 UTF8String];
      *(_DWORD *)v144 = 136446466;
      *(void *)&v144[4] = v60;
      __int16 v145 = 2114;
      v146 = v58;
      _os_log_impl(&dword_1BEEFF000, v59, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v144, 0x16u);
    }
  }
  [a1[4] requestCloseStreamData];
  v61 = [a1[4] device];
  v62 = [v61 deviceWriteQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_256;
  block[3] = &unk_1E63D7910;
  v113 = &v133;
  uint64_t v114 = v95;
  id v105 = a1[6];
  id v63 = a1[5];
  id v64 = a1[4];
  id v106 = v63;
  id v107 = v64;
  double v115 = v50;
  id v108 = a1[7];
  int v116 = v24;
  id v109 = v103;
  id v110 = v102;
  id v112 = a1[8];
  id v111 = v13;
  dispatch_async(v62, block);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(v137, 8);
  _Block_object_dispose(&v138, 8);
  _Block_object_dispose(buf, 8);
LABEL_73:
}

intptr_t __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (unint64_t)(float)((float)((float)mach_absolute_time()
                                                                                                - *(float *)&_gBenchmarkStartMachTime)
                                                                                        + (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  dispatch_time_t v4 = [v3 objectForKeyedSubscript:@"ICReadData"];
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [v3 objectForKeyedSubscript:@"ICBytesRead"];
    uint64_t v7 = [v6 unsignedLongLongValue];

    __ICOSLogCreate();
    id v8 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v8 length] >= 0x15)
    {
      id v9 = objc_msgSend(v8, "substringWithRange:", 0, 18);
      uint64_t v10 = [v9 stringByAppendingString:@".."];

      id v8 = (void *)v10;
    }
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Received: %llu bytes", v7);
    int v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      uint64_t v14 = v12;
      *(_DWORD *)buf = 136446466;
      uint64_t v40 = [v13 UTF8String];
      __int16 v41 = 2114;
      uint64_t v42 = v11;
      _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    dispatch_semaphore_t v15 = [*(id *)(a1 + 32) device];
    uint64_t v16 = [v15 deviceWriteQueue];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    id v30 = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_234;
    id v31 = &unk_1E63D78A0;
    id v32 = v3;
    int v38 = *(_DWORD *)(a1 + 112);
    id v17 = v5;
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    id v33 = v17;
    uint64_t v34 = v18;
    long long v37 = *(_OWORD *)(a1 + 72);
    id v35 = v19;
    id v36 = *(id *)(a1 + 48);
    dispatch_async(v16, &block);

    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) -= v7;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(void *)(a1 + 104)
                                                                - *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      uint64_t v20 = [*(id *)(a1 + 32) name];
      if ((unint64_t)[v20 length] >= 0x15)
      {
        uint64_t v21 = objc_msgSend(v20, "substringWithRange:", 0, 18);
        uint64_t v22 = [v21 stringByAppendingString:@".."];

        uint64_t v20 = (void *)v22;
      }
      id v23 = [NSString stringWithFormat:@"+ Request @ Offset: %lld, Remaining: %lld", *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), block, v29, v30, v31, v32, v33, v34, v35];
      int v24 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v20;
        id v26 = v24;
        uint64_t v27 = [v25 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v40 = v27;
        __int16 v41 = 2114;
        uint64_t v42 = v23;
        _os_log_impl(&dword_1BEEFF000, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_234(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICBufferOffset"];
  uint64_t v3 = [v2 unsignedLongLongValue];

  dispatch_time_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICBytesRead"];
  size_t v5 = [v4 unsignedLongLongValue];

  ssize_t v6 = write(*(_DWORD *)(a1 + 88), (const void *)([*(id *)(a1 + 40) bytes] + v3), v5);
  if (v6 != -1 && v6 == v5)
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      uint64_t v16 = [*(id *)(a1 + 48) name];
      if ((unint64_t)[v16 length] >= 0x15)
      {
        id v17 = objc_msgSend(v16, "substringWithRange:", 0, 18);
        uint64_t v18 = [v17 stringByAppendingString:@".."];

        uint64_t v16 = (void *)v18;
      }
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"+ Wrote: %lld @ Offset: %lld", v5, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
      uint64_t v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v16;
        uint64_t v22 = v20;
        *(_DWORD *)buf = 136446466;
        uint64_t v30 = [v21 UTF8String];
        __int16 v31 = 2114;
        id v32 = v19;
        _os_log_impl(&dword_1BEEFF000, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += v5;
  }
  else
  {
    ssize_t v8 = v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    __ICOSLogCreate();
    id v9 = [*(id *)(a1 + 48) name];
    if ((unint64_t)[v9 length] >= 0x15)
    {
      uint64_t v10 = objc_msgSend(v9, "substringWithRange:", 0, 18);
      uint64_t v11 = [v10 stringByAppendingString:@".."];

      id v9 = (void *)v11;
    }
    int v12 = objc_msgSend(NSString, "stringWithFormat:", @"Downloading Failed - Appended: %llu BufferLength: %llu", v8, v5);
    id v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v9;
      dispatch_semaphore_t v15 = v13;
      *(_DWORD *)buf = 136446466;
      uint64_t v30 = [v14 UTF8String];
      __int16 v31 = 2114;
      id v32 = v12;
      _os_log_impl(&dword_1BEEFF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (!*(void *)(a1 + 56))
  {
    id v23 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_244;
    block[3] = &unk_1E63D7700;
    id v26 = *(id *)(a1 + 64);
    id v27 = v23;
    uint64_t v28 = *(void *)(a1 + 48);
    id v24 = v23;
    ICPerformBlockOnMainThread(block);
  }
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_244(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1[4], "setCompletedUnitCount:", objc_msgSend(a1[5], "unsignedLongLongValue"));
  __ICOSLogCreate();
  dispatch_semaphore_t v2 = [a1[6] name];
  if ((unint64_t)[v2 length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(v2, "substringWithRange:", 0, 18);
    uint64_t v4 = [v3 stringByAppendingString:@".."];

    dispatch_semaphore_t v2 = (void *)v4;
  }
  size_t v5 = NSString;
  [a1[4] fractionCompleted];
  uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"Progress: %f", v6);
  ssize_t v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v2;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 136446466;
    uint64_t v14 = [v9 UTF8String];
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v11 = [a1[6] device];
  int v12 = [v11 delegate];

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v12, sel_didReceiveDownloadProgressForFile_downloadedBytes_maxBytes_, a1[6], objc_msgSend(a1[5], "unsignedLongLongValue"), objc_msgSend(a1[6], "fileSize"));
  }
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_256(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    unlink(*(const char **)(a1 + 104));
    dispatch_semaphore_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9934 userInfo:0];
  }
  else
  {
    dispatch_semaphore_t v2 = 0;
  }
  if ([*(id *)(a1 + 32) isCancelled])
  {
    unlink(*(const char **)(a1 + 104));
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9937 userInfo:0];

    dispatch_semaphore_t v2 = (void *)v3;
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      [*(id *)(a1 + 48) setLastImportSpeed:*(double *)(a1 + 112)];
    }
    uint64_t v4 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"ICTruncateAfterSuccessfulDownload"];
    if (v4)
    {
      size_t v5 = (void *)v4;
      int v6 = [*(id *)(a1 + 48) isConverted];

      if (v6)
      {
        __ICOSLogCreate();
        uint64_t v7 = @"truncating...";
        if ((unint64_t)[@"truncating..." length] >= 0x15)
        {
          ssize_t v8 = objc_msgSend(@"truncating...", "substringWithRange:", 0, 18);
          uint64_t v7 = [v8 stringByAppendingString:@".."];
        }
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Reported File Size: %lld", objc_msgSend(*(id *)(a1 + 48), "fileSize"));
        uint64_t v10 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = v7;
          int v12 = v10;
          buf.st_dev = 136446466;
          *(void *)&buf.st_mode = [(__CFString *)v11 UTF8String];
          WORD2(buf.st_ino) = 2114;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v9;
          _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
        }
        memset(&buf, 0, sizeof(buf));
        if (!lstat(*(const char **)(a1 + 104), &buf))
        {
          uint64_t v13 = 0;
          off_t st_size = buf.st_size;
          do
            LOBYTE(__buf) = 0;
          while (pread(*(_DWORD *)(a1 + 120), &__buf, 1uLL, --v13 + st_size) == 1 && __buf == 0);
          __ICOSLogCreate();
          unint64_t v16 = [@"truncating..." length];
          if (v13 == -1)
          {
            if (v16 < 0x15)
            {
              id v21 = @"truncating...";
            }
            else
            {
              uint64_t v20 = objc_msgSend(@"truncating...", "substringWithRange:", 0, 18);
              id v21 = [v20 stringByAppendingString:@".."];
            }
            id v27 = [NSString stringWithFormat:@"File did not have padding."];
            uint64_t v28 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = v21;
              uint64_t v30 = v28;
              uint64_t v31 = [(__CFString *)v29 UTF8String];
              int __buf = 136446466;
              uint64_t v50 = v31;
              __int16 v51 = 2114;
              uint64_t v52 = v27;
              _os_log_impl(&dword_1BEEFF000, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&__buf, 0x16u);
            }
          }
          else
          {
            off_t v17 = st_size + v13 + 1;
            if (v16 < 0x15)
            {
              id v19 = @"truncating...";
            }
            else
            {
              uint64_t v18 = objc_msgSend(@"truncating...", "substringWithRange:", 0, 18);
              id v19 = [v18 stringByAppendingString:@".."];
            }
            uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Truncated File Size: %zu", v17);
            id v23 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = v19;
              id v25 = v23;
              uint64_t v26 = [(__CFString *)v24 UTF8String];
              int __buf = 136446466;
              uint64_t v50 = v26;
              __int16 v51 = 2114;
              uint64_t v52 = v22;
              _os_log_impl(&dword_1BEEFF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&__buf, 0x16u);
            }
            ftruncate(*(_DWORD *)(a1 + 120), v17);
          }
        }
      }
    }
    id v32 = [*(id *)(a1 + 48) creationDate];
    [v32 timeIntervalSince1970];
    uint64_t v34 = (uint64_t)v33;

    id v35 = [*(id *)(a1 + 48) modificationDate];
    [v35 timeIntervalSince1970];
    uint64_t v37 = (uint64_t)v36;

    *(void *)&buf.st_uid = v34;
    *(void *)&buf.st_rdev = 0;
    *(void *)&buf.st_dev = v37;
    buf.st_ino = 0;
    futimes(*(_DWORD *)(a1 + 120), (const timeval *)&buf);
  }
  close(*(_DWORD *)(a1 + 120));
  if (!v2)
  {
    int v38 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"ICDownloadSidecarFiles"];
    int v39 = [v38 BOOLValue];

    if (v39)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_272;
      block[3] = &unk_1E63D7700;
      void block[4] = *(void *)(a1 + 48);
      id v46 = *(id *)(a1 + 64);
      id v47 = *(id *)(a1 + 72);
      ICPerformBlockOnMainThread(block);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  if (*(void *)(a1 + 40))
  {
    if (v2) {
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t v40 = [*(id *)(a1 + 48) device];
    [v40 setDownloadProgress:0];

    if (v2) {
      goto LABEL_45;
    }
  }
  __int16 v41 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"ICDeleteAfterSuccessfulDownload"];
  uint64_t v42 = v41;
  if (v41 && [v41 BOOLValue])
  {
    uint64_t v43 = [*(id *)(a1 + 48) device];
    uint64_t v48 = *(void *)(a1 + 48);
    dispatch_semaphore_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v43 requestDeleteFiles:v44];
  }
LABEL_45:
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_272(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) sidecarFiles];
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = MEMORY[0x1E4F1CC38];
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        ssize_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
        id v9 = v8;
        uint64_t v10 = *(void *)(a1 + 40);
        if (v10) {
          [v8 setObject:v10 forKeyedSubscript:@"ICAppendedDuplicateNumber"];
        }
        [v9 setObject:v4 forKeyedSubscript:@"ICSidecarDownload"];
        [v9 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"ICDownloadsDirectoryURL"];
        id v11 = (id)[v7 requestDownloadWithOptions:v9 completion:&__block_literal_global_4];

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_2_273(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v3 = v2;
    if ((unint64_t)[v3 length] >= 0x15)
    {
      uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
      uint64_t v5 = [v4 stringByAppendingString:@".."];

      id v3 = (id)v5;
    }
    uint64_t v6 = [NSString stringWithFormat:@"++ (sidecar)"];
    uint64_t v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v3;
      id v9 = v7;
      int v10 = 136446466;
      uint64_t v11 = [v8 UTF8String];
      __int16 v12 = 2114;
      long long v13 = v6;
      _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)requestReadDataAtOffset:(off_t)offset length:(off_t)length completion:(void *)completion
{
  id v8 = completion;
  id v9 = [(ICCameraItem *)self device];
  char v10 = [v9 hasOpenSession];

  if ((v10 & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9958 userInfo:0];
    v8[2](v8, 0, v16);
    goto LABEL_6;
  }
  uint64_t v11 = [(ICCameraItem *)self device];
  if (([v11 hasOpenSession] & 1) == 0)
  {

    goto LABEL_8;
  }
  __int16 v12 = [(ICCameraItem *)self device];
  char v13 = [v12 beingEjected];

  if (v13)
  {
LABEL_8:
    off_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    id v19 = [(ICCameraItem *)self device];
    objc_msgSend(v18, "addTruth:code:", objc_msgSend(v19, "hasOpenSession") ^ 1, -9958);

    uint64_t v20 = [(ICCameraItem *)self device];
    objc_msgSend(v18, "addTruth:code:", objc_msgSend(v20, "beingEjected"), -21346);

    [v17 setObject:v18 forKeyedSubscript:@"errors"];
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-30000 userInfo:v17];
    v8[2](v8, 0, v21);

    goto LABEL_9;
  }
  uint64_t v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:length];
  [v14 setCancellable:1];
  [v14 setPausable:0];
  long long v15 = [(ICCameraItem *)self device];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke;
  v22[3] = &unk_1E63D7988;
  off_t v25 = offset;
  off_t v26 = length;
  v22[4] = self;
  id v23 = v14;
  id v24 = v8;
  id v16 = v14;
  [v15 dispatchAsyncForOperationType:4 block:v22];

LABEL_6:
LABEL_9:
}

void __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) fileSize];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 < 0 || (uint64_t v4 = v2, v3 >= v2) || *(void *)(a1 + 64) + v3 > v2)
  {
    __ICOSLogCreate();
    uint64_t v5 = @"read fail";
    if ((unint64_t)[@"read fail" length] >= 0x15)
    {
      uint64_t v6 = objc_msgSend(@"read fail", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    uint64_t v7 = NSString;
    id v8 = [*(id *)(a1 + 32) name];
    id v9 = [v7 stringWithFormat:@"filename: %@, readOffset: %llu, readLength: %llu", v8, *(void *)(a1 + 56), *(void *)(a1 + 64)];

    char v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v5;
      __int16 v12 = v10;
      *(_DWORD *)stat buf = 136446466;
      *(void *)&uint8_t buf[4] = [(__CFString *)v11 UTF8String];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    char v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-21448 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:

    return;
  }
  char v13 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:");
  if (v13)
  {
    __ICOSLogCreate();
    uint64_t v14 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v14 length] >= 0x15)
    {
      long long v15 = objc_msgSend(v14, "substringWithRange:", 0, 18);
      uint64_t v16 = [v15 stringByAppendingString:@".."];

      uint64_t v14 = (void *)v16;
    }
    off_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Downloading to data buffer: %llu", *(void *)(a1 + 64));
    uint64_t v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v14;
      uint64_t v20 = v18;
      *(_DWORD *)stat buf = 136446466;
      *(void *)&uint8_t buf[4] = [v19 UTF8String];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1BEEFF000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    *(void *)stat buf = 0;
    *(void *)&buf[8] = buf;
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v69 = *(void *)(a1 + 64);
    uint64_t v61 = 0;
    v62 = &v61;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = v21;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    [*(id *)(a1 + 32) requestOpenStreamData];
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    _gBenchmarkStartMachTime = 0;
    *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
    uint64_t v22 = *(void *)&buf[8];
    uint64_t v23 = *(void *)(*(void *)&buf[8] + 24);
    if (v23 >= 1)
    {
      while (!*((unsigned char *)v58 + 24))
      {
        char v35 = [*(id *)(a1 + 40) isCancelled];
        uint64_t v22 = *(void *)&buf[8];
        if (v35) {
          break;
        }
        uint64_t v36 = *(uint64_t *)(*(void *)&buf[8] + 24) >= 0x200000 ? 0x200000 : *(void *)(*(void *)&buf[8] + 24);
        dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
        *(void *)v65 = 0;
        mach_timebase_info((mach_timebase_info_t)v65);
        _gBenchmarkStartMachTime = 0;
        *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
        int v38 = *(void **)(a1 + 32);
        uint64_t v39 = v62[3];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke_293;
        v43[3] = &unk_1E63D7960;
        id v47 = &v53;
        v43[4] = v38;
        id v44 = v13;
        uint64_t v48 = buf;
        uint64_t v49 = &v61;
        id v40 = *(id *)(a1 + 40);
        uint64_t v41 = *(void *)(a1 + 56);
        id v45 = v40;
        uint64_t v50 = &v57;
        uint64_t v51 = v41;
        uint64_t v42 = v37;
        id v46 = v42;
        [v38 requestStreamDataAtOffset:v39 length:v36 completion:v43];
        dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);

        uint64_t v22 = *(void *)&buf[8];
        if (*(uint64_t *)(*(void *)&buf[8] + 24) <= 0) {
          break;
        }
      }
      uint64_t v23 = *(void *)(v22 + 24);
    }
    unint64_t v24 = v54[3];
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    __ICOSLogCreate();
    id v27 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v27 length] >= 0x15)
    {
      uint64_t v28 = objc_msgSend(v27, "substringWithRange:", 0, 18);
      uint64_t v29 = [v28 stringByAppendingString:@".."];

      id v27 = (void *)v29;
    }
    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"icDatarate: %07.2f", (float)-(float)((float)v23- (float)((float)(1000.0/ (float)((float)((float)((float)v24 * (float)numer) / (float)denom) / 1000000.0))* (float)v4))* 0.000000953674316);
    uint64_t v31 = (id)_gICOSLog;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v27 UTF8String];
      *(_DWORD *)v65 = 136446466;
      *(void *)&v65[4] = v32;
      __int16 v66 = 2114;
      v67 = v30;
      _os_log_impl(&dword_1BEEFF000, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v65, 0x16u);
    }

    [*(id *)(a1 + 32) requestCloseStreamData];
    if (*((unsigned char *)v58 + 24))
    {
      double v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-21448 userInfo:0];
    }
    else
    {
      double v33 = 0;
    }
    if ([*(id *)(a1 + 40) isCancelled])
    {
      uint64_t v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9937 userInfo:0];

      double v33 = (void *)v34;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(buf, 8);
    goto LABEL_9;
  }
}

void __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke_293(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (unint64_t)(float)((float)((float)mach_absolute_time()
                                                                                                - *(float *)&_gBenchmarkStartMachTime)
                                                                                        + (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  uint64_t v4 = [v3 objectForKeyedSubscript:@"ICReadData"];
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [v5 length];
    uint64_t v7 = [v3 objectForKeyedSubscript:@"ICBytesRead"];

    if (v7)
    {
      id v8 = [v3 objectForKeyedSubscript:@"ICBytesRead"];
      uint64_t v6 = [v8 unsignedLongLongValue];
    }
    id v9 = [v3 objectForKeyedSubscript:@"ICBufferOffset"];

    if (v9)
    {
      char v10 = [v3 objectForKeyedSubscript:@"ICBufferOffset"];
      id v9 = (void *)[v10 unsignedLongLongValue];
    }
    __ICOSLogCreate();
    uint64_t v11 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v11 length] >= 0x15)
    {
      __int16 v12 = objc_msgSend(v11, "substringWithRange:", 0, 18);
      uint64_t v13 = [v12 stringByAppendingString:@".."];

      uint64_t v11 = (void *)v13;
    }
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Received: %llu bytes", v6);
    long long v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v11;
      off_t v17 = v15;
      *(_DWORD *)stat buf = 136446466;
      uint64_t v33 = [v16 UTF8String];
      __int16 v34 = 2114;
      char v35 = v14;
      _os_log_impl(&dword_1BEEFF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v18 = *(void **)(a1 + 40);
    id v19 = objc_msgSend(v5, "subdataWithRange:", v9, v6);
    [v18 appendData:v19];

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) -= v6;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += v6;
    [*(id *)(a1 + 48) setCompletedUnitCount:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) - *(void *)(a1 + 96)];
    __ICOSLogCreate();
    uint64_t v20 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v20 length] >= 0x15)
    {
      uint64_t v21 = objc_msgSend(v20, "substringWithRange:", 0, 18);
      uint64_t v22 = [v21 stringByAppendingString:@".."];

      uint64_t v20 = (void *)v22;
    }
    uint64_t v23 = NSString;
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    [*(id *)(a1 + 48) fractionCompleted];
    id v27 = [v23 stringWithFormat:@"Offset: %lld, Remaining: %lld, Progress: %f", v24, v25, v26];
    uint64_t v28 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v20;
      uint64_t v30 = v28;
      uint64_t v31 = [v29 UTF8String];
      *(_DWORD *)stat buf = 136446466;
      uint64_t v33 = v31;
      __int16 v34 = 2114;
      char v35 = v27;
      _os_log_impl(&dword_1BEEFF000, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)requestCloseStreamData
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1F1A2C5C8 forKeyedSubscript:@"ICReadOffset"];
  [v3 setObject:&unk_1F1A2C5C8 forKeyedSubscript:@"ICReadLength"];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ICReadBufferStreamClose"];
  uint64_t v4 = [(ICCameraItem *)self device];
  uint64_t v5 = [v4 deviceManager];
  uint64_t v6 = [(ICCameraItem *)self device];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ICCameraFile_requestCloseStreamData__block_invoke;
  v7[3] = &unk_1E63D79B0;
  v7[4] = self;
  [v5 getFileData:self fromDevice:v6 withOptions:v3 completion:v7];
}

void __38__ICCameraFile_requestCloseStreamData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKeyedSubscript:@"errCode"];
  int v5 = [v4 intValue];

  if (!v5)
  {
    __ICOSLogCreate();
    uint64_t v6 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v6 length] >= 0x15)
    {
      uint64_t v7 = objc_msgSend(v6, "substringWithRange:", 0, 18);
      uint64_t v8 = [v7 stringByAppendingString:@".."];

      uint64_t v6 = (void *)v8;
    }
    id v9 = [NSString stringWithFormat:@"ICReadBufferStreamClose"];
    char v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v6;
      __int16 v12 = v10;
      int v13 = 136446466;
      uint64_t v14 = [v11 UTF8String];
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)requestOpenStreamData
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1F1A2C5C8 forKeyedSubscript:@"ICReadOffset"];
  [v3 setObject:&unk_1F1A2C5C8 forKeyedSubscript:@"ICReadLength"];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ICReadBufferStreamOpen"];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  int v5 = [(ICCameraItem *)self device];
  uint64_t v6 = [v5 deviceManager];
  uint64_t v7 = [(ICCameraItem *)self device];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__ICCameraFile_requestOpenStreamData__block_invoke;
  v9[3] = &unk_1E63D79D8;
  v9[4] = self;
  dispatch_semaphore_t v10 = v4;
  uint64_t v8 = v4;
  [v6 getFileData:self fromDevice:v7 withOptions:v3 completion:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __37__ICCameraFile_requestOpenStreamData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = [a3 objectForKeyedSubscript:@"errCode"];
  int v5 = [v4 intValue];

  if (!v5)
  {
    __ICOSLogCreate();
    uint64_t v6 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v6 length] >= 0x15)
    {
      uint64_t v7 = objc_msgSend(v6, "substringWithRange:", 0, 18);
      uint64_t v8 = [v7 stringByAppendingString:@".."];

      uint64_t v6 = (void *)v8;
    }
    id v9 = [NSString stringWithFormat:@"ICReadBufferStreamOpen"];
    dispatch_semaphore_t v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v6;
      __int16 v12 = v10;
      int v14 = 136446466;
      uint64_t v15 = [v11 UTF8String];
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)requestStreamDataAtOffset:(int64_t)a3 length:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  dispatch_semaphore_t v10 = [NSNumber numberWithUnsignedLongLong:a3];
  [v9 setObject:v10 forKeyedSubscript:@"ICReadOffset"];

  id v11 = [NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v11 forKeyedSubscript:@"ICReadLength"];

  __int16 v12 = [(ICCameraItem *)self device];
  int v13 = [v12 deviceManager];
  int v14 = [(ICCameraItem *)self device];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__ICCameraFile_requestStreamDataAtOffset_length_completion___block_invoke;
  v16[3] = &unk_1E63D7A00;
  id v17 = v8;
  id v15 = v8;
  [v13 getFileData:self fromDevice:v14 withOptions:v9 completion:v16];
}

void __60__ICCameraFile_requestStreamDataAtOffset_length_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  dispatch_semaphore_t v4 = [v7 objectForKeyedSubscript:@"errCode"];
  int v5 = [v4 intValue];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v5 userInfo:0];
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUTI:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ICCameraFile;
  [(ICCameraItem *)&v15 setUTI:a3];
  dispatch_semaphore_t v4 = [(ICCameraItem *)self UTI];
  int v5 = [(id)*MEMORY[0x1E4F44400] identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unint64_t v7 = self->_mediaMetadata | 0x20;
  }
  else
  {
    id v8 = [(ICCameraItem *)self UTI];
    id v9 = [(id)*MEMORY[0x1E4F44448] identifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      unint64_t v7 = self->_mediaMetadata | 0x40;
    }
    else
    {
      id v11 = [(ICCameraItem *)self UTI];
      __int16 v12 = [(id)*MEMORY[0x1E4F44330] identifier];
      int v13 = [v11 isEqualToString:v12];

      unint64_t mediaMetadata = self->_mediaMetadata;
      if (v13) {
        unint64_t v7 = mediaMetadata | 0x100;
      }
      else {
        unint64_t v7 = mediaMetadata | 0x10;
      }
    }
  }
  self->_unint64_t mediaMetadata = v7;
}

- (void)requestSecurityScopedURLWithCompletion:(void *)completion
{
  dispatch_semaphore_t v4 = completion;
  int v5 = [(ICCameraItem *)self device];
  int v6 = [v5 deviceManager];
  unint64_t v7 = [(ICCameraItem *)self device];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICCameraFile_requestSecurityScopedURLWithCompletion___block_invoke;
  v9[3] = &unk_1E63D7A00;
  id v10 = v4;
  id v8 = v4;
  [v6 getSecurityScopedURL:self fromDevice:v7 completion:v9];
}

void __55__ICCameraFile_requestSecurityScopedURLWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"errCode"];
  int v6 = [v5 intValue];

  unint64_t v7 = [v4 objectForKeyedSubscript:@"ICSecurityScopedURL"];

  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v6 userInfo:0];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestRefreshObjectHandleInfo:(id)a3
{
  id v4 = a3;
  int v5 = [(ICCameraItem *)self device];
  int v6 = [v5 deviceManager];
  unint64_t v7 = [(ICCameraItem *)self device];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ICCameraFile_requestRefreshObjectHandleInfo___block_invoke;
  v9[3] = &unk_1E63D7A00;
  id v10 = v4;
  id v8 = v4;
  [v6 refreshObjectHandleInfo:self fromDevice:v7 completion:v9];
}

void __47__ICCameraFile_requestRefreshObjectHandleInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"errCode"];
  int v5 = [v4 intValue];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v5 userInfo:0];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleObjectInfoUpdate:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"ICFileSize"];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ICFileSize"];
    -[ICCameraFile setFileSize:](self, "setFileSize:", [v6 unsignedLongLongValue]);

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke;
    block[3] = &unk_1E63D72A8;
    void block[4] = self;
    ICPerformBlockOnMainThread(block);
  }
  id v7 = [v4 objectForKeyedSubscript:@"ICMediaDuration"];

  if (v7)
  {
    id v8 = [v4 objectForKeyedSubscript:@"ICMediaDuration"];
    [v8 doubleValue];
    -[ICCameraFile setDuration:](self, "setDuration:");

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_2;
    v19[3] = &unk_1E63D72A8;
    v19[4] = self;
    ICPerformBlockOnMainThread(v19);
  }
  id v9 = [v4 objectForKeyedSubscript:@"ICModificationDate"];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F1C9C8];
    id v11 = [v4 objectForKeyedSubscript:@"ICModificationDate"];
    __int16 v12 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v11, "unsignedLongLongValue"));

    if (v12)
    {
      [(ICCameraItem *)self setModificationDate:v12];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_3;
      v18[3] = &unk_1E63D72A8;
      v18[4] = self;
      ICPerformBlockOnMainThread(v18);
    }
  }
  int v13 = [v4 objectForKeyedSubscript:@"ICCreationDate"];

  if (v13)
  {
    int v14 = (void *)MEMORY[0x1E4F1C9C8];
    objc_super v15 = [v4 objectForKeyedSubscript:@"ICCreationDate"];
    __int16 v16 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v15, "unsignedLongLongValue"));

    if (v16)
    {
      [(ICCameraItem *)self setCreationDate:v16];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_4;
      v17[3] = &unk_1E63D72A8;
      v17[4] = self;
      ICPerformBlockOnMainThread(v17);
    }
  }
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"fileSize"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"fileSize"];
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"duration"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"duration"];
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"modificationDate"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"modificationDate"];
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"creationDate"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"creationDate"];
}

+ (id)fingerprintForFileAtURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ICCameraFileFingerprint);
  uint64_t v7 = 0;
  int v5 = [(ICCameraFileFingerprint *)v4 fingerprintForFileAtURL:v3 error:&v7];

  return v5;
}

- (void)requestFingerprintWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  int v5 = [(ICCameraFile *)self fingerprint];

  if (v5)
  {
    uint64_t v6 = [(ICCameraFile *)self fingerprint];
    v4[2](v4, v6, 0);
  }
  else
  {
    uint64_t v7 = [(ICCameraItem *)self device];
    id v8 = [v7 deviceManager];
    id v9 = [(ICCameraItem *)self device];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __49__ICCameraFile_requestFingerprintWithCompletion___block_invoke;
    v10[3] = &unk_1E63D7A28;
    v10[4] = self;
    id v11 = v4;
    [v8 getFingerprint:self fromDevice:v9 completion:v10];
  }
}

void __49__ICCameraFile_requestFingerprintWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"errCode"];
  int v6 = [v5 intValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"ICCameraFileFingerprint"];

  if (v6)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v6 userInfo:0];
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v8 = 0;
  if (v7) {
LABEL_3:
  }
    [*(id *)(a1 + 32) setFingerprint:v7];
LABEL_4:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSInteger)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (NSInteger)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
}

- (NSString)createdFilename
{
  return self->_createdFilename;
}

- (void)setCreatedFilename:(id)a3
{
}

- (off_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)highFramerate
{
  return self->_highFramerate;
}

- (void)setHighFramerate:(BOOL)a3
{
  self->_highFramerate = a3;
}

- (BOOL)timeLapse
{
  return self->_timeLapse;
}

- (void)setTimeLapse:(BOOL)a3
{
  self->_timeLapse = a3;
}

- (BOOL)firstPicked
{
  return self->_firstPicked;
}

- (void)setFirstPicked:(BOOL)a3
{
  self->_firstPicked = a3;
}

- (NSString)originatingAssetID
{
  return self->_originatingAssetID;
}

- (void)setOriginatingAssetID:(id)a3
{
}

- (NSString)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
}

- (NSString)gpsString
{
  return self->_gpsString;
}

- (void)setGpsString:(id)a3
{
}

- (NSString)relatedUUID
{
  return self->_relatedUUID;
}

- (void)setRelatedUUID:(id)a3
{
}

- (NSString)burstUUID
{
  return self->_burstUUID;
}

- (void)setBurstUUID:(id)a3
{
}

- (BOOL)burstFavorite
{
  return self->_burstFavorite;
}

- (void)setBurstFavorite:(BOOL)a3
{
  self->_burstFavorite = a3;
}

- (BOOL)burstPicked
{
  return self->_burstPicked;
}

- (void)setBurstPicked:(BOOL)a3
{
  self->_burstPicked = a3;
}

- (void)setSidecarFiles:(id)a3
{
}

- (ICCameraFile)pairedRawImage
{
  return self->_pairedRawImage;
}

- (void)setPairedRawImage:(id)a3
{
}

- (NSDate)fileCreationDate
{
  return self->_fileCreationDate;
}

- (void)setFileCreationDate:(id)a3
{
}

- (NSDate)fileModificationDate
{
  return self->_fileModificationDate;
}

- (void)setFileModificationDate:(id)a3
{
}

- (NSDate)exifCreationDate
{
  return self->_exifCreationDate;
}

- (void)setExifCreationDate:(id)a3
{
}

- (NSDate)exifModificationDate
{
  return self->_exifModificationDate;
}

- (void)setExifModificationDate:(id)a3
{
}

- (BOOL)privHasThumbnail
{
  return self->_privHasThumbnail;
}

- (void)setPrivHasThumbnail:(BOOL)a3
{
  self->_privHasThumbnail = a3;
}

- (BOOL)privHasMetadata
{
  return self->_privHasMetadata;
}

- (void)setPrivHasMetadata:(BOOL)a3
{
  self->_privHasMetadata = a3;
}

- (unint64_t)privOrientation
{
  return self->_privOrientation;
}

- (void)setPrivOrientation:(unint64_t)a3
{
  self->_privOrientation = a3;
}

- (NSString)privSpatialOverCaptureGroupID
{
  return self->_privSpatialOverCaptureGroupID;
}

- (void)setPrivSpatialOverCaptureGroupID:(id)a3
{
}

- (NSString)privFingerprint
{
  return self->_privFingerprint;
}

- (void)setPrivFingerprint:(id)a3
{
}

- (NSString)privMediaBase
{
  return self->_privMediaBase;
}

- (void)setPrivMediaBase:(id)a3
{
}

- (unint64_t)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(unint64_t)a3
{
  self->_unint64_t mediaMetadata = a3;
}

- (NSDictionary)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
}

- (NSMutableDictionary)subImages
{
  return self->_subImages;
}

- (void)setSubImages:(id)a3
{
}

- (BOOL)useExtensionIcon
{
  return self->_useExtensionIcon;
}

- (void)setUseExtensionIcon:(BOOL)a3
{
  self->_useExtensionIcon = a3;
}

- (BOOL)retrievedMetadata
{
  return self->_retrievedMetadata;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (NSData)thumbnailData
{
  return self->_thumbnailData;
}

- (void)setThumbnailData:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (double)lastImportSpeed
{
  return self->_lastImportSpeed;
}

- (void)setLastImportSpeed:(double)a3
{
  self->_lastImportSpeed = a3;
}

- (BOOL)orientationOverridden
{
  return self->_orientationOverridden;
}

- (void)setOrientationOverridden:(BOOL)a3
{
  self->_orientationOverridden = a3;
}

- (unint64_t)oUUID
{
  return self->_oUUID;
}

- (void)setOUUID:(unint64_t)a3
{
  self->_oUUID = a3;
}

- (unint64_t)uTime
{
  return self->_uTime;
}

- (void)setUTime:(unint64_t)a3
{
  self->_uTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_subImages, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_privMediaBase, 0);
  objc_storeStrong((id *)&self->_privFingerprint, 0);
  objc_storeStrong((id *)&self->_privSpatialOverCaptureGroupID, 0);
  objc_storeStrong((id *)&self->_exifModificationDate, 0);
  objc_storeStrong((id *)&self->_exifCreationDate, 0);
  objc_storeStrong((id *)&self->_fileModificationDate, 0);
  objc_storeStrong((id *)&self->_fileCreationDate, 0);
  objc_storeStrong((id *)&self->_pairedRawImage, 0);
  objc_storeStrong((id *)&self->_sidecarFiles, 0);
  objc_storeStrong((id *)&self->_burstUUID, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_gpsString, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_originatingAssetID, 0);
  objc_storeStrong((id *)&self->_createdFilename, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_fileIsHEIC, 0);
  objc_storeStrong((id *)&self->_fileIsJPEG, 0);
  objc_storeStrong((id *)&self->_debugBadge, 0);
  objc_storeStrong((id *)&self->_debugType, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end