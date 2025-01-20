@interface NTKAlaskanPersistenceStorage
- (NSDate)diverCountUpStartDate;
- (NSNumber)gmtOffsetHours;
- (NSNumber)gmtSelectedCityIdentifier;
- (NSString)gmtSelectedTimezone;
- (NTKFaceViewDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setDiverCountUpStartDate:(id)a3;
- (void)setGmtOffsetHours:(id)a3;
- (void)setGmtSelectedCityIdentifier:(id)a3;
- (void)setGmtSelectedTimezone:(id)a3;
@end

@implementation NTKAlaskanPersistenceStorage

- (void)setGmtOffsetHours:(id)a3
{
  id v7 = a3;
  v4 = [(NTKAlaskanPersistenceStorage *)self gmtOffsetHours];
  char v5 = NTKEqualObjects();

  if ((v5 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained faceViewDidUpdateCustomData:v7 forKey:@"gmt-offset-hours"];
  }
}

- (NSNumber)gmtOffsetHours
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained faceViewDidRequestCustomDataForKey:@"gmt-offset-hours"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setGmtSelectedTimezone:(id)a3
{
  id v7 = a3;
  id v4 = [(NTKAlaskanPersistenceStorage *)self gmtSelectedTimezone];
  unsigned __int8 v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained faceViewDidUpdateCustomData:v7 forKey:@"gmt-selected-timezone"];
  }
}

- (NSString)gmtSelectedTimezone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained faceViewDidRequestCustomDataForKey:@"gmt-selected-timezone"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setGmtSelectedCityIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = [v8 integerValue];
  unsigned __int8 v5 = [(NTKAlaskanPersistenceStorage *)self gmtSelectedCityIdentifier];
  id v6 = [v5 integerValue];

  if (v4 != v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained faceViewDidUpdateCustomData:v8 forKey:@"gmt-selected-city"];
  }
}

- (NSNumber)gmtSelectedCityIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained faceViewDidRequestCustomDataForKey:@"gmt-selected-city"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setDiverCountUpStartDate:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    unsigned __int8 v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [WeakRetained faceViewDidUpdateCustomData:v5 forKey:NTKDiverCountUpStartDate];
  }
  else
  {
    [WeakRetained faceViewDidUpdateCustomData:0 forKey:NTKDiverCountUpStartDate];
  }
}

- (NSDate)diverCountUpStartDate
{
  v3 = [(NTKAlaskanPersistenceStorage *)self delegate];

  if (v3)
  {
    id v4 = [(NTKAlaskanPersistenceStorage *)self delegate];
    unsigned __int8 v5 = [v4 faceViewDidRequestCustomDataForKey:NTKDiverCountUpStartDate];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 doubleValue];
      v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v3 = 0;
    }
  }

  return (NSDate *)v3;
}

- (NTKFaceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKFaceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end