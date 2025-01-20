@interface TDPacker
- (BOOL)objectAtIndexFit:(int64_t)a3;
- (CGPoint)fitPositionOfObjectAtIndex:(int64_t)a3;
- (CGSize)enclosingSize;
- (NSArray)objectsToPack;
- (NSArray)packedObjects;
- (_TDPackerNode)root;
- (id)_findNode:(id)a3 ofSize:(CGSize)a4;
- (id)_growDown:(CGSize)a3;
- (id)_growNodeToSize:(CGSize)a3;
- (id)_growRight:(CGSize)a3;
- (id)_splitNode:(id)a3 toSize:(CGSize)a4;
- (id)sizeHandler;
- (unint64_t)countOfEmptyNodes;
- (void)_countOfEmptyNodes:(id)a3 count:(unint64_t *)a4;
- (void)dealloc;
- (void)pack;
- (void)setObjectsToPack:(id)a3;
- (void)setPackedObjects:(id)a3;
- (void)setRoot:(id)a3;
- (void)setSizeHandler:(id)a3;
@end

@implementation TDPacker

- (void)dealloc
{
  [(TDPacker *)self setRoot:0];
  [(TDPacker *)self setPackedObjects:0];

  v3.receiver = self;
  v3.super_class = (Class)TDPacker;
  [(TDPacker *)&v3 dealloc];
}

- (void)setSizeHandler:(id)a3
{
  id sizeHandler = self->_sizeHandler;
  if (sizeHandler != a3)
  {

    self->_id sizeHandler = (id)[a3 copy];
  }
}

- (id)sizeHandler
{
  return self->_sizeHandler;
}

- (void)setObjectsToPack:(id)a3
{
  objectsToPack = self->_objectsToPack;
  if (objectsToPack != a3)
  {

    self->_objectsToPack = (NSArray *)a3;
    [(TDPacker *)self setPackedObjects:0];
    [(TDPacker *)self setRoot:0];
  }
}

- (NSArray)objectsToPack
{
  return self->_objectsToPack;
}

- (void)pack
{
  objc_super v3 = [(TDPacker *)self objectsToPack];
  uint64_t v4 = [(NSArray *)v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
    v17 = objc_alloc_init(_TDPackerNode);
    (*((void (**)(id, id))self->_sizeHandler + 2))(self->_sizeHandler, [(NSArray *)v3 objectAtIndex:0]);
    -[_TDPackerNode setSize:](v17, "setSize:");
    [(TDPacker *)self setRoot:v17];
    uint64_t v7 = 0;
    v8 = (void *)*MEMORY[0x263EFFD08];
    do
    {
      double v9 = (*((double (**)(id, id))self->_sizeHandler + 2))(self->_sizeHandler, [(NSArray *)v3 objectAtIndex:v7]);
      double v11 = v10;
      id v12 = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", [(TDPacker *)self root], v9, v10);
      if (v12) {
        id v13 = -[TDPacker _splitNode:toSize:](self, "_splitNode:toSize:", v12, v9, v11);
      }
      else {
        id v13 = -[TDPacker _growNodeToSize:](self, "_growNodeToSize:", v9, v11);
      }
      v14 = v13;
      if (v13)
      {
        [v13 setFit:1];
        objc_msgSend(v14, "setSize:", v9, v11);
        objc_msgSend(v14, "setNode:", -[NSArray objectAtIndex:](v3, "objectAtIndex:", v7));
        v15 = v6;
        v16 = v14;
      }
      else
      {
        v15 = v6;
        v16 = v8;
      }
      [v15 addObject:v16];
      ++v7;
    }
    while (v5 != v7);
    [(TDPacker *)self setPackedObjects:v6];
  }
  else
  {
    [(TDPacker *)self setRoot:0];
    [(TDPacker *)self setPackedObjects:0];
  }
}

- (CGSize)enclosingSize
{
  v2 = [(TDPacker *)self root];

  [(_TDPackerNode *)v2 size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_countOfEmptyNodes:(id)a3 count:(unint64_t *)a4
{
  if ([a3 fit])
  {
    if ([a3 down]) {
      -[TDPacker _countOfEmptyNodes:count:](self, "_countOfEmptyNodes:count:", [a3 down], a4);
    }
    if ([a3 right])
    {
      uint64_t v7 = [a3 right];
      [(TDPacker *)self _countOfEmptyNodes:v7 count:a4];
    }
  }
  else
  {
    *a4 = (unint64_t)((double)*a4 + 1.0);
  }
}

- (unint64_t)countOfEmptyNodes
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  [(TDPacker *)self _countOfEmptyNodes:[(_TDPackerNode *)[(TDPacker *)self root] down] count:&v5];
  [(TDPacker *)self _countOfEmptyNodes:[(_TDPackerNode *)[(TDPacker *)self root] right] count:&v4];
  return v4 + v5;
}

- (BOOL)objectAtIndexFit:(int64_t)a3
{
  id v3 = [(NSArray *)self->_packedObjects objectAtIndex:a3];
  if (v3 == (id)*MEMORY[0x263EFFD08]) {
    return 0;
  }

  return [v3 fit];
}

- (CGPoint)fitPositionOfObjectAtIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_packedObjects objectAtIndex:a3];
  if (v3 == (id)*MEMORY[0x263EFFD08])
  {
    double v4 = *MEMORY[0x263F00148];
    double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    [v3 origin];
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_findNode:(id)a3 ofSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if ([a3 used])
  {
    id result = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", [a3 right], width, height);
    if (!result)
    {
      uint64_t v9 = [a3 down];
      return -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", v9, width, height);
    }
  }
  else
  {
    [a3 size];
    if (width > v10) {
      return 0;
    }
    [a3 size];
    id result = a3;
    if (height > v11) {
      return 0;
    }
  }
  return result;
}

- (id)_splitNode:(id)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v7 = objc_alloc_init(_TDPackerNode);
  v8 = objc_alloc_init(_TDPackerNode);
  [a3 origin];
  double v10 = v9;
  [a3 origin];
  -[_TDPackerNode setOrigin:](v7, "setOrigin:", v10, height + v11);
  [a3 origin];
  double v13 = width + v12;
  [a3 origin];
  [(_TDPackerNode *)v8 setOrigin:v13];
  [a3 size];
  double v15 = v14;
  [a3 size];
  -[_TDPackerNode setSize:](v7, "setSize:", v15, v16 - height);
  [a3 size];
  -[_TDPackerNode setSize:](v8, "setSize:", v17 - width, height);
  [a3 setUsed:1];
  [a3 setDown:v7];
  [a3 setRight:v8];

  return a3;
}

- (id)_growNodeToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(TDPacker *)self root];
  [(_TDPackerNode *)v6 size];
  double v8 = v7;
  [(_TDPackerNode *)v6 size];
  double v10 = v9;
  if (height > v9)
  {
    if (width > v8) {
      goto LABEL_12;
    }
    BOOL v14 = 0;
  }
  else
  {
    [(_TDPackerNode *)v6 size];
    double v12 = v11;
    [(_TDPackerNode *)v6 size];
    BOOL v14 = v12 >= width + v13;
    if (width > v8) {
      goto LABEL_9;
    }
  }
  [(_TDPackerNode *)v6 size];
  double v16 = v15;
  [(_TDPackerNode *)v6 size];
  if (v14 || v16 < height + v17 && height <= v10)
  {
LABEL_9:
    return -[TDPacker _growRight:](self, "_growRight:", width, height);
  }
LABEL_12:

  return -[TDPacker _growDown:](self, "_growDown:", width, height);
}

- (id)_growRight:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(TDPacker *)self root];
  [(_TDPackerNode *)v6 size];
  double v8 = v7;
  double v10 = v9;
  double v11 = objc_alloc_init(_TDPackerNode);
  [(_TDPackerNode *)v11 setDown:v6];
  [(_TDPackerNode *)v11 setUsed:1];
  -[_TDPackerNode setOrigin:](v11, "setOrigin:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  -[_TDPackerNode setSize:](v11, "setSize:", width + v8, v10);
  double v12 = objc_alloc_init(_TDPackerNode);
  -[_TDPackerNode setOrigin:](v12, "setOrigin:", v8, 0.0);
  -[_TDPackerNode setSize:](v12, "setSize:", width, v10);
  [(_TDPackerNode *)v11 setRight:v12];
  [(TDPacker *)self setRoot:v11];

  id result = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", v11, width, height);
  if (result)
  {
    return -[TDPacker _splitNode:toSize:](self, "_splitNode:toSize:", result, width, height);
  }
  return result;
}

- (id)_growDown:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(TDPacker *)self root];
  [(_TDPackerNode *)v6 size];
  double v8 = v7;
  double v10 = v9;
  double v11 = objc_alloc_init(_TDPackerNode);
  [(_TDPackerNode *)v11 setRight:v6];
  [(_TDPackerNode *)v11 setUsed:1];
  -[_TDPackerNode setOrigin:](v11, "setOrigin:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  -[_TDPackerNode setSize:](v11, "setSize:", v8, height + v10);
  double v12 = objc_alloc_init(_TDPackerNode);
  -[_TDPackerNode setOrigin:](v12, "setOrigin:", 0.0, v10);
  -[_TDPackerNode setSize:](v12, "setSize:", v8, height);
  [(_TDPackerNode *)v11 setDown:v12];
  [(TDPacker *)self setRoot:v11];

  id result = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", v11, width, height);
  if (result)
  {
    return -[TDPacker _splitNode:toSize:](self, "_splitNode:toSize:", result, width, height);
  }
  return result;
}

- (_TDPackerNode)root
{
  return (_TDPackerNode *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRoot:(id)a3
{
}

- (NSArray)packedObjects
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPackedObjects:(id)a3
{
}

@end