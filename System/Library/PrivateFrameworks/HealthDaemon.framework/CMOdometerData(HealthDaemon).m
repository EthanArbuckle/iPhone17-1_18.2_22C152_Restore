@interface CMOdometerData(HealthDaemon)
- (uint64_t)hd_compare:()HealthDaemon;
- (uint64_t)hd_sourceID;
- (uint64_t)hd_unitForType:()HealthDaemon;
@end

@implementation CMOdometerData(HealthDaemon)

- (uint64_t)hd_compare:()HealthDaemon
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hd_datestamp");
  v6 = objc_msgSend(v4, "hd_datestamp");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (uint64_t)hd_sourceID
{
  return 0;
}

- (uint64_t)hd_unitForType:()HealthDaemon
{
  return [MEMORY[0x1E4F2B618] meterUnit];
}

@end