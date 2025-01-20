@interface ACProtobufVariableValueList
+ (Class)valueType;
- (ACProtobufVariableValueList)initWithArray:(id)a3;
- (ACProtobufVariableValueList)initWithSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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

@implementation ACProtobufVariableValueList

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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufVariableValueList;
  id v4 = [(ACProtobufVariableValueList *)&v8 description];
  v5 = [(ACProtobufVariableValueList *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_values count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_values, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_values;
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
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
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
  return ACProtobufVariableValueListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_values;
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
  if ([(ACProtobufVariableValueList *)self valuesCount])
  {
    [v8 clearValues];
    unint64_t v4 = [(ACProtobufVariableValueList *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACProtobufVariableValueList *)self valueAtIndex:i];
        [v8 addValue:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
  uint64_t v14 = *MEMORY[0x1E4F143B8];
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
        -[ACProtobufVariableValueList addValue:](self, "addValue:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
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

- (ACProtobufVariableValueList)initWithArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACProtobufVariableValueList *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [(ACProtobufVariableValueList *)v5 _convertArray:v4];
      if (v7)
      {
        [(ACProtobufVariableValueList *)v6 setValues:v7];
        uint64_t v8 = v6;
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = v5;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (ACProtobufVariableValueList)initWithSet:(id)a3
{
  id v4 = [a3 allObjects];
  uint64_t v5 = [(ACProtobufVariableValueList *)self initWithArray:v4];

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
      uint64_t v7 = [ACProtobufVariableValue alloc];
      uint64_t v8 = [v3 objectAtIndexedSubscript:v6];
      long long v9 = [(ACProtobufVariableValue *)v7 initWithObjectValue:v8];

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
    uint64_t v4 = -[ACProtobufVariableValueList _convertArray:](self, "_convertArray:");
    if (v4) {
      [(ACProtobufVariableValueList *)self setValues:v4];
    }
    MEMORY[0x1F41817F8]();
  }
  else
  {
    -[ACProtobufVariableValueList setValues:](self, "setValues:");
  }
}

- (NSArray)array
{
  v2 = [(ACProtobufVariableValueList *)self values];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 object];

      if (!v8) {
        break;
      }
      [v3 replaceObjectAtIndex:v6 withObject:v8];

      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
    id v9 = 0;
  }
  else
  {
LABEL_5:
    id v9 = v3;
  }

  return (NSArray *)v9;
}

- (void)setSet:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 allObjects];
    id v6 = [(ACProtobufVariableValueList *)self _convertArray:v4];

    uint64_t v5 = v6;
    if (v6)
    {
      [(ACProtobufVariableValueList *)self setValues:v6];
      uint64_t v5 = v6;
    }
  }
  else
  {
    -[ACProtobufVariableValueList setValues:](self, "setValues:");
  }
}

- (NSSet)set
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [(ACProtobufVariableValueList *)self array];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

@end