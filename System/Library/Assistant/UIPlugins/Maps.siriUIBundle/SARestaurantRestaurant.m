@interface SARestaurantRestaurant
- (NSArray)timeComponentsForOpenings;
- (id)_ma_makeReservationPunchOutForSelectedOpeningIndex:(unint64_t)a3;
- (id)_ma_reservationInfoWithDelegate:(id)a3;
@end

@implementation SARestaurantRestaurant

- (NSArray)timeComponentsForOpenings
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(SARestaurantRestaurant *)self openings];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v6 = +[NSDateFormatter _ma_sharedDateFormatter];
  [v6 setLocalizedDateFormatFromTemplate:@"jmm"];
  v7 = [(SARestaurantRestaurant *)self openings];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_9A98;
  v13[3] = &unk_3CFE8;
  id v14 = v6;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v13];

  v10 = v15;
  v11 = (NSArray *)v8;

  return v11;
}

- (id)_ma_makeReservationPunchOutForSelectedOpeningIndex:(unint64_t)a3
{
  v4 = [(SARestaurantRestaurant *)self openings];
  if ((unint64_t)[v4 count] <= a3)
  {
    v6 = +[SAUIAppPunchOut openTableAppPunchOut];
  }
  else
  {
    id v5 = [v4 objectAtIndex:a3];
    v6 = [v5 makeReservationPunchOut];
  }

  return v6;
}

- (id)_ma_reservationInfoWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SARestaurantRestaurant *)self makeReservationPunchOuts];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = [(SARestaurantRestaurant *)self timeComponentsForOpenings];
    id v8 = +[UIImage _ma_openTableLogoImage];
    id v9 = +[NSString _ma_openTableDisplayName];
    id v10 = [objc_alloc((Class)_MKPlaceReservationInfo) initWithOpenTimes:v7 attributionProviderName:v9 providerLogoImage:v8 delegate:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end