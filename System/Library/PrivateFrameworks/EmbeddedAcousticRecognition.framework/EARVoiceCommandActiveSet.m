@interface EARVoiceCommandActiveSet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EARVoiceCommandActiveSet)initWithCoder:(id)a3;
- (EARVoiceCommandActiveSet)initWithPlistJSONDictionary:(id)a3;
- (EARVoiceCommandActiveSet)initWithSuites:(id)a3 resourceBaseURL:(id)a4;
- (NSSet)suites;
- (NSURL)resourceBaseURL;
- (id)plistJSONDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARVoiceCommandActiveSet

- (EARVoiceCommandActiveSet)initWithSuites:(id)a3 resourceBaseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EARVoiceCommandActiveSet;
  v8 = [(EARVoiceCommandActiveSet *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    suites = v8->_suites;
    v8->_suites = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    resourceBaseURL = v8->_resourceBaseURL;
    v8->_resourceBaseURL = (NSURL *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EARVoiceCommandActiveSet *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    suites = self->_suites;
    v8 = [(EARVoiceCommandActiveSet *)v6 suites];
    if ([(NSSet *)suites isEqualToSet:v8])
    {
      resourceBaseURL = self->_resourceBaseURL;
      v10 = [(EARVoiceCommandActiveSet *)v6 resourceBaseURL];
      char v11 = [(NSURL *)resourceBaseURL isEqual:v10];
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
  uint64_t v3 = [(NSSet *)self->_suites hash];
  return [(NSURL *)self->_resourceBaseURL hash] + 773 * v3 + 597529;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:0 forKey:@"version"];
  [v4 encodeObject:self->_suites forKey:@"suites"];
  [v4 encodeObject:self->_resourceBaseURL forKey:@"resourceBaseURL"];
}

- (EARVoiceCommandActiveSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EARVoiceCommandActiveSet;
  v5 = [(EARVoiceCommandActiveSet *)&v16 init];
  if (v5)
  {
    id v6 = (quasar *)[v4 decodeIntegerForKey:@"version"];
    if (v6)
    {
      id v7 = quasar::QuasarCLogger(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[EARVoiceCommandActiveSet initWithCoder:]();
      }

      resourceBaseURL = v5;
      v5 = 0;
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      char v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"suites"];
      suites = v5->_suites;
      v5->_suites = (NSSet *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceBaseURL"];
      resourceBaseURL = v5->_resourceBaseURL;
      v5->_resourceBaseURL = (NSURL *)v14;
    }
  }
  return v5;
}

- (id)plistJSONDictionary
{
  v16[3] = *MEMORY[0x1E4F143B8];
  p_suites = &self->_suites;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSSet count](self->_suites, "count"));
  v5 = *p_suites;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __47__EARVoiceCommandActiveSet_plistJSONDictionary__block_invoke;
  v13 = &unk_1E5FFFCE0;
  id v6 = v4;
  id v14 = v6;
  [(NSSet *)v5 enumerateObjectsUsingBlock:&v10];
  v15[0] = @"version";
  v15[1] = @"suites";
  v16[0] = &unk_1F0A74088;
  v16[1] = v6;
  v15[2] = @"resourceBaseURL";
  id v7 = [(NSURL *)self->_resourceBaseURL absoluteString];
  v16[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v8;
}

void __47__EARVoiceCommandActiveSet_plistJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 plistJSONDictionary];
  objc_msgSend(v2, "addObject:");
}

- (EARVoiceCommandActiveSet)initWithPlistJSONDictionary:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)EARVoiceCommandActiveSet;
  id v6 = [(EARVoiceCommandActiveSet *)&v38 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"version"];

    if (!v7)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, v6, @"EARVoiceCommandActiveSet.mm", 110, @"Missing key \"%@\" of type NSNumber", @"version" object file lineNumber description];
    }
    v8 = [v5 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"EARVoiceCommandActiveSet.mm", 110, @"Wrong value type for key \"%@\"; expecting NSNumber",
        @"version");
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"version"];
    uint64_t v11 = [v10 integerValue];

    if (v11)
    {
      p_super = quasar::QuasarCLogger(v12);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[EARVoiceCommandActiveSet initWithCoder:]();
      }
      id v14 = v6;
      id v6 = 0;
    }
    else
    {
      v15 = [v5 objectForKeyedSubscript:@"suites"];

      if (!v15)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, v6, @"EARVoiceCommandActiveSet.mm", 114, @"Missing key \"%@\" of type NSArray", @"suites" object file lineNumber description];
      }
      objc_super v16 = [v5 objectForKeyedSubscript:@"suites"];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"EARVoiceCommandActiveSet.mm", 114, @"Wrong value type for key \"%@\"; expecting NSArray",
          @"suites");
      }
      v18 = [v5 objectForKeyedSubscript:@"resourceBaseURL"];

      if (!v18)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, v6, @"EARVoiceCommandActiveSet.mm", 115, @"Missing key \"%@\" of type NSString", @"resourceBaseURL" object file lineNumber description];
      }
      v19 = [v5 objectForKeyedSubscript:@"resourceBaseURL"];
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"EARVoiceCommandActiveSet.mm", 115, @"Wrong value type for key \"%@\"; expecting NSString",
          @"resourceBaseURL");
      }
      v21 = [MEMORY[0x1E4F1CA80] set];
      v22 = [v5 objectForKeyedSubscript:@"suites"];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __56__EARVoiceCommandActiveSet_initWithPlistJSONDictionary___block_invoke;
      v36[3] = &unk_1E5FFFD08;
      id v14 = v21;
      v37 = v14;
      [v22 enumerateObjectsUsingBlock:v36];

      uint64_t v23 = [(EARVoiceCommandActiveSet *)v14 copy];
      suites = v6->_suites;
      v6->_suites = (NSSet *)v23;

      v25 = (void *)MEMORY[0x1E4F1CB10];
      v26 = [v5 objectForKeyedSubscript:@"resourceBaseURL"];
      uint64_t v27 = [v25 URLWithString:v26];
      resourceBaseURL = v6->_resourceBaseURL;
      v6->_resourceBaseURL = (NSURL *)v27;

      p_super = &v37->super;
    }
  }
  return v6;
}

void __56__EARVoiceCommandActiveSet_initWithPlistJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [[EARVoiceCommandSuite alloc] initWithPlistJSONDictionary:v5];
  [v3 addObject:v4];
}

- (NSSet)suites
{
  return self->_suites;
}

- (NSURL)resourceBaseURL
{
  return self->_resourceBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceBaseURL, 0);
  objc_storeStrong((id *)&self->_suites, 0);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1B1A86000, v0, v1, "Unknown EARVoiceCommandActiveSet serialized version", v2, v3, v4, v5, v6);
}

@end