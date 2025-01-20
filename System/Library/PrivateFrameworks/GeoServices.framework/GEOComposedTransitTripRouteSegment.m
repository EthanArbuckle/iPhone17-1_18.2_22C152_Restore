@interface GEOComposedTransitTripRouteSegment
+ (BOOL)supportsSecureCoding;
- (BOOL)_needsStepData;
- (BOOL)notifyBeforeAlightStep;
- (GEOComposedTransitTripRouteSegment)initWithCoder:(id)a3;
- (GEOComposedTransitTripRouteSegment)initWithComposedRoute:(id)a3 rideSelections:(id)a4 sectionOptions:(id)a5 decoderData:(id)a6 tripIndex:(unint64_t)a7 stepRange:(_NSRange)a8 transitStepRange:(_NSRange)a9 pointRange:(_NSRange)a10 segmentIndex:(unint64_t)a11;
- (GEOComposedTransitTripRouteStep)alightStep;
- (GEOComposedTransitTripRouteStep)boardStep;
- (GEOTransitLine)transitLine;
- (GEOTransitSystem)transitSystem;
- (NSArray)departureTimes;
- (NSArray)routeLineArtwork;
- (NSArray)transitLineOptions;
- (NSDate)departureTime;
- (NSDate)lastStepArrivalDate;
- (NSTimeZone)departureTimeZone;
- (double)departureFrequencyMax;
- (double)departureFrequencyMin;
- (id)actionSheetArtworkForRideOption:(unint64_t)a3;
- (id)actionSheetDescriptionForRideOption:(unint64_t)a3;
- (id)blockTransferStep;
- (id)routeDetailsPrimaryArtworkForRideOption:(unint64_t)a3;
- (id)transitLineForRideOption:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)numberOfTransitStops;
- (unint64_t)rideOptionsCount;
- (unint64_t)selectedRideOptionIndex;
- (void)_cacheStepData;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedRideOptionIndex:(unint64_t)a3;
@end

@implementation GEOComposedTransitTripRouteSegment

- (GEOComposedTransitTripRouteSegment)initWithComposedRoute:(id)a3 rideSelections:(id)a4 sectionOptions:(id)a5 decoderData:(id)a6 tripIndex:(unint64_t)a7 stepRange:(_NSRange)a8 transitStepRange:(_NSRange)a9 pointRange:(_NSRange)a10 segmentIndex:(unint64_t)a11
{
  id v15 = a3;
  id v73 = a4;
  id v72 = a5;
  id v16 = a6;
  v83.receiver = self;
  v83.super_class = (Class)GEOComposedTransitTripRouteSegment;
  v17 = -[GEOComposedTransitBaseRouteSegment initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:](&v83, sel_initWithComposedRoute_stepRange_transitStepRange_pointRange_segmentIndex_, v15, a8.location, a8.length, a9.location, a9.length, a10.location, a10.length, a11);
  v18 = v17;
  if (v17)
  {
    v17->_boardStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    v17->_alightStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    v17->_blockTransferStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    if ([v15 supportsRideClusters])
    {
      if ([v73 count] <= a7)
      {
        v18->_selectedRideOptionIndex = 0;
      }
      else
      {
        v19 = [v73 objectAtIndexedSubscript:a7];
        v18->_selectedRideOptionIndex = [v19 unsignedIntegerValue];
      }
      v71 = v18;
      if ([v72 count] <= a7)
      {
        v20 = 0;
      }
      else
      {
        v20 = [v72 objectAtIndexedSubscript:a7];
      }
      uint64_t v21 = [v20 sectionsCount];
      v77 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
      v81 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
      v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
      v78 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
      v82 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
      uint64_t v76 = v21;
      if (v21)
      {
        uint64_t v22 = 0;
        v74 = v20;
        id v75 = v15;
        while (1)
        {
          uint64_t v23 = [v20 sectionAtIndex:v22];
          v24 = [v15 suggestedRoute];
          v25 = [v24 sectionAtIndex:v23];

          v26 = [v15 boardStepForSection:v25];
          v27 = [v25 actionSheetName];
          uint64_t v28 = [v27 length];

          if (v28) {
            break;
          }
          if ([v26 vehicleInfosCount])
          {
            v32 = [v26 vehicleInfoAtIndex:0];
            unsigned int v33 = [v32 lineIndex];

            v29 = 0;
            if ([v16 linesCount] > (unint64_t)v33)
            {
              v29 = [v16 lineAtIndex:v33];
            }
          }
          else
          {
            v29 = 0;
          }
          v34 = [(__CFString *)v29 nameDisplayString];
          uint64_t v35 = [v34 length];

          if (!v35)
          {
            v30 = v77;
            v31 = &stru_1ED51F370;
            goto LABEL_13;
          }
          v36 = [(__CFString *)v29 nameDisplayString];
          [v77 addObject:v36];

LABEL_20:
          if ([v25 routeDetailsArtworkIndexsCount])
          {
            uint64_t v37 = [v25 routeDetailsArtworkIndexs];
            uint64_t v38 = [v25 routeDetailsArtworkIndexsCount];
          }
          else
          {
            uint64_t v37 = [v26 routeDetailsPrimaryArtworkIndexs];
            uint64_t v38 = [v26 routeDetailsPrimaryArtworkIndexsCount];
          }
          v39 = [v16 artworkFromIndices:v37 count:v38];
          if (v39)
          {
            [v81 addObject:v39];
          }
          else
          {
            v40 = [MEMORY[0x1E4F1C978] array];
            [v81 addObject:v40];
          }
          if ([v25 actionSheetArtworkIndexsCount])
          {
            uint64_t v41 = [v25 actionSheetArtworkIndexs];
            uint64_t v42 = [v25 actionSheetArtworkIndexsCount];
          }
          else
          {
            uint64_t v41 = [v26 routeDetailsPrimaryArtworkIndexs];
            uint64_t v42 = [v26 routeDetailsPrimaryArtworkIndexsCount];
          }
          v43 = [v16 artworkFromIndices:v41 count:v42];
          if (v43)
          {
            [v79 addObject:v43];
          }
          else
          {
            v44 = [MEMORY[0x1E4F1C978] array];
            [v79 addObject:v44];
          }
          v45 = [v26 vehicleInfos];
          v46 = [v45 firstObject];

          if ([v46 hasLineIndex]
            && (unsigned int v47 = [v46 lineIndex], objc_msgSend(v16, "linesCount") > (unint64_t)v47))
          {
            v48 = objc_msgSend(v16, "lineAtIndex:", objc_msgSend(v46, "lineIndex"));
          }
          else
          {
            v48 = 0;
          }
          if ([v48 hasSystemIndex]
            && (unsigned int v49 = [v48 systemIndex], objc_msgSend(v16, "systemsCount") > (unint64_t)v49))
          {
            v50 = objc_msgSend(v16, "systemAtIndex:", objc_msgSend(v48, "systemIndex"));
            if (v50)
            {
              v51 = [[_GEOTransitSystem alloc] initWithSystem:v50];
              if (v48) {
                goto LABEL_42;
              }
            }
            else
            {
              v51 = 0;
              if (v48)
              {
LABEL_42:
                double v52 = -180.0;
                double v53 = -180.0;
                if (v26)
                {
                  v54 = [v26 location];
                  [v54 coordinate];
                  double v53 = v55;
                  double v52 = v56;
                }
                v57 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", v48, v51, v53, v52);
                if (v57) {
                  goto LABEL_46;
                }
              }
            }
          }
          else
          {
            v51 = 0;
            v50 = 0;
            if (v48) {
              goto LABEL_42;
            }
          }
          v57 = [MEMORY[0x1E4F1CA98] null];
LABEL_46:
          v58 = v57;
          [v78 addObject:v57];

          v59 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v25, "disableAlightNotifications") ^ 1);
          [v82 addObject:v59];

          ++v22;
          id v15 = v75;
          v20 = v74;
          if (v76 == v22) {
            goto LABEL_51;
          }
        }
        v29 = [v25 actionSheetName];
        v30 = v77;
        v31 = v29;
LABEL_13:
        [v30 addObject:v31];
        goto LABEL_20;
      }
LABEL_51:
      uint64_t v60 = [v77 copy];
      v18 = v71;
      actionSheetDescriptions = v71->_actionSheetDescriptions;
      v71->_actionSheetDescriptions = (NSArray *)v60;

      uint64_t v62 = [v81 copy];
      routeDetailsOptionsArtwork = v71->_routeDetailsOptionsArtwork;
      v71->_routeDetailsOptionsArtwork = (NSArray *)v62;

      uint64_t v64 = [v79 copy];
      actionSheetOptionsArtwork = v71->_actionSheetOptionsArtwork;
      v71->_actionSheetOptionsArtwork = (NSArray *)v64;

      uint64_t v66 = [v78 copy];
      transitLineOptions = v71->_transitLineOptions;
      v71->_transitLineOptions = (NSArray *)v66;

      uint64_t v68 = [v82 copy];
      alightNotifications = v71->_alightNotifications;
      v71->_alightNotifications = (NSArray *)v68;
    }
  }

  return v18;
}

- (int64_t)type
{
  return 6;
}

- (void)_cacheStepData
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(GEOComposedRouteSegment *)self composedRoute];
  v4 = [v3 steps];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    self->_numberOfTransitStops = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = [(GEOComposedRouteSegment *)self steps];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          switch([v11 maneuver])
          {
            case 3u:
              v12 = (objc_class *)[v11 stepIndex];
              uint64_t v13 = 72;
              goto LABEL_13;
            case 4u:
              v14 = [v11 transitVehicle];
              int v15 = [v14 pickupDropoffType];

              if (v15 != 100) {
                ++self->_numberOfTransitStops;
              }
              continue;
            case 5u:
              v12 = (objc_class *)[v11 stepIndex];
              uint64_t v13 = 80;
              goto LABEL_13;
            case 9u:
              v12 = (objc_class *)[v11 stepIndex];
              uint64_t v13 = 88;
LABEL_13:
              *(Class *)((char *)&self->super.super.super.isa + v13) = v12;
              break;
            default:
              continue;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)_needsStepData
{
  return self->_boardStepIndex == 0x7FFFFFFFFFFFFFFFLL
      && self->_alightStepIndex == 0x7FFFFFFFFFFFFFFFLL
      && self->_blockTransferStepIndex == 0x7FFFFFFFFFFFFFFFLL;
}

- (GEOComposedTransitTripRouteStep)boardStep
{
  if ([(GEOComposedTransitTripRouteSegment *)self _needsStepData]) {
    [(GEOComposedTransitTripRouteSegment *)self _cacheStepData];
  }
  v3 = [(GEOComposedRouteSegment *)self composedRoute];
  v4 = [v3 stepAtIndex:self->_boardStepIndex];

  return (GEOComposedTransitTripRouteStep *)v4;
}

- (GEOComposedTransitTripRouteStep)alightStep
{
  if ([(GEOComposedTransitTripRouteSegment *)self _needsStepData]) {
    [(GEOComposedTransitTripRouteSegment *)self _cacheStepData];
  }
  v3 = [(GEOComposedRouteSegment *)self composedRoute];
  v4 = [v3 stepAtIndex:self->_alightStepIndex];

  return (GEOComposedTransitTripRouteStep *)v4;
}

- (id)blockTransferStep
{
  if ([(GEOComposedTransitTripRouteSegment *)self _needsStepData]) {
    [(GEOComposedTransitTripRouteSegment *)self _cacheStepData];
  }
  v3 = [(GEOComposedRouteSegment *)self composedRoute];
  v4 = [v3 stepAtIndex:self->_blockTransferStepIndex];

  return v4;
}

- (unint64_t)rideOptionsCount
{
  v3 = [(GEOComposedRouteSegment *)self composedRoute];
  int v4 = [v3 supportsRideClusters];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(GEOComposedRouteSegment *)self composedRoute];
  v6 = [v5 sectionOptionForTripSegment:self];
  unint64_t v7 = [v6 sectionsCount];

  return v7;
}

- (void)setSelectedRideOptionIndex:(unint64_t)a3
{
  if (self->_selectedRideOptionIndex != a3)
  {
    self->_selectedRideOptionIndex = a3;
    uint64_t v5 = [(GEOComposedRouteSegment *)self composedRoute];
    int v6 = [v5 supportsRideClusters];

    if (v6)
    {
      id v7 = [(GEOComposedRouteSegment *)self composedRoute];
      [v7 tripSegment:self didSelectRide:a3];
    }
  }
}

- (id)routeDetailsPrimaryArtworkForRideOption:(unint64_t)a3
{
  uint64_t v5 = [(GEOComposedRouteSegment *)self composedRoute];
  int v6 = [v5 supportsRideClusters];

  if (v6
    && ([(NSArray *)self->_routeDetailsOptionsArtwork objectAtIndexedSubscript:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    uint64_t v9 = [(NSArray *)self->_routeDetailsOptionsArtwork objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)actionSheetArtworkForRideOption:(unint64_t)a3
{
  uint64_t v5 = [(GEOComposedRouteSegment *)self composedRoute];
  int v6 = [v5 supportsRideClusters];

  if (v6
    && ([(NSArray *)self->_actionSheetOptionsArtwork objectAtIndexedSubscript:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    uint64_t v9 = [(NSArray *)self->_actionSheetOptionsArtwork objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)actionSheetDescriptionForRideOption:(unint64_t)a3
{
  return [(NSArray *)self->_actionSheetDescriptions objectAtIndexedSubscript:a3];
}

- (id)transitLineForRideOption:(unint64_t)a3
{
  return [(NSArray *)self->_transitLineOptions objectAtIndexedSubscript:a3];
}

- (GEOTransitSystem)transitSystem
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  if (v3
    || ([(GEOComposedTransitTripRouteSegment *)self blockTransferStep],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v4 = v3;
  }
  else
  {
    int v4 = [(GEOComposedTransitTripRouteSegment *)self alightStep];
    v3 = v4;
  }
  uint64_t v5 = [v4 transitSystem];

  return (GEOTransitSystem *)v5;
}

- (GEOTransitLine)transitLine
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  if (v3
    || ([(GEOComposedTransitTripRouteSegment *)self blockTransferStep],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v4 = v3;
  }
  else
  {
    int v4 = [(GEOComposedTransitTripRouteSegment *)self alightStep];
    v3 = v4;
  }
  uint64_t v5 = [v4 transitLine];

  return (GEOTransitLine *)v5;
}

- (NSTimeZone)departureTimeZone
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOComposedTransitTripRouteSegment *)self blockTransferStep];
  }
  int v6 = v5;

  id v7 = [v6 departureTimeZone];

  return (NSTimeZone *)v7;
}

- (NSDate)departureTime
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOComposedTransitTripRouteSegment *)self blockTransferStep];
  }
  int v6 = v5;

  id v7 = [v6 departureTime];

  return (NSDate *)v7;
}

- (NSArray)departureTimes
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOComposedTransitTripRouteSegment *)self blockTransferStep];
  }
  int v6 = v5;

  id v7 = [v6 departureTimes];

  return (NSArray *)v7;
}

- (double)departureFrequencyMin
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOComposedTransitTripRouteSegment *)self blockTransferStep];
  }
  int v6 = v5;

  id v7 = [v6 transitVehicle];
  double v8 = (double)[v7 departureFrequencyMin];

  return v8;
}

- (double)departureFrequencyMax
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOComposedTransitTripRouteSegment *)self blockTransferStep];
  }
  int v6 = v5;

  id v7 = [v6 transitVehicle];
  double v8 = (double)[v7 departureFrequencyMax];

  return v8;
}

- (unint64_t)numberOfTransitStops
{
  if ([(GEOComposedTransitTripRouteSegment *)self _needsStepData]) {
    [(GEOComposedTransitTripRouteSegment *)self _cacheStepData];
  }
  return self->_numberOfTransitStops;
}

- (NSDate)lastStepArrivalDate
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  if (v3
    || ([(GEOComposedTransitTripRouteSegment *)self blockTransferStep],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[GEOComposedRouteSegment remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:](self, "remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:", [v3 stepIndex], 0.0);
    double v5 = v4;
    int v6 = [v3 departureTime];
    id v7 = [v6 dateByAddingTimeInterval:v5];
  }
  else
  {
    id v7 = 0;
  }

  return (NSDate *)v7;
}

- (NSArray)routeLineArtwork
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self boardStep];
  if (v3
    || ([(GEOComposedTransitTripRouteSegment *)self blockTransferStep],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v4 = [v3 getNextStep];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v6 = [v3 getNextStep];
      id v7 = [v6 routeLineArtwork];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        uint64_t v9 = [v6 routeLineArtwork];

        goto LABEL_10;
      }
    }
    v10 = v3;
  }
  else
  {
    v10 = [(GEOComposedTransitTripRouteSegment *)self alightStep];
    v3 = v10;
  }
  uint64_t v9 = [v10 routeLineArtwork];
LABEL_10:

  return (NSArray *)v9;
}

- (BOOL)notifyBeforeAlightStep
{
  v2 = [(NSArray *)self->_alightNotifications objectAtIndex:self->_selectedRideOptionIndex];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitTripRouteSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedTransitTripRouteSegment;
  double v5 = [(GEOComposedTransitBaseRouteSegment *)&v28 initWithCoder:v4];
  if (v5)
  {
    v5->_boardStepIndex = [v4 decodeIntegerForKey:@"_boardStepIndex"];
    v5->_alightStepIndex = [v4 decodeIntegerForKey:@"_alightStepIndex"];
    v5->_blockTransferStepIndex = [v4 decodeIntegerForKey:@"_blockTransferStepIndex"];
    v5->_numberOfTransitStops = [v4 decodeIntegerForKey:@"_numberOfTransitStops"];
    v5->_selectedRideOptionIndex = [v4 decodeIntegerForKey:@"_selectedRideOptionIndex"];
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_actionSheetDescriptions"];
    actionSheetDescriptions = v5->_actionSheetDescriptions;
    v5->_actionSheetDescriptions = (NSArray *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_routeDetailsOptionsArtwork"];
    routeDetailsOptionsArtwork = v5->_routeDetailsOptionsArtwork;
    v5->_routeDetailsOptionsArtwork = (NSArray *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    int v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_actionSheetOptionsArtwork"];
    actionSheetOptionsArtwork = v5->_actionSheetOptionsArtwork;
    v5->_actionSheetOptionsArtwork = (NSArray *)v16;

    long long v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_transitLineOptions"];
    transitLineOptions = v5->_transitLineOptions;
    v5->_transitLineOptions = (NSArray *)v22;

    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_alightNotifications"];
    alightNotifications = v5->_alightNotifications;
    v5->_alightNotifications = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitTripRouteSegment;
  id v4 = a3;
  [(GEOComposedTransitBaseRouteSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_boardStepIndex, @"_boardStepIndex", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_alightStepIndex forKey:@"_alightStepIndex"];
  [v4 encodeInteger:self->_blockTransferStepIndex forKey:@"_blockTransferStepIndex"];
  [v4 encodeInteger:self->_numberOfTransitStops forKey:@"_numberOfTransitStops"];
  [v4 encodeInteger:self->_selectedRideOptionIndex forKey:@"_selectedRideOptionIndex"];
  [v4 encodeObject:self->_actionSheetDescriptions forKey:@"_actionSheetDescriptions"];
  [v4 encodeObject:self->_routeDetailsOptionsArtwork forKey:@"_routeDetailsOptionsArtwork"];
  [v4 encodeObject:self->_actionSheetOptionsArtwork forKey:@"_actionSheetOptionsArtwork"];
  [v4 encodeObject:self->_transitLineOptions forKey:@"_transitLineOptions"];
  [v4 encodeObject:self->_alightNotifications forKey:@"_alightNotifications"];
}

- (unint64_t)selectedRideOptionIndex
{
  return self->_selectedRideOptionIndex;
}

- (NSArray)transitLineOptions
{
  return self->_transitLineOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alightNotifications, 0);
  objc_storeStrong((id *)&self->_transitLineOptions, 0);
  objc_storeStrong((id *)&self->_actionSheetOptionsArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsOptionsArtwork, 0);

  objc_storeStrong((id *)&self->_actionSheetDescriptions, 0);
}

@end