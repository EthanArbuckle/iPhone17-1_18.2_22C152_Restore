@interface GEOVenueIdentifier
+ (id)componentIdentifiersFromVenueIdentifiers:(id)a3;
- (BOOL)_hasBusinessID;
- (BOOL)_hasFeatureID;
- (BOOL)_hasVenueID;
- (GEOVenueIdentifier)init;
- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3;
- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 componentIdentifiers:(id)a4;
- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5;
- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5 componentIdentifiers:(id)a6;
- (GEOVenueIdentifier)initWithVenueIdentifiers:(id)a3;
- (NSArray)componentIdentifiers;
- (id)placeDataVenueIdentifier;
- (id)placeDataVenueIdentifierForVenue;
- (unint64_t)businessID;
- (unint64_t)featureID;
- (unint64_t)venueID;
@end

@implementation GEOVenueIdentifier

+ (id)componentIdentifiersFromVenueIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [GEOVenueComponentIdentifier alloc];
        v12 = -[GEOVenueComponentIdentifier initWithVenueIdentifier:](v11, "initWithVenueIdentifier:", v10, (void)v15);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];

  return v13;
}

- (GEOVenueIdentifier)init
{
  result = (GEOVenueIdentifier *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOVenueIdentifier)initWithVenueIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  if (!v5 || (__int16 v6 = v5[76], v5, (v6 & 0x80) == 0))
  {
LABEL_3:
    uint64_t v7 = 0;
    uint64_t v8 = v4;
    goto LABEL_21;
  }
  if ([v4 count] != 1)
  {
    v9 = [v4 firstObject];
    uint64_t v10 = v9 ? v9[16] : 0;

    if ((unint64_t)[v4 count] >= 2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 1;
      while (1)
      {
        v13 = (void *)v11;
        uint64_t v11 = [v4 objectAtIndexedSubscript:v12];

        if (!v11 || (*(_WORD *)(v11 + 152) & 0x80) == 0 || *(void *)(v11 + 128) != v10) {
          break;
        }
        if (++v12 >= (unint64_t)[v4 count])
        {

          goto LABEL_14;
        }
      }

      goto LABEL_3;
    }
  }
LABEL_14:

  v14 = [v4 firstObject];
  if (v14) {
    uint64_t v15 = v14[16];
  }
  else {
    uint64_t v15 = 0;
  }

  long long v16 = [v4 firstObject];
  if (v16) {
    uint64_t v17 = v16[10];
  }
  else {
    uint64_t v17 = 0;
  }

  long long v18 = [v4 firstObject];
  if (v18) {
    uint64_t v19 = v18[12];
  }
  else {
    uint64_t v19 = 0;
  }

  uint64_t v8 = +[GEOVenueIdentifier componentIdentifiersFromVenueIdentifiers:v4];
  uint64_t v20 = [(GEOVenueIdentifier *)self initWithVenueID:v15 featureID:v17 businessID:v19 componentIdentifiers:v8];
  uint64_t v21 = [v4 copy];
  originalIdentifiers = v20->_originalIdentifiers;
  v20->_originalIdentifiers = (NSArray *)v21;

  self = v20;
  uint64_t v7 = self;
LABEL_21:

  return v7;
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 componentIdentifiers:(id)a4
{
  return [(GEOVenueIdentifier *)self initWithVenueID:a3 featureID:0 businessID:0 componentIdentifiers:a4];
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5 componentIdentifiers:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)GEOVenueIdentifier;
  uint64_t v11 = [(GEOVenueIdentifier *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_hasVenueID = 1;
    v11->_venueID = a3;
    v11->_hasFeatureID = a4 != 0;
    v11->_featureID = a4;
    v11->_hasBusinessID = a5 != 0;
    v11->_businessID = a5;
    uint64_t v13 = [v10 copy];
    componentIdentifiers = v12->_componentIdentifiers;
    v12->_componentIdentifiers = (NSArray *)v13;
  }
  return v12;
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3
{
  return [(GEOVenueIdentifier *)self initWithVenueID:a3 featureID:0 businessID:0 componentIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5
{
  return [(GEOVenueIdentifier *)self initWithVenueID:a3 featureID:a4 businessID:a5 componentIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (id)placeDataVenueIdentifier
{
  if ([(NSArray *)self->_originalIdentifiers count])
  {
    id v3 = [(NSArray *)self->_originalIdentifiers firstObject];
  }
  else
  {
    id v3 = [[GEOPDVenueIdentifier alloc] initWithIdentifier:self];
  }

  return v3;
}

- (id)placeDataVenueIdentifierForVenue
{
  if (self->_hasVenueID) {
    v2 = [[GEOPDVenueIdentifier alloc] initWithVenueID:self->_venueID featureID:self->_featureID businessID:self->_businessID];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_hasVenueID
{
  return self->_hasVenueID;
}

- (unint64_t)venueID
{
  return self->_venueID;
}

- (BOOL)_hasFeatureID
{
  return self->_hasFeatureID;
}

- (unint64_t)featureID
{
  return self->_featureID;
}

- (BOOL)_hasBusinessID
{
  return self->_hasBusinessID;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (NSArray)componentIdentifiers
{
  return self->_componentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalIdentifiers, 0);

  objc_storeStrong((id *)&self->_componentIdentifiers, 0);
}

@end