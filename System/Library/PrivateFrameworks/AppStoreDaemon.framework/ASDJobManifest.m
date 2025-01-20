@interface ASDJobManifest
+ (BOOL)supportsSecureCoding;
- (ASDJobManifest)init;
- (ASDJobManifest)initWithCoder:(id)a3;
- (ASDJobManifest)initWithManifestType:(int64_t)a3;
- (NSNumber)purchaseID;
- (NSString)storeCorrelationID;
- (id)addActivity:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)manifestType;
- (unint64_t)count;
- (void)_addActivity:(void *)a3 withIdentifier:(void *)a4 persistentID:;
- (void)addActivity:(id)a3 withIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateActivitiesUsingBlock:(id)a3;
- (void)setPurchaseID:(id)a3;
- (void)setStoreCorrelationID:(id)a3;
@end

@implementation ASDJobManifest

- (ASDJobManifest)init
{
  return [(ASDJobManifest *)self initWithManifestType:0];
}

- (ASDJobManifest)initWithManifestType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDJobManifest;
  result = [(ASDJobManifest *)&v5 init];
  if (result) {
    result->_manifestType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = [+[ASDJobManifest allocWithZone:](ASDJobManifest, "allocWithZone:") initWithManifestType:self->_manifestType];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithArray:copyItems:", self->_activities, 1);
  activities = v5->_activities;
  v5->_activities = (NSMutableArray *)v6;

  uint64_t v8 = [(NSNumber *)self->_purchaseID copyWithZone:a3];
  purchaseID = v5->_purchaseID;
  v5->_purchaseID = (NSNumber *)v8;

  uint64_t v10 = [(NSString *)self->_storeCorrelationID copyWithZone:a3];
  storeCorrelationID = v5->_storeCorrelationID;
  v5->_storeCorrelationID = (NSString *)v10;

  return v5;
}

- (id)addActivity:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    objc_super v5 = [MEMORY[0x1E4F29128] UUID];
    v8[0] = 0;
    v8[1] = 0;
    [v5 getUUIDBytes:v8];
    uint64_t v6 = [NSNumber numberWithLongLong:v8[0]];
  }
  else
  {
    uint64_t v6 = 0;
  }
  -[ASDJobManifest _addActivity:withIdentifier:persistentID:]((uint64_t)self, v4, v6, v6);

  return v6;
}

- (void)_addActivity:(void *)a3 withIdentifier:(void *)a4 persistentID:
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v14 isValid]) {
      -[ASDJobActivity setPersistentID:]((uint64_t)v14, v8);
    }
    else {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Activity %@ is invalid: %@", v14, @"Missing bundle ID" format];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      uint64_t v10 = (void *)[v14 copy];
      [v9 addObject:v10];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = (void *)[v14 copy];
      uint64_t v12 = objc_msgSend(v11, "initWithObjects:", v10, 0);
      v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
  }
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_activities count];
}

- (void)enumerateActivitiesUsingBlock:(id)a3
{
  id v4 = a3;
  activities = self->_activities;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ASDJobManifest_enumerateActivitiesUsingBlock___block_invoke;
  v7[3] = &unk_1E58B4498;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)activities enumerateObjectsUsingBlock:v7];
}

uint64_t __48__ASDJobManifest_enumerateActivitiesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addActivity:(id)a3 withIdentifier:(id)a4
{
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ASDJobManifest;
  id v4 = [(ASDJobManifest *)&v9 description];
  unint64_t v5 = [(ASDJobManifest *)self count];
  id v6 = [(ASDJobManifest *)self storeCorrelationID];
  id v7 = [v3 stringWithFormat:@"%@: (%lu, %@)", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[ASDJobManifest initWithManifestType:](self, "initWithManifestType:", [v4 decodeIntegerForKey:@"manifestType"]);
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activities"];
    activities = v5->_activities;
    v5->_activities = (NSMutableArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseID"];
    purchaseID = v5->_purchaseID;
    v5->_purchaseID = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeCorrelationID"];
    storeCorrelationID = v5->_storeCorrelationID;
    v5->_storeCorrelationID = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  activities = self->_activities;
  id v5 = a3;
  [v5 encodeObject:activities forKey:@"activities"];
  [v5 encodeInteger:self->_manifestType forKey:@"manifestType"];
  [v5 encodeObject:self->_purchaseID forKey:@"purchaseID"];
  [v5 encodeObject:self->_storeCorrelationID forKey:@"storeCorrelationID"];
}

- (int64_t)manifestType
{
  return self->_manifestType;
}

- (NSNumber)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCorrelationID, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end