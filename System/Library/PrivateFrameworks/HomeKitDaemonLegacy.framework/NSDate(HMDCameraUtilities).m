@interface NSDate(HMDCameraUtilities)
+ (id)hmd_dateFromSnapshotFileName:()HMDCameraUtilities;
+ (id)hmd_snapshotFileNameDateFormatter;
- (id)hmd_snapshotFileName;
@end

@implementation NSDate(HMDCameraUtilities)

- (id)hmd_snapshotFileName
{
  v2 = objc_msgSend((id)objc_opt_class(), "hmd_snapshotFileNameDateFormatter");
  v3 = [v2 stringFromDate:a1];

  return v3;
}

+ (id)hmd_dateFromSnapshotFileName:()HMDCameraUtilities
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hmd_snapshotFileNameDateFormatter");
  v6 = [v5 dateFromString:v4];

  return v6;
}

+ (id)hmd_snapshotFileNameDateFormatter
{
  if (hmd_snapshotFileNameDateFormatter_onceToken != -1) {
    dispatch_once(&hmd_snapshotFileNameDateFormatter_onceToken, &__block_literal_global_32247);
  }
  v0 = (void *)hmd_snapshotFileNameDateFormatter_dateFormatter;
  return v0;
}

@end