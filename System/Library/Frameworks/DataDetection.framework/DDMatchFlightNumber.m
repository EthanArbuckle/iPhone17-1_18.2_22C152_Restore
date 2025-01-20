@interface DDMatchFlightNumber
- (DDMatchFlightNumber)initWithDDScannerResult:(id)a3;
- (NSString)airline;
- (NSString)flightNumber;
@end

@implementation DDMatchFlightNumber

- (DDMatchFlightNumber)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDMatchFlightNumber;
  v5 = [(DDMatch *)&v14 initWithDDScannerResult:v4];
  if (v5)
  {
    id v12 = 0;
    id v13 = 0;
    int v6 = [v4 getFlightNumber:&v13 airline:&v12];
    id v7 = v13;
    id v8 = v13;
    id v9 = v12;
    id v10 = v12;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_airline, v9);
      objc_storeStrong((id *)&v5->_flightNumber, v7);
    }
  }
  return v5;
}

- (NSString)airline
{
  return self->_airline;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flightNumber, 0);

  objc_storeStrong((id *)&self->_airline, 0);
}

@end