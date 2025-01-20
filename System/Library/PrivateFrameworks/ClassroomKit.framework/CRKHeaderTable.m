@interface CRKHeaderTable
- (CRKHeaderTable)initWithHeaders:(id)a3 keyPaths:(id)a4 objects:(id)a5;
- (CRKTable)table;
- (NSArray)headers;
- (NSArray)keyPaths;
- (NSArray)objects;
- (id)crk_JSONRepresentationWithPrettyPrinting:(BOOL)a3 sortKeys:(BOOL)a4;
- (id)tableString;
@end

@implementation CRKHeaderTable

- (CRKHeaderTable)initWithHeaders:(id)a3 keyPaths:(id)a4 objects:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKHeaderTable;
  v11 = [(CRKHeaderTable *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    headers = v11->_headers;
    v11->_headers = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    keyPaths = v11->_keyPaths;
    v11->_keyPaths = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    objects = v11->_objects;
    v11->_objects = (NSArray *)v16;
  }
  return v11;
}

- (id)crk_JSONRepresentationWithPrettyPrinting:(BOOL)a3 sortKeys:(BOOL)a4
{
  BOOL v16 = a3;
  BOOL v17 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CRKHeaderTable *)self objects];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v11 = objc_opt_new();
        uint64_t v12 = [(CRKHeaderTable *)self keyPaths];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __68__CRKHeaderTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke;
        v19[3] = &unk_2646F3E00;
        id v20 = v11;
        v21 = self;
        uint64_t v22 = v10;
        id v13 = v11;
        [v12 enumerateObjectsUsingBlock:v19];

        [v5 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  uint64_t v14 = objc_msgSend(v5, "crk_JSONRepresentationWithPrettyPrinting:sortKeys:", v16, v17);

  return v14;
}

void __68__CRKHeaderTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:a2];
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) headers];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  [v5 setObject:v8 forKeyedSubscript:v7];
}

- (CRKTable)table
{
  table = self->_table;
  if (!table)
  {
    v4 = [(CRKHeaderTable *)self headers];
    v5 = [(CRKHeaderTable *)self keyPaths];
    uint64_t v6 = [(CRKHeaderTable *)self objects];
    uint64_t v7 = +[CRKTable tableWithHeaders:v4 keyPaths:v5 objects:v6];
    id v8 = self->_table;
    self->_table = v7;

    table = self->_table;
  }

  return table;
}

- (id)tableString
{
  v2 = [(CRKHeaderTable *)self table];
  v3 = [v2 stringValue];

  return v3;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_headers, 0);

  objc_storeStrong((id *)&self->_table, 0);
}

@end