@interface BMIndexSearch
- (BMIndex)index;
- (BMIndexSearch)initWithIndex:(id)a3 startFields:(id)a4 endFields:(id)a5 database:(id)a6;
- (BMSQLDatabase)database;
- (NSArray)endFields;
- (NSArray)startFields;
- (id)_buildSearchQueryWithStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 reversed:(BOOL)a6;
- (id)description;
- (id)performSearchWithError:(id *)a3;
- (id)performSearchWithStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 reversed:(BOOL)a6 error:(id *)a7;
@end

@implementation BMIndexSearch

- (BMIndexSearch)initWithIndex:(id)a3 startFields:(id)a4 endFields:(id)a5 database:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v12 count];
  if (v15 != [v13 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMIndexSearch.m", 23, @"Invalid parameter not satisfying: %@", @"startFields.count == endFields.count" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)BMIndexSearch;
  v16 = [(BMIndexSearch *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_index, a3);
    objc_storeStrong((id *)&v17->_startFields, a4);
    objc_storeStrong((id *)&v17->_endFields, a5);
    objc_storeStrong((id *)&v17->_database, a6);
  }

  return v17;
}

- (id)_buildSearchQueryWithStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v10 = objc_opt_new();
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v73 = self;
  id v11 = [(BMIndex *)self->_index schema];
  id v12 = [v11 columns];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v80 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        id v18 = [NSString alloc];
        v19 = [v17 name];
        v20 = (void *)[v18 initWithFormat:@"\"%@\"", v19];
        [v10 addObject:v20];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v79 objects:v84 count:16];
    }
    while (v14);
  }

  v74 = objc_opt_new();
  if ([(NSArray *)v73->_startFields count])
  {
    unint64_t v21 = 0;
    do
    {
      v22 = [(NSArray *)v73->_startFields objectAtIndexedSubscript:v21];
      v23 = [MEMORY[0x1E4F1CA98] null];

      if (v22 != v23)
      {
        v24 = NSString;
        v25 = [(BMIndex *)v73->_index schema];
        v26 = [v25 columns];
        v27 = [v26 objectAtIndexedSubscript:v21];
        v28 = [v27 name];
        v29 = [v24 stringWithFormat:@"\"%@\" >= ?", v28];
        [v74 addObject:v29];
      }
      v30 = [(NSArray *)v73->_endFields objectAtIndexedSubscript:v21];
      v31 = [MEMORY[0x1E4F1CA98] null];

      if (v30 != v31)
      {
        v32 = NSString;
        v33 = [(BMIndex *)v73->_index schema];
        v34 = [v33 columns];
        v35 = [v34 objectAtIndexedSubscript:v21];
        v36 = [v35 name];
        v37 = [v32 stringWithFormat:@"\"%@\" <= ?", v36];
        [v74 addObject:v37];
      }
      ++v21;
    }
    while ([(NSArray *)v73->_startFields count] > v21);
  }
  v38 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v38 timeIntervalSinceReferenceDate];
  double v40 = v39;

  if (v40 != a3)
  {
    v41 = NSString;
    v42 = BMEventTimestampSQLColumn();
    v43 = [v42 name];
    v44 = [v41 stringWithFormat:@"\"%@\" >= ?", v43];
    [v74 addObject:v44];
  }
  v45 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v45 timeIntervalSinceReferenceDate];
  double v47 = v46;

  if (v47 != a4)
  {
    v48 = NSString;
    v49 = BMEventTimestampSQLColumn();
    v50 = [v49 name];
    v51 = [v48 stringWithFormat:@"\"%@\" <= ?", v50];
    [v74 addObject:v51];
  }
  if ([v74 count])
  {
    v52 = NSString;
    v53 = [v74 componentsJoinedByString:@" AND "];
    v71 = [v52 stringWithFormat:@"WHERE %@", v53];
  }
  else
  {
    v71 = &stru_1EDD7E578;
  }
  v54 = objc_opt_new();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v55 = [(BMIndex *)v73->_index fields];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v76 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = [*(id *)(*((void *)&v75 + 1) + 8 * j) name];
        v61 = v60;
        if (v6)
        {
          uint64_t v62 = [v60 stringByAppendingString:@" DESC"];

          v61 = (void *)v62;
        }
        [v54 addObject:v61];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v75 objects:v83 count:16];
    }
    while (v57);
  }

  v63 = NSString;
  v64 = [v10 componentsJoinedByString:@","];
  v65 = [(BMIndex *)v73->_index schema];
  v66 = [v65 tableName];
  v67 = [v54 componentsJoinedByString:@","];
  v68 = [v63 stringWithFormat:@"SELECT %@ FROM %@ %@ ORDER BY %@", v64, v66, v71, v67];

  if (a5 != -1)
  {
    uint64_t v69 = [v68 stringByAppendingString:@" LIMIT ?"];

    v68 = (void *)v69;
  }

  return v68;
}

- (id)performSearchWithError:(id *)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v8 timeIntervalSinceReferenceDate];
  v10 = [(BMIndexSearch *)self performSearchWithStartTime:-1 endTime:0 maxEvents:a3 reversed:v7 error:v9];

  return v10;
}

- (id)performSearchWithStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 reversed:(BOOL)a6 error:(id *)a7
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v12 = -[BMIndexSearch _buildSearchQueryWithStartTime:endTime:maxEvents:reversed:](self, "_buildSearchQueryWithStartTime:endTime:maxEvents:reversed:", a5, a6);
  uint64_t v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BMIndexSearch performSearchWithStartTime:endTime:maxEvents:reversed:error:]((uint64_t)v12, v13);
  }

  ppStmt = 0;
  uint64_t v14 = [(BMSQLDatabase *)self->_database db];
  id v15 = v12;
  uint64_t v16 = sqlite3_prepare_v2(v14, (const char *)[v15 UTF8String], -1, &ppStmt, 0);
  if (v16)
  {
    if (a7)
    {
      uint64_t v17 = v16;
      id v18 = [NSString stringWithFormat:@"Failed to prepare statement for index search query: %@", v15];
      v19 = [(BMSQLDatabase *)self->_database db];
      id v20 = v18;
      BMSQLDatabaseError(v17, v19, (const char *)[v20 UTF8String]);
      unint64_t v21 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    unint64_t v21 = 0;
    goto LABEL_43;
  }
  id v20 = (id)objc_opt_new();
  if ([(NSArray *)self->_startFields count])
  {
    unint64_t v22 = 0;
    do
    {
      v23 = [(NSArray *)self->_startFields objectAtIndexedSubscript:v22];
      v24 = [MEMORY[0x1E4F1CA98] null];

      if (v23 != v24)
      {
        v25 = [(NSArray *)self->_startFields objectAtIndexedSubscript:v22];
        [v20 addObject:v25];
      }
      v26 = [(NSArray *)self->_endFields objectAtIndexedSubscript:v22];
      v27 = [MEMORY[0x1E4F1CA98] null];

      if (v26 != v27)
      {
        v28 = [(NSArray *)self->_endFields objectAtIndexedSubscript:v22];
        [v20 addObject:v28];
      }
      ++v22;
    }
    while ([(NSArray *)self->_startFields count] > v22);
  }
  unint64_t v29 = 0x1E4F1C000uLL;
  v30 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v30 timeIntervalSinceReferenceDate];
  double v32 = v31;

  if (v32 != a3)
  {
    v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
    [v20 addObject:v33];
  }
  v34 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v34 timeIntervalSinceReferenceDate];
  double v36 = v35;

  if (v36 != a4)
  {
    v37 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
    [v20 addObject:v37];
  }
  if (a5 != -1)
  {
    v38 = [NSNumber numberWithUnsignedInteger:a5];
    [v20 addObject:v38];
  }
  if (![v20 count])
  {
LABEL_40:
    v59 = [BMIndexRowEnumerator alloc];
    v60 = [(BMSQLDatabase *)self->_database db];
    unint64_t v21 = [(BMIndexRowEnumerator *)v59 initWithDatabase:v60 statement:ppStmt index:self->_index];
    goto LABEL_41;
  }
  uint64_t v39 = 0;
  unint64_t v40 = 0x1E4F29000uLL;
  while (1)
  {
    v41 = [v20 objectAtIndexedSubscript:v39];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = ppStmt;
      [v41 doubleValue];
LABEL_25:
      uint64_t v44 = sqlite3_bind_double(v42, v39 + 1, v43);
      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = ppStmt;
      [v41 timeIntervalSince1970];
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v44 = sqlite3_bind_text(ppStmt, v39 + 1, (const char *)[v41 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_26:
      uint64_t v45 = v44;
      if (v44) {
        goto LABEL_36;
      }
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v69 = ppStmt;
      id v46 = v41;
      uint64_t v47 = [v46 bytes];
      unint64_t v48 = v29;
      v49 = a7;
      id v50 = v15;
      int v51 = [v46 length];

      int v52 = v39 + 1;
      v53 = v69;
      v54 = (void *)v47;
      unint64_t v40 = 0x1E4F29000;
      int v55 = v51;
      id v15 = v50;
      a7 = v49;
      unint64_t v29 = v48;
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v73[0] = 0;
    v73[1] = 0;
    [v41 getUUIDBytes:v73];
    v53 = ppStmt;
    int v52 = v39 + 1;
    v54 = v73;
    int v55 = 16;
LABEL_35:
    uint64_t v45 = sqlite3_bind_blob(v53, v52, v54, v55, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v45)
    {
LABEL_36:
      if (!a7) {
        goto LABEL_39;
      }
      uint64_t v56 = [*(id *)(v40 + 24) stringWithFormat:@"Failed to bind value %@ at index: %d", v41, v39 + 1];
      uint64_t v57 = [(BMSQLDatabase *)self->_database db];
      id v58 = v56;
      BMSQLDatabaseError(v45, v57, (const char *)[v58 UTF8String]);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_27:

    if ([v20 count] <= (unint64_t)++v39) {
      goto LABEL_40;
    }
  }
  if (a7)
  {
    uint64_t v62 = *(void **)(v40 + 24);
    uint64_t v63 = v39 + 1;
    v64 = (objc_class *)objc_opt_class();
    v65 = NSStringFromClass(v64);
    objc_msgSend(v62, "stringWithFormat:", @"Failed to bind value %@ at index: %d; %@ is not a valid sqlite type",
      v41,
      v63,
      v65);
    id v58 = (id)objc_claimAutoreleasedReturnValue();

    id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v71 = *MEMORY[0x1E4F28568];
    v67 = (void *)[v58 copy];
    v72 = v67;
    v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    *a7 = (id)[v66 initWithDomain:@"BMSQLDatabaseErrorDomain" code:-1 userInfo:v68];

LABEL_38:
  }
LABEL_39:

  unint64_t v21 = 0;
LABEL_41:

LABEL_43:

  return v21;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p> index: %@, startFields: %@, endFields: %@", objc_opt_class(), self, self->_index, self->_startFields, self->_endFields];

  return v2;
}

- (BMIndex)index
{
  return self->_index;
}

- (NSArray)startFields
{
  return self->_startFields;
}

- (NSArray)endFields
{
  return self->_endFields;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_endFields, 0);
  objc_storeStrong((id *)&self->_startFields, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

- (void)performSearchWithStartTime:(uint64_t)a1 endTime:(NSObject *)a2 maxEvents:reversed:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Performing index search with query: %@", (uint8_t *)&v2, 0xCu);
}

@end