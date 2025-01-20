uint64_t AMFIInitiateDataMigration()
{
  return _AMFIInitiateDataMigration();
}

uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}
return @"AMFIMigrator";
}

- (BOOL)performMigration
{
  _DMLogFunc();
  BOOL v2 = AMFIInitiateDataMigration() == 0;
  _DMLogFunc();
  return v2;
}

@end