@interface CCSetChange
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSetChange:(id)a3;
- (CCSetChange)initWithSharedItem:(id)a3 sharedItemChangeType:(unsigned __int16)a4 allDevices:(id)a5 addedDevices:(id)a6 removedDevices:(id)a7 allLocalInstances:(id)a8 addedLocalInstances:(id)a9 removedLocalInstances:(id)a10;
- (CCSharedItem)sharedItem;
- (NSArray)addedDevices;
- (NSArray)addedLocalInstances;
- (NSArray)allDevices;
- (NSArray)allLocalInstances;
- (NSArray)removedDevices;
- (NSArray)removedLocalInstances;
- (id)description;
- (unint64_t)hash;
- (unsigned)sharedItemChangeType;
@end

@implementation CCSetChange

- (CCSetChange)initWithSharedItem:(id)a3 sharedItemChangeType:(unsigned __int16)a4 allDevices:(id)a5 addedDevices:(id)a6 removedDevices:(id)a7 allLocalInstances:(id)a8 addedLocalInstances:(id)a9 removedLocalInstances:(id)a10
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)CCSetChange;
  v18 = [(CCSetChange *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_sharedItemChangeType = a4;
    objc_storeStrong((id *)&v18->_sharedItem, a3);
    objc_storeStrong((id *)&v19->_allDevices, a5);
    objc_storeStrong((id *)&v19->_addedDevices, a6);
    objc_storeStrong((id *)&v19->_removedDevices, a7);
    objc_storeStrong((id *)&v19->_allLocalInstances, a8);
    objc_storeStrong((id *)&v19->_addedLocalInstances, a9);
    objc_storeStrong((id *)&v19->_removedLocalInstances, a10);
  }

  return v19;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CCSetChange *)self sharedItem];
  v7 = [v6 sharedIdentifier];
  uint64_t v8 = [v3 initWithFormat:@"\n%@ with sharedIdentifier: %@", v5, v7];

  id v9 = [NSString alloc];
  int v10 = [(CCSetChange *)self sharedItemChangeType];
  v11 = @"None";
  if (!v10) {
    v11 = @"SharedItemAdded";
  }
  if (v10 == 2) {
    v11 = @"SharedItemRemoved";
  }
  uint64_t v12 = [v9 initWithFormat:@"sharedItemChangeType: %@", v11];
  id v13 = [NSString alloc];
  v14 = [(CCSetChange *)self sharedItem];
  v15 = (void *)[v13 initWithFormat:@"sharedItem: %@", v14];

  id v16 = [NSString alloc];
  id v17 = [(CCSetChange *)self addedDevices];
  v18 = (void *)[v16 initWithFormat:@"addedDevices: %@", v17];

  id v19 = [NSString alloc];
  v20 = [(CCSetChange *)self removedDevices];
  v39 = (void *)[v19 initWithFormat:@"removedDevices: %@", v20];

  id v21 = [NSString alloc];
  id v22 = [(CCSetChange *)self addedLocalInstances];
  id v23 = (void *)[v21 initWithFormat:@"addedLocalInstances: %@", v22];

  id v24 = [NSString alloc];
  id v25 = [(CCSetChange *)self removedLocalInstances];
  id v26 = (void *)[v24 initWithFormat:@"removedLocalInstances: %@", v25];

  objc_super v27 = objc_opt_new();
  v40 = (void *)v8;
  [v27 addObject:v8];
  [v27 addObject:v15];
  v28 = (void *)v12;
  [v27 addObject:v12];
  v29 = [(CCSetChange *)self addedDevices];
  uint64_t v30 = [v29 count];

  if (v30) {
    [v27 addObject:v18];
  }
  v31 = [(CCSetChange *)self addedLocalInstances];
  uint64_t v32 = [v31 count];

  if (v32) {
    [v27 addObject:v23];
  }
  v33 = [(CCSetChange *)self removedDevices];
  uint64_t v34 = [v33 count];

  if (v34) {
    [v27 addObject:v39];
  }
  v35 = [(CCSetChange *)self removedLocalInstances];
  uint64_t v36 = [v35 count];

  if (v36) {
    [v27 addObject:v26];
  }
  v37 = [v27 componentsJoinedByString:@"\n"];

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCSetChange *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCSetChange *)self isEqualToSetChange:v5];

  return v6;
}

- (BOOL)isEqualToSetChange:(id)a3
{
  id v4 = a3;
  v5 = [(CCSetChange *)self sharedItem];
  BOOL v6 = [v4 sharedItem];
  char v28 = [v5 isEqual:v6];

  int sharedItemChangeType = self->_sharedItemChangeType;
  LODWORD(v5) = [v4 sharedItemChangeType];
  allDevices = self->_allDevices;
  id v9 = [v4 allDevices];
  BOOL v10 = [(NSArray *)allDevices isEqualToArray:v9];

  addedDevices = self->_addedDevices;
  uint64_t v12 = [v4 addedDevices];
  BOOL v13 = [(NSArray *)addedDevices isEqualToArray:v12];

  removedDevices = self->_removedDevices;
  v15 = [v4 removedDevices];
  BOOL v16 = [(NSArray *)removedDevices isEqualToArray:v15];

  allLocalInstances = self->_allLocalInstances;
  v18 = [v4 allLocalInstances];
  BOOL v19 = [(NSArray *)allLocalInstances isEqualToArray:v18];

  addedLocalInstances = self->_addedLocalInstances;
  id v21 = [v4 addedLocalInstances];
  BOOL v22 = [(NSArray *)addedLocalInstances isEqualToArray:v21];

  removedLocalInstances = self->_removedLocalInstances;
  id v24 = [v4 removedLocalInstances];

  BOOL v25 = [(NSArray *)removedLocalInstances isEqualToArray:v24];
  char v26 = v28;
  if (sharedItemChangeType != v5) {
    char v26 = 0;
  }
  return v26 & (v10 && v13) & (v16 && v19 && v22) & v25;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CCSharedItem *)self->_sharedItem hash];
  id v4 = [NSNumber numberWithUnsignedShort:self->_sharedItemChangeType];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v3 ^ [(NSArray *)self->_allDevices hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_addedDevices hash];
  uint64_t v8 = [(NSArray *)self->_removedDevices hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_allLocalInstances hash];
  uint64_t v10 = v9 ^ [(NSArray *)self->_addedLocalInstances hash];
  unint64_t v11 = v7 ^ v10 ^ [(NSArray *)self->_removedLocalInstances hash];

  return v11;
}

- (CCSharedItem)sharedItem
{
  return self->_sharedItem;
}

- (unsigned)sharedItemChangeType
{
  return self->_sharedItemChangeType;
}

- (NSArray)allDevices
{
  return self->_allDevices;
}

- (NSArray)addedDevices
{
  return self->_addedDevices;
}

- (NSArray)removedDevices
{
  return self->_removedDevices;
}

- (NSArray)allLocalInstances
{
  return self->_allLocalInstances;
}

- (NSArray)addedLocalInstances
{
  return self->_addedLocalInstances;
}

- (NSArray)removedLocalInstances
{
  return self->_removedLocalInstances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedLocalInstances, 0);
  objc_storeStrong((id *)&self->_addedLocalInstances, 0);
  objc_storeStrong((id *)&self->_allLocalInstances, 0);
  objc_storeStrong((id *)&self->_removedDevices, 0);
  objc_storeStrong((id *)&self->_addedDevices, 0);
  objc_storeStrong((id *)&self->_allDevices, 0);

  objc_storeStrong((id *)&self->_sharedItem, 0);
}

@end