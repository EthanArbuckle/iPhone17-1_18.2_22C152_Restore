@interface MTRPluginPBMVariableValueList
+ (Class)valueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMVariableValueList)initWithArray:(id)a3;
- (MTRPluginPBMVariableValueList)initWithSet:(id)a3;
- (NSArray)array;
- (NSMutableArray)values;
- (NSSet)set;
- (id)_convertArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValue:(id)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArray:(id)a3;
- (void)setSet:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMVariableValueList

- (MTRPluginPBMVariableValueList)initWithArray:(id)a3
{
  id v4 = a3;
  v5 = [(MTRPluginPBMVariableValueList *)self init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = [(MTRPluginPBMVariableValueList *)v5 _convertArray:v4];
      if (v7)
      {
        [(MTRPluginPBMVariableValueList *)v6 setValues:v7];
        v8 = v6;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MTRPluginPBMVariableValueList)initWithSet:(id)a3
{
  id v4 = [a3 allObjects];
  v5 = [(MTRPluginPBMVariableValueList *)self initWithArray:v4];

  return v5;
}

- (id)_convertArray:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      v7 = [MTRPluginPBMVariableValue alloc];
      v8 = [v3 objectAtIndexedSubscript:v6];
      v9 = [(MTRPluginPBMVariableValue *)v7 initWithObjectValue:v8];

      if (!v9) {
        break;
      }
      [v3 replaceObjectAtIndex:v6 withObject:v9];

      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
    id v10 = 0;
  }
  else
  {
LABEL_5:
    id v10 = v3;
  }

  return v10;
}

- (void)setArray:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[MTRPluginPBMVariableValueList _convertArray:](self, "_convertArray:");
    if (v4) {
      [(MTRPluginPBMVariableValueList *)self setValues:v4];
    }
    MEMORY[0x270F9A758]();
  }
  else
  {
    -[MTRPluginPBMVariableValueList setValues:](self, "setValues:");
  }
}

- (NSArray)array
{
  v2 = [(MTRPluginPBMVariableValueList *)self values];
  v3 = (void *)[v2 mutableCopy];

  if (!v3)
  {
    id v9 = [MEMORY[0x263EFF8C0] array];
    goto LABEL_8;
  }
  uint64_t v4 = [v3 count];
  if (!v4)
  {
LABEL_6:
    id v9 = v3;
LABEL_8:
    id v10 = v9;
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  while (1)
  {
    v7 = [v3 objectAtIndexedSubscript:v6];
    v8 = [v7 object];

    if (!v8) {
      break;
    }
    [v3 replaceObjectAtIndex:v6 withObject:v8];

    if (v5 == ++v6) {
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_9:

  return (NSArray *)v10;
}

- (void)setSet:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 allObjects];
    id v6 = [(MTRPluginPBMVariableValueList *)self _convertArray:v4];

    uint64_t v5 = v6;
    if (v6)
    {
      [(MTRPluginPBMVariableValueList *)self setValues:v6];
      uint64_t v5 = v6;
    }
  }
  else
  {
    -[MTRPluginPBMVariableValueList setValues:](self, "setValues:");
  }
}

- (NSSet)set
{
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v4 = [(MTRPluginPBMVariableValueList *)self array];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (void)clearValues
{
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v8 = v4;
  if (!values)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_values;
    self->_values = v6;

    id v4 = v8;
    values = self->_values;
  }
  [(NSMutableArray *)values addObject:v4];
}

- (unint64_t)valuesCount
{
  return [(NSMutableArray *)self->_values count];
}

- (id)valueAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_values objectAtIndex:a3];
}

+ (Class)valueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMVariableValueList;
  id v4 = [(MTRPluginPBMVariableValueList *)&v8 description];
  uint64_t v5 = [(MTRPluginPBMVariableValueList *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_values count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_values, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_values;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"value"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMVariableValueListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_values;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(MTRPluginPBMVariableValueList *)self valuesCount])
  {
    [v8 clearValues];
    unint64_t v4 = [(MTRPluginPBMVariableValueList *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MTRPluginPBMVariableValueList *)self valueAtIndex:i];
        [v8 addValue:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_values;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addValue:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    values = self->_values;
    if ((unint64_t)values | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](values, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_values hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[MTRPluginPBMVariableValueList addValue:](self, "addValue:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end