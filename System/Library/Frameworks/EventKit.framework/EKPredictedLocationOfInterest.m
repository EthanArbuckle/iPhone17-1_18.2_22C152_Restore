@interface EKPredictedLocationOfInterest
- (EKPredictedLocationOfInterest)initWithPredictedLocationOfInterest:(id)a3;
- (EKPredictedLocationOfInterest)initWithType:(int64_t)a3 customLabel:(id)a4 mapItemName:(id)a5 addressCountryCode:(id)a6 addressThoroughFare:(id)a7 addressLocality:(id)a8;
- (NSString)addressCountryCode;
- (NSString)addressLocality;
- (NSString)addressThoroughfare;
- (NSString)customLabel;
- (NSString)mapItemName;
- (RTPredictedLocationOfInterest)rtPredictedLocationOfInterest;
- (int64_t)type;
@end

@implementation EKPredictedLocationOfInterest

- (EKPredictedLocationOfInterest)initWithPredictedLocationOfInterest:(id)a3
{
  id v16 = a3;
  v4 = [v16 locationOfInterest];
  v5 = [v4 mapItem];
  v6 = [v5 address];
  uint64_t v7 = [v4 type];
  v8 = [v4 customLabel];
  v9 = [v5 name];
  v10 = [v6 countryCode];
  v11 = [v6 thoroughfare];
  v12 = [v6 locality];
  v13 = [(EKPredictedLocationOfInterest *)self initWithType:v7 customLabel:v8 mapItemName:v9 addressCountryCode:v10 addressThoroughFare:v11 addressLocality:v12];

  if (v13) {
    objc_storeStrong((id *)&v13->_rtPredictedLocationOfInterest, a3);
  }

  return v13;
}

- (EKPredictedLocationOfInterest)initWithType:(int64_t)a3 customLabel:(id)a4 mapItemName:(id)a5 addressCountryCode:(id)a6 addressThoroughFare:(id)a7 addressLocality:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)EKPredictedLocationOfInterest;
  v19 = [(EKPredictedLocationOfInterest *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    uint64_t v21 = [v14 copy];
    customLabel = v20->_customLabel;
    v20->_customLabel = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    mapItemName = v20->_mapItemName;
    v20->_mapItemName = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    addressCountryCode = v20->_addressCountryCode;
    v20->_addressCountryCode = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    addressThoroughfare = v20->_addressThoroughfare;
    v20->_addressThoroughfare = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    addressLocality = v20->_addressLocality;
    v20->_addressLocality = (NSString *)v29;
  }
  return v20;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (NSString)mapItemName
{
  return self->_mapItemName;
}

- (NSString)addressCountryCode
{
  return self->_addressCountryCode;
}

- (NSString)addressThoroughfare
{
  return self->_addressThoroughfare;
}

- (NSString)addressLocality
{
  return self->_addressLocality;
}

- (RTPredictedLocationOfInterest)rtPredictedLocationOfInterest
{
  return self->_rtPredictedLocationOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtPredictedLocationOfInterest, 0);
  objc_storeStrong((id *)&self->_addressLocality, 0);
  objc_storeStrong((id *)&self->_addressThoroughfare, 0);
  objc_storeStrong((id *)&self->_addressCountryCode, 0);
  objc_storeStrong((id *)&self->_mapItemName, 0);

  objc_storeStrong((id *)&self->_customLabel, 0);
}

@end