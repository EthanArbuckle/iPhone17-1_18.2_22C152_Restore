@interface _CDNetworkContext
+ (BOOL)cellInterfaceUp:(id)a3;
+ (BOOL)inexpensiveNetworkingAvailable:(id)a3;
+ (BOOL)networkingAvailable:(id)a3;
+ (id)connectionQualityKey;
+ (id)downloadPowerCostKey;
+ (id)interfaceClassKey;
+ (id)interfaceUpKey;
+ (id)keyPathForCellConnectionStatus;
+ (id)keyPathForWiFiConnectionStatus;
+ (id)keyPathForWiredConnectionStatus;
+ (id)loiKey;
+ (id)predictionKey;
+ (id)uploadPowerCostKey;
+ (int64_t)cellDownloadCost:(id)a3;
+ (int64_t)cellInterfaceClass:(id)a3;
+ (int64_t)cellQuality:(id)a3;
+ (int64_t)cellUploadCost:(id)a3;
+ (int64_t)interfaceClassForPath:(id)a3 inContext:(id)a4;
+ (int64_t)qualityForPath:(id)a3 inContext:(id)a4;
+ (int64_t)wifiInterfaceClass:(id)a3;
+ (int64_t)wifiQuality:(id)a3;
+ (int64_t)wiredInterfaceClass:(id)a3;
+ (int64_t)wiredQuality:(id)a3;
@end

@implementation _CDNetworkContext

+ (int64_t)cellInterfaceClass:(id)a3
{
  id v3 = a3;
  v4 = +[_CDNetworkContext keyPathForCellConnectionStatus];
  int64_t v5 = +[_CDNetworkContext interfaceClassForPath:v4 inContext:v3];

  return v5;
}

+ (int64_t)interfaceClassForPath:(id)a3 inContext:(id)a4
{
  v4 = [a4 objectForKeyedSubscript:a3];
  int64_t v5 = +[_CDNetworkContext interfaceClassKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

+ (id)interfaceClassKey
{
  return @"interfaceClass";
}

+ (int64_t)cellQuality:(id)a3
{
  id v3 = a3;
  v4 = +[_CDNetworkContext keyPathForCellConnectionStatus];
  int64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = +[_CDNetworkContext connectionQualityKey];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

+ (id)keyPathForCellConnectionStatus
{
  if (keyPathForCellConnectionStatus_onceToken != -1) {
    dispatch_once(&keyPathForCellConnectionStatus_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)keyPathForCellConnectionStatus_cellConnectionStatus;
  return v2;
}

+ (int64_t)wifiQuality:(id)a3
{
  id v3 = a3;
  v4 = +[_CDNetworkContext keyPathForWiFiConnectionStatus];
  int64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = +[_CDNetworkContext connectionQualityKey];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

+ (id)connectionQualityKey
{
  return @"quality";
}

+ (id)keyPathForWiFiConnectionStatus
{
  if (keyPathForWiFiConnectionStatus_onceToken != -1) {
    dispatch_once(&keyPathForWiFiConnectionStatus_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)keyPathForWiFiConnectionStatus_wifiConnectionStatus;
  return v2;
}

+ (id)keyPathForWiredConnectionStatus
{
  if (keyPathForWiredConnectionStatus_onceToken != -1) {
    dispatch_once(&keyPathForWiredConnectionStatus_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)keyPathForWiredConnectionStatus_wiredConnection;
  return v2;
}

+ (id)interfaceUpKey
{
  return @"hot";
}

+ (id)downloadPowerCostKey
{
  return @"dlPowerCost";
}

+ (id)uploadPowerCostKey
{
  return @"ulPowerCost";
}

+ (id)loiKey
{
  return @"loi";
}

+ (id)predictionKey
{
  return @"prediction";
}

+ (int64_t)qualityForPath:(id)a3 inContext:(id)a4
{
  v4 = [a4 objectForKeyedSubscript:a3];
  int64_t v5 = +[_CDNetworkContext connectionQualityKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 integerValue];

  return v7;
}

+ (int64_t)wiredQuality:(id)a3
{
  id v3 = a3;
  v4 = +[_CDNetworkContext keyPathForWiredConnectionStatus];
  int64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = +[_CDNetworkContext connectionQualityKey];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

+ (int64_t)wiredInterfaceClass:(id)a3
{
  id v3 = a3;
  v4 = +[_CDNetworkContext keyPathForWiredConnectionStatus];
  int64_t v5 = +[_CDNetworkContext interfaceClassForPath:v4 inContext:v3];

  return v5;
}

+ (int64_t)wifiInterfaceClass:(id)a3
{
  id v3 = a3;
  v4 = +[_CDNetworkContext keyPathForWiFiConnectionStatus];
  int64_t v5 = +[_CDNetworkContext interfaceClassForPath:v4 inContext:v3];

  return v5;
}

+ (BOOL)inexpensiveNetworkingAvailable:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_CDNetworkContext wifiQuality:v3] > 0
    || +[_CDNetworkContext wiredQuality:v3] > 0;

  return v4;
}

+ (BOOL)networkingAvailable:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_CDNetworkContext inexpensiveNetworkingAvailable:](_CDNetworkContext, "inexpensiveNetworkingAvailable:", v3)|| +[_CDNetworkContext cellQuality:v3] > 0;

  return v4;
}

+ (BOOL)cellInterfaceUp:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_CDNetworkContext keyPathForCellConnectionStatus];
  int64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = +[_CDNetworkContext interfaceUpKey];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (int64_t)cellDownloadCost:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_CDNetworkContext keyPathForCellConnectionStatus];
  int64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = +[_CDNetworkContext downloadPowerCostKey];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

+ (int64_t)cellUploadCost:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_CDNetworkContext keyPathForCellConnectionStatus];
  int64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = +[_CDNetworkContext uploadPowerCostKey];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

@end