@interface DUFoundInEventResult
+ (id)getErrorForFieldWithField:(id)a3 errorCode:(int64_t)a4;
+ (id)mapErrorCodeToUserInfoWithFieldName:(id)a3 errorCode:(int64_t)a4;
- (BOOL)detectedEventPolarity;
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
- (NSString)text;
- (_TtC21DocumentUnderstanding20DUFoundInEventResult)init;
- (_TtC21DocumentUnderstanding20DUFoundInEventResult)initWithCoder:(id)a3;
- (_TtC21DocumentUnderstanding20DUFoundInEventResult)initWithFoundInEventResult:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)serializedData;
- (void)encodeWithCoder:(id)a3;
- (void)setDetectedEventPolarity:(BOOL)a3;
- (void)setEndAddress:(id)a3;
- (void)setEndAddressComponents:(id)a3;
- (void)setEndAddressError:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEndDateError:(id)a3;
- (void)setEndPlace:(id)a3;
- (void)setEndPlaceError:(id)a3;
- (void)setGuestName:(id)a3;
- (void)setGuestNameError:(id)a3;
- (void)setHotelName:(id)a3;
- (void)setHotelNameError:(id)a3;
- (void)setMovieName:(id)a3;
- (void)setMovieNameError:(id)a3;
- (void)setReservationId:(id)a3;
- (void)setReservationIdError:(id)a3;
- (void)setReservationName:(id)a3;
- (void)setReservationNameError:(id)a3;
- (void)setStartAddress:(id)a3;
- (void)setStartAddressComponents:(id)a3;
- (void)setStartAddressError:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDateError:(id)a3;
- (void)setStartPlace:(id)a3;
- (void)setStartPlaceError:(id)a3;
- (void)setText:(id)a3;
@end

@implementation DUFoundInEventResult

- (BOOL)detectedEventPolarity
{
  return DUFoundInEventResult.detectedEventPolarity.getter() & 1;
}

- (void)setDetectedEventPolarity:(BOOL)a3
{
}

- (NSError)reservationIdError
{
  v2 = DUFoundInEventResult.reservationIdError.getter();
  return (NSError *)v2;
}

- (void)setReservationIdError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.reservationIdError.setter(a3);
}

- (NSString)reservationId
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.reservationId.getter);
}

- (void)setReservationId:(id)a3
{
}

- (NSError)reservationNameError
{
  v2 = DUFoundInEventResult.reservationNameError.getter();
  return (NSError *)v2;
}

- (void)setReservationNameError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.reservationNameError.setter(a3);
}

- (NSString)reservationName
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.reservationName.getter);
}

- (void)setReservationName:(id)a3
{
}

- (NSError)hotelNameError
{
  v2 = DUFoundInEventResult.hotelNameError.getter();
  return (NSError *)v2;
}

- (void)setHotelNameError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.hotelNameError.setter(a3);
}

- (NSString)hotelName
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.hotelName.getter);
}

- (void)setHotelName:(id)a3
{
}

- (NSError)guestNameError
{
  v2 = DUFoundInEventResult.guestNameError.getter();
  return (NSError *)v2;
}

- (void)setGuestNameError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.guestNameError.setter(a3);
}

- (NSString)guestName
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.guestName.getter);
}

- (void)setGuestName:(id)a3
{
}

- (NSError)movieNameError
{
  v2 = DUFoundInEventResult.movieNameError.getter();
  return (NSError *)v2;
}

- (void)setMovieNameError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.movieNameError.setter(a3);
}

- (NSString)movieName
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.movieName.getter);
}

- (void)setMovieName:(id)a3
{
}

- (NSError)startAddressError
{
  v2 = DUFoundInEventResult.startAddressError.getter();
  return (NSError *)v2;
}

- (void)setStartAddressError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.startAddressError.setter(a3);
}

- (NSString)startAddress
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.startAddress.getter);
}

- (void)setStartAddress:(id)a3
{
}

- (NSDictionary)startAddressComponents
{
  return (NSDictionary *)sub_2368E931C((uint64_t)self, (uint64_t)a2, DUFoundInEventResult.startAddressComponents.getter);
}

- (void)setStartAddressComponents:(id)a3
{
}

- (NSError)endAddressError
{
  v2 = DUFoundInEventResult.endAddressError.getter();
  return (NSError *)v2;
}

- (void)setEndAddressError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.endAddressError.setter(a3);
}

- (NSString)endAddress
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.endAddress.getter);
}

- (void)setEndAddress:(id)a3
{
}

- (NSDictionary)endAddressComponents
{
  return (NSDictionary *)sub_2368E931C((uint64_t)self, (uint64_t)a2, DUFoundInEventResult.endAddressComponents.getter);
}

- (void)setEndAddressComponents:(id)a3
{
}

- (NSError)startPlaceError
{
  v2 = DUFoundInEventResult.startPlaceError.getter();
  return (NSError *)v2;
}

- (void)setStartPlaceError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.startPlaceError.setter(a3);
}

- (NSString)startPlace
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.startPlace.getter);
}

- (void)setStartPlace:(id)a3
{
}

- (NSError)endPlaceError
{
  v2 = DUFoundInEventResult.endPlaceError.getter();
  return (NSError *)v2;
}

- (void)setEndPlaceError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.endPlaceError.setter(a3);
}

- (NSString)endPlace
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.endPlace.getter);
}

- (void)setEndPlace:(id)a3
{
}

- (NSError)startDateError
{
  v2 = DUFoundInEventResult.startDateError.getter();
  return (NSError *)v2;
}

- (void)setStartDateError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.startDateError.setter(a3);
}

- (NSString)startDate
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.startDate.getter);
}

- (void)setStartDate:(id)a3
{
}

- (NSError)endDateError
{
  v2 = DUFoundInEventResult.endDateError.getter();
  return (NSError *)v2;
}

- (void)setEndDateError:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUFoundInEventResult.endDateError.setter(a3);
}

- (NSString)endDate
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.endDate.getter);
}

- (void)setEndDate:(id)a3
{
}

- (NSString)text
{
  return (NSString *)sub_2368E886C((uint64_t)self, (uint64_t)a2, (void (*)(void))DUFoundInEventResult.text.getter);
}

- (void)setText:(id)a3
{
}

- (_TtC21DocumentUnderstanding20DUFoundInEventResult)init
{
  return (_TtC21DocumentUnderstanding20DUFoundInEventResult *)DUFoundInEventResult.init()();
}

+ (id)mapErrorCodeToUserInfoWithFieldName:(id)a3 errorCode:(int64_t)a4
{
  uint64_t v5 = sub_23697AF6C();
  sub_2368E9E10(v5, v6, a4);
  swift_bridgeObjectRelease();
  v7 = (void *)sub_23697AE5C();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)getErrorForFieldWithField:(id)a3 errorCode:(int64_t)a4
{
  uint64_t v5 = sub_23697AF6C();
  id v7 = static DUFoundInEventResult.getErrorForField(field:errorCode:)(v5, v6, a4);
  swift_bridgeObjectRelease();
  return v7;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUFoundInEventResult.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (id)serializedData
{
  v2 = self;
  id v3 = sub_2368EAFEC();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUFoundInEventResult.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding20DUFoundInEventResult)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC21DocumentUnderstanding20DUFoundInEventResult *)DUFoundInEventResult.init(coder:)();
}

- (_TtC21DocumentUnderstanding20DUFoundInEventResult)initWithFoundInEventResult:(id)a3
{
  return (_TtC21DocumentUnderstanding20DUFoundInEventResult *)DUFoundInEventResult.init(foundInEventResult:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_reservationIdError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_reservationNameError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_hotelNameError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_guestNameError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_movieNameError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_startAddressError));
  sub_2368D17A8();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_endAddressError));
  sub_2368D17A8();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_startPlaceError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_endPlaceError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_startDateError));
  sub_2368D17A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding20DUFoundInEventResult_endDateError));
  sub_2368D17A8();
  sub_2368D17A8();
  swift_bridgeObjectRelease();
}

@end