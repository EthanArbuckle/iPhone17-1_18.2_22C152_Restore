@interface AudioAnalyticsTestReporter
- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithNewReporterID;
- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithReporterID:(int64_t)a3;
- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4;
- (unsigned)serviceType;
@end

@implementation AudioAnalyticsTestReporter

- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithNewReporterID
{
  v2 = [(AudioAnalyticsTestReporter *)self initWithNewReporterID];
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  [(AudioAnalyticsReporter *)&v4 setServiceType:11];
  return v2;
}

- (unsigned)serviceType
{
  return 11;
}

- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithReporterID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return [(AudioAnalyticsReporter *)&v5 initWithReporterID:a3];
}

- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return [(AudioAnalyticsReporter *)&v7 initWithSessionID:v5 serviceType:v4];
}

@end