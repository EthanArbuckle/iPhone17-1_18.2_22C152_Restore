@interface CoreDAVCurrentUserPrivilegeSetItem
+ (id)copyParseRules;
- (BOOL)hasPrivilegeWithNameSpace:(id)a3 andName:(id)a4;
- (CoreDAVCurrentUserPrivilegeSetItem)init;
- (NSMutableSet)privileges;
- (id)description;
- (void)addPrivilege:(id)a3;
- (void)setPrivileges:(id)a3;
@end

@implementation CoreDAVCurrentUserPrivilegeSetItem

- (CoreDAVCurrentUserPrivilegeSetItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"current-user-privilege-set"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVCurrentUserPrivilegeSetItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVCurrentUserPrivilegeSetItem *)self privileges];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of privileges: [%lu]", objc_msgSend(v5, "count"));

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc(NSDictionary);
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"privilege" objectClass:objc_opt_class() setterMethod:sel_addPrivilege_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"privilege"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addPrivilege:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVCurrentUserPrivilegeSetItem *)self privileges];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVCurrentUserPrivilegeSetItem *)self setPrivileges:v6];
  }
  id v7 = [(CoreDAVCurrentUserPrivilegeSetItem *)self privileges];
  [v7 addObject:v4];
}

- (BOOL)hasPrivilegeWithNameSpace:(id)a3 andName:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7 || (v8 = v7, ![v7 length]))
  {
    id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Non-nil and non-empty 'name' required." userInfo:0];
    objc_exception_throw(v24);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v9 = [(CoreDAVCurrentUserPrivilegeSetItem *)self privileges];
  uint64_t v26 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v10 = *(void *)v33;
    v27 = v9;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v9);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v13 = [v12 extraChildItems];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              v19 = [v18 name];
              if ([v8 isEqualToString:v19])
              {
                if (!v6)
                {

LABEL_25:
                  BOOL v22 = 1;
                  v9 = v27;
                  goto LABEL_26;
                }
                v20 = [v18 nameSpace];
                char v21 = [v6 isEqualToString:v20];

                if (v21) {
                  goto LABEL_25;
                }
              }
              else
              {
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        v9 = v27;
        uint64_t v10 = v25;
      }
      BOOL v22 = 0;
      uint64_t v26 = [v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_26:

  return v22;
}

- (NSMutableSet)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
}

- (void).cxx_destruct
{
}

@end