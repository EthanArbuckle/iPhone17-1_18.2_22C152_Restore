@interface GCHIDServiceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHIDServiceInfo:(id)a3;
- (GCHIDServiceInfo)init;
- (GCHIDServiceInfo)initWithService:(__IOHIDServiceClient *)a3 queue:(id)a4;
- (NSNumber)registryID;
- (OS_dispatch_queue)queue;
- (__IOHIDServiceClient)service;
- (id)debugDescription;
- (id)description;
- (id)dictionaryPropertyForKey:(id)a3;
- (id)numberPropertyForKey:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)propertyForKey:(id)a3 ofClass:(Class)a4;
- (id)redactedDescription;
- (id)stringPropertyForKey:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation GCHIDServiceInfo

- (GCHIDServiceInfo)initWithService:(__IOHIDServiceClient *)a3 queue:(id)a4
{
  v7 = a4;
  v8 = v7;
  if (!a3)
  {
    v16 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCHIDServiceInfo.m", 21, @"Invalid parameter not satisfying: %s", "service != NULL");

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCHIDServiceInfo.m", 22, @"Invalid parameter not satisfying: %s", "hidSystemClientQueue != NULL");

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  dispatch_assert_queue_V2(v8);
  v18.receiver = self;
  v18.super_class = (Class)GCHIDServiceInfo;
  v9 = [(GCHIDServiceInfo *)&v18 init];
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v8;
  v11 = v8;

  v12 = (__IOHIDServiceClient *)CFRetain(a3);
  v9->_service = v12;
  uint64_t v13 = IOHIDServiceClientGetRegistryID(v12);
  registryID = v9->_registryID;
  v9->_registryID = (NSNumber *)v13;

  return v9;
}

- (GCHIDServiceInfo)init
{
  return self;
}

- (void)dealloc
{
  CFRelease(self->_service);
  self->_service = 0;
  v3.receiver = self;
  v3.super_class = (Class)GCHIDServiceInfo;
  [(GCHIDServiceInfo *)&v3 dealloc];
}

- (BOOL)isEqualToHIDServiceInfo:(id)a3
{
  registryID = self->_registryID;
  v4 = [a3 registryID];
  LOBYTE(registryID) = [(NSNumber *)registryID isEqual:v4];

  return (char)registryID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [(GCHIDServiceInfo *)self isEqualToHIDServiceInfo:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    char v5 = [(NSNumber *)self->_registryID isEqual:v4];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_registryID hash];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ registryID='%#010llx'>", objc_opt_class(), [(NSNumber *)self->_registryID longLongValue]];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<%@ registryID='%#010llx'>", objc_opt_class(), [(NSNumber *)self->_registryID longLongValue]];
}

- (id)debugDescription
{
  uint64_t v3 = [(NSNumber *)self->_registryID longLongValue];
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  BOOL v6 = +[NSString stringWithFormat:@"<%@ %p registryID='%#010llx'>", v5, self, v3];

  return v6;
}

- (id)propertyForKey:(id)a3
{
  uint64_t v3 = (void *)IOHIDServiceClientCopyProperty(self->_service, (CFStringRef)a3);

  return v3;
}

- (id)propertyForKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v5 = [(GCHIDServiceInfo *)self propertyForKey:a3];
  BOOL v6 = (void *)v5;
  if (a4 && v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    BOOL v6 = 0;
  }

  return v6;
}

- (id)stringPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCHIDServiceInfo *)self propertyForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)numberPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCHIDServiceInfo *)self propertyForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)dictionaryPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GCHIDServiceInfo *)self propertyForKey:v4 ofClass:objc_opt_class()];

  return v5;
}

- (__IOHIDServiceClient)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)registryID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end