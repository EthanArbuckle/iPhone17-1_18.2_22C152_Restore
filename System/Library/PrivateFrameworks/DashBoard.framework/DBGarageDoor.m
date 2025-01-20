@interface DBGarageDoor
+ (id)observerProtocol;
+ (id)serviceType;
+ (void)load;
- (BOOL)_shouldUpdateLastUsedForCharacteristic:(id)a3;
- (BOOL)_tracksLastUsed;
- (BOOL)current;
- (BOOL)hasError;
- (BOOL)obstructionDetected;
- (BOOL)pendingRead;
- (BOOL)pendingWrite;
- (DBHomeKitBoolCharacteristic)obstructionDetectedCharacteristic;
- (DBHomeKitDoorStateCharacteristic)doorStateCharacteristic;
- (DBHomeKitDoorStateCharacteristic)targetDoorStateCharacteristic;
- (id)description;
- (id)managedCharacteristics;
- (int64_t)_doorStateForCharacteristic:(id)a3;
- (int64_t)doorState;
- (int64_t)targetDoorState;
- (void)_characteristicDidUpdate:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setTargetDoorState:(int64_t)a3;
@end

@implementation DBGarageDoor

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___DBGarageDoor;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)current
{
  v3 = [(DBGarageDoor *)self doorStateCharacteristic];
  if ([v3 current])
  {
    v4 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
    if ([v4 current])
    {
      v5 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
      char v6 = [v5 current];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)pendingWrite
{
  objc_super v2 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  char v3 = [v2 pendingWrite];

  return v3;
}

- (BOOL)pendingRead
{
  char v3 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  if ([v3 pendingRead])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(DBGarageDoor *)self doorStateCharacteristic];
    if ([v5 pendingRead])
    {
      char v4 = 1;
    }
    else
    {
      char v6 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
      char v4 = [v6 pendingRead];
    }
  }

  return v4;
}

- (BOOL)hasError
{
  char v3 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  if ([v3 hasError])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(DBGarageDoor *)self doorStateCharacteristic];
    if ([v5 hasError])
    {
      char v4 = 1;
    }
    else
    {
      char v6 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
      char v4 = [v6 hasError];
    }
  }

  return v4;
}

- (DBHomeKitDoorStateCharacteristic)doorStateCharacteristic
{
  return (DBHomeKitDoorStateCharacteristic *)[(DBHomeKitService *)self characteristicForType:*MEMORY[0x263F0C040]];
}

- (DBHomeKitDoorStateCharacteristic)targetDoorStateCharacteristic
{
  return (DBHomeKitDoorStateCharacteristic *)[(DBHomeKitService *)self characteristicForType:*MEMORY[0x263F0C4A8]];
}

- (DBHomeKitBoolCharacteristic)obstructionDetectedCharacteristic
{
  return (DBHomeKitBoolCharacteristic *)[(DBHomeKitService *)self characteristicForType:*MEMORY[0x263F0C2B8]];
}

- (int64_t)_doorStateForCharacteristic:(id)a3
{
  id v4 = a3;
  if ((([v4 current] & 1) != 0 || -[DBHomeKitService reachable](self, "reachable"))
    && (![v4 current]
     || ![v4 hasError]
     || [(DBHomeKitService *)self reachable]))
  {
    if (([v4 current] & 1) == 0
      && ([v4 pendingWrite] & 1) == 0
      && ![v4 pendingRead])
    {
      goto LABEL_16;
    }
    v5 = [v4 value];
    if (v5)
    {

      goto LABEL_14;
    }
    if (([v4 hasError] & 1) == 0)
    {
LABEL_14:
      v7 = [v4 value];

      if (v7)
      {
        int64_t v6 = [v4 doorStateValue];
        goto LABEL_17;
      }
LABEL_16:
      int64_t v6 = -1;
      goto LABEL_17;
    }
    int64_t v6 = -3;
  }
  else
  {
    int64_t v6 = -2;
  }
LABEL_17:

  return v6;
}

- (int64_t)doorState
{
  char v3 = [(DBGarageDoor *)self doorStateCharacteristic];
  unint64_t v4 = [(DBGarageDoor *)self _doorStateForCharacteristic:v3];

  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
    int64_t v6 = [(DBGarageDoor *)self _doorStateForCharacteristic:v5];

    v7 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
    LOBYTE(v5) = [v7 BOOLValue];

    if (v5)
    {
      return 100;
    }
    else if (v4 <= 1 && v4 != v6)
    {
      if (v6 == 1)
      {
        return 3;
      }
      else if (!v6)
      {
        return 2;
      }
    }
  }
  return v4;
}

- (int64_t)targetDoorState
{
  char v3 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  int64_t v4 = [(DBGarageDoor *)self _doorStateForCharacteristic:v3];

  return v4;
}

- (void)setTargetDoorState:(int64_t)a3
{
  uint64_t v5 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  uint64_t v6 = [v5 doorStateValue];

  if (v6 != a3)
  {
    id v7 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
    [v7 setDoorStateValue:a3];
  }
}

- (BOOL)obstructionDetected
{
  objc_super v2 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)description
{
  v26 = NSString;
  uint64_t v25 = objc_opt_class();
  v24 = [(DBHomeKitService *)self name];
  v23 = [(DBHomeKitService *)self uniqueIdentifier];
  v22 = [(DBHomeKitService *)self home];
  v27 = [(DBHomeKitService *)self home];
  v28 = [v27 uniqueIdentifier];
  if ([(DBHomeKitService *)self lastWritten]) {
    char v3 = @"YES";
  }
  else {
    char v3 = @"NO";
  }
  v21 = v3;
  if ([(DBHomeKitService *)self reachable]) {
    int64_t v4 = @"YES";
  }
  else {
    int64_t v4 = @"NO";
  }
  v20 = v4;
  if ([(DBGarageDoor *)self current]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  v19 = v5;
  if ([(DBGarageDoor *)self pendingRead]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v18 = v6;
  if ([(DBGarageDoor *)self pendingWrite]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(DBGarageDoor *)self hasError]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v17 = NSStringFromDoorState([(DBGarageDoor *)self doorState]);
  v9 = [(DBGarageDoor *)self doorStateCharacteristic];
  v10 = [v9 stateDescription];
  v11 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  v12 = [v11 stateDescription];
  v13 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
  v14 = [v13 stateDescription];
  v15 = [v26 stringWithFormat:@"<%@: %p name=%@ uniqueIdentifier=%@ home=(%p)%@ lastWritten=%@ reachable=%@ current=%@ pendingRead=%@ pendingWrite=%@ hasError=%@ doorState=%@ characteristics: %@ %@ %@>", v25, self, v24, v23, v22, v28, v21, v20, v19, v18, v7, v8, v17, v10, v12, v14];

  return v15;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeKitService *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHomeKitService *)self observers];
  [v5 removeObserver:v4];
}

+ (id)serviceType
{
  objc_super v2 = +[DBHomeKitServiceTypes serviceNameByType];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0D6F8]];

  return v3;
}

+ (id)observerProtocol
{
  return &unk_26E1A3638;
}

- (id)managedCharacteristics
{
  v8[3] = *MEMORY[0x263EF8340];
  char v3 = [(DBGarageDoor *)self doorStateCharacteristic];
  id v4 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  v8[1] = v4;
  id v5 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

- (void)_characteristicDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [(DBGarageDoor *)self doorStateCharacteristic];
  id v7 = [v6 uniqueIdentifier];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    v9 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DBGarageDoor _characteristicDidUpdate:](v4);
    }

    v10 = [(DBHomeKitService *)self observers];
    objc_msgSend(v10, "garageDoor:didUpdateDoorState:", self, -[DBGarageDoor doorState](self, "doorState"));
LABEL_13:

    goto LABEL_14;
  }
  v11 = [v4 uniqueIdentifier];
  v12 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  v13 = [v12 uniqueIdentifier];
  int v14 = [v11 isEqual:v13];

  if (v14)
  {
    v15 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[DBGarageDoor _characteristicDidUpdate:](v4);
    }

    v10 = [(DBHomeKitService *)self observers];
    objc_msgSend(v10, "garageDoor:didUpdateTargetDoorState:", self, -[DBGarageDoor targetDoorState](self, "targetDoorState"));
    goto LABEL_13;
  }
  v16 = [v4 uniqueIdentifier];
  v17 = [(DBGarageDoor *)self obstructionDetectedCharacteristic];
  v18 = [v17 uniqueIdentifier];
  int v19 = [v16 isEqual:v18];

  v20 = DBLogForCategory(7uLL);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[DBGarageDoor _characteristicDidUpdate:](v4);
    }

    v10 = [(DBHomeKitService *)self observers];
    objc_msgSend(v10, "garageDoor:didUpdateObstructionDetected:", self, -[DBGarageDoor obstructionDetected](self, "obstructionDetected"));
    goto LABEL_13;
  }
  if (v21) {
    -[DBGarageDoor _characteristicDidUpdate:].cold.4(v4, v20);
  }

  v22.receiver = self;
  v22.super_class = (Class)DBGarageDoor;
  [(DBHomeKitService *)&v22 _characteristicDidUpdate:v4];
LABEL_14:
}

- (BOOL)_tracksLastUsed
{
  return 1;
}

- (BOOL)_shouldUpdateLastUsedForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(DBGarageDoor *)v4 _shouldUpdateLastUsedForCharacteristic:v5];
  }

  uint64_t v6 = [v4 uniqueIdentifier];
  id v7 = [(DBGarageDoor *)self targetDoorStateCharacteristic];
  int v8 = [v7 uniqueIdentifier];
  int v9 = [v6 isEqual:v8];

  if (v9) {
    BOOL v10 = [(DBGarageDoor *)self _tracksLastUsed];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_characteristicDidUpdate:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "match: doorState %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_characteristicDidUpdate:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "match: targetDoorState %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_characteristicDidUpdate:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_2_3(&dword_22D6F0000, v2, v3, "match: obstruction %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_characteristicDidUpdate:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 name];
  uint64_t v5 = [a1 uniqueIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "match: NONE(%@) %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_shouldUpdateLastUsedForCharacteristic:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 uniqueIdentifier];
  int v6 = [v5 UUIDString];
  uint64_t v7 = [a2 targetDoorStateCharacteristic];
  __int16 v8 = [v7 uniqueIdentifier];
  int v9 = [v8 UUIDString];
  int v10 = 138543618;
  v11 = v6;
  __int16 v12 = 2114;
  v13 = v9;
  _os_log_debug_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_DEBUG, "characteristic.uniqueIdentifier=%{public}@ targetDoorStateCharacteristic.uniqueIdentifier=%{public}@", (uint8_t *)&v10, 0x16u);
}

@end