@interface AXMLayoutHeader
+ (id)header:(id)a3;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (id)cells;
- (void)addCell:(id)a3;
@end

@implementation AXMLayoutHeader

+ (id)header:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXMLayoutHeader);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];

  cells = v4->_cells;
  v4->_cells = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  id v3 = objc_opt_class();
  cells = self->_cells;

  [v3 boundingFrameForItems:cells];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)normalizedFrame
{
  id v3 = objc_opt_class();
  cells = self->_cells;

  [v3 normalizedBoundingFrameForItems:cells];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)addCell:(id)a3
{
}

- (id)cells
{
  return self->_cells;
}

- (void).cxx_destruct
{
}

@end