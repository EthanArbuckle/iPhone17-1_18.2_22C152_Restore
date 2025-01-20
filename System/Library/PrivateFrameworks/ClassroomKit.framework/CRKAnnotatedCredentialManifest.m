@interface CRKAnnotatedCredentialManifest
+ (BOOL)supportsSecureCoding;
+ (CRKAnnotatedCredentialManifest)manifestWithData:(id)a3;
- (BOOL)isEmpty;
- (BOOL)modified;
- (CRKAnnotatedCredentialManifest)init;
- (CRKAnnotatedCredentialManifest)initWithCoder:(id)a3;
- (NSMutableDictionary)annotationsByPersistentID;
- (NSSet)persistentIDs;
- (id)annotationForPersistentID:(id)a3;
- (id)dataRepresentation;
- (void)addPersistentID:(id)a3 withAnnotation:(id)a4;
- (void)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)removePersistentID:(id)a3;
- (void)setModified:(BOOL)a3;
@end

@implementation CRKAnnotatedCredentialManifest

+ (CRKAnnotatedCredentialManifest)manifestWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    v4 = objc_msgSend(MEMORY[0x263F08928], "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v3, &v8);
    id v5 = v8;
    if (!v4)
    {
      v6 = _CRKLogASM_19();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[CRKAnnotatedCredentialManifest manifestWithData:](v5);
      }
    }
  }
  else
  {
    v4 = objc_opt_new();
  }

  return (CRKAnnotatedCredentialManifest *)v4;
}

- (CRKAnnotatedCredentialManifest)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKAnnotatedCredentialManifest;
  v2 = [(CRKAnnotatedCredentialManifest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    annotationsByPersistentID = v2->_annotationsByPersistentID;
    v2->_annotationsByPersistentID = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)dataRepresentation
{
  if ([(CRKAnnotatedCredentialManifest *)self isEmpty])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v8 = 0;
    uint64_t v3 = objc_msgSend(MEMORY[0x263F08910], "cat_archivedDataWithRootObject:error:", self, &v8);
    id v4 = v8;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      objc_super v6 = _CRKLogASM_19();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CRKAnnotatedCredentialManifest dataRepresentation](v4);
      }
    }
  }

  return v3;
}

- (NSSet)persistentIDs
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
  id v4 = [v3 allKeys];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)annotationForPersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (void)addPersistentID:(id)a3 withAnnotation:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
  uint64_t v8 = [v7 objectForKeyedSubscript:v11];

  if (v6)
  {
    uint64_t v9 = (uint64_t)v6;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
    if (!(v8 | v9))
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
  }
  if (([(id)v8 isEqual:v9] & 1) == 0)
  {
    v10 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
    [v10 setObject:v9 forKeyedSubscript:v11];

    [(CRKAnnotatedCredentialManifest *)self setModified:1];
  }
LABEL_7:
}

- (void)removePersistentID:(id)a3
{
  id v7 = a3;
  id v4 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
  id v5 = [v4 objectForKeyedSubscript:v7];

  if (v5)
  {
    id v6 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
    [v6 setObject:0 forKeyedSubscript:v7];

    [(CRKAnnotatedCredentialManifest *)self setModified:1];
  }
}

- (BOOL)isEmpty
{
  v2 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKAnnotatedCredentialManifest *)self annotationsByPersistentID];
  [v4 encodeObject:v5 forKey:@"annotationsByPersistentID"];
}

- (CRKAnnotatedCredentialManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKAnnotatedCredentialManifest;
  id v5 = [(CRKAnnotatedCredentialManifest *)&v21 init];
  if (v5)
  {
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"annotationsByPersistentID"];
    annotationsByPersistentID = v5->_annotationsByPersistentID;
    v5->_annotationsByPersistentID = (NSMutableDictionary *)v15;
  }
  return v5;
}

- (NSMutableDictionary)annotationsByPersistentID
{
  return self->_annotationsByPersistentID;
}

- (BOOL)modified
{
  return self->_modified;
}

- (void)setModified:(BOOL)a3
{
  self->_modified = a3;
}

- (void).cxx_destruct
{
}

+ (void)manifestWithData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Failed to deserialize credential store manifest: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)dataRepresentation
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Failed to serialize credential store manifest: %{public}@", v4, v5, v6, v7, 2u);
}

@end