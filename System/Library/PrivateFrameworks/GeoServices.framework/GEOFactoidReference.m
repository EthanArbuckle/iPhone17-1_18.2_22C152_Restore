@interface GEOFactoidReference
- (GEOFactoidReference)initWithFactoidReference:(id)a3;
- (int)linkStyle;
- (unsigned)indexInFactoidComponent;
@end

@implementation GEOFactoidReference

- (GEOFactoidReference)initWithFactoidReference:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOFactoidReference;
    v6 = [(GEOFactoidReference *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_factoidReference, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)indexInFactoidComponent
{
  factoidReference = self->_factoidReference;
  if (factoidReference) {
    return factoidReference->_factoidItemIndex;
  }
  else {
    return 0;
  }
}

- (int)linkStyle
{
  factoidReference = self->_factoidReference;
  if (!factoidReference || (*(unsigned char *)&factoidReference->_flags & 2) == 0) {
    return 0;
  }
  int style = factoidReference->_style;
  if (style == 2) {
    return 2;
  }
  else {
    return style == 1;
  }
}

- (void).cxx_destruct
{
}

@end