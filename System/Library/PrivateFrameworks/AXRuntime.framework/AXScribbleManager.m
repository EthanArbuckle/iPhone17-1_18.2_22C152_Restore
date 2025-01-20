@interface AXScribbleManager
- (AXScribbleElement)lastFetchedElement;
- (AXScribbleManager)init;
- (BOOL)isUniqueElement:(id)a3;
- (id)searchPointToNSString:(int64_t)a3;
- (int64_t)lastSearchPoint;
- (int64_t)nextSearchPoint:(BOOL)a3;
- (int64_t)nsStringToSearchPoint:(id)a3;
- (void)foundScribbleElement:(id)a3 atSearchPoint:(int64_t)a4;
- (void)hideSelectedElement;
- (void)setLastFetchedElement:(id)a3;
- (void)setLastSearchPoint:(int64_t)a3;
@end

@implementation AXScribbleManager

- (AXScribbleManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXScribbleManager;
  v2 = [(AXScribbleManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    lastFetchedElement = v2->_lastFetchedElement;
    v2->_lastSearchPoint = 0;
    v2->_lastFetchedElement = 0;
  }
  return v3;
}

- (void)foundScribbleElement:(id)a3 atSearchPoint:(int64_t)a4
{
}

- (void)hideSelectedElement
{
  lastFetchedElement = self->_lastFetchedElement;
  self->_lastFetchedElement = 0;

  self->_lastSearchPoint = 0;
}

- (BOOL)isUniqueElement:(id)a3
{
  id v4 = a3;
  lastFetchedElement = self->_lastFetchedElement;
  if (!lastFetchedElement) {
    goto LABEL_6;
  }
  objc_super v6 = [(AXScribbleElement *)lastFetchedElement renderedText];
  v7 = [v4 renderedText];
  if (![v6 isEqualToString:v7])
  {

    goto LABEL_6;
  }
  [(AXScribbleElement *)self->_lastFetchedElement geometry];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v4 geometry];
  v24.origin.x = v16;
  v24.origin.y = v17;
  v24.size.width = v18;
  v24.size.height = v19;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  BOOL v20 = CGRectEqualToRect(v23, v24);

  if (!v20)
  {
LABEL_6:
    BOOL v21 = 1;
    goto LABEL_7;
  }
  BOOL v21 = 0;
LABEL_7:

  return v21;
}

- (id)searchPointToNSString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"AXScribbleSearchPointCenter";
  }
  else {
    return off_1E62207C0[a3 - 1];
  }
}

- (int64_t)nsStringToSearchPoint:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AXScribbleSearchPointTopLeft"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"AXScribbleSearchPointTopRight"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"AXScribbleSearchPointBottomLeft"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"AXScribbleSerachPointBottomRight"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)nextSearchPoint:(BOOL)a3
{
  int64_t lastSearchPoint = self->_lastSearchPoint;
  uint64_t v4 = lastSearchPoint - 1;
  if (lastSearchPoint <= 0) {
    uint64_t v4 = 4;
  }
  if (lastSearchPoint < 4) {
    int64_t v5 = lastSearchPoint + 1;
  }
  else {
    int64_t v5 = 0;
  }
  if (a3) {
    int64_t v5 = v4;
  }
  self->_int64_t lastSearchPoint = v5;
  return v5;
}

- (int64_t)lastSearchPoint
{
  return self->_lastSearchPoint;
}

- (void)setLastSearchPoint:(int64_t)a3
{
  self->_int64_t lastSearchPoint = a3;
}

- (AXScribbleElement)lastFetchedElement
{
  return self->_lastFetchedElement;
}

- (void)setLastFetchedElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end