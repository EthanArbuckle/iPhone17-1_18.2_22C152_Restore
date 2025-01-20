@interface _CPListValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)values;
- (_CPListValue)initWithFacade:(id)a3;
- (id)valuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValues:(id)a3;
- (void)clearValues;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPListValue

- (void).cxx_destruct
{
}

- (NSArray)values
{
  return self->_values;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_values hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_CPListValue *)self values];
    v6 = [v4 values];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_CPListValue *)self values];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_CPListValue *)self values];
      v11 = [v4 values];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
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
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPListValueReadFrom(self, (uint64_t)a3);
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_values objectAtIndexedSubscript:a3];
}

- (unint64_t)valuesCount
{
  return [(NSArray *)self->_values count];
}

- (void)addValues:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v8 = v4;
  if (!values)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_values;
    self->_values = v6;

    id v4 = v8;
    values = self->_values;
  }
  [(NSArray *)values addObject:v4];
}

- (void)clearValues
{
}

- (void)setValues:(id)a3
{
  self->_values = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPListValue)initWithFacade:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CPListValue *)self init];
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          long long v12 = [_CPValue alloc];
          long long v13 = -[_CPValue initWithFacade:](v12, "initWithFacade:", v11, (void)v16);
          [(_CPListValue *)v5 addValues:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    v14 = v5;
  }

  return v5;
}

@end