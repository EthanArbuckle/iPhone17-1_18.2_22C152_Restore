@interface _GEOMapItemTransitAttribution
- (NSArray)_providerNames;
- (_GEOMapItemTransitAttribution)initWithTransitAttribution:(id)a3;
@end

@implementation _GEOMapItemTransitAttribution

- (_GEOMapItemTransitAttribution)initWithTransitAttribution:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOMapItemTransitAttribution;
  v6 = [(_GEOMapItemTransitAttribution *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)_providerNames
{
  return (NSArray *)-[GEOPDTransitAttribution providerNames]((id *)&self->_transitAttribution->super.super.isa);
}

- (void).cxx_destruct
{
}

@end