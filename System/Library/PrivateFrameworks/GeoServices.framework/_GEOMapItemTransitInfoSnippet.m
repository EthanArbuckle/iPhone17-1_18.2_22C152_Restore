@interface _GEOMapItemTransitInfoSnippet
- (BOOL)hasTransitIncidentComponent;
- (BOOL)isTransitIncidentsTTLExpired;
- (GEOComposedRoute)composedRoute;
- (GEOTransitNearbySchedule)nearbySchedule;
- (NSArray)connections;
- (NSArray)departureSequences;
- (NSArray)incidents;
- (NSArray)labelItems;
- (NSArray)lines;
- (NSArray)systems;
- (NSArray)transitTripStops;
- (NSDate)lastFullScheduleValidDate;
- (NSString)displayName;
- (NSString)subtitle;
- (NSString)title;
- (_GEOMapItemTransitInfoSnippet)initWithTransitInfoSnippet:(id)a3;
- (double)timeToLive;
- (id)allSequencesForSystem:(id)a3 container:(id)a4;
- (id)allSequencesForSystem:(id)a3 direction:(id)a4;
- (id)departureSequenceContainersForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5;
- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 container:(id)a5 validForDateFromBlock:(id)a6;
- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 direction:(id)a5 validForDateFromBlock:(id)a6;
- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5;
- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5 hasSequencesWithNoDirection:(BOOL *)a6;
- (id)headSignsForLine:(id)a3;
- (id)inactiveLinesForSystem:(id)a3 relativeToDateFromBlock:(id)a4 excludingIncidentEntities:(id)a5 usingContainers:(BOOL)a6;
- (id)linesForSystem:(id)a3;
- (id)serviceResumesResultForLine:(id)a3 excludingIncidentEntities:(id)a4 afterDate:(id)a5 usingContainers:(BOOL)a6;
- (unint64_t)linesCount;
- (unint64_t)numAdditionalDeparturesForSequence:(id)a3;
- (unint64_t)systemsCount;
@end

@implementation _GEOMapItemTransitInfoSnippet

- (_GEOMapItemTransitInfoSnippet)initWithTransitInfoSnippet:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_GEOMapItemTransitInfoSnippet;
  v6 = [(_GEOMapItemTransitInfoSnippet *)&v50 init];
  v7 = v6;
  if (v6)
  {
    p_transitInfoSnippet = (id **)&v6->_transitInfoSnippet;
    objc_storeStrong((id *)&v6->_transitInfoSnippet, a3);
    transitInfoSnippet = v7->_transitInfoSnippet;
    if (transitInfoSnippet)
    {
      -[GEOPDTransitInfoSnippet _readLabels]((uint64_t)v7->_transitInfoSnippet);
      uint64_t v10 = [(NSMutableArray *)transitInfoSnippet->_labels count];
      v11 = *p_transitInfoSnippet;
      if (v10)
      {
        uint64_t v12 = -[GEOPDTransitInfoSnippet labels](*p_transitInfoSnippet);
        labelItems = v7->_labelItems;
        v7->_labelItems = (NSArray *)v12;
LABEL_33:

        goto LABEL_34;
      }
      if (v11)
      {
        -[GEOPDTransitInfoSnippet _readArtworks]((uint64_t)*p_transitInfoSnippet);
        if ([v11[3] count])
        {
          id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v15 = *p_transitInfoSnippet;
          if (*p_transitInfoSnippet)
          {
            -[GEOPDTransitInfoSnippet _readArtworks]((uint64_t)*p_transitInfoSnippet);
            uint64_t v16 = [v15[3] count];
          }
          else
          {
            uint64_t v16 = 0;
          }
          labelItems = (NSArray *)[v14 initWithCapacity:v16];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v17 = -[GEOPDTransitInfoSnippet artworks](*p_transitInfoSnippet);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v52 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v47 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = [[_GEOMapItemTransitInfoSnippetLabelItem alloc] initWithType:1 labelString:0 labelArtwork:*(void *)(*((void *)&v46 + 1) + 8 * i)];
                if (v22) {
                  [(NSArray *)labelItems addObject:v22];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v52 count:16];
            }
            while (v19);
          }
LABEL_32:

          uint64_t v34 = [(NSArray *)labelItems copy];
          v35 = v7->_labelItems;
          v7->_labelItems = (NSArray *)v34;

          goto LABEL_33;
        }
        v23 = *p_transitInfoSnippet;
        if (*p_transitInfoSnippet)
        {
          -[GEOPDTransitInfoSnippet _readSystemNames]((uint64_t)*p_transitInfoSnippet);
          if (![v23[8] count])
          {
LABEL_34:
            v36 = *p_transitInfoSnippet;
            if (v36)
            {
              -[GEOPDTransitInfoSnippet _readSearchDisplayName]((uint64_t)v36);
              if (v36[5])
              {
                v37 = -[GEOPDTransitInfoSnippet searchDisplayName]((id *)&v7->_transitInfoSnippet->super.super.isa);
                uint64_t v38 = [v37 copy];
                displayName = v7->_displayName;
                v7->_displayName = (NSString *)v38;
              }
            }
            goto LABEL_37;
          }
          id v24 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v25 = *p_transitInfoSnippet;
          if (*p_transitInfoSnippet)
          {
            -[GEOPDTransitInfoSnippet _readSystemNames]((uint64_t)*p_transitInfoSnippet);
            uint64_t v26 = [v25[8] count];
          }
          else
          {
            uint64_t v26 = 0;
          }
          labelItems = (NSArray *)[v24 initWithCapacity:v26];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v17 = -[GEOPDTransitInfoSnippet systemNames](*p_transitInfoSnippet);
          uint64_t v27 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v43 != v29) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * j);
                v32 = [_GEOMapItemTransitInfoSnippetLabelItem alloc];
                v33 = -[_GEOMapItemTransitInfoSnippetLabelItem initWithType:labelString:labelArtwork:](v32, "initWithType:labelString:labelArtwork:", 2, v31, 0, (void)v42);
                if (v33) {
                  [(NSArray *)labelItems addObject:v33];
                }
              }
              uint64_t v28 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v28);
          }
          goto LABEL_32;
        }
      }
    }
LABEL_37:
    v40 = v7;
  }

  return v7;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (NSArray)connections
{
  return 0;
}

- (NSArray)systems
{
  return 0;
}

- (unint64_t)systemsCount
{
  return 0;
}

- (NSArray)lines
{
  return 0;
}

- (unint64_t)linesCount
{
  return 0;
}

- (id)linesForSystem:(id)a3
{
  return 0;
}

- (NSArray)incidents
{
  return 0;
}

- (BOOL)hasTransitIncidentComponent
{
  return 0;
}

- (BOOL)isTransitIncidentsTTLExpired
{
  return 0;
}

- (NSArray)departureSequences
{
  return 0;
}

- (double)timeToLive
{
  return 0.0;
}

- (NSDate)lastFullScheduleValidDate
{
  return 0;
}

- (unint64_t)numAdditionalDeparturesForSequence:(id)a3
{
  return 0;
}

- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 direction:(id)a5 validForDateFromBlock:(id)a6
{
  return 0;
}

- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 container:(id)a5 validForDateFromBlock:(id)a6
{
  return 0;
}

- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5 hasSequencesWithNoDirection:(BOOL *)a6
{
  return 0;
}

- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5
{
  return 0;
}

- (id)departureSequenceContainersForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5
{
  return 0;
}

- (id)allSequencesForSystem:(id)a3 direction:(id)a4
{
  return 0;
}

- (id)allSequencesForSystem:(id)a3 container:(id)a4
{
  return 0;
}

- (id)serviceResumesResultForLine:(id)a3 excludingIncidentEntities:(id)a4 afterDate:(id)a5 usingContainers:(BOOL)a6
{
  return 0;
}

- (id)inactiveLinesForSystem:(id)a3 relativeToDateFromBlock:(id)a4 excludingIncidentEntities:(id)a5 usingContainers:(BOOL)a6
{
  return 0;
}

- (id)headSignsForLine:(id)a3
{
  return 0;
}

- (NSArray)transitTripStops
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSString)subtitle
{
  return 0;
}

- (GEOComposedRoute)composedRoute
{
  return 0;
}

- (GEOTransitNearbySchedule)nearbySchedule
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_labelItems, 0);

  objc_storeStrong((id *)&self->_transitInfoSnippet, 0);
}

@end