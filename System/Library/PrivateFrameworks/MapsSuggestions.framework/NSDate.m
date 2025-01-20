@interface NSDate
+ (id)_maps_dateDescriptionShort:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5;
+ (id)_maps_dayDescriptionStringShortDescription:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5;
@end

@implementation NSDate

+ (id)_maps_dateDescriptionShort:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (qword_100081F30 != -1) {
    dispatch_once(&qword_100081F30, &stru_100072830);
  }
  [(id)qword_100081F28 setTimeZone:v7];
  v9 = +[NSDate _maps_dayDescriptionStringShortDescription:v6 timeZone:v7 bookingDate:v8];
  v10 = [(id)qword_100081F28 stringFromDate:v8];
  v11 = +[NSCalendar currentCalendar];
  v12 = [v11 componentsInTimeZone:v7 fromDate:v8];

  if ([v12 hour] == (id)1)
  {
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v13 = [v12 hour];
  if (v6)
  {
    if (v13 != (id)13)
    {
      block = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_10004BC2C;
      v24 = &unk_1000719C0;
      v25 = "NSDate+RestaurantReservationDescriptionHelper";
      if (qword_100081F50 != -1) {
        dispatch_once(&qword_100081F50, &block);
      }
      v14 = (void *)qword_100081F48;
      CFStringRef v15 = @"reservation_date_at_time_key_not_at_1";
      goto LABEL_17;
    }
LABEL_8:
    block = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_10004BC2C;
    v24 = &unk_1000719C0;
    v25 = "NSDate+RestaurantReservationDescriptionHelper";
    if (qword_100081F50 != -1) {
      dispatch_once(&qword_100081F50, &block);
    }
    v14 = (void *)qword_100081F48;
    CFStringRef v15 = @"reservation_date_at_time_key_at_1";
LABEL_17:
    CFStringRef v16 = @"%1$@ at %2$@<unlocalized>";
    goto LABEL_18;
  }
LABEL_11:
  block = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_10004BC2C;
  v24 = &unk_1000719C0;
  v25 = "NSDate+RestaurantReservationDescriptionHelper";
  if (qword_100081F50 != -1) {
    dispatch_once(&qword_100081F50, &block);
  }
  v14 = (void *)qword_100081F48;
  CFStringRef v15 = @"reservation_date_at_time_short_key";
  CFStringRef v16 = @"%1$@, %2$@<unlocalized>";
LABEL_18:
  v17 = [v14 localizedStringForKey:v15 value:v16 table:0];
  v18 = MapsSuggestionsNonNilString();

  id v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v18, v9, v10);
  return v19;
}

+ (id)_maps_dayDescriptionStringShortDescription:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  BOOL v37 = v6;
  if (qword_100081F40 != -1) {
    dispatch_once(&qword_100081F40, &stru_100072850);
  }
  [(id)qword_100081F38 setDateStyle:0];
  [(id)qword_100081F38 setTimeStyle:1];
  [(id)qword_100081F38 setTimeZone:v7];
  v9 = +[NSCalendar currentCalendar];
  v10 = +[NSDate date];
  v11 = [v9 componentsInTimeZone:v7 fromDate:v10];

  v12 = [v9 componentsInTimeZone:v7 fromDate:v8];
  id v13 = [v11 year];
  if (v13 == [v12 year] && (id v14 = objc_msgSend(v11, "month"), v14 == objc_msgSend(v12, "month")))
  {
    id v15 = [v11 day];
    BOOL v16 = v15 == [v12 day];
  }
  else
  {
    BOOL v16 = 0;
  }
  id v17 = [v11 year];
  if (v17 != [v12 year])
  {
    BOOL v19 = 0;
    if (!v16) {
      goto LABEL_9;
    }
LABEL_11:
    BOOL v20 = (uint64_t)[v12 hour] > 16;
    goto LABEL_12;
  }
  id v18 = [v11 weekOfYear];
  BOOL v19 = v18 == [v12 weekOfYear];
  if (v16) {
    goto LABEL_11;
  }
LABEL_9:
  BOOL v20 = 0;
LABEL_12:
  id v21 = [v11 copy];
  objc_msgSend(v21, "setDay:", (char *)objc_msgSend(v21, "day") + 1);
  id v22 = [v21 year];
  if (v22 == [v12 year])
  {
    id v23 = [v21 month];
    if (v23 == [v12 month])
    {
      id v24 = [v21 day];
      BOOL v25 = v24 == [v12 day];
      if (!v20) {
        goto LABEL_15;
      }
LABEL_20:
      block = _NSConcreteStackBlock;
      uint64_t v39 = 3221225472;
      v40 = sub_10004BC2C;
      v41 = &unk_1000719C0;
      v42 = "NSDate+RestaurantReservationDescriptionHelper";
      if (qword_100081F50 != -1) {
        dispatch_once(&qword_100081F50, &block);
      }
      v26 = v8;
      v27 = (void *)qword_100081F48;
      CFStringRef v28 = @"reservation_tonight_key";
      CFStringRef v29 = @"Tonight<unlocalized>";
      goto LABEL_27;
    }
  }
  BOOL v25 = 0;
  if (v20) {
    goto LABEL_20;
  }
LABEL_15:
  if (v16)
  {
    block = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472;
    v40 = sub_10004BC2C;
    v41 = &unk_1000719C0;
    v42 = "NSDate+RestaurantReservationDescriptionHelper";
    v26 = v8;
    if (qword_100081F50 != -1) {
      dispatch_once(&qword_100081F50, &block);
    }
    v27 = (void *)qword_100081F48;
    CFStringRef v28 = @"reservation_today_key";
    CFStringRef v29 = @"Today<unlocalized>";
LABEL_27:
    v30 = [v27 localizedStringForKey:v28 value:v29 table:0];
    v31 = MapsSuggestionsNonNilString();

    goto LABEL_28;
  }
  v26 = v8;
  if (v25)
  {
    block = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472;
    v40 = sub_10004BC2C;
    v41 = &unk_1000719C0;
    v42 = "NSDate+RestaurantReservationDescriptionHelper";
    if (qword_100081F50 != -1) {
      dispatch_once(&qword_100081F50, &block);
    }
    v27 = (void *)qword_100081F48;
    CFStringRef v28 = @"reservation_tomorrow_key";
    CFStringRef v29 = @"Tomorrow<unlocalized>";
    goto LABEL_27;
  }
  if (v19)
  {
    if (v37) {
      CFStringRef v33 = @"EE";
    }
    else {
      CFStringRef v33 = @"EEEE";
    }
    [(id)qword_100081F38 setDateFormat:v33];
    v34 = (void *)qword_100081F38;
  }
  else
  {
    if (v37)
    {
      v35 = +[NSLocale currentLocale];
      v36 = +[NSDateFormatter dateFormatFromTemplate:@"MMMdd" options:0 locale:v35];

      [(id)qword_100081F38 setDateFormat:v36];
    }
    else
    {
      [(id)qword_100081F38 setDateStyle:2];
      [(id)qword_100081F38 setTimeStyle:0];
    }
    v34 = (void *)qword_100081F38;
  }
  v31 = [v34 stringFromDate:v8];
LABEL_28:

  return v31;
}

@end