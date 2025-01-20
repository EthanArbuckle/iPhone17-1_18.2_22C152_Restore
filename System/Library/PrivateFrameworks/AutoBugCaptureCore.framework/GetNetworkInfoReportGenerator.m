@interface GetNetworkInfoReportGenerator
- (GetNetworkInfoReportGenerator)initWithQueue:(id)a3;
- (void)setDefaults;
- (void)setGNINDFInfoOption:(BOOL)a3;
- (void)setGNISensitiveOption:(BOOL)a3;
- (void)setGNISysConfigOption:(BOOL)a3;
@end

@implementation GetNetworkInfoReportGenerator

- (GetNetworkInfoReportGenerator)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GetNetworkInfoReportGenerator;
  v3 = [(NetworkDiagnosticsReportGenerator *)&v7 initWithQueue:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(NetworkDiagnosticsReportGenerator *)v3 createDefaultTaskDictionaryWithTaskName:kNetDiagTaskGetNetworkInfo[0]];
    [(NetworkDiagnosticsReportGenerator *)v4 setOptions:v5];
    [(GetNetworkInfoReportGenerator *)v4 setDefaults];
  }
  return v4;
}

- (void)setDefaults
{
  v3 = +[ABCAdministrator sharedInstance];
  v4 = [v3 configurationManager];
  -[GetNetworkInfoReportGenerator setGNISensitiveOption:](self, "setGNISensitiveOption:", [v4 autoBugCaptureSensitivePayloads]);

  [(GetNetworkInfoReportGenerator *)self setGNISysConfigOption:1];

  [(GetNetworkInfoReportGenerator *)self setGNINDFInfoOption:1];
}

- (void)setGNISensitiveOption:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  v4 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v4 setObject:v5 forKeyedSubscript:@"taskGNISensitive"];
}

- (void)setGNISysConfigOption:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  v4 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v4 setObject:v5 forKeyedSubscript:@"taskGNISysConfig"];
}

- (void)setGNINDFInfoOption:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  v4 = [(NetworkDiagnosticsReportGenerator *)self options];
  [v4 setObject:v5 forKeyedSubscript:@"taskGNINDFInfo"];
}

@end