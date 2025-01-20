@interface HMCAMDEmbeddedDevice
- (BOOL)filterNSDataLogging;
- (HMCAMDEmbeddedDevice)init;
- (id)instanceOfClass:(Class)a3 forShortName:(id)a4;
- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6;
- (id)valueForUndefinedKey:(id)a3;
- (void)setFilterNSDataLogging:(BOOL)a3;
@end

@implementation HMCAMDEmbeddedDevice

- (void).cxx_destruct
{
}

- (void)setFilterNSDataLogging:(BOOL)a3
{
  self->_filterNSDataLogging = a3;
}

- (BOOL)filterNSDataLogging
{
  return self->_filterNSDataLogging;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = +[NSString stringWithFormat:@"%@ is unavailable", v12];
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (id)instanceOfClass:(Class)a3 forShortName:(id)a4
{
  id v5 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(NSMutableDictionary *)v6->_classInstances objectForKeyedSubscript:v5];

  if (!v7)
  {
    v8 = objc_opt_new();
    if (!v8) {
      goto LABEL_5;
    }
    [(NSMutableDictionary *)v6->_classInstances setObject:v8 forKeyedSubscript:v5];
  }
  v8 = [(NSMutableDictionary *)v6->_classInstances objectForKeyedSubscript:v5];
LABEL_5:
  objc_sync_exit(v6);

  return v8;
}

- (HMCAMDEmbeddedDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMCAMDEmbeddedDevice;
  v2 = [(HMCAMDEmbeddedDevice *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_filterNSDataLogging = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    classInstances = v3->_classInstances;
    v3->_classInstances = (NSMutableDictionary *)v4;
  }
  return v3;
}

@end