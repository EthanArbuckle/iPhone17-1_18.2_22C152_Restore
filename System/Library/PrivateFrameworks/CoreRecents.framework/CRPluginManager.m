@interface CRPluginManager
+ (id)defaultPluginPath;
- (CRPluginManager)initWithPath:(id)a3;
- (id)addressHandlerForAddressKind:(id)a3;
- (id)addressHandlers;
- (void)_addAddressHandler:(id)a3;
- (void)_loadPluginBundle:(id)a3;
- (void)_loadPlugins;
- (void)dealloc;
@end

@implementation CRPluginManager

+ (id)defaultPluginPath
{
  if (qword_100034510 != -1) {
    dispatch_once(&qword_100034510, &stru_10002D2C0);
  }
  return (id)qword_100034508;
}

- (CRPluginManager)initWithPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRPluginManager;
  v4 = [(CRPluginManager *)&v6 init];
  if (v4)
  {
    v4->_path = (NSString *)[a3 copy];
    v4->_addressHandlersByKind = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(CRPluginManager *)v4 _loadPlugins];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRPluginManager;
  [(CRPluginManager *)&v3 dealloc];
}

- (void)_loadPlugins
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", self->_path, 0, 0);
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (!objc_msgSend(objc_msgSend(v8, "pathExtension"), "caseInsensitiveCompare:", @"addresshandler"))
        {
          v10 = +[NSBundle bundleWithPath:[(NSString *)self->_path stringByAppendingPathComponent:v8]];
          if (v10) {
            [(CRPluginManager *)self _loadPluginBundle:v10];
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_loadPluginBundle:(id)a3
{
  uint64_t v6 = 0;
  if ([a3 loadAndReturnError:&v6])
  {
    id v5 = [a3 principalClass];
    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___CRAddressHandler]) {
      [(CRPluginManager *)self _addAddressHandler:+[CRAddressHandler addressHandlerWithPrincipalClass:v5]];
    }
    else {
      NSLog(@"no conforming principal class found in %@", a3);
    }
  }
  else
  {
    NSLog(@"unable to load plugin bundle %@: %@", a3, v6);
  }
}

- (void)_addAddressHandler:(id)a3
{
  id v5 = [a3 supportedAddressKinds];
  uint64_t v6 = +[NSMutableSet setWithSet:v5];
  [(NSMutableSet *)v6 intersectSet:+[NSSet setWithArray:[(NSMutableDictionary *)self->_addressHandlersByKind allKeys]]];
  if ([(NSMutableSet *)v6 count])
  {
    v7 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"ERROR: %@ attempting to register multiple sync transformers for kinds: {%@}\n\tregistered transformers:\n", a3, objc_msgSend(-[NSMutableSet allObjects](v6, "allObjects"), "componentsJoinedByString:", @","));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        long long v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          [(NSMutableString *)v7 appendFormat:@"\t%@ => %@\n", *(void *)(*((void *)&v20 + 1) + 8 * (void)v11), [(NSMutableDictionary *)self->_addressHandlersByKind objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)v11)]];
          long long v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }
    NSLog(@"%@", v7);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v12 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v5);
          }
          [(NSMutableDictionary *)self->_addressHandlersByKind setObject:a3 forKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15)];
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (id)addressHandlers
{
  v2 = +[NSSet setWithArray:[(NSMutableDictionary *)self->_addressHandlersByKind allValues]];
  return [(NSSet *)v2 allObjects];
}

- (id)addressHandlerForAddressKind:(id)a3
{
  return [(NSMutableDictionary *)self->_addressHandlersByKind objectForKey:a3];
}

@end