@interface _GEOLocalOfflineSubscriptionInfo
- ($140BDABED96B4E653C9F0DB440664A5C)rect;
- (BOOL)isLoaded;
- (GEOMapRegion)region;
- (NSString)description;
- (unsigned)device;
@end

@implementation _GEOLocalOfflineSubscriptionInfo

- (BOOL)isLoaded
{
  unint64_t v2 = [(GEOMapDataSubscriptionState *)self->_state loadState];
  return (v2 < 4) & (6u >> (v2 & 0xF));
}

- (unsigned)device
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@<%p> { region: %@, loadState: %d }", v5, self, self->_region, -[GEOMapDataSubscriptionState loadState](self->_state, "loadState")];

  return (NSString *)v6;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- ($140BDABED96B4E653C9F0DB440664A5C)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end