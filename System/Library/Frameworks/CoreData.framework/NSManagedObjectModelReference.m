@interface NSManagedObjectModelReference
- (BOOL)resolve:(id *)a3;
- (NSBundle)bundle;
- (NSDictionary)entityVersionHashes;
- (NSManagedObjectModel)model;
- (NSManagedObjectModel)resolvedModel;
- (NSManagedObjectModelReference)initWithEntityVersionHashes:(NSDictionary *)versionHash inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum;
- (NSManagedObjectModelReference)initWithFileURL:(NSURL *)fileURL versionChecksum:(NSString *)versionChecksum;
- (NSManagedObjectModelReference)initWithModel:(NSManagedObjectModel *)model versionChecksum:(NSString *)versionChecksum;
- (NSManagedObjectModelReference)initWithName:(NSString *)modelName inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum;
- (NSString)modelName;
- (NSString)versionChecksum;
- (NSURL)fileURL;
- (void)dealloc;
- (void)setBundle:(id)a3;
- (void)setEntityVersionHashes:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelName:(id)a3;
- (void)unresolve;
@end

@implementation NSManagedObjectModelReference

- (void)unresolve
{
  self->_resolvedModel = 0;
}

- (NSManagedObjectModel)resolvedModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)resolve:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_resolvedModel) {
    return 1;
  }
  id v41 = 0;
  model = self->_model;
  if (model)
  {
    bundle = model;
LABEL_7:
    self->_resolvedModel = bundle;
    goto LABEL_8;
  }
  if (self->_fileURL)
  {
    bundle = [[NSManagedObjectModel alloc] initWithContentsOfURL:self->_fileURL];
    goto LABEL_7;
  }
  bundle = (NSManagedObjectModel *)self->_bundle;
  if (!bundle)
  {
LABEL_8:
    [(NSManagedObjectModel *)bundle _setIsEditable:0];
    if (![(NSString *)[(NSManagedObjectModel *)self->_resolvedModel versionChecksum] isEqualToString:self->_versionChecksum])
    {
      id v41 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134100, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"The version hash (and associated hashes) are incompatible with the current Core Data version.", @"reason", -[NSManagedObjectModel versionHash](self->_resolvedModel, "versionHash"), @"versionHash", self->_versionChecksum, @"checksum", 0));

      self->_resolvedModel = 0;
    }
    goto LABEL_10;
  }
  modelName = self->_modelName;
  if (!modelName)
  {
    if (!self->_entityVersionHashes)
    {
      bundle = 0;
      goto LABEL_8;
    }
    v45 = bundle;
    v19 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)NSManagedObjectModel, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
LABEL_30:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v32 + 1) + 8 * v23)];
        id v25 = +[NSManagedObjectModel versionsHashesForModelAtURL:v24 error:&v41];
        if (v41) {
          break;
        }
        if ([v25 isEqualToDictionary:self->_entityVersionHashes])
        {
          resolvedModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:v24];
          self->_resolvedModel = resolvedModel;
          goto LABEL_44;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v21) {
            goto LABEL_30;
          }
          break;
        }
      }
    }
    resolvedModel = self->_resolvedModel;
LABEL_44:
    if (resolvedModel)
    {
      id v12 = v41;
      goto LABEL_49;
    }
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F281F8];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v43 = [NSString stringWithFormat:@"A model with version hashes %@ could not be found in the bundle at %@.", self->_entityVersionHashes, -[NSBundle bundlePath](self->_bundle, "bundlePath")];
    v29 = (void *)MEMORY[0x1E4F1C9E8];
    v30 = &v43;
    v31 = &v42;
    goto LABEL_47;
  }
  v10 = (void *)[(NSManagedObjectModel *)bundle URLForResource:modelName withExtension:@"momd"];
  v40 = 0;
  v11 = +[NSManagedObjectModel checksumsForVersionedModelAtURL:v10 error:&v40];
  id v12 = v40;
  if (!v40)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v13 = [(NSDictionary *)v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", v17), "isEqualToString:", self->_versionChecksum))
          {
            v18 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", v17), "URLByAppendingPathExtension:", @"mom"));
            self->_resolvedModel = v18;
            goto LABEL_39;
          }
        }
        uint64_t v14 = [(NSDictionary *)v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    v18 = self->_resolvedModel;
LABEL_39:
    if (v18)
    {
      id v12 = 0;
      goto LABEL_49;
    }
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F281F8];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    uint64_t v47 = [NSString stringWithFormat:@"A model with version checksum %@ could not be found in the bundle at %@.", self->_versionChecksum, -[NSBundle bundlePath](self->_bundle, "bundlePath")];
    v29 = (void *)MEMORY[0x1E4F1C9E8];
    v30 = &v47;
    v31 = &v46;
LABEL_47:
    id v12 = (id)objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 134504, objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1));
  }
  id v41 = v12;
LABEL_49:
  if (!v12)
  {
    bundle = self->_resolvedModel;
    goto LABEL_8;
  }
LABEL_10:
  id v8 = v41;
  if (a3)
  {
    if (v41)
    {
      *a3 = v41;
      id v8 = v41;
    }
  }
  return v8 == 0;
}

- (NSManagedObjectModelReference)initWithName:(NSString *)modelName inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum
{
  v11.receiver = self;
  v11.super_class = (Class)NSManagedObjectModelReference;
  id v8 = [(NSManagedObjectModelReference *)&v11 init];
  if (v8)
  {
    v8->_modelName = (NSString *)[(NSString *)modelName copy];
    if (bundle) {
      v9 = bundle;
    }
    else {
      v9 = (NSBundle *)(id)[MEMORY[0x1E4F28B50] mainBundle];
    }
    v8->_bundle = v9;
    v8->_versionChecksum = (NSString *)[(NSString *)versionChecksum copy];
  }
  return v8;
}

- (NSString)versionChecksum
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSManagedObjectModelReference)initWithFileURL:(NSURL *)fileURL versionChecksum:(NSString *)versionChecksum
{
  v8.receiver = self;
  v8.super_class = (Class)NSManagedObjectModelReference;
  v6 = [(NSManagedObjectModelReference *)&v8 init];
  if (v6)
  {
    v6->_fileURL = (NSURL *)[(NSURL *)fileURL copy];
    v6->_versionChecksum = (NSString *)[(NSString *)versionChecksum copy];
  }
  return v6;
}

- (NSManagedObjectModelReference)initWithEntityVersionHashes:(NSDictionary *)versionHash inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum
{
  v11.receiver = self;
  v11.super_class = (Class)NSManagedObjectModelReference;
  objc_super v8 = [(NSManagedObjectModelReference *)&v11 init];
  if (v8)
  {
    v8->_entityVersionHashes = (NSDictionary *)[(NSDictionary *)versionHash copy];
    if (bundle) {
      v9 = bundle;
    }
    else {
      v9 = (NSBundle *)(id)[MEMORY[0x1E4F28B50] mainBundle];
    }
    v8->_bundle = v9;
    v8->_versionChecksum = (NSString *)[(NSString *)versionChecksum copy];
  }
  return v8;
}

- (NSManagedObjectModelReference)initWithModel:(NSManagedObjectModel *)model versionChecksum:(NSString *)versionChecksum
{
  v8.receiver = self;
  v8.super_class = (Class)NSManagedObjectModelReference;
  v6 = [(NSManagedObjectModelReference *)&v8 init];
  if (v6)
  {
    v6->_model = (NSManagedObjectModel *)[(NSManagedObjectModel *)model copy];
    v6->_versionChecksum = (NSString *)[(NSString *)versionChecksum copy];
  }
  return v6;
}

- (void)dealloc
{
  self->_fileURL = 0;
  self->_versionChecksum = 0;

  self->_bundle = 0;
  self->_modelName = 0;

  self->_entityVersionHashes = 0;
  self->_model = 0;

  self->_resolvedModel = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSManagedObjectModelReference;
  [(NSManagedObjectModelReference *)&v3 dealloc];
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileURL:(id)a3
{
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundle:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSDictionary)entityVersionHashes
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEntityVersionHashes:(id)a3
{
}

- (NSManagedObjectModel)model
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
}

@end