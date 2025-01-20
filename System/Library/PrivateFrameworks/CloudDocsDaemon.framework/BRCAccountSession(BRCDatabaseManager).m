@interface BRCAccountSession(BRCDatabaseManager)
- (void)_startWatcher;
- (void)expensiveReadOnlyDB;
- (void)readOnlyDB;
@end

@implementation BRCAccountSession(BRCDatabaseManager)

- (void)readOnlyDB
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't open interactive DB: %@%@", v1);
}

- (void)expensiveReadOnlyDB
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't open expensive DB: %@%@", v1);
}

- (void)_startWatcher
{
  OUTLINED_FUNCTION_8();
  v0 = brc_append_system_info_to_message();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v1, v2, "[CRIT] %@%@", v3, v4, v5, v6, v7);
}

- (void)_stepBackupDetector:()BRCDatabaseManager newState:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v3 = v2;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315650;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v1;
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] failed stating '%s' %{errno}d%@", (uint8_t *)&v5, 0x1Cu);
}

- (void)saveServerZone:()BRCDatabaseManager toDB:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: saving the container state should always work%@", v2, v3, v4, v5, v6);
}

- (void)saveServerZone:()BRCDatabaseManager toDB:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sct.dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)saveClientZoneToDB:()BRCDatabaseManager .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: saving the zone state should always work%@", v2, v3, v4, v5, v6);
}

- (void)saveClientZoneToDB:()BRCDatabaseManager .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lcz.dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)createServerZone:()BRCDatabaseManager .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: rowID%@", v2, v3, v4, v5, v6);
}

- (void)createServerZone:()BRCDatabaseManager .cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] trying to create server zone that already exists%@", v2, v3, v4, v5, v6);
}

- (void)saveAppLibrary:()BRCDatabaseManager toDB:supportsEnhancedDrivePrivacy:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: saving the app library state should always work%@", v2, v3, v4, v5, v6);
}

- (void)saveAppLibrary:()BRCDatabaseManager toDB:supportsEnhancedDrivePrivacy:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lib.zoneRowID%@", v2, v3, v4, v5, v6);
}

- (void)_createAppLibrary:()BRCDatabaseManager .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lib.dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)newSharedClientZoneFromPQLResultSet:()BRCDatabaseManager error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: plist%@", v2, v3, v4, v5, v6);
}

- (void)newSharedServerZoneFromPQLResultSet:()BRCDatabaseManager error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: plist != nil%@", v2, v3, v4, v5, v6);
}

- (void)newPrivateServerZoneFromPQLResultSet:()BRCDatabaseManager error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: mangledID%@", v2, v3, v4, v5, v6);
}

- (void)createDeviceKeyForNameInServerDB:()BRCDatabaseManager .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] this is the first time we hear of a device named '%@'%@");
}

- (void)createDeviceKeyForNameInServerDB:()BRCDatabaseManager .cold.2()
{
  OUTLINED_FUNCTION_8();
  [v0 UTF8String];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: can't insert device name: '%s'%@", v3, v4, v5, v6, v7);
}

- (void)_setUserIdentity:()BRCDatabaseManager forName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unable to update user identity%@", v2, v3, v4, v5, v6);
}

- (void)_setUserIdentity:()BRCDatabaseManager forName:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: userIdentity%@", v2, v3, v4, v5, v6);
}

- (void)_setUserIdentity:()BRCDatabaseManager forName:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: userFormattedName != nil%@", v2, v3, v4, v5, v6);
}

- (void)createUserKeyForOwnerName:()BRCDatabaseManager .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: userName shouldn't be nil%@", v2, v3, v4, v5, v6);
}

- (void)createUserKeyForOwnerName:()BRCDatabaseManager .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] this is the first time we hear of a user named '%@'%@");
}

- (void)_clearNeedsUpgradeErrorsWithBrVersion:()BRCDatabaseManager .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] clearing needs-upgrade errors%@", v2, v3, v4, v5, v6);
}

+ (void)_registerLastBootIfNeeded:()BRCDatabaseManager table:skipControlFiles:deviceIDChanged:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Failed getting deviceID through device-tracking file%@", v2, v3, v4, v5, v6);
}

+ (void)_checkIntegrity:()BRCDatabaseManager serverTruth:session:skipControlFiles:deviceIDChanged:error:.cold.1(char a1)
{
  uint64_t v1 = "server";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "client";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] Checking integrity of %s DB%@", (void)v4, DWORD2(v4));
}

- (void)_loadClientStateFromDB:()BRCDatabaseManager .cold.1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Client state dictionary is nil. Client state is: %@%@", (void)v3, DWORD2(v3));
}

- (void)_loadClientStateFromDB:()BRCDatabaseManager .cold.2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] loaded client-state %@%@", (void)v3, DWORD2(v3));
}

- (void)_loadClientStateFromDB:()BRCDatabaseManager .cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Loading client state from DB%@", v2, v3, v4, v5, v6);
}

- (void)_finishClientTruthConnectionSetupWithError:()BRCDatabaseManager .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _databaseID%@", v2, v3, v4, v5, v6);
}

+ (void)openAndValidateDatabase:()BRCDatabaseManager serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] database is already on FPFS, skip control files check%@", v2, v3, v4, v5, v6);
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16(&dword_1D353B000, v0, v1, "[CRIT] database is stale, can't be migrated (db at version %d, migration range [%d,%d])%@");
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15(&dword_1D353B000, v0, v1, "[CRIT] database has a major version from the future: %d (want at most %d)%@");
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] can't reopen db after truncate: %@%@");
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed opening connection: %@%@");
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Opening DB %@%@");
}

+ (void)_validateDatabase:()BRCDatabaseManager baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] no database migration required, version is current (db at version %d)%@", v1, 0x12u);
}

+ (void)_validateDatabase:()BRCDatabaseManager baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: db_version == DB_VERSION_CURRENT%@", v2, v3, v4, v5, v6);
}

+ (void)_validateDatabase:()BRCDatabaseManager baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:.cold.3(char a1)
{
  uint64_t v1 = "server";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "client";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] Validating %s DB%@", (void)v4, DWORD2(v4));
}

+ (void)upgradeOfflineDB:()BRCDatabaseManager serverTruth:session:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Not doing a database migration on an offline database where the major version matches%@", v2, v3, v4, v5, v6);
}

@end