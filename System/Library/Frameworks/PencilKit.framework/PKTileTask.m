@interface PKTileTask
- (PKTileTask)initWithStrokes:(id)a3 additionalStrokes:(id)a4 intoTile:(id)a5 completionBlock:(id)a6;
- (id)description;
@end

@implementation PKTileTask

- (PKTileTask)initWithStrokes:(id)a3 additionalStrokes:(id)a4 intoTile:(id)a5 completionBlock:(id)a6
{
  v10 = (PKRendererTile *)a5;
  v25.receiver = self;
  v25.super_class = (Class)PKTileTask;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(PKTileTask *)&v25 init];
  uint64_t v15 = objc_msgSend(v13, "copy", v25.receiver, v25.super_class);

  renderStrokes = v14->_renderStrokes;
  v14->_renderStrokes = (NSArray *)v15;

  uint64_t v17 = [v12 copy];
  additionalStrokes = v14->_additionalStrokes;
  v14->_additionalStrokes = (NSArray *)v17;

  tile = v14->_tile;
  v14->_tile = v10;
  v20 = v10;

  if (v20) {
    unint64_t v21 = atomic_load(v20 + 2);
  }
  else {
    unint64_t v21 = 0;
  }
  v14->_renderCount = v21;
  v22 = _Block_copy(v11);

  id completionBlock = v14->_completionBlock;
  v14->_id completionBlock = v22;

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_tile;
    additionalStrokes = self->_additionalStrokes;
  }
  else
  {
    v6 = 0;
    additionalStrokes = 0;
  }
  v8 = additionalStrokes;
  uint64_t v9 = [(NSArray *)v8 count];
  if (self) {
    int64_t renderCount = self->_renderCount;
  }
  else {
    int64_t renderCount = 0;
  }
  id v11 = [v3 stringWithFormat:@"<%@ %p %@ additionalStrokes:%ld renderCount:%ld>", v5, self, v6, v9, renderCount];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_additionalStrokes, 0);

  objc_storeStrong((id *)&self->_renderStrokes, 0);
}

@end