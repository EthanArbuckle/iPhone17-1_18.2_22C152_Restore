@interface CalDatabaseVacuumIfNeeded
@end

@implementation CalDatabaseVacuumIfNeeded

CFAbsoluteTime ___CalDatabaseVacuumIfNeeded_block_invoke()
{
  CFAbsoluteTime result = CFAbsoluteTimeGetCurrent() + -3.0;
  _CalDatabaseVacuumIfNeeded___LastVacuumTimestamp = *(void *)&result;
  return result;
}

@end