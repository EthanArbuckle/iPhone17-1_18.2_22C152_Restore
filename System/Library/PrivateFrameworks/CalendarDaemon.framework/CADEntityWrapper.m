@interface CADEntityWrapper
+ (BOOL)supportsSecureCoding;
- (CADEntityWrapper)initWithCalEntity:(void *)a3;
- (CADEntityWrapper)initWithCalEntity:(void *)a3 loadedValues:(id)a4;
- (CADEntityWrapper)initWithCoder:(id)a3;
- (id)loadedValues;
- (id)objectID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADEntityWrapper

- (id)loadedValues
{
  return self->_loadedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_loadedValues, 0);
}

- (id)objectID
{
  return self->_objectID;
}

- (CADEntityWrapper)initWithCalEntity:(void *)a3 loadedValues:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADEntityWrapper;
  v7 = [(CADEntityWrapper *)&v12 init];
  if (v7)
  {
    v7->_entityType = CalEntityGetType();
    v7->_rowID = CalEntityGetID();
    uint64_t v8 = CADEntityCopyObjectID();
    objectID = v7->_objectID;
    v7->_objectID = (CADObjectID *)v8;

    v7->_databaseID = [(CADObjectID *)v7->_objectID databaseID];
    if (!v7->_objectID)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v7->_loadedValues, a4);
  }
  v10 = v7;
LABEL_6:

  return v10;
}

- (CADEntityWrapper)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"CADEntityWrapper.m" lineNumber:60 description:@"wha!"];
  }
  v16.receiver = self;
  v16.super_class = (Class)CADEntityWrapper;
  id v6 = [(CADEntityWrapper *)&v16 init];
  if (v6)
  {
    if (initWithCoder__onceToken_1 != -1) {
      dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_26);
    }
    uint64_t v7 = [v5 decodeIntForKey:@"entityType"];
    uint64_t v8 = [v5 decodeIntForKey:@"rowID"];
    uint64_t v9 = [v5 decodeIntForKey:@"dbID"];
    uint64_t v10 = [v5 decodeObjectOfClasses:initWithCoder__allowedObjectClasses forKey:@"objects"];
    loadedValues = v6->_loadedValues;
    v6->_loadedValues = (NSArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:v7 entityID:v8 databaseID:v9];
    objectID = v6->_objectID;
    v6->_objectID = (CADObjectID *)v12;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CADEntityWrapper.m" lineNumber:83 description:@"wha!"];
  }
  [v8 encodeInt:self->_entityType forKey:@"entityType"];
  [v8 encodeInt:self->_rowID forKey:@"rowID"];
  uint64_t databaseID = self->_databaseID;
  if (databaseID) {
    [v8 encodeInt:databaseID forKey:@"dbID"];
  }
  loadedValues = self->_loadedValues;
  if (loadedValues) {
    [v8 encodeObject:loadedValues forKey:@"objects"];
  }
}

uint64_t __34__CADEntityWrapper_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)initWithCoder__allowedKeyClasses;
  initWithCoder__allowedKeyClasses = v2;

  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  initWithCoder__allowedObjectClasses = v11;
  return MEMORY[0x1F41817F8](v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADEntityWrapper)initWithCalEntity:(void *)a3
{
  return [(CADEntityWrapper *)self initWithCalEntity:a3 loadedValues:0];
}

@end