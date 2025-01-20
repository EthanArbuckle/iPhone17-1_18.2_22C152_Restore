@interface IMDAttachmentUtilities
+ (BOOL)_doesWRMRecommendDisablingLQM;
+ (BOOL)commonCapabilitiesSupportHighQualityPhotos:(id)a3;
+ (BOOL)didLQMSettingChanged;
+ (BOOL)isPreviewAttachmentSizeEnabled;
+ (BOOL)shouldAllowBackwardsCompatibilitySizeOverride;
+ (BOOL)shouldAllowHighQualityPhotoUploadForNetworkConditions;
+ (BOOL)shouldEnablePreviewTranscodingQualityForTransfer:(id)a3 isSending:(BOOL)a4;
+ (BOOL)shouldSendLowResolutionOnly;
+ (BOOL)updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled;
+ (id)_fetchSizeLimitsForTransfer:(id)a3 mode:(unint64_t)a4;
+ (id)fetchSizeLimitsForTransfer:(id)a3;
+ (id)fetchSizeLimitsForTransfer:(id)a3 mode:(unint64_t)a4;
+ (id)messageAttachmentSendableUTIs;
+ (id)messageAttachmentSendableUTIsForResourcePath:(id)a3;
+ (int64_t)largeFileSizeFor:(id)a3 allowedLargerRepresentation:(BOOL *)a4;
+ (unint64_t)_fileTransferSizeForSpatialImageFromServerBag:(id)a3;
+ (unint64_t)_maxAllowedSpatialImageSize;
+ (unint64_t)_maxAllowedStereoVideoSize;
+ (unint64_t)_minSizeForLargeAuxVideo;
+ (unint64_t)_smallerImageFileSize;
+ (unint64_t)freeSpaceInHomeDirectory;
+ (unint64_t)maxTransferAudioFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4;
+ (unint64_t)maxTransferVideoFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4;
+ (unint64_t)minimumFreeSpace;
+ (unint64_t)mmcsTargetReportSizeForHighQualityPhotoSize:(unint64_t)a3 commonCapabilities:(id)a4;
+ (unint64_t)modernHighQualityPhotoSizeLimit;
+ (unint64_t)tinyImageQualitySizeLimit;
+ (void)_fetchStandardSizeLimit:(unint64_t *)a3 highQualitySizeLimit:(unint64_t *)a4 forTransfer:(id)a5;
+ (void)_fileTransferSizeForAAVideoFromServerBag:(unint64_t *)a3 smallSize:(unint64_t *)a4 serverBag:(id)a5;
+ (void)_fileTransferSizeForAuxVideoFromServerBag:(unint64_t *)a3 smallSize:(unint64_t *)a4 serverBag:(id)a5;
+ (void)maxTransferFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4;
@end

@implementation IMDAttachmentUtilities

+ (unint64_t)freeSpaceInHomeDirectory
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = NSHomeDirectory();
  v4 = [v2 attributesOfFileSystemForPath:v3 error:0];

  v5 = [v4 objectForKey:*MEMORY[0x1E4F283A0]];
  unint64_t v6 = [v5 longLongValue];

  return v6;
}

+ (id)messageAttachmentSendableUTIs
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 resourcePath];

  v5 = [a1 messageAttachmentSendableUTIsForResourcePath:v4];

  return v5;
}

+ (id)messageAttachmentSendableUTIsForResourcePath:(id)a3
{
  id v3 = a3;
  if (_IMWillLog())
  {
    id v11 = v3;
    _IMAlwaysLog();
  }
  v4 = objc_msgSend(v3, "stringByAppendingPathComponent:", @"MessageSendableUTIs", v11);
  v5 = [v4 stringByAppendingPathExtension:@"plist"];

  if (_IMWillLog())
  {
    v12 = v5;
    _IMAlwaysLog();
  }
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v12);
  int v7 = [v6 fileExistsAtPath:v5];

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (!v7) {
    goto LABEL_14;
  }
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (v8)
  {
    v9 = [v8 objectForKey:@"MessageSendableUTIs"];
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  else
  {
LABEL_14:
    v9 = 0;
  }

  return v9;
}

+ (id)fetchSizeLimitsForTransfer:(id)a3 mode:(unint64_t)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__fetchSizeLimitsForTransfer_mode_);
}

+ (id)fetchSizeLimitsForTransfer:(id)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel__fetchSizeLimitsForTransfer_mode_);
}

+ (BOOL)shouldSendLowResolutionOnly
{
  return MEMORY[0x1F4123B38](a1, a2);
}

+ (id)_fetchSizeLimitsForTransfer:(id)a3 mode:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  unint64_t v28 = 0;
  [a1 _fetchStandardSizeLimit:&v28 highQualitySizeLimit:&v27 forTransfer:v6];
  unint64_t v7 = v28;
  char v8 = [v6 isAuxVideo];
  CFStringRef v9 = (const __CFString *)[v6 type];
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F225F8];
  if (UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x1E4F225F8]))
  {
    if ((v8 & 1) == 0)
    {
      unint64_t v11 = [a1 tinyImageQualitySizeLimit];
      if (v11 < v28) {
        unint64_t v7 = v11;
      }
    }
  }
  v12 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  v13 = [v12 objectForKey:@"ck-imessage-always-send-LQM-for-standard-size_overwrite"];
  char v14 = [v13 BOOLValue];

  if (UTTypeConformsTo((CFStringRef)[v6 type], v10))
  {
    if ((v14 & 1) == 0)
    {
      unint64_t v28 = [a1 _smallerImageFileSize];
      if (_IMWillLog())
      {
        v24 = [NSNumber numberWithUnsignedInteger:v28];
        _IMAlwaysLog();
      }
    }
  }
  if (objc_msgSend(a1, "shouldEnablePreviewTranscodingQualityForTransfer:isSending:", v6, 1, v24))
  {
    if (_IMWillLog())
    {
      v15 = [v6 guid];
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "tinyImageQualitySizeLimit"));
      v26 = v25 = v15;
      _IMAlwaysLog();
    }
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "tinyImageQualitySizeLimit", v25, v26));
    v33[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

    goto LABEL_27;
  }
  if (a4 == 2)
  {
    v18 = [NSNumber numberWithUnsignedInteger:v27];
    v29 = v18;
    v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = &v29;
  }
  else if (a4 == 1)
  {
    v18 = [NSNumber numberWithUnsignedInteger:v7];
    v30 = v18;
    v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = &v30;
  }
  else
  {
    if (a4)
    {
      v21 = 0;
      goto LABEL_23;
    }
    if (![a1 shouldSendLowResolutionOnly])
    {
      v18 = [NSNumber numberWithUnsignedInteger:v28];
      v31[0] = v18;
      v23 = [NSNumber numberWithUnsignedInteger:v27];
      v31[1] = v23;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

      goto LABEL_21;
    }
    v18 = [NSNumber numberWithUnsignedInteger:v7];
    v32 = v18;
    v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = &v32;
  }
  v21 = [v19 arrayWithObjects:v20 count:1];
LABEL_21:

LABEL_23:
  if (_IMWillLog())
  {
    v25 = v21;
    _IMAlwaysLog();
  }
  v17 = objc_msgSend(v21, "__message_sortedDedupedNonZeroNumberArray", v25);

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
LABEL_27:

  return v17;
}

+ (int64_t)largeFileSizeFor:(id)a3 allowedLargerRepresentation:(BOOL *)a4
{
  id v5 = a3;
  if (qword_1EA8CA448 != -1) {
    dispatch_once(&qword_1EA8CA448, &unk_1F3390BE0);
  }
  id v6 = (void (*)(id, int64_t *, uint64_t *, void *, BOOL *))off_1EA8CA440;
  if (off_1EA8CA440)
  {
    int64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v7 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
    v6(v5, &v10, &v11, v7, a4);

    int64_t v8 = v10;
  }
  else
  {
    int64_t v8 = IMiMessageMaxFileSizeForUTI();
  }

  return v8;
}

+ (void)maxTransferFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  id v6 = (void *)MEMORY[0x1E4F6E660];
  id v7 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  [v6 IMiMessageMaxTransferFileSizeForWifiForPhoneNumber:a3 cellSize:a4 serverConfigurationBag:v7 phoneNumber:0 simID:0];
}

+ (unint64_t)maxTransferAudioFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  id v6 = (void *)MEMORY[0x1E4F6E660];
  id v7 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  unint64_t v8 = [v6 IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:a3 cellSize:a4 serverConfigurationBag:v7 phoneNumber:0 simID:0];

  return v8;
}

+ (unint64_t)maxTransferVideoFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  id v6 = (void *)MEMORY[0x1E4F6E660];
  id v7 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  unint64_t v8 = [v6 IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:a3 cellSize:a4 serverConfigurationBag:v7 phoneNumber:0 simID:0];

  return v8;
}

+ (unint64_t)minimumFreeSpace
{
  return 26214400;
}

+ (void)_fileTransferSizeForAuxVideoFromServerBag:(unint64_t *)a3 smallSize:(unint64_t *)a4 serverBag:(id)a5
{
  id v7 = a5;
  unint64_t v8 = [v7 objectForKey:@"att-aux-video-max-file-size"];
  unint64_t v9 = [v8 unsignedIntegerValue];

  int64_t v10 = [v7 objectForKey:@"att-aux-video-min-file-size"];

  uint64_t v11 = [v10 unsignedIntegerValue];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  unint64_t v12 = 0x100000;
  if (v11) {
    unint64_t v12 = v11;
  }
  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v12;
  }
}

+ (void)_fileTransferSizeForAAVideoFromServerBag:(unint64_t *)a3 smallSize:(unint64_t *)a4 serverBag:(id)a5
{
  id v7 = [a5 objectForKey:@"att-aa-video-max-file-size"];
  id v9 = v7;
  if (v7) {
    unint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 104857600;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (a3) {
    *a3 = v8;
  }
  if (a4) {
    *a4 = v8;
  }
}

+ (unint64_t)_fileTransferSizeForSpatialImageFromServerBag:(id)a3
{
  id v3 = [a3 objectForKey:@"att-spatial-image-max-file-size"];
  v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 20971520;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }

  return v5;
}

+ (BOOL)shouldAllowHighQualityPhotoUploadForNetworkConditions
{
  v2 = [MEMORY[0x1E4F6C378] sharedInstance];
  char v3 = [v2 isWiFiUsable];

  v4 = [MEMORY[0x1E4F6C378] sharedInstance];
  char v5 = [v4 hasLTEDataConnection];

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  return v3 | v5;
}

+ (unint64_t)modernHighQualityPhotoSizeLimit
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  char v3 = [v2 objectForKey:@"hq-photo-size-limit"];
  v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 104857600;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }

  return v5;
}

+ (BOOL)commonCapabilitiesSupportHighQualityPhotos:(id)a3
{
  char v3 = [a3 objectForKey:@"supports-high-quality-photo-file-sizes"];
  BOOL v4 = v3 && (objc_opt_respondsToSelector() & 1) != 0 && [v3 integerValue] == 1;

  return v4;
}

+ (BOOL)shouldAllowBackwardsCompatibilitySizeOverride
{
  LOBYTE(v2) = 1;
  char v3 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v4 = [v3 objectForKey:@"disable-hq-photo-mmcs-reported-size-override"];
  unint64_t v5 = v4;
  if (v4) {
    int v2 = [v4 BOOLValue] ^ 1;
  }

  return v2;
}

+ (unint64_t)mmcsTargetReportSizeForHighQualityPhotoSize:(unint64_t)a3 commonCapabilities:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F6B598];
  id v7 = a4;
  unint64_t v8 = [v6 sharedInstanceForBagType:1];
  uint64_t v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [(id)v9 isHighQualityPhotosEnabled];

  LOBYTE(v9) = [a1 commonCapabilitiesSupportHighQualityPhotos:v7];
  int v11 = [a1 shouldAllowBackwardsCompatibilitySizeOverride];
  unint64_t v12 = [a1 modernHighQualityPhotoSizeLimit];
  unint64_t v13 = a3;
  if ((v9 & 1) == 0)
  {
    unint64_t v13 = a3;
    if (v10)
    {
      unint64_t v13 = a3;
      if (v11)
      {
        unint64_t v13 = a3;
        if (v12 >= a3)
        {
          char v14 = [v8 objectForKey:@"hq-photo-mmcs-reported-size-override"];
          v15 = v14;
          if (v14) {
            unint64_t v16 = [v14 unsignedIntegerValue];
          }
          else {
            unint64_t v16 = 0x100000;
          }
          if (v16 >= a3) {
            unint64_t v13 = a3;
          }
          else {
            unint64_t v13 = v16;
          }
        }
      }
    }
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }

  return v13;
}

+ (unint64_t)_minSizeForLargeAuxVideo
{
  int v2 = [MEMORY[0x1E4F6C378] sharedInstance];
  if ([v2 isWiFiEnabled])
  {
    char v3 = [MEMORY[0x1E4F6C378] sharedInstance];
    char v4 = [v3 isWiFiUsable];

    if (v4)
    {
      int v5 = 0;
      int v6 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [MEMORY[0x1E4F6C378] sharedInstance];
  int v5 = [v7 hasLTEDataConnection];

  int v6 = 1;
LABEL_6:
  unint64_t v8 = [MEMORY[0x1E4F6C378] sharedInstance];
  int v9 = [v8 isWiFiUsable];

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v10 = 0x200000;
  if (v5 ^ 1 | v9) {
    uint64_t v10 = 3145728;
  }
  if (v6 ^ 1 | v5 | v9) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0x100000;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  return v11;
}

+ (unint64_t)_maxAllowedStereoVideoSize
{
  return 104857600;
}

+ (unint64_t)_maxAllowedSpatialImageSize
{
  return 20971520;
}

+ (void)_fetchStandardSizeLimit:(unint64_t *)a3 highQualitySizeLimit:(unint64_t *)a4 forTransfer:(id)a5
{
  id v8 = a5;
  unint64_t v42 = 0;
  unint64_t v43 = 0;
  int v9 = [v8 localURL];
  int v10 = IMIsAAVideoURL();

  if (!v10)
  {
    if ([v8 isAuxVideo])
    {
      unint64_t v40 = 0;
      unint64_t v41 = 0;
      char v14 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
      [a1 _fileTransferSizeForAuxVideoFromServerBag:&v41 smallSize:&v40 serverBag:v14];

      unint64_t v16 = v40;
      unint64_t v15 = v41;
      unint64_t v42 = v40;
      if (v15 <= [a1 _minSizeForLargeAuxVideo]) {
        uint64_t v17 = [a1 _minSizeForLargeAuxVideo];
      }
      else {
        uint64_t v17 = v41;
      }
      unint64_t v43 = v17;
      if (!_IMWillLog()) {
        goto LABEL_30;
      }
      v20 = [v8 guid];
      unint64_t v38 = v16;
      unint64_t v39 = v17;
      v37 = v20;
      _IMAlwaysLog();
    }
    else
    {
      v18 = [v8 type];
      int IsImage = IMUTTypeIsImage();

      v20 = [v8 type];
      if (IsImage)
      {
        v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v22 = [v21 isHighQualityPhotosEnabled];

        if (v22)
        {
          v23 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
          IMiMessageSizeLimitsForTransferType();

          if ([a1 shouldAllowHighQualityPhotoUploadForNetworkConditions]) {
            unint64_t v43 = [a1 modernHighQualityPhotoSizeLimit];
          }
        }
        else
        {
          v25 = [v8 localURL];
          int v26 = IMIsSpatialMedia();

          if (v26)
          {
            if (_IMWillLog())
            {
              v37 = [v8 guid];
              _IMAlwaysLog();
            }
            uint64_t v27 = objc_msgSend(MEMORY[0x1E4F6B598], "sharedInstanceForBagType:", 1, v37);
            unint64_t v28 = [a1 _fileTransferSizeForSpatialImageFromServerBag:v27];

            if (v28 >= [a1 _maxAllowedSpatialImageSize]) {
              unint64_t v28 = [a1 _maxAllowedSpatialImageSize];
            }
            unint64_t v42 = v28;
            unint64_t v43 = v28;
          }
          else
          {
            v29 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
            IMiMessageSizeLimitsForTransferType();
          }
        }
        if (!_IMWillLog()) {
          goto LABEL_29;
        }
        v24 = [v8 guid];
        unint64_t v38 = v43;
        unint64_t v39 = v42;
        v37 = v24;
        _IMAlwaysLog();
      }
      else
      {
        v24 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
        IMiMessageSizeLimitsForTransferType();
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (_IMWillLog())
  {
    v37 = [v8 guid];
    _IMAlwaysLog();
  }
  unint64_t v40 = 0;
  unint64_t v41 = 0;
  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F6B598], "sharedInstanceForBagType:", 1, v37);
  [a1 _fileTransferSizeForAAVideoFromServerBag:&v41 smallSize:&v40 serverBag:v11];

  unint64_t v12 = v41;
  if (v12 >= [a1 _maxAllowedStereoVideoSize]) {
    uint64_t v13 = [a1 _maxAllowedStereoVideoSize];
  }
  else {
    uint64_t v13 = v41;
  }
  unint64_t v42 = v13;
  unint64_t v43 = v13;
LABEL_30:
  v30 = objc_msgSend(MEMORY[0x1E4F6E720], "sharedInstance", v37, v38, v39);
  v31 = [v30 getValueFromDomain:@"com.apple.imessage" forKey:@"TranscodeSizeLimitsKB"];

  if (v31 && [v31 count] == 2)
  {
    v32 = [v31 objectAtIndex:0];
    LODWORD(v33) = [v32 unsignedIntValue];

    v34 = [v31 objectAtIndex:1];
    unsigned int v35 = [v34 unsignedIntValue];

    if (v33 <= v35) {
      uint64_t v36 = v35;
    }
    else {
      uint64_t v36 = v33;
    }
    if (v33 >= v35) {
      uint64_t v33 = v35;
    }
    else {
      uint64_t v33 = v33;
    }
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    unint64_t v42 = v33 << 10;
    unint64_t v43 = v36 << 10;
  }
  if (a3) {
    *a3 = v42;
  }
  if (a4) {
    *a4 = v43;
  }
}

+ (unint64_t)_smallerImageFileSize
{
  int v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  char v3 = [v2 objectForKey:@"madrid-small-image-size"];
  uint64_t v4 = [v3 unsignedIntegerValue];

  if (v4)
  {
    int v5 = [v2 objectForKey:@"madrid-small-image-size"];
    unint64_t v6 = [v5 unsignedIntegerValue];

    if (_IMWillLog())
    {
      id v8 = [NSNumber numberWithUnsignedInteger:v6];
      _IMAlwaysLog();
    }
  }
  else
  {
    unint64_t v6 = 512000;
  }

  return v6;
}

+ (BOOL)didLQMSettingChanged
{
  return IMGetCachedDomainBoolForKey();
}

+ (BOOL)isPreviewAttachmentSizeEnabled
{
  if [MEMORY[0x1E4F6E660] IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:0 simID:0]&& !objc_msgSend(a1, "didLQMSettingChanged")|| (IMGetCachedDomainBoolForKey())
  {
    return 1;
  }
  uint64_t v4 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  int v5 = [v4 objectForKey:@"send-preview-image"];
  char v6 = [v5 BOOLValue];

  return v6;
}

+ (BOOL)shouldEnablePreviewTranscodingQualityForTransfer:(id)a3 isSending:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v6 = (const __CFString *)[a3 type];
  int v7 = UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F225F8]);
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6C378] sharedInstance];
    int v9 = [v8 isWiFiUsable];

    if (v9
      && [MEMORY[0x1E4F6E660] IMReadDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:0 simID:0])
    {
      int v7 = _IMWillLog();
      if (v7) {
        goto LABEL_27;
      }
    }
    else
    {
      int v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v11 = [v10 isDynamicLQMDisabledByWRM];

      if (!v11) {
        goto LABEL_25;
      }
      int v12 = [a1 updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled];
      if (![MEMORY[0x1E4F6E660] IMReadDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:0 simID:0])goto LABEL_25; {
      if (_IMWillLog())
      }
        _IMAlwaysLog();
      uint64_t v13 = (void *)[a1 _doesWRMRecommendDisablingLQM];
      char v14 = [MEMORY[0x1E4F6E668] sharedInstance];
      uint64_t v15 = [v14 isDataConnectionExpensive];

      unint64_t v16 = [MEMORY[0x1E4F6E668] sharedInstance];
      uint64_t v17 = [v16 wrmNetworkPreference];
      int v18 = [v17 intValue];

      if (v12)
      {
        v19 = IMLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_1D990193C(v19, v20, v21, v22, v23, v24, v25, v26);
        }

        uint64_t v27 = IMLogHandleForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_1D99018BC();
        }

        unint64_t v28 = IMLogHandleForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_1D9901844(v28, v29, v30, v31, v32, v33, v34, v35);
        }

        uint64_t v36 = IMLogHandleForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          sub_1D99017C4();
        }

        v37 = IMLogHandleForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_1D9901744();
        }

        unint64_t v38 = IMLogHandleForCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          sub_1D99016C4();
        }

        id v53 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v52 = [NSNumber numberWithBool:1];
        uint64_t v51 = *MEMORY[0x1E4F6DC28];
        v50 = [NSNumber numberWithBool:v4];
        uint64_t v49 = *MEMORY[0x1E4F6DC30];
        unint64_t v39 = [NSNumber numberWithBool:1];
        uint64_t v40 = *MEMORY[0x1E4F6DC20];
        unint64_t v41 = [NSNumber numberWithBool:v18 != 0];
        uint64_t v42 = *MEMORY[0x1E4F6DC38];
        [NSNumber numberWithBool:v13];
        uint64_t v13 = v43 = (int)v13;
        uint64_t v44 = *MEMORY[0x1E4F6DC10];
        v45 = [NSNumber numberWithBool:v15];
        v46 = objc_msgSend(v53, "initWithObjectsAndKeys:", v52, v51, v50, v49, v39, v40, v41, v42, v13, v44, v45, *MEMORY[0x1E4F6DC18], 0);

        LODWORD(v13) = v43;
        v47 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v47 trackEvent:*MEMORY[0x1E4F6DC08] withDictionary:v46];
      }
      if (((v13 ^ 1 | v15) & 1) == 0)
      {
        int v7 = _IMWillLog();
        if (v7)
        {
LABEL_27:
          _IMAlwaysLog();
          LOBYTE(v7) = 0;
        }
      }
      else
      {
LABEL_25:
        LOBYTE(v7) = [a1 updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled];
      }
    }
  }
  return v7;
}

+ (unint64_t)tinyImageQualitySizeLimit
{
  uint64_t v2 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if (!v2)
  {
    uint64_t v5 = [MEMORY[0x1E4F6E660] IMReadAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:0 simID:0];
    if (v5)
    {
      unint64_t v4 = v5;
      if (!_IMWillLog()) {
        return v4;
      }
    }
    else
    {
      CFStringRef v6 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
      int v7 = [v6 objectForKey:@"preview-attachment-photo-size"];
      unint64_t v4 = [v7 integerValue];

      int v8 = _IMWillLog();
      if (v4)
      {
        if (!v8) {
          return v4;
        }
      }
      else
      {
        unint64_t v4 = 358400;
        if (!v8) {
          return v4;
        }
      }
    }
    _IMAlwaysLog();
    return v4;
  }
  uint64_t v3 = v2;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  return v3 << 10;
}

+ (BOOL)updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled
{
  int v3 = [MEMORY[0x1E4F6E660] IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:0 simID:0];
  char v4 = [a1 didLQMSettingChanged];
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      IMSetDomainBoolForKey();
      return 1;
    }
  }
  else if ((v4 & 1) == 0)
  {
    IMSetDomainBoolForKey();
  }
  if (IMGetCachedDomainBoolForKey()) {
    return 1;
  }
  CFStringRef v6 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  int v7 = [v6 objectForKey:@"send-preview-image"];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (BOOL)_doesWRMRecommendDisablingLQM
{
  if (_IMWillLog())
  {
    uint64_t v2 = [MEMORY[0x1E4F6E668] sharedInstance];
    int v3 = [v2 wrmNetworkPreference];
    char v4 = [MEMORY[0x1E4F6E668] sharedInstance];
    [v4 wrmCellScore];
    v15 = char v14 = v3;
    _IMAlwaysLog();
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F6E668], "sharedInstance", v14, v15);
  CFStringRef v6 = [v5 wrmCellScore];
  int v7 = [v6 intValue];

  char v8 = [MEMORY[0x1E4F6E668] sharedInstance];
  int v9 = [v8 wrmNetworkPreference];
  if ([v9 intValue]) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v7 < 3;
  }
  BOOL v12 = v10 && v7 > 0;

  if (v12 && _IMWillLog()) {
    _IMAlwaysLog();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  return v12;
}

@end