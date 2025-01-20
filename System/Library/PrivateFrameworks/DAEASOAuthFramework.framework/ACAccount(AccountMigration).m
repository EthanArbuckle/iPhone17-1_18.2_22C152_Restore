@interface ACAccount(AccountMigration)
- (__CFString)migrationStatusString;
- (uint64_t)migrationStatus;
- (void)setMigrationStatus:()AccountMigration;
@end

@implementation ACAccount(AccountMigration)

- (uint64_t)migrationStatus
{
  uint64_t v2 = *MEMORY[0x263F3B928];
  v3 = [a1 objectForKeyedSubscript:*MEMORY[0x263F3B928]];

  if (!v3) {
    return 5;
  }
  v4 = [a1 objectForKeyedSubscript:v2];
  uint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (__CFString)migrationStatusString
{
  uint64_t v1 = [a1 migrationStatus];
  if ((unint64_t)(v1 - 1) > 4) {
    return @"Attempting";
  }
  else {
    return off_26490A8B8[v1 - 1];
  }
}

- (void)setMigrationStatus:()AccountMigration
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:*MEMORY[0x263F3B928]];
}

@end