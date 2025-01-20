@interface FigCaptureSemanticStyleSet
+ (FigCaptureSemanticStyleSet)semanticStyleSetWithSemanticStyles:(id)a3 regions:(id)a4;
- (CGFloat)_edgeOffsetForRegionAtIndex:(void *)a1;
- (CGRect)regionAtIndex:(unint64_t)a3;
- (FigCaptureSemanticStyleSet)initWithXPCEncoding:(id)a3;
- (NSArray)regions;
- (NSArray)semanticStyles;
- (NSString)description;
- (float)largestEdgeOffset;
- (float)leftmostRegionStartXOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)largestRegionSemanticStyle;
- (void)dealloc;
- (void)initWithSemanticStyles:(void *)a3 regions:;
@end

@implementation FigCaptureSemanticStyleSet

+ (FigCaptureSemanticStyleSet)semanticStyleSetWithSemanticStyles:(id)a3 regions:(id)a4
{
  v4 = -[FigCaptureSemanticStyleSet initWithSemanticStyles:regions:]([FigCaptureSemanticStyleSet alloc], a3, a4);
  return (FigCaptureSemanticStyleSet *)v4;
}

- (void)initWithSemanticStyles:(void *)a3 regions:
{
  if (!a1) {
    return 0;
  }
  v20.receiver = a1;
  v20.super_class = (Class)FigCaptureSemanticStyleSet;
  v5 = objc_msgSendSuper2(&v20, sel_init);
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v19.size = _Q0;
    v5[2] = a3;
    if ([a2 count])
    {
      for (unint64_t i = 0; [a2 count] > i; ++i)
      {
        uint64_t v14 = [a2 objectAtIndexedSubscript:i];
        if (a3)
        {
          if ([a3 count] <= i) {
            continue;
          }
          objc_msgSend(v5, "regionAtIndex:", i, 0, 0, 0, 0);
          CGRect v18 = v21;
          CGRect v18 = CGRectIntersection(v21, v19);
          if (CGRectIsEmpty(v18)) {
            continue;
          }
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v18, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
          v15 = v6;
          uint64_t v16 = v14;
        }
        else
        {
          [v6 addObject:v14];
          uint64_t v16 = [MEMORY[0x1E4F29238] valueWithBytes:&v19 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          v15 = v7;
        }
        [v15 addObject:v16];
      }
    }
    v5[1] = v6;
    v5[2] = v7;
  }
  return v5;
}

- (FigCaptureSemanticStyleSet)initWithXPCEncoding:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)FigCaptureSemanticStyleSet;
  v4 = [(FigCaptureSemanticStyleSet *)&v19 init];
  if (v4)
  {
    xpc_object_t value = xpc_dictionary_get_value(a3, "semanticStylesArray");
    id v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (xpc_array_get_count(value))
    {
      size_t v7 = 0;
      do
        [(NSArray *)v6 addObject:[[FigCaptureSemanticStyle alloc] initWithXPCEncoding:xpc_array_get_value(value, v7++)]];
      while (xpc_array_get_count(value) > v7);
    }
    v4->_semanticStyles = v6;
    xpc_object_t v8 = xpc_dictionary_get_value(a3, "regionsArray");
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (xpc_array_get_count(v8))
    {
      size_t v10 = 0;
      do
      {
        xpc_object_t v11 = xpc_array_get_value(v8, v10);
        long long v17 = 0u;
        long long v18 = 0u;
        double v12 = xpc_dictionary_get_double(v11, "X");
        double v13 = xpc_dictionary_get_double(v11, "Y");
        double v14 = xpc_dictionary_get_double(v11, "W");
        double v15 = xpc_dictionary_get_double(v11, "H");
        *(double *)&long long v17 = v12;
        *((double *)&v17 + 1) = v13;
        *(double *)&long long v18 = v14;
        *((double *)&v18 + 1) = v15;
        -[NSArray addObject:](v9, "addObject:", [MEMORY[0x1E4F29238] valueWithBytes:&v17 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"]);
        ++v10;
      }
      while (xpc_array_get_count(v8) > v10);
    }
    v4->_regions = v9;
  }
  return v4;
}

- (id)copyXPCEncoding
{
  xpc_object_t empty = xpc_array_create_empty();
  if ([(NSArray *)self->_semanticStyles count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_semanticStyles, "objectAtIndexedSubscript:", v4), "copyXPCEncoding");
      xpc_array_append_value(empty, v5);

      ++v4;
    }
    while ([(NSArray *)self->_semanticStyles count] > v4);
  }
  xpc_object_t v6 = xpc_array_create_empty();
  if ([(NSArray *)self->_regions count])
  {
    unint64_t v7 = 0;
    do
    {
      xpc_object_t v8 = xpc_dictionary_create_empty();
      [(FigCaptureSemanticStyleSet *)self regionAtIndex:v7];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      xpc_dictionary_set_double(v8, "X", v15);
      xpc_dictionary_set_double(v8, "Y", v10);
      xpc_dictionary_set_double(v8, "W", v12);
      xpc_dictionary_set_double(v8, "H", v14);
      xpc_array_append_value(v6, v8);

      ++v7;
    }
    while ([(NSArray *)self->_regions count] > v7);
  }
  xpc_object_t v16 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v16, "semanticStylesArray", empty);

  xpc_dictionary_set_value(v16, "regionsArray", v6);
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSemanticStyleSet;
  [(FigCaptureSemanticStyleSet *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[FigCaptureSemanticStyleSet allocWithZone:a3];
  semanticStyles = self->_semanticStyles;
  regions = self->_regions;
  return -[FigCaptureSemanticStyleSet initWithSemanticStyles:regions:](v4, semanticStyles, regions);
}

- (NSString)description
{
  objc_super v3 = (void *)[(NSString *)[(NSArray *)self->_semanticStyles description] mutableCopy];
  [v3 appendString:@", regions = {"];
  if ([(NSArray *)self->_regions count])
  {
    unint64_t v4 = 0;
    do
    {
      [(FigCaptureSemanticStyleSet *)self regionAtIndex:v4];
      [v3 appendFormat:@"(%f, %f, %f, %f)", v5, v6, v7, v8];
      if ([(NSArray *)self->_regions count] - 1 > v4) {
        [v3 appendString:@","];
      }
      ++v4;
    }
    while ([(NSArray *)self->_regions count] > v4);
  }
  [v3 appendString:@"}"];
  return (NSString *)v3;
}

- (NSArray)semanticStyles
{
  return self->_semanticStyles;
}

- (NSArray)regions
{
  return self->_regions;
}

- (float)leftmostRegionStartXOffset
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  regions = self->_regions;
  uint64_t v3 = [(NSArray *)regions countByEnumeratingWithState:&v13 objects:v17 count:16];
  float v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v14;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v11 = *MEMORY[0x1E4F1DB28];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(regions);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12[0] = v11;
        v12[1] = v10;
        objc_msgSend(v8, "getValue:", v12, v10, v11);
        if (*(double *)v12 > 0.0) {
          return *(double *)v12;
        }
      }
      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:](regions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, *(double *)v12);
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (id)largestRegionSemanticStyle
{
  NSUInteger v3 = [(NSArray *)self->_regions count];
  NSUInteger v4 = [(NSArray *)self->_semanticStyles count];
  uint64_t v5 = 8;
  if (v3 > v4) {
    uint64_t v5 = 16;
  }
  uint64_t v6 = [*(id *)((char *)&self->super.isa + v5) count];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  id v9 = 0;
  float v10 = 0.0;
  do
  {
    [(FigCaptureSemanticStyleSet *)self regionAtIndex:v8];
    if (v11 * v12 > v10)
    {
      float v10 = v11 * v12;
      id v9 = [(NSArray *)self->_semanticStyles objectAtIndexedSubscript:v8];
    }
    ++v8;
  }
  while (v7 != v8);
  return v9;
}

- (CGRect)regionAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_regions objectAtIndexedSubscript:a3];
  long long v8 = 0u;
  long long v9 = 0u;
  [v3 getValue:&v8];
  double v5 = *((double *)&v8 + 1);
  double v4 = *(double *)&v8;
  double v7 = *((double *)&v9 + 1);
  double v6 = *(double *)&v9;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (float)largestEdgeOffset
{
  if (![(NSArray *)[(FigCaptureSemanticStyleSet *)self semanticStyles] count]) {
    return 0.0;
  }
  unint64_t v3 = 0;
  float v4 = 0.0;
  do
  {
    CGFloat v5 = -[FigCaptureSemanticStyleSet _edgeOffsetForRegionAtIndex:](self, v3);
    if (*(float *)&v5 > v4) {
      float v4 = *(float *)&v5;
    }
    ++v3;
  }
  while ([(NSArray *)[(FigCaptureSemanticStyleSet *)self semanticStyles] count] > v3);
  return v4;
}

- (CGFloat)_edgeOffsetForRegionAtIndex:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  [a1 regionAtIndex:a2];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  float MaxX = CGRectGetMaxX(v9);
  if ((float)(1.0 - MaxX) <= MaxX) {
    float v7 = 1.0 - MaxX;
  }
  else {
    float v7 = MaxX;
  }
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGFloat result = CGRectGetMinX(v10);
  *(float *)&CGFloat result = result;
  if ((float)(1.0 - *(float *)&result) <= *(float *)&result) {
    *(float *)&CGFloat result = 1.0 - *(float *)&result;
  }
  if (*(float *)&result <= v7) {
    *(float *)&CGFloat result = v7;
  }
  return result;
}

@end