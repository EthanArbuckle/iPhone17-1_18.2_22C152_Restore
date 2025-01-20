@interface MADataFrame
- (BOOL)isEqual:(id)a3;
- (MADataFrame)initWithName:(id)a3 rowIndexCache:(id)a4 columnIndexCache:(id)a5 matrix:(id)a6;
- (MADataFrame)initWithName:(id)a3 rowLabels:(id)a4 columnLabels:(id)a5 matrix:(id)a6;
- (MAFloatMatrix)matrix;
- (MAIndexCache)columnIndexCache;
- (MAIndexCache)rowIndexCache;
- (NSArray)columnLabels;
- (NSArray)rowLabels;
- (NSString)name;
- (float)floatAtRowIndex:(int64_t)a3 columnIndex:(int64_t)a4;
- (id)csvString;
- (id)dataFrameByAppendingColumnsOfDataFrame:(id)a3 withName:(id)a4;
- (id)numberAtRow:(id)a3 column:(id)a4;
- (int64_t)indexOfColumnWithLabel:(id)a3;
- (int64_t)indexOfRowWithLabel:(id)a3;
- (unint64_t)hash;
@end

@implementation MADataFrame

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matrix, 0);
  objc_storeStrong((id *)&self->_columnIndexCache, 0);
  objc_storeStrong((id *)&self->_rowIndexCache, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (MAFloatMatrix)matrix
{
  return self->_matrix;
}

- (MAIndexCache)columnIndexCache
{
  return self->_columnIndexCache;
}

- (MAIndexCache)rowIndexCache
{
  return self->_rowIndexCache;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(MAIndexCache *)self->_rowIndexCache hash] ^ v3;
  unint64_t v5 = [(MAIndexCache *)self->_columnIndexCache hash];
  return v4 ^ v5 ^ [(MAFloatMatrix *)self->_matrix hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MADataFrame *)a3;
  if (v4 == self)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = v5;
      name = self->_name;
      if (name)
      {
        v8 = [(MADataFrame *)v5 name];
        int v9 = [(NSString *)name isEqual:v8];

        if (!v9) {
          goto LABEL_12;
        }
      }
      rowIndexCache = self->_rowIndexCache;
      if (rowIndexCache)
      {
        v11 = [(MADataFrame *)v6 rowIndexCache];
        BOOL v12 = [(MAIndexCache *)rowIndexCache isEqual:v11];

        if (!v12) {
          goto LABEL_12;
        }
      }
      columnIndexCache = self->_columnIndexCache;
      if (columnIndexCache
        && ([(MADataFrame *)v6 columnIndexCache],
            v14 = objc_claimAutoreleasedReturnValue(),
            BOOL v15 = [(MAIndexCache *)columnIndexCache isEqual:v14],
            v14,
            !v15))
      {
LABEL_12:
        char v18 = 0;
      }
      else
      {
        matrix = self->_matrix;
        v17 = [(MADataFrame *)v6 matrix];
        char v18 = [(MAFloatMatrix *)matrix isEqual:v17];
      }
    }
    else
    {
      char v18 = 0;
    }
  }

  return v18;
}

- (id)csvString
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  rowIndexCache = self->_rowIndexCache;
  columnIndexCache = self->_columnIndexCache;
  unint64_t v5 = [MEMORY[0x1E4F28E78] string];
  v6 = v5;
  if (columnIndexCache)
  {
    if (rowIndexCache) {
      [v5 appendString:@"Index"];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(MAIndexCache *)self->_columnIndexCache labels];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 appendFormat:@",%@", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v6 appendString:@"\n"];
  }
  if ([(MAFloatMatrix *)self->_matrix rows] >= 1)
  {
    int64_t v12 = 0;
    do
    {
      if (rowIndexCache)
      {
        v13 = [(MAIndexCache *)self->_rowIndexCache labels];
        v14 = [v13 objectAtIndexedSubscript:v12];
        [v6 appendFormat:@"%@", v14];
      }
      if ([(MAFloatMatrix *)self->_matrix columns] >= 1)
      {
        int64_t v15 = 0;
        do
        {
          [(MAFloatMatrix *)self->_matrix floatAtRow:v12 column:v15];
          objc_msgSend(v6, "appendFormat:", @",%f", v16);
          ++v15;
        }
        while (v15 < [(MAFloatMatrix *)self->_matrix columns]);
      }
      [v6 appendString:@"\n"];
      ++v12;
    }
    while (v12 < [(MAFloatMatrix *)self->_matrix rows]);
  }
  return v6;
}

- (id)dataFrameByAppendingColumnsOfDataFrame:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  rowIndexCache = self->_rowIndexCache;
  if (rowIndexCache)
  {
LABEL_4:
    uint64_t v10 = [v6 rowIndexCache];
    BOOL v11 = [(MAIndexCache *)rowIndexCache isEqual:v10];

    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  uint64_t v9 = [v6 rowIndexCache];

  if (v9)
  {
    rowIndexCache = self->_rowIndexCache;
    goto LABEL_4;
  }
LABEL_5:
  int v12 = self->_columnIndexCache != 0;
  v13 = [v6 rowIndexCache];
  int v14 = v13 == 0;

  if (v12 != v14)
  {
    int64_t v15 = [(MAFloatMatrix *)self->_matrix rows];
    float v16 = [v6 matrix];
    uint64_t v17 = [v16 rows];

    if (v15 == v17)
    {
      matrix = self->_matrix;
      long long v19 = [v6 matrix];
      long long v20 = [(MAFloatMatrix *)matrix matrixByAppendingColumnsOfMatrix:v19];

      long long v21 = [(MAIndexCache *)self->_columnIndexCache labels];
      v22 = [v6 columnLabels];
      uint64_t v23 = [v21 arrayByAddingObjectsFromArray:v22];

      if (v23) {
        v24 = [[MAIndexCache alloc] initWithLabels:v23];
      }
      else {
        v24 = 0;
      }
      v25 = [[MADataFrame alloc] initWithName:v7 rowIndexCache:self->_rowIndexCache columnIndexCache:v24 matrix:v20];

      goto LABEL_10;
    }
  }
LABEL_9:
  v25 = 0;
LABEL_10:

  return v25;
}

- (id)numberAtRow:(id)a3 column:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(MADataFrame *)self indexOfRowWithLabel:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL
    || (int64_t v8 = v7,
        int64_t v9 = [(MADataFrame *)self indexOfColumnWithLabel:v6],
        v9 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v10 = 0;
  }
  else
  {
    BOOL v11 = NSNumber;
    [(MAFloatMatrix *)self->_matrix floatAtRow:v8 column:v9];
    uint64_t v10 = objc_msgSend(v11, "numberWithFloat:");
  }

  return v10;
}

- (float)floatAtRowIndex:(int64_t)a3 columnIndex:(int64_t)a4
{
  [(MAFloatMatrix *)self->_matrix floatAtRow:a3 column:a4];
  return result;
}

- (int64_t)indexOfColumnWithLabel:(id)a3
{
  columnIndexCache = self->_columnIndexCache;
  if (columnIndexCache) {
    return [(MAIndexCache *)columnIndexCache indexOfLabel:a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)indexOfRowWithLabel:(id)a3
{
  rowIndexCache = self->_rowIndexCache;
  if (rowIndexCache) {
    return [(MAIndexCache *)rowIndexCache indexOfLabel:a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (NSArray)columnLabels
{
  return [(MAIndexCache *)self->_columnIndexCache labels];
}

- (NSArray)rowLabels
{
  return [(MAIndexCache *)self->_rowIndexCache labels];
}

- (MADataFrame)initWithName:(id)a3 rowLabels:(id)a4 columnLabels:(id)a5 matrix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    int v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    int64_t v15 = 0;
    goto LABEL_6;
  }
  int v14 = [[MAIndexCache alloc] initWithLabels:v11];
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  int64_t v15 = [[MAIndexCache alloc] initWithLabels:v12];
LABEL_6:
  float v16 = [(MADataFrame *)self initWithName:v10 rowIndexCache:v14 columnIndexCache:v15 matrix:v13];

  return v16;
}

- (MADataFrame)initWithName:(id)a3 rowIndexCache:(id)a4 columnIndexCache:(id)a5 matrix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    int v14 = [v11 labels];
    uint64_t v15 = [v14 count];
    uint64_t v16 = [v13 rows];

    if (v15 != v16) {
      goto LABEL_8;
    }
  }
  if (v12
    && ([v12 labels],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 count],
        uint64_t v19 = [v13 columns],
        v17,
        v18 != v19))
  {
LABEL_8:
    v25 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)MADataFrame;
    long long v20 = [(MADataFrame *)&v27 init];
    if (v20)
    {
      uint64_t v21 = [v10 copy];
      name = v20->_name;
      v20->_name = (NSString *)v21;

      objc_storeStrong((id *)&v20->_rowIndexCache, a4);
      objc_storeStrong((id *)&v20->_columnIndexCache, a5);
      uint64_t v23 = [v13 copy];
      matrix = v20->_matrix;
      v20->_matrix = (MAFloatMatrix *)v23;
    }
    self = v20;
    v25 = self;
  }

  return v25;
}

@end