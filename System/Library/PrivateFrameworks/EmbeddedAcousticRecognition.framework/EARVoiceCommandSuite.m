@interface EARVoiceCommandSuite
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EARVoiceCommandSuite)initWithCoder:(id)a3;
- (EARVoiceCommandSuite)initWithIdentifier:(id)a3 commands:(id)a4;
- (EARVoiceCommandSuite)initWithPlistJSONDictionary:(id)a3;
- (NSSet)commandSpecs;
- (NSString)identifier;
- (id)plistJSONDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARVoiceCommandSuite

- (EARVoiceCommandSuite)initWithIdentifier:(id)a3 commands:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EARVoiceCommandSuite;
  v8 = [(EARVoiceCommandSuite *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    commandSpecs = v8->_commandSpecs;
    v8->_commandSpecs = (NSSet *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EARVoiceCommandSuite *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    identifier = self->_identifier;
    v8 = [(EARVoiceCommandSuite *)v6 identifier];
    if ([(NSString *)identifier isEqualToString:v8])
    {
      commandSpecs = self->_commandSpecs;
      v10 = [(EARVoiceCommandSuite *)v6 commandSpecs];
      char v11 = [(NSSet *)commandSpecs isEqualToSet:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSSet *)self->_commandSpecs hash] + 727 * v3 + 528529;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:0 forKey:@"version"];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_commandSpecs forKey:@"commandSpecs"];
}

- (EARVoiceCommandSuite)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EARVoiceCommandSuite;
  v5 = [(EARVoiceCommandSuite *)&v15 init];
  if (v5)
  {
    id v6 = (quasar *)[v4 decodeIntegerForKey:@"version"];
    if (v6)
    {
      p_super = quasar::QuasarCLogger(v6);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[EARVoiceCommandSuite initWithCoder:]();
      }
      v8 = v5;
      v5 = 0;
    }
    else
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v9;

      char v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = objc_opt_class();
      v8 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"commandSpecs"];
      p_super = &v5->_commandSpecs->super;
      v5->_commandSpecs = (NSSet *)v13;
    }
  }
  return v5;
}

- (id)plistJSONDictionary
{
  v16[3] = *MEMORY[0x1E4F143B8];
  p_commandSpecs = &self->_commandSpecs;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSSet count](self->_commandSpecs, "count"));
  v5 = *p_commandSpecs;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __43__EARVoiceCommandSuite_plistJSONDictionary__block_invoke;
  uint64_t v13 = &unk_1E5FFFD30;
  id v6 = v4;
  id v14 = v6;
  [(NSSet *)v5 enumerateObjectsUsingBlock:&v10];
  v15[0] = @"version";
  v15[1] = @"identifier";
  identifier = self->_identifier;
  v16[0] = &unk_1F0A74088;
  v16[1] = identifier;
  v15[2] = @"commandSpecs";
  v16[2] = v6;
  v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, v15, 3, v10, v11, v12, v13);

  return v8;
}

void __43__EARVoiceCommandSuite_plistJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 plistJSONDictionary];
  objc_msgSend(v2, "addObject:");
}

- (EARVoiceCommandSuite)initWithPlistJSONDictionary:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)EARVoiceCommandSuite;
  id v6 = [(EARVoiceCommandSuite *)&v36 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"version"];

    if (!v7)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, v6, @"EARVoiceCommandActiveSet.mm", 226, @"Missing key \"%@\" of type NSNumber", @"version" object file lineNumber description];
    }
    v8 = [v5 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"EARVoiceCommandActiveSet.mm", 226, @"Wrong value type for key \"%@\"; expecting NSNumber",
        @"version");
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"version"];
    uint64_t v11 = [v10 integerValue];

    if (v11)
    {
      p_super = quasar::QuasarCLogger(v12);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[EARVoiceCommandSuite initWithCoder:]();
      }
      id v14 = v6;
      id v6 = 0;
    }
    else
    {
      objc_super v15 = [v5 objectForKeyedSubscript:@"identifier"];

      if (!v15)
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2, v6, @"EARVoiceCommandActiveSet.mm", 230, @"Missing key \"%@\" of type NSString", @"identifier" object file lineNumber description];
      }
      v16 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"EARVoiceCommandActiveSet.mm", 230, @"Wrong value type for key \"%@\"; expecting NSString",
          @"identifier");
      }
      v18 = [v5 objectForKeyedSubscript:@"commandSpecs"];

      if (!v18)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, v6, @"EARVoiceCommandActiveSet.mm", 231, @"Missing key \"%@\" of type NSArray", @"commandSpecs" object file lineNumber description];
      }
      v19 = [v5 objectForKeyedSubscript:@"commandSpecs"];
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"EARVoiceCommandActiveSet.mm", 231, @"Wrong value type for key \"%@\"; expecting NSArray",
          @"commandSpecs");
      }
      v21 = [MEMORY[0x1E4F1CA80] set];
      v22 = [v5 objectForKeyedSubscript:@"commandSpecs"];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __52__EARVoiceCommandSuite_initWithPlistJSONDictionary___block_invoke;
      v34[3] = &unk_1E5FFFD08;
      id v14 = v21;
      v35 = v14;
      [v22 enumerateObjectsUsingBlock:v34];

      uint64_t v23 = [v5 objectForKeyedSubscript:@"identifier"];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v23;

      uint64_t v25 = [(EARVoiceCommandSuite *)v14 copy];
      commandSpecs = v6->_commandSpecs;
      v6->_commandSpecs = (NSSet *)v25;

      p_super = &v35->super;
    }
  }
  return v6;
}

void __52__EARVoiceCommandSuite_initWithPlistJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [[EARVoiceCommandSpec alloc] initWithPlistJSONDictionary:v5];
  [v3 addObject:v4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)commandSpecs
{
  return self->_commandSpecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandSpecs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1B1A86000, v0, v1, "Unknown EARVoiceCommandSuite serialized version", v2, v3, v4, v5, v6);
}

@end