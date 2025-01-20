@interface DDUIPhysicalUnitGroup
- (BOOL)restrictedLinkification;
- (DDUIPhysicalUnitGroup)initWithName:(id)a3 units:(id)a4 restricted:(BOOL)a5 symbol:(id)a6;
- (NSArray)units;
- (NSString)name;
- (NSString)symbol;
- (id)symbolNameForValue:(double)a3 unit:(id)a4;
@end

@implementation DDUIPhysicalUnitGroup

- (NSArray)units
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (DDUIPhysicalUnitGroup)initWithName:(id)a3 units:(id)a4 restricted:(BOOL)a5 symbol:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)DDUIPhysicalUnitGroup;
  v14 = [(DDUIPhysicalUnitGroup *)&v26 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_units, a4);
    v15->_restrictedLinkification = a5;
    objc_storeStrong((id *)&v15->_symbol, a6);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20++), "setGroup:", v15, (void)v22);
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
  }
  return v15;
}

- (id)symbolNameForValue:(double)a3 unit:(id)a4
{
  id v6 = a4;
  p_isa = self->_symbol;
  v8 = [v6 group];
  if (v8 != self)
  {
    v9 = v8;
    goto LABEL_3;
  }
  BOOL v11 = [(NSString *)p_isa isEqualToString:@"thermometer"];

  if (v11)
  {
    id v12 = +[DDUIPhysicalUnit unitWithIdentifier:@"celsius"];
    v9 = v12;
    if (v12)
    {
      [(DDUIPhysicalUnitGroup *)v12 valueFrom:v6 unit:a3];
      if (v13 <= 0.0)
      {
        v14 = @"thermometer.snowflake";
      }
      else
      {
        if (v13 < 30.0) {
          goto LABEL_3;
        }
        v14 = @"thermometer.sun";
      }

      p_isa = &v14->isa;
    }
LABEL_3:
  }
  return p_isa;
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)restrictedLinkification
{
  return self->_restrictedLinkification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end