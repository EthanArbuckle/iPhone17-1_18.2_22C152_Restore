@interface CNScriptChanges
+ (id)_changesFromInternal:(id)a3;
- (CNScriptChanges)initWithDataRepresentation:(NSData *)dataRepresentation;
- (NSArray)addedDetectionTracks;
- (NSArray)userDecisions;
- (NSData)dataRepresentation;
- (NSDictionary)internalChanges;
- (float)fNumber;
- (id)_initWithInternalChanges:(id)a3;
- (void)dataRepresentation;
@end

@implementation CNScriptChanges

- (id)_initWithInternalChanges:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNScriptChanges;
  v5 = [(CNScriptChanges *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    internalChanges = v5->_internalChanges;
    v5->_internalChanges = (NSDictionary *)v6;
  }
  return v5;
}

+ (id)_changesFromInternal:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithInternalChanges:v4];

  return v5;
}

- (CNScriptChanges)initWithDataRepresentation:(NSData *)dataRepresentation
{
  v18[4] = *MEMORY[0x263EF8340];
  id v4 = dataRepresentation;
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
  uint64_t v6 = (void *)MEMORY[0x263F08928];
  v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  id v17 = 0;
  v8 = [v6 unarchivedObjectOfClasses:v7 fromData:v4 error:&v17];

  id v9 = v17;
  if (v9)
  {
    v10 = _CNLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNScriptChanges initWithDataRepresentation:].cold.5();
    }
    v11 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = _CNLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CNScriptChanges initWithDataRepresentation:].cold.4();
      }
    }
    v10 = [v8 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = _CNLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CNScriptChanges initWithDataRepresentation:]();
      }
    }
    if ([v10 integerValue] == 1)
    {
      v14 = [v8 objectForKeyedSubscript:@"scriptChanges"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = _CNLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CNScriptChanges initWithDataRepresentation:]();
        }
      }
      self = (CNScriptChanges *)[(CNScriptChanges *)self _initWithInternalChanges:v14];
      v11 = self;
    }
    else
    {
      v14 = _CNLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CNScriptChanges initWithDataRepresentation:]();
      }
      v11 = 0;
    }
  }
  return v11;
}

- (NSData)dataRepresentation
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"version";
  v10[1] = @"scriptChanges";
  v11[0] = &unk_26F8974D0;
  v2 = [(CNScriptChanges *)self internalChanges];
  v11[1] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v9 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = _CNLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNScriptChanges dataRepresentation]();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return (NSData *)v7;
}

- (float)fNumber
{
  v2 = [(CNScriptChanges *)self internalChanges];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F5F318]];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (NSArray)userDecisions
{
  v2 = [(CNScriptChanges *)self internalChanges];
  v3 = [v2 objectForKeyedSubscript:@"user_decisions"];

  float v4 = [MEMORY[0x263F5F2A0] _mutableDecisionsWithCinematographyDictionaries:v3];
  float v5 = +[CNDecision _takeDecisionsFromInternal:v4];

  return (NSArray *)v5;
}

- (NSArray)addedDetectionTracks
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  float v4 = [(CNScriptChanges *)self internalChanges];
  float v5 = [v4 objectForKeyedSubscript:@"user_tracks"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x263F5F2C0]);
        v13 = objc_msgSend(v12, "_initWithCinematographyDictionary:", v11, (void)v17);
        v14 = +[CNDetectionTrack _trackFromInternal:v13];
        [v3 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = (void *)[v3 copy];

  return (NSArray *)v15;
}

- (NSDictionary)internalChanges
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithDataRepresentation:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_243267000, v2, v3, "Error decoding script changes: changes of unexpected class %@", v4, v5, v6, v7, v8);
}

- (void)initWithDataRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_243267000, v0, v1, "Unsupported script changes version: %@", v2, v3, v4, v5, v6);
}

- (void)initWithDataRepresentation:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_243267000, v2, v3, "Error decoding script changes: version of unexpected class %@", v4, v5, v6, v7, v8);
}

- (void)initWithDataRepresentation:.cold.4()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_243267000, v2, v3, "Error decoding script changes: root dict of unexpected class %@", v4, v5, v6, v7, v8);
}

- (void)initWithDataRepresentation:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_243267000, v0, v1, "Error decoding script changes: %@", v2, v3, v4, v5, v6);
}

- (void)dataRepresentation
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_243267000, v0, v1, "Error encoding script changes: %@", v2, v3, v4, v5, v6);
}

@end