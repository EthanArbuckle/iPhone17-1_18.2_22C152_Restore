@interface ICSCallAnalyticsLogger
- (ICSCallAnalyticsLogger)init;
- (void)bannerDidDisconnect;
- (void)callStatusChanged:(id)a3;
- (void)createAnalyticsViewForCall:(id)a3 initialPresentationMode:(int64_t)a4 bannersEnabled:(BOOL)a5;
- (void)createAnsweredBannerAnalyticsViewWithIsHandsfreeAudioRoute:(BOOL)a3;
- (void)ringerMutedForCallUUID:(id)a3;
- (void)setBannerDismissalReasonForAnalyticsSource:(id)a3 callUUID:(id)a4;
- (void)setPresentationMode:(int64_t)a3 callUUID:(id)a4;
- (void)submitCAMetric:(id)a3 viewId:(id)a4;
@end

@implementation ICSCallAnalyticsLogger

- (ICSCallAnalyticsLogger)init
{
  sub_1001ACBB4();
  return result;
}

- (void)createAnalyticsViewForCall:(id)a3 initialPresentationMode:(int64_t)a4 bannersEnabled:(BOOL)a5
{
  id v6 = a3;
  v7 = self;
  sub_1001ACD04();
}

- (void)createAnsweredBannerAnalyticsViewWithIsHandsfreeAudioRoute:(BOOL)a3
{
  v4 = self;
  sub_1001AD02C(a3);
}

- (void)setBannerDismissalReasonForAnalyticsSource:(id)a3 callUUID:(id)a4
{
  uint64_t v7 = sub_10011EB3C(&qword_100321178);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = type metadata accessor for UUID();
    uint64_t v12 = 1;
  }
  sub_10011EB80((uint64_t)v10, v12, 1, v11);
  id v13 = a3;
  v14 = self;
  sub_1001AD120();

  sub_10013C174((uint64_t)v10, &qword_100321178);
}

- (void)setPresentationMode:(int64_t)a3 callUUID:(id)a4
{
  uint64_t v6 = sub_10011EB3C(&qword_100321178);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = 1;
  }
  sub_10011EB80((uint64_t)v9, v11, 1, v10);
  uint64_t v12 = self;
  sub_1001AD3EC();

  sub_10013C174((uint64_t)v9, &qword_100321178);
}

- (void)ringerMutedForCallUUID:(id)a3
{
  uint64_t v5 = sub_10011EB3C(&qword_100321178);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = type metadata accessor for UUID();
    uint64_t v10 = 1;
  }
  sub_10011EB80((uint64_t)v8, v10, 1, v9);
  uint64_t v11 = self;
  sub_1001AD65C();

  sub_10013C174((uint64_t)v8, &qword_100321178);
}

- (void)bannerDidDisconnect
{
  v2 = self;
  sub_1001AD8D4();
}

- (void)submitCAMetric:(id)a3 viewId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1001AD960();
}

- (void)callStatusChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  sub_1001ADAA4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
}

@end