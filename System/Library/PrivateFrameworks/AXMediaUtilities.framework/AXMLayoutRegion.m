@interface AXMLayoutRegion
+ (id)region:(id)a3;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (id)firstLine;
- (id)lines;
- (void)addLine:(id)a3;
@end

@implementation AXMLayoutRegion

+ (id)region:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXMLayoutRegion);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];

  lines = v4->_lines;
  v4->_lines = (NSMutableArray *)v5;

  return v4;
}

- (CGRect)frame
{
  id v3 = objc_opt_class();
  lines = self->_lines;

  [v3 boundingFrameForItems:lines];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)normalizedFrame
{
  id v3 = objc_opt_class();
  lines = self->_lines;

  [v3 normalizedBoundingFrameForItems:lines];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)addLine:(id)a3
{
}

- (id)firstLine
{
  return (id)[(NSMutableArray *)self->_lines firstObject];
}

- (id)lines
{
  return self->_lines;
}

- (void).cxx_destruct
{
}

@end