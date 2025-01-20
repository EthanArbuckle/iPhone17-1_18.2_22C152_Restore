@interface _GEOTransitNearbyScheduleLine
- (BOOL)isSignificant;
- (NSArray)artworks;
- (NSArray)departureSequences;
- (NSString)displayName;
- (_GEOTransitNearbyScheduleLine)initWithDepartureSequenceContainer:(id)a3 departureSequences:(id)a4;
@end

@implementation _GEOTransitNearbyScheduleLine

- (_GEOTransitNearbyScheduleLine)initWithDepartureSequenceContainer:(id)a3 departureSequences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOTransitNearbyScheduleLine;
  v9 = [(_GEOTransitNearbyScheduleLine *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_departureSequenceContainer, a3);
    uint64_t v11 = [v8 copy];
    departureSequences = v10->_departureSequences;
    v10->_departureSequences = (NSArray *)v11;
  }
  return v10;
}

- (NSArray)artworks
{
  v2 = -[GEOPDDepartureSequenceContainer labels]((id *)&self->_departureSequenceContainer->super.super.isa);
  v3 = objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_657);

  return (NSArray *)v3;
}

- (NSString)displayName
{
  departureSequenceContainer = self->_departureSequenceContainer;
  if (departureSequenceContainer
    && (-[GEOPDDepartureSequenceContainer _readDisplayName]((uint64_t)self->_departureSequenceContainer),
        departureSequenceContainer->_displayName))
  {
    v4 = -[GEOPDDepartureSequenceContainer displayName]((id *)&self->_departureSequenceContainer->super.super.isa);
  }
  else
  {
    v5 = [(NSArray *)self->_departureSequences firstObject];
    v6 = [v5 line];
    id v7 = [v6 name];
    uint64_t v8 = [v7 length];
    v9 = [v5 line];
    v10 = v9;
    if (v8)
    {
      v4 = [v9 name];
    }
    else
    {
      uint64_t v11 = [v9 system];
      v4 = [v11 name];
    }
  }

  return (NSString *)v4;
}

- (BOOL)isSignificant
{
  departureSequenceContainer = self->_departureSequenceContainer;
  return departureSequenceContainer && departureSequenceContainer->_isSignificant;
}

- (NSArray)departureSequences
{
  return self->_departureSequences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureSequences, 0);

  objc_storeStrong((id *)&self->_departureSequenceContainer, 0);
}

@end