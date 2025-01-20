@interface GEOEnclosingPlace
- (GEOEnclosingPlace)initWithContainmentPlace:(id)a3;
- (GEOMapItemIdentifier)parentIdentifier;
- (GEOServerFormattedString)containmentTextTemplate;
@end

@implementation GEOEnclosingPlace

- (GEOEnclosingPlace)initWithContainmentPlace:(id)a3
{
  v5 = a3;
  v6 = v5;
  if (v5 && (-[GEOPDContainmentPlace _readContainmentLine]((uint64_t)v5), v6[4]))
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOEnclosingPlace;
    v7 = [(GEOEnclosingPlace *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_enclosingPlace, a3);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (GEOMapItemIdentifier)parentIdentifier
{
  v3 = -[GEOPDContainmentPlace containerId]((id *)&self->_enclosingPlace->super.super.isa);

  if (v3)
  {
    v4 = [GEOMapItemIdentifier alloc];
    v5 = -[GEOPDContainmentPlace containerId]((id *)&self->_enclosingPlace->super.super.isa);
    v6 = [(GEOMapItemIdentifier *)v4 initWithMapsIdentifier:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOServerFormattedString)containmentTextTemplate
{
  return (GEOServerFormattedString *)-[GEOPDContainmentPlace containmentLine]((id *)&self->_enclosingPlace->super.super.isa);
}

- (void).cxx_destruct
{
}

@end