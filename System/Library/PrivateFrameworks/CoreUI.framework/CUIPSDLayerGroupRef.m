@interface CUIPSDLayerGroupRef
- (BOOL)_isGroupType:(unsigned int)a3;
- (BOOL)isGroupEnd;
- (BOOL)isGroupStart;
- (BOOL)isLayerGroup;
- (BOOL)isOpen;
- (CGRect)bounds;
- (CUIPSDLayerGroupRef)initWithImageRef:(id)a3 layerIndex:(unsigned int)a4;
- (id)layerEnumerator;
- (id)layerNames;
- (id)layerRefAtIndex:(unsigned int)a3;
- (unsigned)numberOfLayers;
- (void)dealloc;
- (void)enumerateLayersUsingBlock:(id)a3;
@end

@implementation CUIPSDLayerGroupRef

- (CUIPSDLayerGroupRef)initWithImageRef:(id)a3 layerIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)CUIPSDLayerGroupRef;
  v6 = [(CUIPSDLayerGroupRef *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CUIPSDLayerBaseRef *)v6 setImageRef:a3];
    [(CUIPSDLayerBaseRef *)v7 setLayerIndex:v4];
    v7->_sublayerInfo = (_CUIPSDSublayerInfo *)[a3 _copySublayerInfoAtAbsoluteIndex:v4 atRoot:0];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerGroupRef;
  [(CUIPSDLayerBaseRef *)&v3 dealloc];
}

- (BOOL)isLayerGroup
{
  return 1;
}

- (CGRect)bounds
{
  CGFloat x = NSZeroRect.origin.x;
  CGFloat y = NSZeroRect.origin.y;
  CGFloat width = NSZeroRect.size.width;
  CGFloat height = NSZeroRect.size.height;
  unsigned int v7 = [(CUIPSDLayerGroupRef *)self numberOfLayers];
  if (v7)
  {
    unsigned int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      id v10 = [(CUIPSDLayerGroupRef *)self layerRefAtIndex:v9];
      if (v10)
      {
        [v10 bounds];
        v22.origin.CGFloat x = v11;
        v22.origin.CGFloat y = v12;
        v22.size.CGFloat width = v13;
        v22.size.CGFloat height = v14;
        v19.origin.CGFloat x = x;
        v19.origin.CGFloat y = y;
        v19.size.CGFloat width = width;
        v19.size.CGFloat height = height;
        NSRect v20 = NSUnionRect(v19, v22);
        CGFloat x = v20.origin.x;
        CGFloat y = v20.origin.y;
        CGFloat width = v20.size.width;
        CGFloat height = v20.size.height;
      }
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (BOOL)_isGroupType:(unsigned int)a3
{
  v5 = [(CUIPSDImageRef *)[(CUIPSDLayerBaseRef *)self imageRef] psdFile];
  if (v5)
  {
    unsigned int v7 = 0;
    CPSDFile::GetLayerSectionDividerType(v5, [(CUIPSDLayerBaseRef *)self layerIndex], &v7);
    LOBYTE(v5) = v7 == a3;
  }
  return (char)v5;
}

- (BOOL)isOpen
{
  return [(CUIPSDLayerGroupRef *)self _isGroupType:1];
}

- (BOOL)isGroupStart
{
  if ([(CUIPSDLayerGroupRef *)self _isGroupType:1]) {
    return 1;
  }
  return [(CUIPSDLayerGroupRef *)self _isGroupType:2];
}

- (BOOL)isGroupEnd
{
  return [(CUIPSDLayerGroupRef *)self _isGroupType:3];
}

- (unsigned)numberOfLayers
{
  return [(_CUIPSDSublayerInfo *)self->_sublayerInfo numberOfSublayers];
}

- (id)layerNames
{
  objc_super v3 = [(CUIPSDLayerBaseRef *)self imageRef];
  sublayerInfo = self->_sublayerInfo;
  return [(CUIPSDImageRef *)v3 _namesOfSublayers:sublayerInfo];
}

- (id)layerRefAtIndex:(unsigned int)a3
{
  char v6 = 0;
  uint64_t v4 = [(_CUIPSDSublayerInfo *)self->_sublayerInfo sublayerAtIndex:*(void *)&a3 isValid:&v6];
  if (v6) {
    return [(CUIPSDImageRef *)[(CUIPSDLayerBaseRef *)self imageRef] _layerRefAtAbsoluteIndex:v4];
  }
  else {
    return 0;
  }
}

- (id)layerEnumerator
{
  return +[CUIPSDLayerEnumerator enumeratorWithPSDLayerGroup:self];
}

- (void)enumerateLayersUsingBlock:(id)a3
{
  id v4 = [(CUIPSDLayerGroupRef *)self layerEnumerator];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
      char v10 = 0;
      (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v9, &v10);
      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

@end