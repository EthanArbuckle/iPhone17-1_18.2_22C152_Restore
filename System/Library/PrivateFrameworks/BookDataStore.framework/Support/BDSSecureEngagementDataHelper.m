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
  uint64_t v7 = sub_1001EAFE0();
  unint64_t v9 = v8;

  uint64_t v10 = sub_1001EAFE0();
  unint64_t v12 = v11;

  swift_getObjCClassMetadata();
  uint64_t v13 = static SecureEngagementDataHelper.mergedTimeSliceData(local:remote:)(v7, v9, v10, v12);
  unint64_t v15 = v14;
  sub_100081714(v10, v12);
  sub_100081714(v7, v9);
  if (v15 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_1001EAFD0().super.isa;
    sub_100081700(v13, v15);
  }
  return isa;
}

+ (BOOL)isEngagementTimeSliceDataEmpty:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1001EAFE0();
  unint64_t v6 = v5;

  LOBYTE(v3) = _s14bookdatastored26SecureEngagementDataHelperC7isEmpty9timeSliceSb10Foundation0D0V_tFZ_0(v4, v6);
  sub_100081714(v4, v6);
  return v3 & 1;
}

- (BDSSecureEngagementDataHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecureEngagementDataHelper();
  return [(BDSSecureEngagementDataHelper *)&v3 init];
}

@end