@interface HKTableFormatter
+ (id)formatterForCodableCondensedWorkouts;
- (HKTableFormatter)init;
- (HKTableFormatter)initWithColumnTitles:(id)a3;
- (NSString)title;
- (id)_columnWidths;
- (id)_formattedTableHeaderForColumnWidths:(id)a3;
- (id)formattedTable;
- (id)formattedTableHeader;
- (id)stringFromDate:(id)a3;
- (id)stringFromDate:(id)a3 fallback:(id)a4;
- (id)stringFromTimeInterval:(double)a3;
- (int64_t)rowCount;
- (void)_appendColumn:(id)a3 width:(int64_t)a4 padding:(id)a5 row:(id)a6;
- (void)_enumerateFormattedRowsWithColumnWidths:(id)a3 handler:(id)a4;
- (void)appendEmptyRow;
- (void)appendHeterogenousRow:(id)a3;
- (void)appendRow:(id)a3;
- (void)appendWorkout:(id)a3;
- (void)enumerateFormattedRows:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HKTableFormatter

+ (id)formatterForCodableCondensedWorkouts
{
  v2 = [[HKTableFormatter alloc] initWithColumnTitles:&unk_1EECE6B70];

  return v2;
}

- (void)appendWorkout:(id)a3
{
  v34[11] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[HKTableFormatter rowCount](self, "rowCount"));
  v34[0] = v33;
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v4, "persistentID"));
  v34[1] = v32;
  v5 = (void *)MEMORY[0x1E4F29128];
  v31 = [v4 uuid];
  v30 = objc_msgSend(v5, "hk_UUIDWithData:");
  v29 = [v30 UUIDString];
  v34[2] = v29;
  v6 = (void *)0x1E4F1C000;
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 creationDate];
  v28 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v27 = -[HKTableFormatter stringFromDate:](self, "stringFromDate:");
  v34[3] = v27;
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 startDate];
  v26 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v25 = -[HKTableFormatter stringFromDate:](self, "stringFromDate:");
  v34[4] = v25;
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 endDate];
  v24 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v23 = -[HKTableFormatter stringFromDate:](self, "stringFromDate:");
  v34[5] = v23;
  v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "type"));
  v21 = [v22 stringValue];
  v34[6] = v21;
  v20 = +[HKWorkout _stringFromWorkoutActivityType:](HKWorkout, "_stringFromWorkoutActivityType:", [v4 type]);
  uint64_t v10 = [v20 substringFromIndex:21];
  v11 = (void *)v10;
  v12 = @"Unknown";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v34[7] = v12;
  [v4 duration];
  v13 = -[HKTableFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:");
  v34[8] = v13;
  int v14 = [v4 hasCondenserVersion];
  if (v14)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v4, "condenserVersion"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_1EEC60288;
  }
  v34[9] = v15;
  int v16 = [v4 hasCondenserDate];
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 condenserDate];
    v6 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    v18 = [(HKTableFormatter *)self stringFromDate:v6];
  }
  else
  {
    v18 = &stru_1EEC60288;
  }
  v34[10] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:11];
  [(HKTableFormatter *)self appendRow:v19];

  if (v16)
  {
  }
  if (v14) {
}
  }

- (HKTableFormatter)initWithColumnTitles:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKTableFormatter;
  v5 = [(HKTableFormatter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    titles = v5->_titles;
    v5->_titles = (NSArray *)v6;

    if (v5->_titles)
    {
      uint64_t v8 = objc_msgSend(v4, "hk_map:", &__block_literal_global_119);
      columns = v5->_columns;
      v5->_columns = (NSArray *)v8;
    }
  }

  return v5;
}

id __41__HKTableFormatter_initWithColumnTitles___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return v0;
}

- (HKTableFormatter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)appendRow:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!self->_columns)
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global_4_0);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    columns = self->_columns;
    self->_columns = v7;
  }
  uint64_t v9 = [v6 count];
  if (v9 != [(NSArray *)self->_columns count])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKTableFormatter.m", 45, @"Invalid parameter not satisfying: %@", @"row.count == _columns.count" object file lineNumber description];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__HKTableFormatter_appendRow___block_invoke_2;
  v11[3] = &unk_1E58C8448;
  v11[4] = self;
  [v6 enumerateObjectsUsingBlock:v11];
}

id __30__HKTableFormatter_appendRow___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return v0;
}

void __30__HKTableFormatter_appendRow___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v6 addObject:v5];
}

- (void)appendHeterogenousRow:(id)a3
{
  objc_msgSend(a3, "hk_map:", &__block_literal_global_18);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HKTableFormatter *)self appendRow:v4];
}

uint64_t __42__HKTableFormatter_appendHeterogenousRow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (void)appendEmptyRow
{
  id v3 = [(NSArray *)self->_titles hk_map:&__block_literal_global_21_3];
  [(HKTableFormatter *)self appendRow:v3];
}

__CFString *__34__HKTableFormatter_appendEmptyRow__block_invoke()
{
  return &stru_1EEC60288;
}

- (int64_t)rowCount
{
  int64_t result = (int64_t)self->_columns;
  if (result)
  {
    id v3 = [(id)result firstObject];
    int64_t v4 = [v3 count];

    return v4;
  }
  return result;
}

- (id)_columnWidths
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_columns count])
  {
    unint64_t v4 = 0;
    do
    {
      titles = self->_titles;
      if (titles)
      {
        id v6 = [(NSArray *)titles objectAtIndexedSubscript:v4];
        unint64_t v7 = [v6 length];
      }
      else
      {
        unint64_t v7 = 0;
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", v4, 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            unint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) length];
            if (v7 <= v13) {
              unint64_t v7 = v13;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      if (v7 + 4 <= 8) {
        uint64_t v14 = 8;
      }
      else {
        uint64_t v14 = v7 + 4;
      }
      v15 = [NSNumber numberWithUnsignedInteger:v14];
      [v3 addObject:v15];

      ++v4;
    }
    while (v4 < [(NSArray *)self->_columns count]);
  }

  return v3;
}

- (void)_appendColumn:(id)a3 width:(int64_t)a4 padding:(id)a5 row:(id)a6
{
  id v16 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![v11 length])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKTableFormatter.m", 88, @"Invalid parameter not satisfying: %@", @"padding.length > 0" object file lineNumber description];
  }
  [v12 appendString:v16];
  int64_t v13 = [v16 length];
  if (v13 < a4)
  {
    int64_t v14 = v13;
    do
    {
      [v12 appendString:v11];
      v14 += [v11 length];
    }
    while (v14 < a4);
  }
}

- (id)formattedTableHeader
{
  id v3 = [(HKTableFormatter *)self _columnWidths];
  unint64_t v4 = [(HKTableFormatter *)self _formattedTableHeaderForColumnWidths:v3];

  return v4;
}

- (id)_formattedTableHeaderForColumnWidths:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v18 + 1) + 8 * i) integerValue];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  title = self->_title;
  if (title) {
    objc_msgSend(v10, "appendFormat:", @"%*s\n", (v7 - -[NSString length](title, "length")) >> 1, "");
  }
  if (self->_titles)
  {
    if ([(NSArray *)self->_columns count])
    {
      unint64_t v12 = 0;
      do
      {
        int64_t v13 = [(NSArray *)self->_titles objectAtIndexedSubscript:v12];
        int64_t v14 = [v4 objectAtIndexedSubscript:v12];
        -[HKTableFormatter _appendColumn:width:padding:row:](self, "_appendColumn:width:padding:row:", v13, [v14 integerValue], @" ", v10);

        ++v12;
      }
      while (v12 < [(NSArray *)self->_columns count]);
    }
    [v10 appendString:@"\n"];
    if ([(NSArray *)self->_columns count])
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = [v4 objectAtIndexedSubscript:v15];
        -[HKTableFormatter _appendColumn:width:padding:row:](self, "_appendColumn:width:padding:row:", &stru_1EEC60288, [v16 integerValue], @"-", v10);

        ++v15;
      }
      while (v15 < [(NSArray *)self->_columns count]);
    }
    [v10 appendString:@"\n"];
  }

  return v10;
}

- (void)enumerateFormattedRows:(id)a3
{
  id v4 = a3;
  id v5 = [(HKTableFormatter *)self _columnWidths];
  [(HKTableFormatter *)self _enumerateFormattedRowsWithColumnWidths:v5 handler:v4];
}

- (void)_enumerateFormattedRowsWithColumnWidths:(id)a3 handler:(id)a4
{
  id v16 = a3;
  uint64_t v6 = (char *)a4;
  if ([(NSArray *)self->_columns count])
  {
    uint64_t v7 = [(NSArray *)self->_columns objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = 0;
      unint64_t v15 = v6 + 16;
      do
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        if ([(NSArray *)self->_columns count])
        {
          unint64_t v11 = 0;
          do
          {
            unint64_t v12 = -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", v11, v15);
            int64_t v13 = [v12 objectAtIndexedSubscript:v9];
            int64_t v14 = [v16 objectAtIndexedSubscript:v11];
            -[HKTableFormatter _appendColumn:width:padding:row:](self, "_appendColumn:width:padding:row:", v13, [v14 integerValue], @" ", v10);

            ++v11;
          }
          while (v11 < [(NSArray *)self->_columns count]);
        }
        (*((void (**)(char *, uint64_t, id))v6 + 2))(v6, v9, v10);

        ++v9;
      }
      while (v9 != v8);
    }
  }
}

- (id)formattedTable
{
  id v3 = [(HKTableFormatter *)self _columnWidths];
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v5 = [(HKTableFormatter *)self _formattedTableHeaderForColumnWidths:v3];
  uint64_t v6 = (void *)[v4 initWithString:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__HKTableFormatter_formattedTable__block_invoke;
  v9[3] = &unk_1E58C8490;
  id v7 = v6;
  id v10 = v7;
  [(HKTableFormatter *)self _enumerateFormattedRowsWithColumnWidths:v3 handler:v9];

  return v7;
}

uint64_t __34__HKTableFormatter_formattedTable__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@\n", a3];
}

- (id)stringFromDate:(id)a3
{
  return [(HKTableFormatter *)self stringFromDate:a3 fallback:@"never"];
}

- (id)stringFromDate:(id)a3 fallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_dateFormatter)
  {
    if (v6)
    {
LABEL_3:
      id v8 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v6];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v9;

    [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    if (v6) {
      goto LABEL_3;
    }
  }
  id v8 = v7;
LABEL_6:
  unint64_t v11 = v8;

  return v11;
}

- (id)stringFromTimeInterval:(double)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  double v5 = 0.0;
  HKSeparateTimeIntervalComponents(1, &v7, &v6, &v5, a3);
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld:%02ld:%02ld", v7, v6, (uint64_t)v5);

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_titles, 0);
}

@end