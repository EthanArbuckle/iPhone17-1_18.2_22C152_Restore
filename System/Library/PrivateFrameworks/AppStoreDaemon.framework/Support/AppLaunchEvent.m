@interface AppLaunchEvent
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppLaunchEvent

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_new();
  id v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(NSString *)self->_clipBundleID copyWithZone:a3];
  v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  id v12 = [(NSString *)self->_clipLaunchReason copyWithZone:a3];
  v13 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v12;

  id v14 = [(NSURL *)self->_clipFullURL copyWithZone:a3];
  v15 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v14;

  id v16 = [(NSString *)self->_clipReferrerBundleID copyWithZone:a3];
  v17 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v16;

  id v18 = [(NSURL *)self->_clipReferrerURL copyWithZone:a3];
  v19 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v18;

  id v20 = [(NSString *)self->_clipWebAppBundleID copyWithZone:a3];
  v21 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v20;

  id v22 = [(NSString *)self->_containingBundleID copyWithZone:a3];
  v23 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v22;

  id v24 = [(NSDate *)self->_endDate copyWithZone:a3];
  v25 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v24;

  id v26 = [(NSNumber *)self->_evid copyWithZone:a3];
  v27 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v26;

  *(unsigned char *)(v5 + 8) = self->_isExtensionUsage;
  *(unsigned char *)(v5 + 10) = self->_clip;
  id v28 = [(NSNumber *)self->_itemID copyWithZone:a3];
  v29 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v28;

  id v30 = [(NSString *)self->_itemName copyWithZone:a3];
  v31 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v30;

  id v32 = [(NSString *)self->_launchReason copyWithZone:a3];
  v33 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v32;

  *(_DWORD *)(v5 + 12) = self->_sourceStream;
  id v34 = [(NSDate *)self->_startDate copyWithZone:a3];
  v35 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v34;

  *(_OWORD *)(v5 + 144) = *(_OWORD *)&self->_usageTime;
  return (id)v5;
}

- (id)description
{
  v3 = +[NSMutableArray array];
  if (self) {
    bundleID = self->_bundleID;
  }
  else {
    bundleID = 0;
  }
  uint64_t v5 = +[NSString stringWithFormat:@"bundleID: %@", bundleID];
  [v3 addObject:v5];

  if (self) {
    startDate = self->_startDate;
  }
  else {
    startDate = 0;
  }
  v7 = sub_1002826D4(startDate);
  id v8 = +[NSString stringWithFormat:@"startTime: %@", v7];
  [v3 addObject:v8];

  if (self) {
    endDate = self->_endDate;
  }
  else {
    endDate = 0;
  }
  id v10 = sub_1002826D4(endDate);
  v11 = +[NSString stringWithFormat:@"endTime: %@", v10];
  [v3 addObject:v11];

  if (self)
  {
    id v12 = +[NSString stringWithFormat:@"type: %ld", self->_sourceStream];
    [v3 addObject:v12];

    if (self->_isExtensionUsage) {
      [v3 addObject:@"isExtensionUsage: Y"];
    }
    containingBundleID = self->_containingBundleID;
  }
  else
  {
    id v22 = +[NSString stringWithFormat:@"type: %ld", 0];
    [v3 addObject:v22];

    containingBundleID = 0;
  }
  if ([(NSString *)containingBundleID length])
  {
    if (self) {
      id v14 = self->_containingBundleID;
    }
    else {
      id v14 = 0;
    }
    v15 = +[NSString stringWithFormat:@"bundleID: %@", v14];
    [v3 addObject:v15];
  }
  if (self) {
    launchReason = self->_launchReason;
  }
  else {
    launchReason = 0;
  }
  if ([(NSString *)launchReason length])
  {
    if (self) {
      v17 = self->_launchReason;
    }
    else {
      v17 = 0;
    }
    id v18 = +[NSString stringWithFormat:@"launchReason: %@", v17];
    [v3 addObject:v18];
  }
  v19 = [v3 componentsJoinedByString:@", "];
  id v20 = +[NSString stringWithFormat:@"{ %@ }", v19];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventEndDate, 0);
  objc_storeStrong((id *)&self->_containingBundleID, 0);
  objc_storeStrong((id *)&self->_clipWebAppBundleID, 0);
  objc_storeStrong((id *)&self->_clipReferrerBundleID, 0);
  objc_storeStrong((id *)&self->_clipReferrerURL, 0);
  objc_storeStrong((id *)&self->_clipLaunchReason, 0);
  objc_storeStrong((id *)&self->_clipFullURL, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end