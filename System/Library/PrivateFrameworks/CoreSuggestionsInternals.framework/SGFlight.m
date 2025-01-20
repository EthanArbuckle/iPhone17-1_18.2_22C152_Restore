@interface SGFlight
- (NSString)airline;
- (NSString)arrivalAirportDescription;
- (NSString)departureAirportDescription;
- (NSString)flightno;
- (SGFlight)initWithCarrier:(id)a3 flightNo:(id)a4 depDesc:(id)a5 arrDesc:(id)a6;
- (id)description;
@end

@implementation SGFlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalAirportDescription, 0);
  objc_storeStrong((id *)&self->_departureAirportDescription, 0);
  objc_storeStrong((id *)&self->_airline, 0);
  objc_storeStrong((id *)&self->_flightno, 0);
}

- (NSString)arrivalAirportDescription
{
  return self->_arrivalAirportDescription;
}

- (NSString)departureAirportDescription
{
  return self->_departureAirportDescription;
}

- (NSString)airline
{
  return self->_airline;
}

- (NSString)flightno
{
  return self->_flightno;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGFlight *)self airline];
  v5 = [(SGFlight *)self flightno];
  v6 = [(SGFlight *)self departureAirportDescription];
  v7 = [(SGFlight *)self arrivalAirportDescription];
  v8 = (void *)[v3 initWithFormat:@"%@ %@ from %@ to %@", v4, v5, v6, v7];

  return v8;
}

- (SGFlight)initWithCarrier:(id)a3 flightNo:(id)a4 depDesc:(id)a5 arrDesc:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGFlightData.m", 710, @"Invalid parameter not satisfying: %@", @"airline" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGFlightData.m", 711, @"Invalid parameter not satisfying: %@", @"flightno" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)SGFlight;
  v16 = [(SGFlight *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_airline, a3);
    objc_storeStrong((id *)&v17->_flightno, a4);
    objc_storeStrong((id *)&v17->_departureAirportDescription, a5);
    objc_storeStrong((id *)&v17->_arrivalAirportDescription, a6);
  }

  return v17;
}

@end