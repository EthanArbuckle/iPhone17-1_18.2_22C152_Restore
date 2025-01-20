@interface AXMLayoutTable
+ (id)region:(id)a3 row:(id)a4;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (id)columns;
- (id)firstColumn;
- (id)firstLine;
- (id)header;
- (id)rows;
- (void)addColumn:(id)a3;
- (void)addRow:(id)a3;
@end

@implementation AXMLayoutTable

+ (id)region:(id)a3 row:(id)a4
{
  v5 = (AXMLayoutHeader *)a3;
  id v6 = a4;
  v7 = objc_alloc_init(AXMLayoutTable);
  header = v7->_header;
  v7->_header = v5;
  v9 = v5;

  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];

  rows = v7->_rows;
  v7->_rows = (NSMutableArray *)v10;

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  columns = v7->_columns;
  v7->_columns = (NSMutableArray *)v12;

  return v7;
}

- (CGRect)frame
{
  v3 = objc_opt_class();
  rows = self->_rows;

  [v3 boundingFrameForItems:rows];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)normalizedFrame
{
  v3 = objc_opt_class();
  rows = self->_rows;

  [v3 normalizedBoundingFrameForItems:rows];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)addRow:(id)a3
{
}

- (id)firstLine
{
  return (id)[(NSMutableArray *)self->_rows firstObject];
}

- (id)header
{
  return self->_header;
}

- (void)addColumn:(id)a3
{
}

- (id)firstColumn
{
  return (id)[(NSMutableArray *)self->_columns firstObject];
}

- (id)rows
{
  return self->_rows;
}

- (id)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_rows, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end