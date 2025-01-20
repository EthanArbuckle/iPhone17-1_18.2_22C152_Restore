@interface IMDDaemonPropertyManager
+ (IMDDaemonPropertyManager)sharedManager;
- (IMDDaemonPropertyManager)init;
- (NSDictionary)persistentProperties;
- (NSDictionary)properties;
- (NSMutableDictionary)mutablePersistentProperties;
- (NSMutableDictionary)mutableProperties;
- (id)valueOfPersistentProperty:(id)a3;
- (id)valueOfProperty:(id)a3;
- (void)setMutablePersistentProperties:(id)a3;
- (void)setMutableProperties:(id)a3;
- (void)setValue:(id)a3 ofPersistentProperty:(id)a4;
- (void)setValue:(id)a3 ofProperty:(id)a4;
@end

@implementation IMDDaemonPropertyManager

- (NSDictionary)persistentProperties
{
  v2 = [(IMDDaemonPropertyManager *)self mutablePersistentProperties];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSDictionary)properties
{
  v2 = [(IMDDaemonPropertyManager *)self mutableProperties];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSMutableDictionary)mutableProperties
{
  return self->_mutableProperties;
}

+ (IMDDaemonPropertyManager)sharedManager
{
  if (qword_1EBE2BE78 != -1) {
    dispatch_once(&qword_1EBE2BE78, &unk_1F33917C0);
  }
  v2 = (void *)qword_1EBE2BE88;

  return (IMDDaemonPropertyManager *)v2;
}

- (NSMutableDictionary)mutablePersistentProperties
{
  return self->_mutablePersistentProperties;
}

- (IMDDaemonPropertyManager)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)IMDDaemonPropertyManager;
  v2 = [(IMDDaemonPropertyManager *)&v23 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableProperties = v2->_mutableProperties;
    v2->_mutableProperties = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutablePersistentProperties = v2->_mutablePersistentProperties;
    v2->_mutablePersistentProperties = v5;

    CFArrayRef v7 = CFPreferencesCopyKeyList((CFStringRef)*MEMORY[0x1E4F1D3D8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if ([(__CFArray *)v7 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      CFArrayRef v18 = v7;
      CFArrayRef v8 = v7;
      uint64_t v9 = [(__CFArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 hasPrefix:@"Setting."])
            {
              v14 = v2->_mutablePersistentProperties;
              v15 = MEMORY[0x1E0169500](v13);
              v16 = [v13 substringFromIndex:8];
              [(NSMutableDictionary *)v14 setObject:v15 forKey:v16];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [(__CFArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      CFArrayRef v7 = v18;
    }
  }
  return v2;
}

- (void)setValue:(id)a3 ofProperty:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  CFArrayRef v7 = [(IMDDaemonPropertyManager *)self mutableProperties];
  [v7 setObject:v10 forKeyedSubscript:v6];

  if (v10)
  {
    CFArrayRef v8 = +[IMDBroadcastController sharedProvider];
    uint64_t v9 = [v8 broadcasterForAllListeners];
    [v9 property:v6 changedTo:v10 from:0];
  }
}

- (id)valueOfProperty:(id)a3
{
  id v4 = a3;
  v5 = [(IMDDaemonPropertyManager *)self mutableProperties];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 ofPersistentProperty:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  CFArrayRef v7 = [(IMDDaemonPropertyManager *)self mutablePersistentProperties];
  [v7 setObject:v11 forKeyedSubscript:v6];

  CFArrayRef v8 = [@"Setting." stringByAppendingString:v6];
  if (v11) {
    IMSetAppValueForKey();
  }
  else {
    IMRemoveAppValueForKey();
  }
  if (v11)
  {
    uint64_t v9 = +[IMDBroadcastController sharedProvider];
    id v10 = [v9 broadcasterForAllListeners];
    [v10 persistentProperty:v6 changedTo:v11 from:0];
  }
}

- (id)valueOfPersistentProperty:(id)a3
{
  id v4 = a3;
  v5 = [(IMDDaemonPropertyManager *)self mutablePersistentProperties];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setMutableProperties:(id)a3
{
}

- (void)setMutablePersistentProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePersistentProperties, 0);

  objc_storeStrong((id *)&self->_mutableProperties, 0);
}

@end