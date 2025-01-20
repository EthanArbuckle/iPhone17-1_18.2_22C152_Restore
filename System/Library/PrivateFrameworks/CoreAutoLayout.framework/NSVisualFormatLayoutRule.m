@interface NSVisualFormatLayoutRule
+ (id)ruleWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 rects:(id)a6 containerRect:(id)a7;
+ (id)ruleWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (id)makeChildRules;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithVisualFormat:(uint64_t)a3 options:(void *)a4 metrics:(void *)a5 rects:(void *)a6 containerRect:;
@end

@implementation NSVisualFormatLayoutRule

- (void)initWithVisualFormat:(uint64_t)a3 options:(void *)a4 metrics:(void *)a5 rects:(void *)a6 containerRect:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)NSVisualFormatLayoutRule;
  v11 = objc_msgSendSuper2(&v13, sel_init);
  if (v11)
  {
    v11[1] = [a2 copy];
    v11[2] = a3;
    v11[3] = [a4 copy];
    v11[4] = [a5 copy];
    v11[5] = [a6 copy];
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSVisualFormatLayoutRule;
  [(NSVisualFormatLayoutRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  unint64_t formatOptions = self->_formatOptions;
  NSUInteger v4 = [(NSString *)self->_visualFormatString hash] - formatOptions + 32 * formatOptions;
  uint64_t v5 = [(NSDictionary *)self->_metricMapping hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDictionary *)self->_rectMapping hash] - v5 + 32 * v5;
  return [(NSLayoutRect *)self->_containerRect hash] - v6 + 32 * v6;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_15;
  }
  if (!a3) {
    goto LABEL_16;
  }
  int v5 = [a3 isMemberOfClass:NSVisualFormatLayoutRule];
  if (!v5) {
    return v5;
  }
  if (self->_formatOptions != *((void *)a3 + 2))
  {
LABEL_16:
    LOBYTE(v5) = 0;
    return v5;
  }
  containerRect = self->_containerRect;
  if (containerRect == *((NSLayoutRect **)a3 + 5) || (int v5 = -[NSLayoutRect isEqual:](containerRect, "isEqual:")) != 0)
  {
    visualFormatString = self->_visualFormatString;
    if (visualFormatString == *((NSString **)a3 + 1)
      || (int v5 = -[NSString isEqual:](visualFormatString, "isEqual:")) != 0)
    {
      metricMapping = self->_metricMapping;
      if (metricMapping == *((NSDictionary **)a3 + 3)
        || (int v5 = -[NSDictionary isEqual:](metricMapping, "isEqual:")) != 0)
      {
        rectMapping = self->_rectMapping;
        if (rectMapping != *((NSDictionary **)a3 + 4))
        {
          LOBYTE(v5) = -[NSDictionary isEqual:](rectMapping, "isEqual:");
          return v5;
        }
LABEL_15:
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)ruleWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 rects:(id)a6 containerRect:(id)a7
{
  v7 = -[NSVisualFormatLayoutRule initWithVisualFormat:options:metrics:rects:containerRect:]([NSVisualFormatLayoutRule alloc], a3, a4, a5, a6, a7);
  return v7;
}

+ (id)ruleWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6
{
  uint64_t v11 = [a6 allKeys];
  v12 = objc_msgSend(a6, "objectsForKeys:notFoundMarker:", v11, objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  uint64_t v13 = [v12 valueForKey:@"layoutRect"];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v11];
  uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "firstObject"), "nsli_superitem"), "nsli_layoutRect");
  return (id)[a1 ruleWithVisualFormat:a3 options:a4 metrics:a5 rects:v14 containerRect:v15];
}

- (id)makeChildRules
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = +[NSLayoutConstraint constraintsWithVisualFormat:self->_visualFormatString options:self->_formatOptions metrics:self->_metricMapping views:self->_rectMapping];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = v2;
  uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
        v9 = [NSLayoutAnchorRule alloc];
        v10 = (void *)[v8 firstAnchor];
        uint64_t v11 = (void *)[v8 secondAnchor];
        uint64_t v12 = [v8 relation];
        [v8 multiplier];
        double v14 = v13;
        [v8 constant];
        double v16 = v15;
        [v8 priority];
        v17 = -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:](v9, v10, v11, v12, (void *)[v8 identifier], v14, v16);
        [v3 addObject:v17];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  return v3;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@ (opts: %lu)>", NSStringFromClass(v4), self, self->_visualFormatString, self->_formatOptions];
}

- (NSString)ruleDescription
{
  return self->_visualFormatString;
}

@end