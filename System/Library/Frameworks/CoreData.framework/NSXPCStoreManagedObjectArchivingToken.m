@interface NSXPCStoreManagedObjectArchivingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSXPCStoreManagedObjectArchivingToken)initWithCoder:(id)a3;
- (NSXPCStoreManagedObjectArchivingToken)initWithURI:(id)a3;
- (id)URI;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSXPCStoreManagedObjectArchivingToken

- (NSXPCStoreManagedObjectArchivingToken)initWithURI:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSXPCStoreManagedObjectArchivingToken;
  v4 = [(NSXPCStoreManagedObjectArchivingToken *)&v6 init];
  if (v4) {
    v4->_managedObjectReferenceURI = (NSURL *)a3;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSXPCStoreManagedObjectArchivingToken)initWithCoder:(id)a3
{
  v4 = self;
  v5 = (void *)MEMORY[0x18C127630](self, a2);
  objc_super v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSManagedObjectIDURI"];
  v7 = (void *)[a3 delegate];
  if ([a3 requiresSecureCoding])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (v8 = (void *)[a3 userInfo]) != 0)
    {
      v9 = v8;
      id v10 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"NSConnectionContext"), "managedObjectContext"), "persistentStoreCoordinator");
      if (v10) {
        goto LABEL_17;
      }
      id v10 = (id)[v9 valueForKey:@"PSCKey"];
      if (v10) {
        goto LABEL_16;
      }
    }
    else
    {
      id v10 = 0;
    }
    if (!v7) {
      goto LABEL_16;
    }
  }
  else if (!v7)
  {
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = objc_msgSend((id)objc_msgSend(v7, "managedObjectContext"), "persistentStoreCoordinator");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_20:
      NSLog((NSString *)@"NSMOIDArchivingToken escaping un-de-tokenized (secured %d).", [a3 requiresSecureCoding]);
LABEL_26:
      v20 = [(NSXPCStoreManagedObjectArchivingToken *)v4 init];
      v20->_managedObjectReferenceURI = (NSURL *)v6;
      goto LABEL_27;
    }
    v11 = (void *)[v7 _persistentStoreCoordinator];
  }
  id v10 = v11;
LABEL_16:
  if (!v10) {
    goto LABEL_20;
  }
LABEL_17:
  id v12 = v10;
  if (!v6)
  {
    _NSCoreDataLog(1, @"XPC: Missing oid uri", v13, v14, v15, v16, v17, v18, v28);
    goto LABEL_26;
  }
  v19 = (NSXPCStoreManagedObjectArchivingToken *)(id)[v10 managedObjectIDForURIRepresentation:v6];
  if (v19)
  {
    v20 = v19;

    goto LABEL_27;
  }
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(1, @"XPC: Possible API misuse: Unable to find object for managed object URI %@, returning null instead", v21, v22, v23, v24, v25, v26, (uint64_t)v6);
  }

  v20 = (NSXPCStoreManagedObjectArchivingToken *)[MEMORY[0x1E4F1CA98] null];
  if (!v20)
  {
    v4 = 0;
    goto LABEL_26;
  }
LABEL_27:
  return v20;
}

- (void)dealloc
{
  self->_managedObjectReferenceURI = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreManagedObjectArchivingToken;
  [(NSXPCStoreManagedObjectArchivingToken *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)URI
{
  return self->_managedObjectReferenceURI;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    managedObjectReferenceURI = self->_managedObjectReferenceURI;
    uint64_t v7 = *((void *)a3 + 1);
    LOBYTE(v5) = [(NSURL *)managedObjectReferenceURI isEqual:v7];
  }
  return v5;
}

@end