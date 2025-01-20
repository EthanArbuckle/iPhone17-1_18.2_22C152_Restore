@interface HKProductVersions
+ (id)activePairedDeviceSystemBuildVersion;
+ (id)productBuildVersionForDeviceType:(int64_t)a3;
@end

@implementation HKProductVersions

+ (id)activePairedDeviceSystemBuildVersion
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceSystemBuildVersion];
}

+ (id)productBuildVersionForDeviceType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = +[_HKBehavior sharedBehavior];
      int v5 = [v4 isAppleWatch];

      if (v5)
      {
LABEL_8:
        v6 = [a1 activePairedDeviceSystemBuildVersion];
        goto LABEL_10;
      }
LABEL_6:
      v6 = +[_HKBehavior currentOSBuild];
      goto LABEL_10;
    case 1:
      v7 = +[_HKBehavior sharedBehavior];
      int v8 = [v7 isAppleWatch];

      if (!v8) {
        goto LABEL_8;
      }
      goto LABEL_6;
    case 2:
      goto LABEL_6;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

@end