@interface UARPPowerLogManager
- (BOOL)accessoryIDSupportsPowerLogging:(id)a3;
- (UARPPowerLogManager)init;
- (id)createPowerLogAccessoryForAccessoryID:(id)a3;
- (id)pendingReachabilityEventForAccessoryID:(id)a3;
- (id)powerLogAccessoryForAccessoryID:(id)a3;
- (id)powerLogAccessoryForUUID:(id)a3;
- (unsigned)stagingWindowPeriodSeconds;
- (void)addAccessoryID:(id)a3;
- (void)postPendingReachabilityEvent:(id)a3;
- (void)removeAccessoryID:(id)a3;
- (void)setAccessoryIDReachable:(id)a3;
- (void)setAccessoryIDUnreachable:(id)a3;
- (void)setActiveFirmwareVersionForAccessoryID:(id)a3 activeFirmwareVersion:(id)a4;
- (void)setAssetOfferedForAccessoryID:(id)a3 offeredFirmwareVersion:(id)a4 activeFirmwareVersion:(id)a5;
- (void)setStagedFirmwareVersionForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4;
- (void)setStagingCompleteForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4 activeFirmareVersion:(id)a5 status:(unint64_t)a6;
- (void)setStagingWindowPeriodSeconds:(unsigned int)a3;
- (void)updateStagingProgressForAccessoryID:(id)a3 requestedOffset:(unsigned int)a4 requestedLength:(unsigned int)a5;
@end

@implementation UARPPowerLogManager

- (UARPPowerLogManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)UARPPowerLogManager;
  v2 = [(UARPPowerLogManager *)&v10 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "powerLogManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    accessories = v2->_accessories;
    v2->_accessories = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    pendingReachableEvents = v2->_pendingReachableEvents;
    v2->_pendingReachableEvents = (NSMutableSet *)v7;

    v2->_stagingWindowPeriodSeconds = 900;
  }
  return v2;
}

- (BOOL)accessoryIDSupportsPowerLogging:(id)a3
{
  os_log_t v3 = [a3 modelNumber];
  if (v3)
  {
    v4 = +[UARPSupportedAccessory findByAppleModelNumber:v3];
    char v5 = [v4 supportsPowerLogging];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)createPowerLogAccessoryForAccessoryID:(id)a3
{
  id v4 = a3;
  if ([(UARPPowerLogManager *)self accessoryIDSupportsPowerLogging:v4])
  {
    char v5 = [UARPPowerLogAccessory alloc];
    v6 = [v4 modelNumber];
    uint64_t v7 = [v4 uuid];
    v8 = [(UARPPowerLogAccessory *)v5 initWithModelNumber:v6 uuid:v7 stagingWindowPeriodSeconds:self->_stagingWindowPeriodSeconds];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addAccessoryID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(UARPPowerLogManager *)self createPowerLogAccessoryForAccessoryID:v4];
  if (v5)
  {
    if ([(NSMutableSet *)self->_accessories containsObject:v5])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPPowerLogManager addAccessoryID:]();
      }
    }
    else
    {
      [(NSMutableSet *)self->_accessories addObject:v5];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Added: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (id)powerLogAccessoryForUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_accessories;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v9, "uuid", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)powerLogAccessoryForAccessoryID:(id)a3
{
  id v4 = [a3 uuid];
  char v5 = [(UARPPowerLogManager *)self powerLogAccessoryForUUID:v4];

  return v5;
}

- (id)pendingReachabilityEventForAccessoryID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v5 = self->_pendingReachableEvents;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v9, "uuid", (void)v14);
        char v11 = [v4 uuid];
        char v12 = [v10 isEqual:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)postPendingReachabilityEvent:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_pendingReachableEvents removeObject:v4];
  char v5 = [v4 uuid];
  id v6 = [(UARPPowerLogManager *)self powerLogAccessoryForUUID:v5];

  if (v6)
  {
    uint64_t v7 = [v4 activeFirmwareVersion];
    id v8 = [v4 stagedFirmwareVersion];
    [v6 setReachableWithActiveFirmwareVersion:v7 stagedFirmwareVersion:v8];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPPowerLogManager postPendingReachabilityEvent:]();
  }
}

- (void)removeAccessoryID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(UARPPowerLogManager *)self powerLogAccessoryForAccessoryID:v4];
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Removed: %@", (uint8_t *)&v7, 0xCu);
    }
    [(NSMutableSet *)self->_accessories removeObject:v5];
  }
  else if ([(UARPPowerLogManager *)self accessoryIDSupportsPowerLogging:v4] {
         && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  }
  {
    -[UARPPowerLogManager removeAccessoryID:]();
  }
}

- (void)setAccessoryIDReachable:(id)a3
{
  id v4 = a3;
  char v5 = [(UARPPowerLogManager *)self powerLogAccessoryForAccessoryID:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 reachable])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPPowerLogManager setAccessoryIDReachable:]();
      }
    }
    else
    {
      int v7 = [UARPPowerLogPendingReachabilityEvent alloc];
      id v8 = [v4 modelNumber];
      uint64_t v9 = [v4 uuid];
      id v10 = [(UARPPowerLogPendingReachabilityEvent *)v7 initModelNumber:v8 uuid:v9];

      [(NSMutableSet *)self->_pendingReachableEvents addObject:v10];
    }
  }
  else if ([(UARPPowerLogManager *)self accessoryIDSupportsPowerLogging:v4] {
         && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  }
  {
    -[UARPPowerLogManager setAccessoryIDReachable:]();
  }
}

- (void)setStagedFirmwareVersionForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4
{
  id v8 = a4;
  id v6 = [(UARPPowerLogManager *)self pendingReachabilityEventForAccessoryID:a3];
  int v7 = v6;
  if (v6)
  {
    [v6 setStagedFirmwareVersion:v8];
    if ([v7 allDataPresent]) {
      [(UARPPowerLogManager *)self postPendingReachabilityEvent:v7];
    }
  }
}

- (void)setActiveFirmwareVersionForAccessoryID:(id)a3 activeFirmwareVersion:(id)a4
{
  id v8 = a4;
  id v6 = [(UARPPowerLogManager *)self pendingReachabilityEventForAccessoryID:a3];
  int v7 = v6;
  if (v6)
  {
    [v6 setActiveFirmwareVersion:v8];
    if ([v7 allDataPresent]) {
      [(UARPPowerLogManager *)self postPendingReachabilityEvent:v7];
    }
  }
}

- (void)setAccessoryIDUnreachable:(id)a3
{
  id v4 = a3;
  char v5 = [(UARPPowerLogManager *)self powerLogAccessoryForAccessoryID:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 reachable])
    {
      [v6 setUnreachable];
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager setAccessoryIDUnreachable:]();
    }
  }
  else if ([(UARPPowerLogManager *)self accessoryIDSupportsPowerLogging:v4] {
         && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  }
  {
    -[UARPPowerLogManager setAccessoryIDUnreachable:]();
  }
}

- (void)setAssetOfferedForAccessoryID:(id)a3 offeredFirmwareVersion:(id)a4 activeFirmwareVersion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPPowerLogManager *)self powerLogAccessoryForAccessoryID:a3];
  char v11 = v10;
  if (v10)
  {
    if ([v10 reachable])
    {
      if ([v11 stagingInProgress])
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:]();
        }
      }
      else if (v8)
      {
        if (v9)
        {
          [v11 setAssetOfferedWithVersion:v8 activeFirmwareVersion:v9];
        }
        else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        {
          -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.4();
    }
  }
}

- (void)setStagingCompleteForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4 activeFirmareVersion:(id)a5 status:(unint64_t)a6
{
  id v10 = a3;
  char v11 = (__CFString *)a4;
  char v12 = (__CFString *)a5;
  long long v13 = [(UARPPowerLogManager *)self powerLogAccessoryForAccessoryID:v10];
  long long v14 = v13;
  if (v13)
  {
    if ([v13 stagingInProgress])
    {
      if (v11)
      {
        if (v12)
        {
LABEL_14:
          [v14 setStagingCompleteForStagedFirmareVersion:v11 activeFirmareVersion:v12 status:a6];
          goto LABEL_15;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:]();
        }
        char v11 = &stru_26CEE54E0;
        if (v12) {
          goto LABEL_14;
        }
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:]();
      }
      char v12 = &stru_26CEE54E0;
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:]();
    }
  }
LABEL_15:
}

- (void)updateStagingProgressForAccessoryID:(id)a3 requestedOffset:(unsigned int)a4 requestedLength:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = [(UARPPowerLogManager *)self powerLogAccessoryForAccessoryID:a3];
  id v9 = v8;
  if (v8)
  {
    if ([v8 stagingInProgress])
    {
      [v9 updateStagingProgressWithRequestedOffset:v6 requestedLength:v5];
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager updateStagingProgressForAccessoryID:requestedOffset:requestedLength:]();
    }
  }
}

- (unsigned)stagingWindowPeriodSeconds
{
  return self->_stagingWindowPeriodSeconds;
}

- (void)setStagingWindowPeriodSeconds:(unsigned int)a3
{
  self->_stagingWindowPeriodSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pendingReachableEvents, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

- (void)addAccessoryID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to add %@ twice", v2, v3, v4, v5, v6);
}

- (void)postPendingReachabilityEvent:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attemping to post reachability event, but backing accessory is missing: %@", v2, v3, v4, v5, v6);
}

- (void)removeAccessoryID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to remove accessory that is not present: %@", v2, v3, v4, v5, v6);
}

- (void)setAccessoryIDReachable:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to mark accessory reachable that is not present: %@", v2, v3, v4, v5, v6);
}

- (void)setAccessoryIDReachable:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attemping to mark accessory reachable that is already reachable: %@", v2, v3, v4, v5, v6);
}

- (void)setAccessoryIDUnreachable:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to make accessory unreachable that is not present: %@", v2, v3, v4, v5, v6);
}

- (void)setAccessoryIDUnreachable:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to mark accessory unreachable that is already unreachable: %@", v2, v3, v4, v5, v6);
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to offer asset to accessory already staging: %@", v2, v3, v4, v5, v6);
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to stage nil firmware version: %@", v2, v3, v4, v5, v6);
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to stage with nil active firmware version: %@", v2, v3, v4, v5, v6);
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to offer asset to unreachable accessory: %@", v2, v3, v4, v5, v6);
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to complete staging with nil active firmware version: %@", v2, v3, v4, v5, v6);
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to complete staging for a nil firmware version: %@", v2, v3, v4, v5, v6);
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to complete staging for accessory where staging is not in progress: %@", v2, v3, v4, v5, v6);
}

- (void)updateStagingProgressForAccessoryID:requestedOffset:requestedLength:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Attempting to update staging progress for an accessory where staging is not in progress: %@", v2, v3, v4, v5, v6);
}

@end