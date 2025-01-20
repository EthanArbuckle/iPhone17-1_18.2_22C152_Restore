@interface IDSCKContainer
+ (Class)__class;
+ (IDSCKContainer)containerWithIdentifier:(id)a3;
- (IDSCKDatabase)privateCloudDatabase;
- (IDSCKDatabase)publicCloudDatabase;
- (NSString)containerIdentifier;
@end

@implementation IDSCKContainer

+ (Class)__class
{
  if (qword_1E944F4B0 != -1) {
    dispatch_once(&qword_1E944F4B0, &unk_1EEFCDB78);
  }
  v2 = (void *)qword_1E944F4A8;
  return (Class)v2;
}

+ (IDSCKContainer)containerWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)CUTWeakLinkClass();
  v7 = objc_msgSend_containerWithIdentifier_(v4, v5, (uint64_t)v3, v6);

  return (IDSCKContainer *)v7;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (IDSCKDatabase)privateCloudDatabase
{
  return self->_privateCloudDatabase;
}

- (IDSCKDatabase)publicCloudDatabase
{
  return self->_publicCloudDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicCloudDatabase, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabase, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end