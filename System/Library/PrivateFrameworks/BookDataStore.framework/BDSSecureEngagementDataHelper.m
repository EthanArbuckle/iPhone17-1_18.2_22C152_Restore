@interface BDSSecureEngagementDataHelper
+ (BOOL)isEngagementTimeSliceDataEmpty:(id)a3;
+ (id)mergedTimeSliceDataLocal:(id)a3 remote:(id)a4;
- (BDSSecureEngagementDataHelper)init;
@end

@implementation BDSSecureEngagementDataHelper

+ (id)mergedTimeSliceDataLocal:(id)a3 remote:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_2361FD678();
  unint64_t v9 = v8;

  uint64_t v10 = sub_2361FD678();
  unint64_t v12 = v11;

  swift_getObjCClassMetadata();
  uint64_t v13 = static SecureEngagementDataHelper.mergedTimeSliceData(local:remote:)(v7, v9, v10, v12);
  unint64_t v15 = v14;
  sub_23612D578(v10, v12);
  sub_23612D578(v7, v9);
  if (v15 >> 60 == 15)
  {
    v16 = 0;
  }
  else
  {
    v16 = (void *)sub_2361FD668();
    sub_2361343FC(v13, v15);
  }
  return v16;
}

+ (BOOL)isEngagementTimeSliceDataEmpty:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_2361FD678();
  unint64_t v6 = v5;

  LOBYTE(v3) = _s13BookDataStore016SecureEngagementB6HelperC7isEmpty9timeSliceSb10Foundation0B0V_tFZ_0(v4, v6);
  sub_23612D578(v4, v6);
  return v3 & 1;
}

- (BDSSecureEngagementDataHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecureEngagementDataHelper();
  return [(BDSSecureEngagementDataHelper *)&v3 init];
}

@end