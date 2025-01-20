@interface _GEONavRoutePreloadTileType
- (_GEONavRoutePreloadTileType)init;
- (_GEONavRoutePreloadTileType)initWithStyle:(int)a3 restrictions:(unint64_t)a4;
- (int)style;
- (unint64_t)restrictions;
@end

@implementation _GEONavRoutePreloadTileType

- (_GEONavRoutePreloadTileType)init
{
  result = (_GEONavRoutePreloadTileType *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEONavRoutePreloadTileType)initWithStyle:(int)a3 restrictions:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GEONavRoutePreloadTileType;
  v6 = [(_GEONavRoutePreloadTileType *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    v6->_restrictions = a4;
    v8 = v6;
  }

  return v7;
}

- (int)style
{
  return self->_style;
}

- (unint64_t)restrictions
{
  return self->_restrictions;
}

@end