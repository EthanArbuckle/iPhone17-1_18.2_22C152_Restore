@interface DUFoundInEventClientAbstractResult
+ (BOOL)supportsSecureCoding;
- (BOOL)detectedEventPolarity;
- (DUFoundInEventClientAbstractResult)initWithCoder:(id)a3;
- (DUFoundInEventClientAbstractResult)initWithFields:(BOOL)a3 reservationIdError:(id)a4 reservationId:(id)a5 reservationNameError:(id)a6 reservationName:(id)a7 startAddressError:(id)a8 startAddress:(id)a9 startAddressComponents:(id)a10 endAddressError:(id)a11 endAddress:(id)a12 endAddressComponents:(id)a13 startPlaceError:(id)a14 startPlace:(id)a15 endPlaceError:(id)a16 endPlace:(id)a17 startDateError:(id)a18 startDate:(id)a19 endDateError:(id)a20 endDate:(id)a21 hotelNameError:(id)a22 hotelName:(id)a23 guestNameError:(id)a24 guestName:(id)a25 movieNameError:(id)a26 movieName:(id)a27;
- (NSDictionary)endAddressComponents;
- (NSDictionary)startAddressComponents;
- (NSError)endAddressError;
- (NSError)endDateError;
- (NSError)endPlaceError;
- (NSError)guestNameError;
- (NSError)hotelNameError;
- (NSError)movieNameError;
- (NSError)reservationIdError;
- (NSError)reservationNameError;
- (NSError)startAddressError;
- (NSError)startDateError;
- (NSError)startPlaceError;
- (NSString)endAddress;
- (NSString)endDate;
- (NSString)endPlace;
- (NSString)guestName;
- (NSString)hotelName;
- (NSString)movieName;
- (NSString)reservationId;
- (NSString)reservationName;
- (NSString)startAddress;
- (NSString)startDate;
- (NSString)startPlace;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DUFoundInEventClientAbstractResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieName, 0);
  objc_storeStrong((id *)&self->_movieNameError, 0);
  objc_storeStrong((id *)&self->_guestName, 0);
  objc_storeStrong((id *)&self->_guestNameError, 0);
  objc_storeStrong((id *)&self->_hotelName, 0);
  objc_storeStrong((id *)&self->_hotelNameError, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_endDateError, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_startDateError, 0);
  objc_storeStrong((id *)&self->_endPlace, 0);
  objc_storeStrong((id *)&self->_endPlaceError, 0);
  objc_storeStrong((id *)&self->_startPlace, 0);
  objc_storeStrong((id *)&self->_startPlaceError, 0);
  objc_storeStrong((id *)&self->_endAddressComponents, 0);
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_endAddressError, 0);
  objc_storeStrong((id *)&self->_startAddressComponents, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_startAddressError, 0);
  objc_storeStrong((id *)&self->_reservationName, 0);
  objc_storeStrong((id *)&self->_reservationNameError, 0);
  objc_storeStrong((id *)&self->_reservationId, 0);
  objc_storeStrong((id *)&self->_reservationIdError, 0);
}

- (NSString)movieName
{
  return self->_movieName;
}

- (NSError)movieNameError
{
  return self->_movieNameError;
}

- (NSString)guestName
{
  return self->_guestName;
}

- (NSError)guestNameError
{
  return self->_guestNameError;
}

- (NSString)hotelName
{
  return self->_hotelName;
}

- (NSError)hotelNameError
{
  return self->_hotelNameError;
}

- (NSString)endDate
{
  return self->_endDate;
}

- (NSError)endDateError
{
  return self->_endDateError;
}

- (NSString)startDate
{
  return self->_startDate;
}

- (NSError)startDateError
{
  return self->_startDateError;
}

- (NSString)endPlace
{
  return self->_endPlace;
}

- (NSError)endPlaceError
{
  return self->_endPlaceError;
}

- (NSString)startPlace
{
  return self->_startPlace;
}

- (NSError)startPlaceError
{
  return self->_startPlaceError;
}

- (NSDictionary)endAddressComponents
{
  return self->_endAddressComponents;
}

- (NSString)endAddress
{
  return self->_endAddress;
}

- (NSError)endAddressError
{
  return self->_endAddressError;
}

- (NSDictionary)startAddressComponents
{
  return self->_startAddressComponents;
}

- (NSString)startAddress
{
  return self->_startAddress;
}

- (NSError)startAddressError
{
  return self->_startAddressError;
}

- (NSString)reservationName
{
  return self->_reservationName;
}

- (NSError)reservationNameError
{
  return self->_reservationNameError;
}

- (NSString)reservationId
{
  return self->_reservationId;
}

- (NSError)reservationIdError
{
  return self->_reservationIdError;
}

- (BOOL)detectedEventPolarity
{
  return self->_detectedEventPolarity;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DUFoundInEventClientAbstractResult initWithFields:reservationIdError:reservationId:reservationNameError:reservationName:startAddressError:startAddress:startAddressComponents:endAddressError:endAddress:endAddressComponents:startPlaceError:startPlace:endPlaceError:endPlace:startDateError:startDate:endDateError:endDate:hotelNameError:hotelName:guestNameError:guestName:movieNameError:movieName:]([DUFoundInEventClientAbstractResult alloc], "initWithFields:reservationIdError:reservationId:reservationNameError:reservationName:startAddressError:startAddress:startAddressComponents:endAddressError:endAddress:endAddressComponents:startPlaceError:startPlace:endPlaceError:endPlace:startDateError:startDate:endDateError:endDate:hotelNameError:hotelName:guestNameError:guestName:movieNameError:movieName:", self->_detectedEventPolarity, self->_reservationIdError, self->_reservationId, self->_reservationNameError, self->_reservationName, self->_startAddressError, self->_startAddress, self->_startAddressComponents, self->_endAddressError, self->_endAddress, self->_endAddressComponents, self->_startPlaceError, self->_startPlace, self->_endPlaceError,
           self->_endPlace,
           self->_startDateError,
           self->_startDate,
           self->_endDateError,
           self->_endDate,
           self->_hotelNameError,
           self->_hotelName,
           self->_guestNameError,
           self->_guestName,
           self->_movieNameError,
           self->_movieName);
}

- (DUFoundInEventClientAbstractResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detectedEventPolarity"];
  self->_detectedEventPolarity = [v5 BOOLValue];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationIdError"];
  reservationIdError = self->_reservationIdError;
  self->_reservationIdError = v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationId"];
  reservationId = self->_reservationId;
  self->_reservationId = v8;

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationNameError"];
  reservationNameError = self->_reservationNameError;
  self->_reservationNameError = v10;

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationName"];
  reservationName = self->_reservationName;
  self->_reservationName = v12;

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startAddressError"];
  startAddressError = self->_startAddressError;
  self->_startAddressError = v14;

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startAddress"];
  startAddress = self->_startAddress;
  self->_startAddress = v16;

  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startAddressComponents"];
  startAddressComponents = self->_startAddressComponents;
  self->_startAddressComponents = v18;

  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endAddressError"];
  endAddressError = self->_endAddressError;
  self->_endAddressError = v20;

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endAddress"];
  endAddress = self->_endAddress;
  self->_endAddress = v22;

  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endAddressComponents"];
  endAddressComponents = self->_endAddressComponents;
  self->_endAddressComponents = v24;

  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startPlaceError"];
  startPlaceError = self->_startPlaceError;
  self->_startPlaceError = v26;

  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startPlace"];
  startPlace = self->_startPlace;
  self->_startPlace = v28;

  v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endPlaceError"];
  endPlaceError = self->_endPlaceError;
  self->_endPlaceError = v30;

  v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endPlace"];
  endPlace = self->_endPlace;
  self->_endPlace = v32;

  v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDateError"];
  startDateError = self->_startDateError;
  self->_startDateError = v34;

  v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  startDate = self->_startDate;
  self->_startDate = v36;

  v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDateError"];
  endDateError = self->_endDateError;
  self->_endDateError = v38;

  v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  endDate = self->_endDate;
  self->_endDate = v40;

  v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hotelNameError"];
  hotelNameError = self->_hotelNameError;
  self->_hotelNameError = v42;

  v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hotelName"];
  hotelName = self->_hotelName;
  self->_hotelName = v44;

  v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guestNameError"];
  guestNameError = self->_guestNameError;
  self->_guestNameError = v46;

  v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guestName"];
  guestName = self->_guestName;
  self->_guestName = v48;

  v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"movieNameError"];
  movieNameError = self->_movieNameError;
  self->_movieNameError = v50;

  v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"movieName"];

  movieName = self->_movieName;
  self->_movieName = v52;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL detectedEventPolarity = self->_detectedEventPolarity;
  id v6 = a3;
  id v7 = [v4 numberWithBool:detectedEventPolarity];
  [v6 encodeObject:v7 forKey:@"detectedEventPolarity"];
  [v6 encodeObject:self->_reservationIdError forKey:@"reservationIdError"];
  [v6 encodeObject:self->_reservationId forKey:@"reservationId"];
  [v6 encodeObject:self->_reservationNameError forKey:@"reservationNameError"];
  [v6 encodeObject:self->_reservationName forKey:@"reservationName"];
  [v6 encodeObject:self->_startAddressError forKey:@"startAddressError"];
  [v6 encodeObject:self->_startAddress forKey:@"startAddress"];
  [v6 encodeObject:self->_startAddressComponents forKey:@"startAddressComponents"];
  [v6 encodeObject:self->_endAddressError forKey:@"endAddressError"];
  [v6 encodeObject:self->_endAddress forKey:@"endAddress"];
  [v6 encodeObject:self->_endAddressComponents forKey:@"endAddressComponents"];
  [v6 encodeObject:self->_startPlaceError forKey:@"startPlaceError"];
  [v6 encodeObject:self->_startPlace forKey:@"startPlace"];
  [v6 encodeObject:self->_endPlaceError forKey:@"endPlaceError"];
  [v6 encodeObject:self->_endPlace forKey:@"endPlace"];
  [v6 encodeObject:self->_startDateError forKey:@"startDateError"];
  [v6 encodeObject:self->_startDate forKey:@"startDate"];
  [v6 encodeObject:self->_endDateError forKey:@"endDateError"];
  [v6 encodeObject:self->_endDate forKey:@"endDate"];
  [v6 encodeObject:self->_hotelNameError forKey:@"hotelNameError"];
  [v6 encodeObject:self->_hotelName forKey:@"hotelName"];
  [v6 encodeObject:self->_guestNameError forKey:@"guestNameError"];
  [v6 encodeObject:self->_guestName forKey:@"guestName"];
  [v6 encodeObject:self->_movieNameError forKey:@"movieNameError"];
  [v6 encodeObject:self->_movieName forKey:@"movieName"];
}

- (DUFoundInEventClientAbstractResult)initWithFields:(BOOL)a3 reservationIdError:(id)a4 reservationId:(id)a5 reservationNameError:(id)a6 reservationName:(id)a7 startAddressError:(id)a8 startAddress:(id)a9 startAddressComponents:(id)a10 endAddressError:(id)a11 endAddress:(id)a12 endAddressComponents:(id)a13 startPlaceError:(id)a14 startPlace:(id)a15 endPlaceError:(id)a16 endPlace:(id)a17 startDateError:(id)a18 startDate:(id)a19 endDateError:(id)a20 endDate:(id)a21 hotelNameError:(id)a22 hotelName:(id)a23 guestNameError:(id)a24 guestName:(id)a25 movieNameError:(id)a26 movieName:(id)a27
{
  v73 = (NSError *)a4;
  v32 = (NSString *)a5;
  v33 = (NSError *)a6;
  v34 = (NSString *)a7;
  v35 = (NSError *)a8;
  v97 = (NSString *)a9;
  v94 = (NSDictionary *)a10;
  v90 = (NSError *)a11;
  v87 = (NSString *)a12;
  v85 = (NSDictionary *)a13;
  v78 = (NSError *)a14;
  v74 = (NSString *)a15;
  v76 = (NSError *)a16;
  v80 = (NSString *)a17;
  v82 = (NSError *)a18;
  v84 = (NSString *)a19;
  v36 = (NSError *)a20;
  v37 = (NSString *)a21;
  v38 = (NSError *)a22;
  v39 = (NSString *)a23;
  v89 = (NSError *)a24;
  v92 = (NSString *)a25;
  v93 = (NSError *)a26;
  v96 = (NSString *)a27;
  self->_BOOL detectedEventPolarity = a3;
  reservationIdError = self->_reservationIdError;
  self->_reservationIdError = v73;
  v104 = v73;

  reservationId = self->_reservationId;
  self->_reservationId = v32;
  v102 = v32;

  reservationNameError = self->_reservationNameError;
  self->_reservationNameError = v33;
  v101 = v33;

  reservationName = self->_reservationName;
  self->_reservationName = v34;
  v100 = v34;

  startAddressError = self->_startAddressError;
  self->_startAddressError = v35;
  v99 = v35;

  startAddress = self->_startAddress;
  self->_startAddress = v97;
  v98 = v97;

  startAddressComponents = self->_startAddressComponents;
  self->_startAddressComponents = v94;
  v95 = v94;

  endAddressError = self->_endAddressError;
  self->_endAddressError = v90;
  v91 = v90;

  endAddress = self->_endAddress;
  self->_endAddress = v87;
  v88 = v87;

  endAddressComponents = self->_endAddressComponents;
  self->_endAddressComponents = v85;
  v86 = v85;

  startPlaceError = self->_startPlaceError;
  self->_startPlaceError = v78;
  v79 = v78;

  startPlace = self->_startPlace;
  self->_startPlace = v74;
  v75 = v74;

  endPlaceError = self->_endPlaceError;
  self->_endPlaceError = v76;
  v77 = v76;

  endPlace = self->_endPlace;
  self->_endPlace = v80;
  v81 = v80;

  startDateError = self->_startDateError;
  self->_startDateError = v82;
  v83 = v82;

  startDate = self->_startDate;
  self->_startDate = v84;
  v56 = v84;

  endDateError = self->_endDateError;
  self->_endDateError = v36;
  v58 = v36;

  endDate = self->_endDate;
  self->_endDate = v37;
  v60 = v37;

  hotelNameError = self->_hotelNameError;
  self->_hotelNameError = v38;
  v62 = v38;

  hotelName = self->_hotelName;
  self->_hotelName = v39;
  v64 = v39;

  guestNameError = self->_guestNameError;
  self->_guestNameError = v89;
  v66 = v89;

  guestName = self->_guestName;
  self->_guestName = v92;
  v68 = v92;

  movieNameError = self->_movieNameError;
  self->_movieNameError = v93;
  v70 = v93;

  movieName = self->_movieName;
  self->_movieName = v96;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end