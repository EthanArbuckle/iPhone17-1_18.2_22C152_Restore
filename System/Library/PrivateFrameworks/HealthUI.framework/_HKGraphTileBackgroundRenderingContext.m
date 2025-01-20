@interface _HKGraphTileBackgroundRenderingContext
- (BOOL)sameForRendering:(id)a3;
- (CGSize)tileSize;
- (HKGraphTile)graphTile;
- (HKGraphViewRenderer)graphViewRenderer;
- (_HKGraphTileBackgroundRenderingContext)initWithGraphTile:(id)a3 graphViewRenderer:(id)a4 tileSize:(CGSize)a5 configurationChangedCounter:(int64_t)a6;
- (id)debugDescription;
- (int64_t)configurationChangedCounter;
- (void)renderTileContent;
@end

@implementation _HKGraphTileBackgroundRenderingContext

- (_HKGraphTileBackgroundRenderingContext)initWithGraphTile:(id)a3 graphViewRenderer:(id)a4 tileSize:(CGSize)a5 configurationChangedCounter:(int64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_HKGraphTileBackgroundRenderingContext;
  v14 = [(_HKGraphTileBackgroundRenderingContext *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_graphTile, a3);
    objc_storeStrong((id *)&v15->_graphViewRenderer, a4);
    v15->_tileSize.CGFloat width = width;
    v15->_tileSize.CGFloat height = height;
    v15->_configurationChangedCounter = a6;
  }

  return v15;
}

- (id)debugDescription
{
  v2 = NSString;
  v3 = [(_HKGraphTileBackgroundRenderingContext *)self graphTile];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"Tile %ld", objc_msgSend(v3, "currentColumn"));

  return v4;
}

- (void)renderTileContent
{
  id v6 = [(_HKGraphTileBackgroundRenderingContext *)self graphTile];
  v3 = [(_HKGraphTileBackgroundRenderingContext *)self graphViewRenderer];
  [(_HKGraphTileBackgroundRenderingContext *)self tileSize];
  objc_msgSend(v6, "renderTileInBackgroundWithRenderer:tileSize:configurationChangedCounter:", v3, -[_HKGraphTileBackgroundRenderingContext configurationChangedCounter](self, "configurationChangedCounter"), v4, v5);
}

- (BOOL)sameForRendering:(id)a3
{
  id v4 = a3;
  double v5 = [(_HKGraphTileBackgroundRenderingContext *)self graphTile];
  uint64_t v6 = [v5 currentColumn];
  v7 = [v4 graphTile];

  LOBYTE(v4) = v6 == [v7 currentColumn];
  return (char)v4;
}

- (HKGraphTile)graphTile
{
  return self->_graphTile;
}

- (HKGraphViewRenderer)graphViewRenderer
{
  return self->_graphViewRenderer;
}

- (CGSize)tileSize
{
  double width = self->_tileSize.width;
  double height = self->_tileSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)configurationChangedCounter
{
  return self->_configurationChangedCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphViewRenderer, 0);
  objc_storeStrong((id *)&self->_graphTile, 0);
}

@end