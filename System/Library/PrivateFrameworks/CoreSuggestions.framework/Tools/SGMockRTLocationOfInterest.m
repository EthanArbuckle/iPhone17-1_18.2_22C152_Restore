@interface SGMockRTLocationOfInterest
+ (id)mockLocationOfInterestWithPreferredName:(id)a3 longitude:(double)a4 latitude:(double)a5 type:(int64_t)a6;
- (NSString)preferredName;
- (SGMockRTMapItem)mapItem;
- (double)confidence;
- (int64_t)type;
- (void)setConfidence:(double)a3;
- (void)setMapItem:(id)a3;
- (void)setPreferredName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SGMockRTLocationOfInterest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredName, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setPreferredName:(id)a3
{
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (void)setMapItem:(id)a3
{
}

- (SGMockRTMapItem)mapItem
{
  return self->_mapItem;
}

+ (id)mockLocationOfInterestWithPreferredName:(id)a3 longitude:(double)a4 latitude:(double)a5 type:(int64_t)a6
{
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setLongitude:a4];
  [v10 setLatitude:a5];
  v11 = objc_opt_new();
  [v11 setLocation:v10];
  v12 = objc_opt_new();
  [v12 setPreferredName:v9];

  [v12 setMapItem:v11];
  [v12 setType:a6];

  return v12;
}

@end