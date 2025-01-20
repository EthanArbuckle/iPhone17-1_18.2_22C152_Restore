@interface NSUserDefaults
- (BOOL)forceKillPCViewService;
- (BOOL)forceKillProximitycontrold;
- (BOOL)transferToHomePod;
- (double)executeDistanceDefault;
- (double)executeDistanceLarge;
- (int64_t)updateRateBluetoothWatch;
- (int64_t)updateRateExecuteWatch;
- (void)setExecuteDistanceDefault:(double)a3;
- (void)setExecuteDistanceLarge:(double)a3;
- (void)setForceKillPCViewService:(BOOL)a3;
- (void)setForceKillProximitycontrold:(BOOL)a3;
- (void)setTransferToHomePod:(BOOL)a3;
- (void)setUpdateRateBluetoothWatch:(int64_t)a3;
- (void)setUpdateRateExecuteWatch:(int64_t)a3;
@end

@implementation NSUserDefaults

- (BOOL)forceKillProximitycontrold
{
  return sub_10003AA58(self);
}

- (void)setForceKillProximitycontrold:(BOOL)a3
{
}

- (BOOL)forceKillPCViewService
{
  return sub_10003AA58(self);
}

- (void)setForceKillPCViewService:(BOOL)a3
{
}

- (BOOL)transferToHomePod
{
  return sub_10003AA58(self);
}

- (void)setTransferToHomePod:(BOOL)a3
{
}

- (double)executeDistanceDefault
{
  return sub_10003ABB0(self);
}

- (void)setExecuteDistanceDefault:(double)a3
{
}

- (double)executeDistanceLarge
{
  return sub_10003ABB0(self);
}

- (void)setExecuteDistanceLarge:(double)a3
{
}

- (int64_t)updateRateBluetoothWatch
{
  return (int64_t)sub_10003AD18(self);
}

- (void)setUpdateRateBluetoothWatch:(int64_t)a3
{
}

- (int64_t)updateRateExecuteWatch
{
  return (int64_t)sub_10003AD18(self);
}

- (void)setUpdateRateExecuteWatch:(int64_t)a3
{
}

@end