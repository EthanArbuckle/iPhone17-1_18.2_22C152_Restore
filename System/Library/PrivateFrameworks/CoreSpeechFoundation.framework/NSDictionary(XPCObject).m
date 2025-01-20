@interface NSDictionary(XPCObject)
- (id)_cs_initWithXPCObject:()XPCObject;
- (id)_cs_xpcObject;
@end

@implementation NSDictionary(XPCObject)

- (id)_cs_xpcObject
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NSDictionary_XPCObject___cs_xpcObject__block_invoke;
  v5[3] = &unk_1E62001D0;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

- (id)_cs_initWithXPCObject:()XPCObject
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_9;
  }
  if (MEMORY[0x1BA9E7EA0](v4) != MEMORY[0x1E4F14590])
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[NSDictionary(XPCObject) _cs_initWithXPCObject:]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s xpc object should be XPC_TYPE_DICTIONARY", buf, 0xCu);
    }
    goto LABEL_5;
  }
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = v8;
  if (v8)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __49__NSDictionary_XPCObject___cs_initWithXPCObject___block_invoke;
    applier[3] = &unk_1E62001A8;
    id v12 = v8;
    xpc_dictionary_apply(v5, applier);
  }
  v7 = (void *)[a1 initWithDictionary:v9];

LABEL_9:
  return v7;
}

@end