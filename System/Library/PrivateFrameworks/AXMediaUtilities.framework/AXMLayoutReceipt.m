@interface AXMLayoutReceipt
+ (id)region:(id)a3;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (id)firstLine;
- (id)rows;
- (void)addRow:(id)a3;
@end

@implementation AXMLayoutReceipt

+ (id)region:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXMLayoutReceipt);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];

  rows = v4->_rows;
  v4->_rows = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  id v3 = objc_opt_class();
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
  id v3 = objc_opt_class();
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

- (id)rows
{
  return self->_rows;
}

- (void).cxx_destruct
{
}

@end