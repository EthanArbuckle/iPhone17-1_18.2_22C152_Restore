@interface MKETAResponse
- (CLLocationDistance)distance;
- (MKDirectionsTransportType)transportType;
- (MKETAResponse)initWithSource:(id)a3 destination:(id)a4 expectedTravelTime:(double)a5 distance:(double)a6 sortedETAs:(id)a7;
- (MKMapItem)destination;
- (MKMapItem)source;
- (NSArray)_sortedETAs;
- (NSDate)expectedArrivalDate;
- (NSDate)expectedDepartureDate;
- (NSTimeInterval)expectedTravelTime;
- (id)description;
- (unint64_t)_transportType:(int)a3;
- (void)setExpectedArrivalDate:(id)a3;
- (void)setExpectedDepartureDate:(id)a3;
@end

@implementation MKETAResponse

- (NSTimeInterval)expectedTravelTime
{
  return self->_expectedTravelTime;
}

- (NSDate)expectedDepartureDate
{
  return self->_expectedDepartureDate;
}

- (void)setExpectedDepartureDate:(id)a3
{
}

- (void)setExpectedArrivalDate:(id)a3
{
}

- (MKETAResponse)initWithSource:(id)a3 destination:(id)a4 expectedTravelTime:(double)a5 distance:(double)a6 sortedETAs:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MKETAResponse;
  v16 = [(MKETAResponse *)&v30 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_source, a3);
    objc_storeStrong((id *)&v17->_destination, a4);
    v17->_expectedTravelTime = a5;
    v17->_distance = a6;
    objc_storeStrong((id *)&v17->_sortedETAs, a7);
    v18 = [(NSArray *)v17->_sortedETAs firstObject];

    if (v18)
    {
      v19 = [(NSArray *)v17->_sortedETAs firstObject];
      v17->_transportType = -[MKETAResponse _transportType:](v17, "_transportType:", [v19 transportType]);
      [v19 expectedTimeOfDeparture];
      if (v20 > 0.0)
      {
        v21 = (void *)MEMORY[0x1E4F1C9C8];
        [v19 expectedTimeOfDeparture];
        uint64_t v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
        expectedDepartureDate = v17->_expectedDepartureDate;
        v17->_expectedDepartureDate = (NSDate *)v22;

        v24 = (void *)MEMORY[0x1E4F1C9C8];
        [v19 expectedTimeOfDeparture];
        uint64_t v26 = [v24 dateWithTimeIntervalSinceReferenceDate:v25 + a5];
        expectedArrivalDate = v17->_expectedArrivalDate;
        v17->_expectedArrivalDate = (NSDate *)v26;
      }
    }
    v28 = v17;
  }

  return v17;
}

- (unint64_t)_transportType:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_18BD1B058[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedDepartureDate, 0);
  objc_storeStrong((id *)&self->_expectedArrivalDate, 0);
  objc_storeStrong((id *)&self->_sortedETAs, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MKETAResponse;
  v4 = [(MKETAResponse *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ source: %@ destination: %@ etas: %@", v4, self->_source, self->_destination, self->_sortedETAs];

  return v5;
}

- (MKMapItem)source
{
  return self->_source;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (CLLocationDistance)distance
{
  return self->_distance;
}

- (NSArray)_sortedETAs
{
  return self->_sortedETAs;
}

- (MKDirectionsTransportType)transportType
{
  return self->_transportType;
}

- (NSDate)expectedArrivalDate
{
  return self->_expectedArrivalDate;
}

@end