@interface FetchLogArchivesReportGenerator
- (FetchLogArchivesReportGenerator)initWithQueue:(id)a3;
- (void)setBaseDuration:(unint64_t)a3 maximumSize:(unint64_t)a4;
- (void)setDefaults;
- (void)setHighVolumeLoggersDuration:(unint64_t)a3 maximumSize:(unint64_t)a4;
- (void)setTTLDuration:(unint64_t)a3 maximumSize:(unint64_t)a4;
@end

@implementation FetchLogArchivesReportGenerator

- (FetchLogArchivesReportGenerator)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FetchLogArchivesReportGenerator;
  v3 = [(NetworkDiagnosticsReportGenerator *)&v7 initWithQueue:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(NetworkDiagnosticsReportGenerator *)v3 createDefaultTaskDictionaryWithTaskName:kNetDiagTaskFetchLogArchive[0]];
    [(NetworkDiagnosticsReportGenerator *)v4 setOptions:v5];
    [(FetchLogArchivesReportGenerator *)v4 setDefaults];
  }
  return v4;
}

- (void)setDefaults
{
  [(FetchLogArchivesReportGenerator *)self setBaseDuration:900 maximumSize:26214400];
  [(FetchLogArchivesReportGenerator *)self setTTLDuration:900 maximumSize:26214400];

  [(FetchLogArchivesReportGenerator *)self setHighVolumeLoggersDuration:900 maximumSize:26214400];
}

- (void)setBaseDuration:(unint64_t)a3 maximumSize:(unint64_t)a4
{
  v6 = [NSNumber numberWithUnsignedInteger:a4];
  objc_super v7 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v7 setObject:v6 forKeyedSubscript:@"taskArchiveBaseSize"];

  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v8 setObject:v9 forKeyedSubscript:@"taskArchiveBaseDuration"];
}

- (void)setTTLDuration:(unint64_t)a3 maximumSize:(unint64_t)a4
{
  v6 = [NSNumber numberWithUnsignedInteger:a4];
  objc_super v7 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v7 setObject:v6 forKeyedSubscript:@"taskArchiveTTLSize"];

  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v8 setObject:v9 forKeyedSubscript:@"taskArchiveTTLDuration"];
}

- (void)setHighVolumeLoggersDuration:(unint64_t)a3 maximumSize:(unint64_t)a4
{
  v6 = [NSNumber numberWithUnsignedInteger:a4];
  objc_super v7 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v7 setObject:v6 forKeyedSubscript:@"taskArchiveHVSize"];

  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v8 setObject:v9 forKeyedSubscript:@"taskArchiveHVDuration"];
}

@end