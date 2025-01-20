@interface GEOQuickETATransitDeparturesInfo
- (BOOL)departuresHaveFrequency;
- (GEOQuickETATransitDeparturesInfo)initWithComposedRoute:(id)a3;
- (NSDate)departureFrequencyValidUntil;
- (NSString)direction;
- (NSString)headsign;
- (double)departureFrequency;
- (id)_chooseMostImportantTransitLegInRoute:(id)a3;
- (id)description;
@end

@implementation GEOQuickETATransitDeparturesInfo

- (GEOQuickETATransitDeparturesInfo)initWithComposedRoute:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOQuickETATransitDeparturesInfo;
  v5 = [(GEOQuickETATransitDeparturesInfo *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(GEOQuickETATransitDeparturesInfo *)v5 _chooseMostImportantTransitLegInRoute:v4];
    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6->_departuresHaveFrequency = 0;
  }
  v8 = v6;
LABEL_6:

  return v8;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)GEOQuickETATransitDeparturesInfo;
  id v4 = [(GEOQuickETATransitDeparturesInfo *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendFormat:@"  direction : %@\n  headsign : %@\n departuresHaveFrequency : %d\n  departureFrequency : %f\n  departureFrequencyValidUntil : %@", self->_direction, self->_headsign, self->_departuresHaveFrequency, *(void *)&self->_departureFrequency, self->_departureFrequencyValidUntil];

  return v5;
}

- (id)_chooseMostImportantTransitLegInRoute:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "segments", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_super v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 type] == 6)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (NSString)direction
{
  return self->_direction;
}

- (NSString)headsign
{
  return self->_headsign;
}

- (BOOL)departuresHaveFrequency
{
  return self->_departuresHaveFrequency;
}

- (double)departureFrequency
{
  return self->_departureFrequency;
}

- (NSDate)departureFrequencyValidUntil
{
  return self->_departureFrequencyValidUntil;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureFrequencyValidUntil, 0);
  objc_storeStrong((id *)&self->_headsign, 0);

  objc_storeStrong((id *)&self->_direction, 0);
}

@end