@interface NEIKEv2FragmentMap
- (NEIKEv2FragmentMap)init;
@end

@implementation NEIKEv2FragmentMap

- (void).cxx_destruct
{
}

- (NEIKEv2FragmentMap)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NEIKEv2FragmentMap;
  v2 = [(NEIKEv2FragmentMap *)&v12 init];
  if (!v2)
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_WORD *)buf = 0;
    v9 = "[super init] failed";
    v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_8;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_setProperty_atomic(v2, v4, v3, 16);

  if (!objc_getProperty(v2, v5, 16, 1))
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_5:

      v6 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v14 = "-[NEIKEv2FragmentMap init]";
    v9 = "%s called with null self.fragments";
    v10 = v7;
    uint32_t v11 = 12;
LABEL_8:
    _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, v9, buf, v11);
    goto LABEL_5;
  }
  v6 = v2;
LABEL_6:

  return v6;
}

@end