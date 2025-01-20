@interface DDMatchShipmentTrackingNumber
- (DDMatchShipmentTrackingNumber)initWithDDScannerResult:(id)a3;
- (NSString)carrier;
- (NSString)trackingNumber;
@end

@implementation DDMatchShipmentTrackingNumber

- (DDMatchShipmentTrackingNumber)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDMatchShipmentTrackingNumber;
  v5 = [(DDMatch *)&v14 initWithDDScannerResult:v4];
  if (v5)
  {
    id v12 = 0;
    id v13 = 0;
    int v6 = [v4 getTrackingNumber:&v13 carrier:&v12];
    id v7 = v13;
    id v8 = v13;
    id v9 = v12;
    id v10 = v12;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_carrier, v9);
      objc_storeStrong((id *)&v5->_trackingNumber, v7);
    }
  }
  return v5;
}

- (NSString)carrier
{
  return self->_carrier;
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingNumber, 0);

  objc_storeStrong((id *)&self->_carrier, 0);
}

@end