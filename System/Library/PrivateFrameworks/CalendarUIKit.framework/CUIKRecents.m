@interface CUIKRecents
+ (BOOL)recentDirectoryLocation:(id)a3 matchesSource:(id)a4;
+ (BOOL)recentIsDirectoryLocation:(id)a3;
+ (BOOL)recentMissingStyleAttributes:(id)a3;
+ (id)_archivedInstance:(id)a3;
+ (id)directoryLocationForRecent:(id)a3 onSource:(id)a4;
+ (id)locationForRecent:(id)a3;
+ (id)logHandle;
+ (id)mapKitHandleForRecent:(id)a3;
+ (id)mapKitStyleAttributesForRecent:(id)a3;
+ (id)recentEventWithRecentContact:(id)a3 styleAttributes:(id)a4;
+ (id)recentForDirectoryLocation:(id)a3 onSource:(id)a4;
+ (id)recentForLocation:(id)a3 withAddressString:(id)a4 andTitle:(id)a5 mapItem:(id)a6;
@end

@implementation CUIKRecents

+ (id)logHandle
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global);
  }
  v2 = (void *)logHandle_handle;

  return v2;
}

void __24__CUIKRecents_logHandle__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.caluikit", "CUIKRecents");
  v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;
}

+ (id)mapKitHandleForRecent:(id)a3
{
  v3 = [a3 metadata];
  v4 = [v3 objectForKey:@"mapKitHandle"];

  return v4;
}

+ (id)mapKitStyleAttributesForRecent:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = [a3 metadata];
  v5 = [v4 objectForKey:@"mapItemStyleAttributes"];

  if (!v5)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v6 setWithArray:v7];

  id v13 = 0;
  v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v13];
  id v10 = v13;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
  }
  else
  {
    v11 = [a1 logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CUIKRecents mapKitStyleAttributesForRecent:]((uint64_t)v10, v11);
    }
  }
  v9 = 0;
LABEL_10:

LABEL_11:

  return v9;
}

+ (BOOL)recentMissingStyleAttributes:(id)a3
{
  v3 = [a3 metadata];
  v4 = [v3 objectForKey:@"mapItemStyleAttributes"];

  return v4 == 0;
}

+ (id)recentEventWithRecentContact:(id)a3 styleAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 metadata];
  v9 = (void *)[v8 mutableCopy];

  if (v6)
  {
    id v10 = [a1 _archivedInstance:v6];
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v19 = [MEMORY[0x1E4F1CA98] null];
  id v10 = [a1 _archivedInstance:v19];

  if (v10) {
LABEL_3:
  }
    [v9 setObject:v10 forKey:@"mapItemStyleAttributes"];
LABEL_4:
  v11 = (void *)EKWeakLinkClass();
  v12 = [v7 address];
  id v13 = [v7 displayName];
  v14 = [v7 kind];
  v15 = [v7 mostRecentDate];
  v16 = [v7 weight];

  v17 = [v11 recentEventForAddress:v12 displayName:v13 kind:v14 date:v15 weight:v16 metadata:v9 options:0];

  return v17;
}

+ (id)_archivedInstance:(id)a3
{
  id v9 = 0;
  v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [a1 logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CUIKRecents _archivedInstance:]((uint64_t)v5, v7);
    }
  }

  return v4;
}

+ (id)locationForRecent:(id)a3
{
  id v3 = a3;
  v4 = [v3 metadata];
  id v5 = [v4 objectForKey:@"locationType"];
  id v6 = v5;
  if (v5 && [v5 unsignedIntegerValue] == 1)
  {
    id v7 = 0;
  }
  else
  {
    v8 = (double (*)(uint64_t, double, double))EKWeakLinkSymbol();
    id v9 = (objc_class *)EKWeakLinkClass();
    id v10 = [v4 objectForKey:@"latitude"];
    [v10 doubleValue];
    double v12 = v11;
    id v13 = [v4 objectForKey:@"longitude"];
    uint64_t v14 = [v13 doubleValue];
    double v16 = v8(v14, v12, v15);
    double v18 = v17;

    id v19 = [v9 alloc];
    v20 = [v4 objectForKey:@"hAccuracy"];
    [v20 doubleValue];
    double v22 = v21;
    v23 = [v4 objectForKey:@"vAccuracy"];
    [v23 doubleValue];
    double v25 = v24;
    v26 = [MEMORY[0x1E4F1C9C8] date];
    v27 = [v4 objectForKey:@"referenceFrame"];
    v28 = objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v26, objc_msgSend(v27, "integerValue"), v16, v18, 0.0, v22, v25);

    v29 = [v4 objectForKey:@"radius"];
    [v29 doubleValue];
    double v31 = v30;

    v32 = (void *)MEMORY[0x1E4F25630];
    v33 = [v3 displayName];
    id v7 = [v32 locationWithTitle:v33];

    [v7 setGeoLocation:v28];
    v34 = [v3 address];
    [v7 setAddress:v34];

    [v7 setRadius:v31];
    v35 = [v4 objectForKey:@"mapKitHandle"];
    if (v35) {
      [v7 setMapKitHandle:v35];
    }
    v36 = [v4 objectForKey:@"addressBookID"];
    if (v36) {
      [v7 setContactLabel:v36];
    }
  }

  return v7;
}

+ (id)recentForLocation:(id)a3 withAddressString:(id)a4 andTitle:(id)a5 mapItem:(id)a6
{
  v46[7] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v44 = a6;
  id v43 = a5;
  id v42 = a4;
  id v10 = [v9 geoLocation];
  v45[0] = @"latitude";
  double v11 = NSNumber;
  [v10 coordinate];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  v46[0] = v12;
  v45[1] = @"longitude";
  id v13 = NSNumber;
  [v10 coordinate];
  double v15 = [v13 numberWithDouble:v14];
  v46[1] = v15;
  v45[2] = @"hAccuracy";
  double v16 = NSNumber;
  [v10 horizontalAccuracy];
  double v17 = objc_msgSend(v16, "numberWithDouble:");
  v46[2] = v17;
  v45[3] = @"vAccuracy";
  double v18 = NSNumber;
  [v10 verticalAccuracy];
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  v46[3] = v19;
  v45[4] = @"locationType";
  v20 = [NSNumber numberWithUnsignedInteger:0];
  v46[4] = v20;
  v45[5] = @"radius";
  double v21 = NSNumber;
  [v9 radius];
  double v22 = objc_msgSend(v21, "numberWithDouble:");
  v46[5] = v22;
  v45[6] = @"referenceFrame";
  v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "referenceFrame"));
  v46[6] = v23;
  double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:7];

  double v25 = [v9 mapKitHandle];
  if (v25)
  {
  }
  else
  {
    v26 = [v9 contactLabel];

    if (!v26)
    {
      v27 = v24;
      v29 = v44;
      goto LABEL_14;
    }
  }
  v27 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v24];

  v28 = [v9 mapKitHandle];

  v29 = v44;
  if (v28)
  {
    double v30 = [v9 mapKitHandle];
    [v27 setObject:v30 forKey:@"mapKitHandle"];

    double v31 = [v44 _styleAttributes];

    if (v31) {
      [v44 _styleAttributes];
    }
    else {
    v32 = [MEMORY[0x1E4F1CA98] null];
    }
    v33 = [a1 _archivedInstance:v32];

    if (v33) {
      [v27 setObject:v33 forKey:@"mapItemStyleAttributes"];
    }
  }
  v34 = [v9 contactLabel];

  if (v34)
  {
    v35 = [v9 contactLabel];
    [v27 setObject:v35 forKey:@"addressBookID"];
  }
LABEL_14:
  v36 = (void *)EKWeakLinkClass();
  v37 = EKWeakLinkStringConstant();
  v38 = [MEMORY[0x1E4F1C9C8] date];
  v39 = [v36 recentEventForAddress:v42 displayName:v43 kind:v37 date:v38 weight:0 metadata:v27 options:1];

  return v39;
}

+ (id)directoryLocationForRecent:(id)a3 onSource:(id)a4
{
  id v6 = a3;
  if ([a1 recentDirectoryLocation:v6 matchesSource:a4])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F25520]);
    v8 = [v6 displayName];
    [v7 setDisplayName:v8];

    id v9 = [v6 address];
    [v7 setPreferredAddress:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)recentForDirectoryLocation:(id)a3 onSource:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = @"sourceExternalID";
  id v5 = a3;
  id v6 = [a4 externalID];
  v19[1] = @"locationType";
  v20[0] = v6;
  id v7 = [NSNumber numberWithUnsignedInteger:1];
  v20[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  id v9 = (void *)EKWeakLinkClass();
  id v10 = EKWeakLinkStringConstant();
  uint64_t v11 = [v5 preferredAddress];
  double v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = &stru_1F187C430;
  }
  double v14 = [v5 displayName];

  if (v14) {
    double v15 = v14;
  }
  else {
    double v15 = &stru_1F187C430;
  }
  double v16 = [MEMORY[0x1E4F1C9C8] date];
  double v17 = objc_msgSend(v9, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v13, v15, v10, v16, 0, v8, 1, v19[0]);

  return v17;
}

+ (BOOL)recentIsDirectoryLocation:(id)a3
{
  id v3 = [a3 metadata];
  v4 = [v3 objectForKey:@"locationType"];
  id v5 = v4;
  if (v4) {
    BOOL v6 = [v4 unsignedIntegerValue] == 1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)recentDirectoryLocation:(id)a3 matchesSource:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 metadata];
  id v7 = [v6 objectForKey:@"locationType"];
  v8 = [v6 objectForKey:@"sourceExternalID"];
  BOOL v11 = 0;
  if (v7)
  {
    if ([v7 unsignedIntegerValue] == 1)
    {
      if (v8)
      {
        id v9 = [v5 externalID];
        char v10 = [v8 isEqualToString:v9];

        if (v10) {
          BOOL v11 = 1;
        }
      }
    }
  }

  return v11;
}

+ (void)mapKitStyleAttributesForRecent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Unable to unarchive style attributes for recent: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_archivedInstance:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Unable to archive instance for recent: %@", (uint8_t *)&v2, 0xCu);
}

@end