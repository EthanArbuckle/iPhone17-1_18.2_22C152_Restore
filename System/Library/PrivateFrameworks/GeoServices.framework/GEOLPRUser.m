@interface GEOLPRUser
+ (BOOL)isValid:(id)a3;
+ (Class)vehiclesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRUser)initWithDictionary:(id)a3;
- (GEOLPRUser)initWithJSON:(id)a3;
- (NSMutableDictionary)vehicles;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)vehiclesForKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)vehiclesCount;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearVehicles;
- (void)copyTo:(id)a3;
- (void)enumerateVehiclesUsingBlock:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setVehicles:(id)a3;
- (void)setVehiclesValue:(id)a3 forKey:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRUser

- (NSMutableDictionary)vehicles
{
  return self->_vehicles;
}

- (void)setVehicles:(id)a3
{
}

- (void)clearVehicles
{
}

- (void)setVehiclesValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  vehicles = self->_vehicles;
  if (!vehicles)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_vehicles;
    self->_vehicles = v8;

    vehicles = self->_vehicles;
  }
  [(NSMutableDictionary *)vehicles setObject:v10 forKey:v6];
}

- (id)vehiclesForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_vehicles objectForKey:a3];
}

- (void)enumerateVehiclesUsingBlock:(id)a3
{
}

- (unint64_t)vehiclesCount
{
  return [(NSMutableDictionary *)self->_vehicles count];
}

+ (Class)vehiclesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRUser;
  v4 = [(GEOLPRUser *)&v8 description];
  v5 = [(GEOLPRUser *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRUser _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[1] count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
      id v6 = a1[1];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __40__GEOLPRUser__dictionaryRepresentation___block_invoke;
      v12 = &unk_1E53F62D0;
      id v13 = v5;
      char v14 = a2;
      id v7 = v5;
      [v6 enumerateKeysAndObjectsUsingBlock:&v9];
      objc_msgSend(v4, "setObject:forKey:", v7, @"vehicles", v9, v10, v11, v12);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRUser _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

void __40__GEOLPRUser__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a2;
  if (v5) {
    [a3 jsonRepresentation];
  }
  else {
  id v7 = [a3 dictionaryRepresentation];
  }
  [v4 setObject:v7 forKey:v6];
}

- (GEOLPRUser)initWithDictionary:(id)a3
{
  return (GEOLPRUser *)-[GEOLPRUser _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"vehicles"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v3;
        uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
        id v6 = (void *)a1[1];
        a1[1] = v5;

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v17 = v4;
        id v7 = v4;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, v17);
              char v14 = (void *)a1[1];
              v15 = [[GEOLPRVehicle alloc] initWithDictionary:v13];
              [v14 setObject:v15 forKey:v12];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v9);
        }

        v4 = v17;
        id v3 = v18;
      }
    }
  }

  return a1;
}

- (GEOLPRUser)initWithJSON:(id)a3
{
  return (GEOLPRUser *)-[GEOLPRUser _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRUserIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRUserReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  vehicles = self->_vehicles;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__GEOLPRUser_writeTo___block_invoke;
  v7[3] = &unk_1E53F62F8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)vehicles enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __22__GEOLPRUser_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLPRUser *)self readAll:0];
  if ([(GEOLPRUser *)self vehiclesCount])
  {
    [v4 clearVehicles];
    if (!v4[1])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = (void *)v4[1];
      v4[1] = v5;
    }
    vehicles = self->_vehicles;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __21__GEOLPRUser_copyTo___block_invoke;
    v8[3] = &unk_1E53F62F8;
    uint64_t v9 = v4;
    [(NSMutableDictionary *)vehicles enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __21__GEOLPRUser_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(NSMutableDictionary *)self->_vehicles count])
  {
    [v5 clearVehicles];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = (void *)v5[1];
    v5[1] = v6;

    vehicles = self->_vehicles;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__GEOLPRUser_copyWithZone___block_invoke;
    v10[3] = &unk_1E53F6320;
    uint64_t v12 = a3;
    v11 = v5;
    [(NSMutableDictionary *)vehicles enumerateKeysAndObjectsUsingBlock:v10];
  }
  return v5;
}

void __27__GEOLPRUser_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOLPRUser *)self readAll:1];
    [v4 readAll:1];
    vehicles = self->_vehicles;
    if ((unint64_t)vehicles | v4[1]) {
      char v5 = -[NSMutableDictionary isEqual:](vehicles, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOLPRUser *)self readAll:1];
  vehicles = self->_vehicles;

  return [(NSMutableDictionary *)vehicles hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  char v5 = (void *)v4[1];

  if (v5)
  {
    vehicles = self->_vehicles;
    if (vehicles)
    {
      [(NSMutableDictionary *)vehicles addEntriesFromDictionary:v5];
    }
    else
    {
      id v7 = (NSMutableDictionary *)[v5 copy];
      id v8 = self->_vehicles;
      self->_vehicles = v7;
    }
  }
}

- (void).cxx_destruct
{
}

@end