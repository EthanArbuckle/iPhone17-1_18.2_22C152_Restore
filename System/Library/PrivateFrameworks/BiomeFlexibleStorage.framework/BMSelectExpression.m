@interface BMSelectExpression
+ (BOOL)supportsSecureCoding;
- (BMSelectExpression)initWithChildren:(id)a3 columnNames:(id)a4;
- (BMSelectExpression)initWithCoder:(id)a3;
- (NSArray)children;
- (NSArray)columnNames;
- (id)queryTable:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChildren:(id)a3;
- (void)setColumnNames:(id)a3;
@end

@implementation BMSelectExpression

- (BMSelectExpression)initWithChildren:(id)a3 columnNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSelectExpression;
  v9 = [(BMSelectExpression *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    columnNames = v9->_columnNames;
    v9->_columnNames = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_children, a3);
  }

  return v9;
}

- (id)queryTable:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v39 = self;
  v5 = [(BMSelectExpression *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
  id v7 = v4;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v53;
    id v7 = v4;
    do
    {
      uint64_t v10 = 0;
      v11 = v7;
      do
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(v5);
        }
        id v7 = [*(id *)(*((void *)&v52 + 1) + 8 * v10) queryTable:v11];

        ++v10;
        v11 = v7;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v8);
  }
  v38 = v4;

  v12 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  objc_super v13 = [(BMSelectExpression *)v39 columnNames];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v19 = objc_msgSend(v7, "schema", v38);
        v20 = [v19 columnNames];
        uint64_t v21 = [v20 indexOfObject:v18];

        if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
          [v12 addIndex:v21];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v15);
  }

  v41 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = [v7 rows];
  uint64_t v22 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v45;
    v25 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        v28 = objc_msgSend(v25, "mutableCopy", v38);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __33__BMSelectExpression_queryTable___block_invoke;
        v42[3] = &unk_1E617A340;
        v42[4] = v27;
        id v29 = v28;
        id v43 = v29;
        [v12 enumerateIndexesUsingBlock:v42];
        if ([v29 count])
        {
          v30 = [[BMSQLRow alloc] initWithValues:v29];
          [v41 addObject:v30];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v23);
  }

  v31 = [BMTableSchema alloc];
  v32 = [(BMSelectExpression *)v39 columnNames];
  v33 = [(BMTableSchema *)v31 initWithColumnNames:v32];

  v34 = [BMTable alloc];
  v35 = (void *)[v41 copy];
  v36 = [(BMTable *)v34 initWithRows:v35 schema:v33];

  return v36;
}

void __33__BMSelectExpression_queryTable___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) valueAtIdx:a2];
  [*(id *)(a1 + 40) addObject:v5];
  *a3 = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSelectExpression *)self columnNames];
  [v4 encodeObject:v5 forKey:@"columnNames"];

  id v6 = [(BMSelectExpression *)self children];
  [v4 encodeObject:v6 forKey:@"children"];
}

- (BMSelectExpression)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"columnNames"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"children"];

  id v7 = [(BMSelectExpression *)self initWithChildren:v6 columnNames:v5];
  return v7;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end