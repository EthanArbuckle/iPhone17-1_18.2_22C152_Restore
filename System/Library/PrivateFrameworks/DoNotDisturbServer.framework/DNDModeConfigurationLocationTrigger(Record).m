@interface DNDModeConfigurationLocationTrigger(Record)
+ (uint64_t)newWithDictionaryRepresentation:()Record context:;
- (id)dictionaryRepresentationWithContext:()Record;
@end

@implementation DNDModeConfigurationLocationTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "bs_safeNumberForKey:", @"latitude");
  [v4 doubleValue];
  double v6 = v5;

  v7 = objc_msgSend(v3, "bs_safeNumberForKey:", @"longitude");
  [v7 doubleValue];
  double v9 = v8;

  v10 = objc_msgSend(v3, "bs_safeNumberForKey:", @"radius");
  [v10 doubleValue];
  double v12 = v11;

  v13 = objc_msgSend(v3, "bs_safeStringForKey:", @"identifier");
  v14 = objc_msgSend(v3, "bs_safeNumberForKey:", @"referenceFrame");
  uint64_t v15 = [v14 intValue];

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v13, v6, v9, v12);
  [v16 setGeoReferenceFrame:v15];
  v17 = objc_msgSend(v3, "bs_safeStringForKey:", @"detail");
  v18 = objc_msgSend(v3, "bs_safeNumberForKey:", @"enabledSetting");

  uint64_t v19 = [v18 unsignedIntegerValue];
  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F5F678]) initWithRegion:v16 detail:v17 enabledSetting:v19];

  return v20;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  v24[7] = *MEMORY[0x1E4F143B8];
  v24[0] = @"DNDModeConfigurationLocationTrigger";
  v23[0] = @"class";
  v23[1] = @"latitude";
  v2 = NSNumber;
  v22 = [a1 region];
  [v22 center];
  v21 = objc_msgSend(v2, "numberWithDouble:");
  v24[1] = v21;
  v23[2] = @"longitude";
  id v3 = NSNumber;
  uint64_t v20 = [a1 region];
  [v20 center];
  uint64_t v19 = [v3 numberWithDouble:v4];
  v24[2] = v19;
  v23[3] = @"radius";
  double v5 = NSNumber;
  double v6 = [a1 region];
  [v6 radius];
  v7 = objc_msgSend(v5, "numberWithDouble:");
  v24[3] = v7;
  v23[4] = @"referenceFrame";
  double v8 = NSNumber;
  double v9 = [a1 region];
  v10 = objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "geoReferenceFrame"));
  v24[4] = v10;
  v23[5] = @"identifier";
  double v11 = [a1 region];
  double v12 = [v11 identifier];
  v24[5] = v12;
  v23[6] = @"enabledSetting";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v24[6] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
  uint64_t v15 = (void *)[v14 mutableCopy];

  v16 = [a1 detail];

  if (v16)
  {
    v17 = [a1 detail];
    [v15 setObject:v17 forKeyedSubscript:@"detail"];
  }
  return v15;
}

@end