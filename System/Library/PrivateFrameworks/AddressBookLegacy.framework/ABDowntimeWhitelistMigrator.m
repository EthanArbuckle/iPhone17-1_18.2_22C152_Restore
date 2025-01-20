@interface ABDowntimeWhitelistMigrator
+ (BOOL)moveDowntimeWhitelistFromUnknownProperties:(CPSqliteConnection *)a3;
+ (id)externalRepresentationFromUnknownProperties:(id)a3;
+ (id)unknownPropertiesFromExternalRepresentation:(id)a3;
@end

@implementation ABDowntimeWhitelistMigrator

+ (BOOL)moveDowntimeWhitelistFromUnknownProperties:(CPSqliteConnection *)a3
{
  uint64_t v3 = CPSqliteConnectionStatementForSQL();
  if (v3)
  {
    CPSqliteStatementSendResults();
    CPSqliteStatementReset();
    CPSqliteDatabaseReleaseSqliteStatement();
  }
  return v3 != 0;
}

+ (id)unknownPropertiesFromExternalRepresentation:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v13 = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v13];
    id v5 = v13;
    if (v4)
    {
      v14[0] = objc_opt_class();
      v14[1] = objc_opt_class();
      v14[2] = objc_opt_class();
      v14[3] = objc_opt_class();
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
      v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      v8 = [v4 decodeObjectOfClasses:v7 forKey:*MEMORY[0x1E4F284E8]];

      [v4 finishDecoding];
    }
    else
    {
      ABDiagnosticsEnabled();
      _ABLog2(4, (uint64_t)"+[ABDowntimeWhitelistMigrator unknownPropertiesFromExternalRepresentation:]", 69, 0, @"Error trying to decode externalRepresentation: %@", v9, v10, v11, (uint64_t)v5);
      v8 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

+ (id)externalRepresentationFromUnknownProperties:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] data];
  if ([v3 count])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v5 setOutputFormat:200];
    [v5 encodeObject:v3 forKey:*MEMORY[0x1E4F284E8]];
    [v5 finishEncoding];
    uint64_t v6 = [v5 encodedData];

    v4 = (void *)v6;
  }

  return v4;
}

@end