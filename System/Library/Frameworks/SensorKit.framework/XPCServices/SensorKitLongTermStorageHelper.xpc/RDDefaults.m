@interface RDDefaults
+ (void)initialize;
- (RDDefaults)init;
- (void)dealloc;
- (void)setAuthorizationVersions:(id)a3 forBundleId:(id)a4;
- (void)updateAuthorizationVersions:(id)a3 forBundleId:(id)a4;
@end

@implementation RDDefaults

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100016FD8 = (uint64_t)os_log_create("com.apple.SensorKit", "RDDefaults");
  }
}

- (RDDefaults)init
{
  v3 = +[NSUserDefaults standardUserDefaults];

  return (RDDefaults *)sub_100002570(self, v3);
}

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0, 24);
  }
  v3.receiver = self;
  v3.super_class = (Class)RDDefaults;
  [(RDDefaults *)&v3 dealloc];
}

- (void)setAuthorizationVersions:(id)a3 forBundleId:(id)a4
{
  id v7 = objc_alloc((Class)NSMutableDictionary);
  if (self) {
    v8 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"AuthorizationVersions"];
  }
  else {
    v8 = 0;
  }
  id v9 = [v7 initWithDictionary:v8];
  [v9 setObject:a3 forKeyedSubscript:a4];
  [(NSUserDefaults *)self->_defaults setObject:v9 forKey:@"AuthorizationVersions"];
}

- (void)updateAuthorizationVersions:(id)a3 forBundleId:(id)a4
{
  id v7 = objc_alloc((Class)NSMutableDictionary);
  if (self) {
    v8 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"AuthorizationVersions"];
  }
  else {
    v8 = 0;
  }
  id v9 = [v7 initWithDictionary:v8];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(v9, "objectForKeyedSubscript:", a4));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14)), *(void *)(*((void *)&v15 + 1) + 8 * (void)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
  [v9 setObject:v10 forKeyedSubscript:a4];
  [(NSUserDefaults *)self->_defaults setObject:v9 forKey:@"AuthorizationVersions"];
}

@end