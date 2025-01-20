@interface NTKParmesanAnalyticsReporter
+ (NTKParmesanAnalyticsReporter)shared;
- (NTKParmesanAnalyticsReporter)init;
- (void)sendAddedNewParmesanFaceEvent:(id)a3;
- (void)sendParmesanFaceSnapshotEvent:(id)a3;
@end

@implementation NTKParmesanAnalyticsReporter

+ (NTKParmesanAnalyticsReporter)shared
{
  if (qword_2691D6328 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2691E01C8;

  return (NTKParmesanAnalyticsReporter *)v2;
}

- (NTKParmesanAnalyticsReporter)init
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAnalyticsReporter_coreAnalyticsNotifyToken) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParmesanAnalyticsReporter();
  return [(NTKParmesanAnalyticsReporter *)&v3 init];
}

- (void)sendParmesanFaceSnapshotEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_246BCCF1C(v4);
}

- (void)sendAddedNewParmesanFaceEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_246BCD268(v4);
}

@end