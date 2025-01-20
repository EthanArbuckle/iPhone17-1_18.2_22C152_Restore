@interface _FBSCapturedSceneLayer
- (BOOL)isEqual:(id)a3;
- (_FBSCapturedSceneLayer)initWithXPCDictionary:(id)a3;
- (id)_initWithLayer:(id)a3;
- (int64_t)compare:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _FBSCapturedSceneLayer

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FBSCapturedSceneLayer;
  BOOL v6 = [(FBSSceneLayer *)&v8 isEqual:v4]
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
    && self->_captureTime == v4[8];

  return v6;
}

- (_FBSCapturedSceneLayer)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBSSceneLayer *)self _init];
  if (v5)
  {
    v5[5] = xpc_dictionary_get_uint64(v4, "t");
    *((double *)v5 + 3) = xpc_dictionary_get_double(v4, "l");
    v5[8] = xpc_dictionary_get_uint64(v4, "ts");
    *((_DWORD *)v5 + 4) = xpc_dictionary_get_uint64(v4, "cid");
    v5[6] = xpc_dictionary_get_uint64(v4, "a");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }

  return 0;
}

- (id)_initWithLayer:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"layer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_FBSCapturedSceneLayer _initWithLayer:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
  }
  id v5 = v4;
  BOOL v6 = [(FBSSceneLayer *)self _init];
  v7 = v6;
  if (v6)
  {
    v6[5] = (id)*((void *)v5 + 5);
    objc_storeStrong(v6 + 1, *((id *)v5 + 1));
    *((_DWORD *)v7 + 4) = *((_DWORD *)v5 + 4);
    objc_storeStrong(v7 + 4, *((id *)v5 + 4));
    v7[6] = (id)*((void *)v5 + 6);
    objc_storeStrong(v7 + 7, *((id *)v5 + 7));
    v7[8] = (id)mach_absolute_time();
    id v8 = v7[1];
    if (v8)
    {
      [v8 level];
      double v10 = v9;
    }
    else
    {
      double v10 = *((double *)v5 + 3);
    }
    *((double *)v7 + 3) = v10;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  double level = self->super._level;
  [v4 level];
  if (level >= v6)
  {
    if (level <= v6)
    {
      unint64_t captureTime = self->_captureTime;
      unint64_t v9 = v4[8];
      BOOL v10 = captureTime >= v9;
      BOOL v11 = captureTime == v9;
      uint64_t v12 = -1;
      if (v10) {
        uint64_t v12 = 1;
      }
      if (v11) {
        int64_t v7 = 0;
      }
      else {
        int64_t v7 = v12;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_uint64(xdict, "t", self->super._type);
  xpc_dictionary_set_double(xdict, "l", self->super._level);
  xpc_dictionary_set_uint64(xdict, "ts", self->_captureTime);
  uint64_t contextID = self->super._contextID;
  if (contextID) {
    xpc_dictionary_set_uint64(xdict, "cid", contextID);
  }
  int64_t alignment = self->super._alignment;
  if (alignment >= 1) {
    xpc_dictionary_set_uint64(xdict, "a", alignment);
  }
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)_initWithLayer:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end