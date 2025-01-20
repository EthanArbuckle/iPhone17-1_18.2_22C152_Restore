@interface ASDAppUsageStats
- (BOOL)isClip;
- (BOOL)isClipLaunch;
- (BOOL)isExtensionUsage;
- (NSDate)endDate;
- (NSDate)lastEventEndDate;
- (NSDate)startDate;
- (NSNumber)evid;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)clipBundleID;
- (NSString)clipLaunchReason;
- (NSString)clipReferrerBundleID;
- (NSString)clipReferrerURL;
- (NSString)clipWebAppBundleID;
- (NSString)containingBundleID;
- (NSString)itemName;
- (NSString)launchReason;
- (NSString)sourceStream;
- (NSURL)clipFullURL;
- (id)_formatTimeInternal:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventTime;
- (int64_t)usageCount;
- (int64_t)usageTime;
- (void)setBundleID:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setClipBundleID:(id)a3;
- (void)setClipFullURL:(id)a3;
- (void)setClipLaunchReason:(id)a3;
- (void)setClipReferrerBundleID:(id)a3;
- (void)setClipReferrerURL:(id)a3;
- (void)setClipWebAppBundleID:(id)a3;
- (void)setContainingBundleID:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEventTime:(int64_t)a3;
- (void)setEvid:(id)a3;
- (void)setIsClip:(BOOL)a3;
- (void)setIsClipLaunch:(BOOL)a3;
- (void)setIsExtensionUsage:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setLastEventEndDate:(id)a3;
- (void)setLaunchReason:(id)a3;
- (void)setSourceStream:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setUsageCount:(int64_t)a3;
- (void)setUsageTime:(int64_t)a3;
@end

@implementation ASDAppUsageStats

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_clipBundleID copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_clipLaunchReason copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSURL *)self->_clipFullURL copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSString *)self->_clipReferrerBundleID copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSString *)self->_clipReferrerURL copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  uint64_t v20 = [(NSString *)self->_clipWebAppBundleID copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  uint64_t v22 = [(NSString *)self->_containingBundleID copyWithZone:a3];
  v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  uint64_t v24 = [(NSDate *)self->_endDate copyWithZone:a3];
  v25 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v24;

  uint64_t v26 = [(NSNumber *)self->_evid copyWithZone:a3];
  v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  *(unsigned char *)(v5 + 8) = self->_isClip;
  *(unsigned char *)(v5 + 9) = self->_isClipLaunch;
  *(unsigned char *)(v5 + 10) = self->_isExtensionUsage;
  uint64_t v28 = [(NSNumber *)self->_itemID copyWithZone:a3];
  v29 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v28;

  uint64_t v30 = [(NSString *)self->_itemName copyWithZone:a3];
  v31 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v30;

  uint64_t v32 = [(NSString *)self->_launchReason copyWithZone:a3];
  v33 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v32;

  uint64_t v34 = [(NSString *)self->_sourceStream copyWithZone:a3];
  v35 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v34;

  uint64_t v36 = [(NSDate *)self->_startDate copyWithZone:a3];
  v37 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v36;

  *(_OWORD *)(v5 + 160) = *(_OWORD *)&self->_usageTime;
  return (id)v5;
}

- (id)description
{
  if (self->_isExtensionUsage)
  {
    v3 = NSString;
    bundleID = self->_bundleID;
    containingBundleID = self->_containingBundleID;
    -[ASDAppUsageStats _formatTimeInternal:]((uint64_t)self, self->_usageTime);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"<id: %@ isExtension: Y containingBundleID: %@ usage: %@>", bundleID, containingBundleID, v6];
    uint64_t v14 = LABEL_8:;
    goto LABEL_9;
  }
  BOOL v7 = [(ASDAppUsageStats *)self isClip];
  uint64_t v8 = NSString;
  v9 = self->_bundleID;
  if (!v7)
  {
    int64_t usageCount = self->_usageCount;
    -[ASDAppUsageStats _formatTimeInternal:]((uint64_t)self, self->_usageTime);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"<id: %@ count: %lu usage: %@>", v9, usageCount, v6];
    goto LABEL_8;
  }
  BOOL isClipLaunch = self->_isClipLaunch;
  BOOL isClip = self->_isClip;
  int64_t usageTime = self->_usageTime;
  id v6 = [(ASDAppUsageStats *)self startDate];
  if (qword_1EB4D6480 != -1) {
    dispatch_once(&qword_1EB4D6480, &__block_literal_global_6);
  }
  v13 = [(id)_MergedGlobals_29 stringFromDate:v6];

  uint64_t v14 = [v8 stringWithFormat:@"{ id: %@ launch: %d clip: %d usage: %ld startDate: %@ }", v9, isClipLaunch, isClip, usageTime, v13];

LABEL_9:
  return v14;
}

- (id)_formatTimeInternal:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v3 = a2 % 60;
    if (a2 / 60 % 60 >= 10) {
      v4 = &stru_1EEC399F8;
    }
    else {
      v4 = @"0";
    }
    uint64_t v5 = [NSString stringWithFormat:@"%@%lu", v4, a2 / 60 % 60];
    if ((int)v3 >= 10) {
      id v6 = &stru_1EEC399F8;
    }
    else {
      id v6 = @"0";
    }
    BOOL v7 = [NSString stringWithFormat:@"%@%lu", v6, v3 % 0x3C];
    uint64_t v8 = [NSString stringWithFormat:@"%lu:%@:%@", a2 / 3600, v5, v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

void __37__ASDAppUsageStats__formatShortDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_29;
  _MergedGlobals_29 = (uint64_t)v0;

  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_MergedGlobals_29 setLocale:v2];
  [(id)_MergedGlobals_29 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
}

- (NSURL)clipFullURL
{
  return self->_clipFullURL;
}

- (void)setClipFullURL:(id)a3
{
}

- (NSString)clipLaunchReason
{
  return self->_clipLaunchReason;
}

- (void)setClipLaunchReason:(id)a3
{
}

- (NSString)clipReferrerURL
{
  return self->_clipReferrerURL;
}

- (void)setClipReferrerURL:(id)a3
{
}

- (NSString)clipReferrerBundleID
{
  return self->_clipReferrerBundleID;
}

- (void)setClipReferrerBundleID:(id)a3
{
}

- (NSString)clipWebAppBundleID
{
  return self->_clipWebAppBundleID;
}

- (void)setClipWebAppBundleID:(id)a3
{
}

- (NSString)containingBundleID
{
  return self->_containingBundleID;
}

- (void)setContainingBundleID:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(int64_t)a3
{
  self->_eventTime = a3;
}

- (NSNumber)evid
{
  return self->_evid;
}

- (void)setEvid:(id)a3
{
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (void)setIsClip:(BOOL)a3
{
  self->_BOOL isClip = a3;
}

- (BOOL)isClipLaunch
{
  return self->_isClipLaunch;
}

- (void)setIsClipLaunch:(BOOL)a3
{
  self->_BOOL isClipLaunch = a3;
}

- (BOOL)isExtensionUsage
{
  return self->_isExtensionUsage;
}

- (void)setIsExtensionUsage:(BOOL)a3
{
  self->_isExtensionUsage = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSDate)lastEventEndDate
{
  return self->_lastEventEndDate;
}

- (void)setLastEventEndDate:(id)a3
{
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
}

- (NSString)sourceStream
{
  return self->_sourceStream;
}

- (void)setSourceStream:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (int64_t)usageTime
{
  return self->_usageTime;
}

- (void)setUsageTime:(int64_t)a3
{
  self->_int64_t usageTime = a3;
}

- (int64_t)usageCount
{
  return self->_usageCount;
}

- (void)setUsageCount:(int64_t)a3
{
  self->_int64_t usageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sourceStream, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_lastEventEndDate, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_containingBundleID, 0);
  objc_storeStrong((id *)&self->_clipWebAppBundleID, 0);
  objc_storeStrong((id *)&self->_clipReferrerBundleID, 0);
  objc_storeStrong((id *)&self->_clipReferrerURL, 0);
  objc_storeStrong((id *)&self->_clipLaunchReason, 0);
  objc_storeStrong((id *)&self->_clipFullURL, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end