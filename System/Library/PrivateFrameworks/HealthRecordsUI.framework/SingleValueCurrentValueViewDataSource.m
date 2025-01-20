@interface SingleValueCurrentValueViewDataSource
- (_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource)init;
- (_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5;
- (id)titleFor:(id)a3;
- (void)updateDataSourceWithGraphView:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5;
@end

@implementation SingleValueCurrentValueViewDataSource

- (id)titleFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1C24BDB88();

  return v6;
}

- (void)updateDataSourceWithGraphView:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1C24BCD94(v8, (uint64_t)v9, a5);
}

- (_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5
{
  id v8 = (char *)self
     + OBJC_IVAR____TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource_lastCachedNumberOfChartPoints;
  *(void *)id v8 = 0;
  v8[8] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SingleValueCurrentValueViewDataSource();
  return [(HKCurrentValueViewDataSource *)&v10 initWithDateCache:a3 healthStore:a4 selectedRangeFormatter:a5];
}

- (_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource)init
{
  v2 = (char *)self
     + OBJC_IVAR____TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource_lastCachedNumberOfChartPoints;
  *(void *)v2 = 0;
  v2[8] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SingleValueCurrentValueViewDataSource();
  return [(SingleValueCurrentValueViewDataSource *)&v4 init];
}

@end