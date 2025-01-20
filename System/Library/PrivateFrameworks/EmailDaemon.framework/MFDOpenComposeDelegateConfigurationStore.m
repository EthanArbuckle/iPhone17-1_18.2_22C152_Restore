@interface MFDOpenComposeDelegateConfigurationStore
+ (MFDOpenComposeDelegateConfigurationStore)sharedStore;
- (id)_init;
- (id)consumeConfigurationWithIdentifier:(id)a3;
- (void)registerConfiguration:(id)a3;
@end

@implementation MFDOpenComposeDelegateConfigurationStore

+ (MFDOpenComposeDelegateConfigurationStore)sharedStore
{
  if (qword_10016BAE0 != -1) {
    dispatch_once(&qword_10016BAE0, &stru_10013C0F8);
  }
  v2 = (void *)qword_10016BAD8;

  return (MFDOpenComposeDelegateConfigurationStore *)v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MFDOpenComposeDelegateConfigurationStore;
  return [(MFDOpenComposeDelegateConfigurationStore *)&v3 init];
}

- (void)registerConfiguration:(id)a3
{
  id v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  configurations = self->_configurations;
  if (!configurations)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7 = self->_configurations;
    self->_configurations = v6;

    configurations = self->_configurations;
  }
  v8 = [v9 identifier];
  [(NSMutableDictionary *)configurations setObject:v9 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
}

- (id)consumeConfigurationWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_configurations objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_configurations setObject:0 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void).cxx_destruct
{
}

@end