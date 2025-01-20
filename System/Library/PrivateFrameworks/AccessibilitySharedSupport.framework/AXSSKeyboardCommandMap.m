@interface AXSSKeyboardCommandMap
+ (BOOL)supportsSecureCoding;
- (AXSSKeyboardCommandMap)commandMapWithKeyChord:(id)a3 forCommand:(id)a4;
- (AXSSKeyboardCommandMap)init;
- (AXSSKeyboardCommandMap)initWithCoder:(id)a3;
- (BOOL)_isAvailableCommand:(id)a3;
- (BOOL)_validateCommandsToKeyChords:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommandMap:(id)a3;
- (NSDictionary)commandsToArraysOfKeyChords;
- (NSDictionary)keyChordsToCommands;
- (NSDictionary)userDefinedCommandsToKeyChords;
- (NSMutableDictionary)transientCommands;
- (NSSet)availableCommands;
- (id)_initWithCommandsToKeyChordsDictionary:(id)a3;
- (id)addCommandsForTransientKeyChords:(id)a3;
- (id)commandForKeyChord:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyChordForCommand:(id)a3;
- (unint64_t)hash;
- (void)_initializeDictionariesIfNeeded;
- (void)encodeWithCoder:(id)a3;
- (void)removeTransientKeyChordsForIdentifier:(id)a3;
- (void)setAvailableCommands:(id)a3;
@end

@implementation AXSSKeyboardCommandMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithCommandsToKeyChordsDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSSKeyboardCommandMap;
  v6 = [(AXSSKeyboardCommandMap *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefinedCommandsToKeyChords, a3);
  }

  return v7;
}

- (AXSSKeyboardCommandMap)init
{
  return (AXSSKeyboardCommandMap *)[(AXSSKeyboardCommandMap *)self _initWithCommandsToKeyChordsDictionary:0];
}

- (AXSSKeyboardCommandMap)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_super v9 = [v5 decodeObjectOfClasses:v8 forKey:@"commandsToKeyChords"];

  if (v9 && ![(AXSSKeyboardCommandMap *)self _validateCommandsToKeyChords:v9])
  {
    v10 = FKALogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXSSKeyboardCommandMap initWithCoder:]((uint64_t)v9, v10);
    }

    objc_super v9 = 0;
  }
  v11 = [(AXSSKeyboardCommandMap *)self _initWithCommandsToKeyChordsDictionary:v9];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSKeyboardCommandMap *)self userDefinedCommandsToKeyChords];
  [v4 encodeObject:v5 forKey:@"commandsToKeyChords"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(AXSSKeyboardCommandMap *)self userDefinedCommandsToKeyChords];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(AXSSKeyboardCommandMap *)self availableCommands];
  v8 = (void *)v4[1];
  v4[1] = v7;

  objc_super v9 = [(AXSSKeyboardCommandMap *)self transientCommands];
  uint64_t v10 = [v9 copy];
  v11 = (void *)v4[5];
  v4[5] = v10;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AXSSKeyboardCommandMap *)self isEqualToCommandMap:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(AXSSKeyboardCommandMap *)self userDefinedCommandsToKeyChords];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToCommandMap:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXSSKeyboardCommandMap *)self userDefinedCommandsToKeyChords];
  uint64_t v6 = [v4 userDefinedCommandsToKeyChords];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v7 = [(AXSSKeyboardCommandMap *)self userDefinedCommandsToKeyChords];
    v8 = [v4 userDefinedCommandsToKeyChords];
    char v9 = [v7 isEqualToDictionary:v8];
  }
  return v9;
}

- (BOOL)_validateCommandsToKeyChords:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v13);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            continue;
          }
        }
        BOOL v11 = 0;
        goto LABEL_13;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_13:

  return v11;
}

- (BOOL)_isAvailableCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSSKeyboardCommandMap *)self availableCommands];
  if (v5)
  {
    uint64_t v6 = [(AXSSKeyboardCommandMap *)self availableCommands];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)_initializeDictionariesIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Error loading default keyboard commands: %@", (uint8_t *)&v2, 0xCu);
}

- (id)commandForKeyChord:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isNull]) {
    goto LABEL_2;
  }
  [(AXSSKeyboardCommandMap *)self _initializeDictionariesIfNeeded];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(AXSSKeyboardCommandMap *)self transientCommands];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = [(AXSSKeyboardCommandMap *)self transientCommands];
        long long v13 = [v12 objectForKeyedSubscript:v11];
        uint64_t v5 = [v13 objectForKeyedSubscript:v4];

        if (v5)
        {

          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v14 = [(AXSSKeyboardCommandMap *)self keyChordsToCommands];
  uint64_t v5 = [v14 objectForKeyedSubscript:v4];

  if (!v5)
  {
    long long v15 = [v4 keys];
    int v16 = [v15 containsObject:@"⎋"];

    if (!v16)
    {
LABEL_2:
      uint64_t v5 = 0;
      goto LABEL_15;
    }
    uint64_t v5 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:@"Escape"];
  }
LABEL_15:

  return v5;
}

- (id)keyChordForCommand:(id)a3
{
  id v4 = a3;
  [(AXSSKeyboardCommandMap *)self _initializeDictionariesIfNeeded];
  uint64_t v5 = [(AXSSKeyboardCommandMap *)self commandsToArraysOfKeyChords];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if ([v6 count] == 1
    && ([v6 firstObject],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isNull],
        v7,
        (v8 & 1) != 0))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v6 firstObject];
  }

  return v9;
}

- (AXSSKeyboardCommandMap)commandMapWithKeyChord:(id)a3 forCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(AXSSKeyboardCommandMap *)self userDefinedCommandsToKeyChords];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if (v9)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v7) {
LABEL_3:
  }
    [v9 setObject:v6 forKeyedSubscript:v7];
LABEL_4:
  uint64_t v10 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithCommandsToKeyChordsDictionary:v9];
  uint64_t v11 = [(AXSSKeyboardCommandMap *)self availableCommands];
  [v10 setAvailableCommands:v11];

  return (AXSSKeyboardCommandMap *)v10;
}

- (id)addCommandsForTransientKeyChords:(id)a3
{
  id v4 = a3;
  if (!self->_transientCommands)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    transientCommands = self->_transientCommands;
    self->_transientCommands = v5;
  }
  id v7 = [MEMORY[0x1E4F29128] UUID];
  char v8 = [v7 UUIDString];

  uint64_t v9 = [(AXSSKeyboardCommandMap *)self transientCommands];
  [v9 setObject:v4 forKeyedSubscript:v8];

  return v8;
}

- (void)removeTransientKeyChordsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSKeyboardCommandMap *)self transientCommands];
  [v5 setObject:0 forKeyedSubscript:v4];
}

- (NSSet)availableCommands
{
  return self->_availableCommands;
}

- (void)setAvailableCommands:(id)a3
{
}

- (NSDictionary)keyChordsToCommands
{
  return self->_keyChordsToCommands;
}

- (NSDictionary)commandsToArraysOfKeyChords
{
  return self->_commandsToArraysOfKeyChords;
}

- (NSDictionary)userDefinedCommandsToKeyChords
{
  return self->_userDefinedCommandsToKeyChords;
}

- (NSMutableDictionary)transientCommands
{
  return self->_transientCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientCommands, 0);
  objc_storeStrong((id *)&self->_userDefinedCommandsToKeyChords, 0);
  objc_storeStrong((id *)&self->_commandsToArraysOfKeyChords, 0);
  objc_storeStrong((id *)&self->_keyChordsToCommands, 0);

  objc_storeStrong((id *)&self->_availableCommands, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Ignoring commands to key chords dictionary because of unexpected format: %@", (uint8_t *)&v2, 0xCu);
}

@end