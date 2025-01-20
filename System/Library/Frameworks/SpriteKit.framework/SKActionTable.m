@interface SKActionTable
+ (BOOL)supportsSecureCoding;
+ (id)actionTableWithContentsOfDictionary:(id)a3;
- (BOOL)isEqualToActionTable:(id)a3;
- (NSDictionary)actionTableDictionary;
- (NSMutableDictionary)_info;
- (SKActionTable)initWithCoder:(id)a3;
- (SKActionTable)initWithContentsOfDictionary:(id)a3;
- (id)actionForName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_info:(id)a3;
@end

@implementation SKActionTable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionTableWithContentsOfDictionary:(id)a3
{
  id v3 = a3;
  v4 = [[SKActionTable alloc] initWithContentsOfDictionary:v3];

  return v4;
}

- (SKActionTable)initWithContentsOfDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKActionTable;
  v5 = [(SKActionTable *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [NSDictionary dictionaryWithDictionary:v4];
    actionTableDictionary = v5->_actionTableDictionary;
    v5->_actionTableDictionary = (NSDictionary *)v6;

    info = v5->__info;
    v5->__info = 0;
  }
  return v5;
}

- (SKActionTable)initWithCoder:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKActionTable;
  v5 = [(SKActionTable *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_actionTableDict"];
    actionTableDictionary = v5->_actionTableDictionary;
    v5->_actionTableDictionary = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v6 forKey:@"_info"];
    info = v5->__info;
    v5->__info = (NSMutableDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_actionTableDictionary forKey:@"_actionTableDict"];
  [v4 encodeObject:self->__info forKey:@"_info"];
}

- (BOOL)isEqualToActionTable:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (SKActionTable *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_actionTableDictionary;
    uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_super v10 = -[NSDictionary objectForKey:](self->_actionTableDictionary, "objectForKey:", v9, (void)v15);
          uint64_t v11 = [(NSDictionary *)v4->_actionTableDictionary objectForKey:v9];
          if (!v11)
          {

LABEL_15:
            BOOL v13 = 0;
            goto LABEL_16;
          }
          char v12 = [v10 isEqualToAction:v11];

          if ((v12 & 1) == 0) {
            goto LABEL_15;
          }
        }
        uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v13 = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v13 = 1;
    }
LABEL_16:
  }
  return v13;
}

- (id)actionForName:(id)a3
{
  id v3 = [(NSDictionary *)self->_actionTableDictionary objectForKeyedSubscript:a3];

  return v3;
}

- (NSDictionary)actionTableDictionary
{
  return self->_actionTableDictionary;
}

- (NSMutableDictionary)_info
{
  return self->__info;
}

- (void)set_info:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__info, 0);

  objc_storeStrong((id *)&self->_actionTableDictionary, 0);
}

@end