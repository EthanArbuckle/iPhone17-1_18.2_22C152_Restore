@interface GEOMapItemContainedPlace
- (GEOMapItem)parent;
- (GEOMapItemContainedPlace)init;
- (GEOMapItemContainedPlace)initWithContainedPlace:(id)a3;
- (NSArray)children;
- (NSArray)siblings;
- (id)description;
- (unint64_t)featureId;
- (unint64_t)parentFeatureId;
@end

@implementation GEOMapItemContainedPlace

- (GEOMapItemContainedPlace)init
{
  result = (GEOMapItemContainedPlace *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapItemContainedPlace)initWithContainedPlace:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GEOMapItemContainedPlace;
  v6 = [(GEOMapItemContainedPlace *)&v45 init];
  v7 = v6;
  if (v6)
  {
    p_containedPlace = (uint64_t *)&v6->_containedPlace;
    objc_storeStrong((id *)&v6->_containedPlace, a3);
    containedPlace = v7->_containedPlace;
    if (containedPlace)
    {
      -[GEOPDContainedPlace _readParentPlace]((uint64_t)v7->_containedPlace);
      if (containedPlace->_parentPlace)
      {
        v10 = [GEOMapItemContainedPlaceLinkedPlace alloc];
        v11 = -[GEOPDContainedPlace parentPlace]((id *)&v7->_containedPlace->super.super.isa);
        uint64_t v12 = [(GEOMapItemContainedPlaceLinkedPlace *)v10 initWithLinkedPlace:v11];
        parent = v7->_parent;
        v7->_parent = (GEOMapItem *)v12;
      }
      uint64_t v14 = *p_containedPlace;
      if (*p_containedPlace)
      {
        -[GEOPDContainedPlace _readChildPlaces](*p_containedPlace);
        if ([*(id *)(v14 + 24) count])
        {
          v15 = [MEMORY[0x1E4F1CA48] array];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v16 = -[GEOPDContainedPlace childPlaces]((id *)*p_containedPlace);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v42;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v42 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = [[GEOMapItemContainedPlaceLinkedPlace alloc] initWithLinkedPlace:*(void *)(*((void *)&v41 + 1) + 8 * v20)];
                [v15 addObject:v21];

                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v47 count:16];
            }
            while (v18);
          }

          uint64_t v22 = [v15 copy];
          children = v7->_children;
          v7->_children = (NSArray *)v22;
        }
        uint64_t v24 = *p_containedPlace;
        if (*p_containedPlace)
        {
          -[GEOPDContainedPlace _readSiblingPlaces](*p_containedPlace);
          if ([*(id *)(v24 + 48) count])
          {
            v25 = [MEMORY[0x1E4F1CA48] array];
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            v26 = -[GEOPDContainedPlace siblingPlaces]((id *)*p_containedPlace);
            uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v38;
              do
              {
                uint64_t v30 = 0;
                do
                {
                  if (*(void *)v38 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * v30);
                  v32 = [GEOMapItemContainedPlaceLinkedPlace alloc];
                  v33 = -[GEOMapItemContainedPlaceLinkedPlace initWithLinkedPlace:](v32, "initWithLinkedPlace:", v31, (void)v37);
                  [v25 addObject:v33];

                  ++v30;
                }
                while (v28 != v30);
                uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
              }
              while (v28);
            }

            uint64_t v34 = [v25 copy];
            siblings = v7->_siblings;
            v7->_siblings = (NSArray *)v34;
          }
        }
      }
    }
  }

  return v7;
}

- (unint64_t)featureId
{
  containedPlace = self->_containedPlace;
  if (containedPlace) {
    return containedPlace->_featureId;
  }
  else {
    return 0;
  }
}

- (unint64_t)parentFeatureId
{
  v2 = -[GEOPDContainedPlace parentPlace]((id *)&self->_containedPlace->super.super.isa);
  if (v2) {
    unint64_t v3 = v2[4];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (GEOMapItem)parent
{
  return self->_parent;
}

- (NSArray)children
{
  return self->_children;
}

- (NSArray)siblings
{
  return self->_siblings;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%p %@>\n%@", self, v5, self->_containedPlace];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siblings, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);

  objc_storeStrong((id *)&self->_containedPlace, 0);
}

@end