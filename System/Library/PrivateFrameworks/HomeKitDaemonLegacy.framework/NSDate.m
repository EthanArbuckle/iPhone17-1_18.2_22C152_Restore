@interface NSDate
@end

@implementation NSDate

uint64_t __63__NSDate_HMDCameraUtilities__hmd_snapshotFileNameDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)hmd_snapshotFileNameDateFormatter_dateFormatter;
  hmd_snapshotFileNameDateFormatter_dateFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)hmd_snapshotFileNameDateFormatter_dateFormatter setLocale:v2];

  v3 = (void *)hmd_snapshotFileNameDateFormatter_dateFormatter;
  return [v3 setDateFormat:@"yyyy_MM_dd_HH_mm_ss_SSS_ZZZ"];
}

@end