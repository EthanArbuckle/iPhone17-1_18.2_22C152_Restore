@interface CLGeocoder
+ (id)_timeZoneAtLocation:(id)a3;
+ (void)hydrateGeoMapItemLocallyFromHandle:(id)a3 completionHandler:(id)a4;
- (BOOL)isGeocoding;
- (CLGeocoder)init;
- (CLSilo)_responseSilo;
- (void)_notifyCancel;
- (void)_notifyError:(id)a3;
- (void)_notifyNoResult;
- (void)_notifyPartialResult:(id)a3;
- (void)_notifyResult:(id)a3;
- (void)_notifyResult:(id)a3 error:(id)a4;
- (void)_setResponseSilo:(id)a3;
- (void)_ticket:(id)a3 didReturnError:(id)a4;
- (void)_ticket:(id)a3 didReturnError:(id)a4 partialResultForLocation:(id)a5;
- (void)_ticket:(id)a3 didReturnGeoMapItems:(id)a4;
- (void)cancelGeocode;
- (void)dealloc;
- (void)geocodeAddressDictionary:(NSDictionary *)addressDictionary completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)geocodeAddressDictionary:(id)a3 preferredLocale:(id)a4 completionHandler:(id)a5;
- (void)geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)geocodeAddressString:(NSString *)addressString inRegion:(CLRegion *)region completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)geocodeAddressString:(NSString *)addressString inRegion:(CLRegion *)region preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)geocodeAddressString:(id)a3 inRegionCenteredAt:(CLLocationCoordinate2D)a4 inRegionRadius:(double)a5 preferredLocale:(id)a6 completionHandler:(id)a7;
- (void)geocodePostalAddress:(CNPostalAddress *)postalAddress completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)geocodePostalAddress:(CNPostalAddress *)postalAddress preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)reverseGeocodeLocation:(CLLocation *)location completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)reverseGeocodeLocation:(CLLocation *)location preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)reverseGeocodeLocation:(id)a3 heading:(double)a4 completionHandler:(id)a5;
- (void)reverseGeocodeLocation:(id)a3 heading:(double)a4 localResultsOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)reverseGeocodeLocation:(id)a3 localResultsOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)reverseGeocodeLocation:(id)a3 preferredLocale:(id)a4 heading:(double)a5 localResultsOnly:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation CLGeocoder

- (void)reverseGeocodeLocation:(id)a3 preferredLocale:(id)a4 heading:(double)a5 localResultsOnly:(BOOL)a6 completionHandler:(id)a7
{
  queue = self->_internal->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1906C2DBC;
  v8[3] = &unk_1E5697E90;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a7;
  *(double *)&v8[8] = a5;
  BOOL v9 = a6;
  dispatch_async(queue, v8);
}

- (BOOL)isGeocoding
{
  internal = self->_internal;
  return internal && internal->_ticket != 0;
}

- (CLGeocoder)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!objc_opt_class())
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005CC0);
    }
    v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "[GEOMapService class]";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Do not use CLGeocoder when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CC0);
      }
    }
    v6 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "[GEOMapService class]";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Do not use CLGeocoder when GeoServices is missing", "{\"msg%{public}.0s\":\"Do not use CLGeocoder when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005CC0);
      }
    }
    v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "[GEOMapService class]";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Do not use CLGeocoder when GeoServices is missing\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v8.receiver = self;
  v8.super_class = (Class)CLGeocoder;
  v3 = [(CLGeocoder *)&v8 init];
  if (v3) {
    v3->_internal = objc_alloc_init(CLGeocoderInternal);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLGeocoder;
  [(CLGeocoder *)&v3 dealloc];
}

- (void)_ticket:(id)a3 didReturnGeoMapItems:(id)a4
{
  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1906C7090;
  block[3] = &unk_1E5696FA8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)_notifyResult:(id)a3 error:(id)a4
{
  internal = self->_internal;
  id geocodeCompletionHandler = internal->_geocodeCompletionHandler;
  internal->_id geocodeCompletionHandler = 0;
  if (geocodeCompletionHandler)
  {
    objc_super v8 = [(CLGeocoderInternal *)self->_internal responseSilo];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1906DDA6C;
    v9[3] = &unk_1E5696CB8;
    v9[5] = a4;
    v9[6] = geocodeCompletionHandler;
    v9[4] = a3;
    [(CLSilo *)v8 async:v9];
  }
}

- (void)_notifyResult:(id)a3
{
}

+ (id)_timeZoneAtLocation:(id)a3
{
  return (id)sub_1907FEAA0((uint64_t)a3);
}

- (void)_setResponseSilo:(id)a3
{
}

- (CLSilo)_responseSilo
{
  return [(CLGeocoderInternal *)self->_internal responseSilo];
}

- (void)reverseGeocodeLocation:(id)a3 localResultsOnly:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)reverseGeocodeLocation:(CLLocation *)location completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
}

- (void)reverseGeocodeLocation:(CLLocation *)location preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
}

- (void)reverseGeocodeLocation:(id)a3 heading:(double)a4 completionHandler:(id)a5
{
}

- (void)reverseGeocodeLocation:(id)a3 heading:(double)a4 localResultsOnly:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)geocodeAddressDictionary:(NSDictionary *)addressDictionary completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
}

- (void)geocodeAddressDictionary:(id)a3 preferredLocale:(id)a4 completionHandler:(id)a5
{
  queue = self->_internal->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1907E3274;
  v6[3] = &unk_1E5697EE0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
}

- (void)geocodeAddressString:(NSString *)addressString inRegion:(CLRegion *)region completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
}

- (void)geocodeAddressString:(id)a3 inRegionCenteredAt:(CLLocationCoordinate2D)a4 inRegionRadius:(double)a5 preferredLocale:(id)a6 completionHandler:(id)a7
{
  -[CLCircularRegion initWithCenter:radius:identifier:]([CLCircularRegion alloc], "initWithCenter:radius:identifier:", [NSString stringWithFormat:@"com.apple.CoreLocation.geocodeAddressStringRegion-%@", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")], a4.latitude, a4.longitude, a5);

  MEMORY[0x1F4181798](self, sel_geocodeAddressString_inRegion_preferredLocale_completionHandler_);
}

- (void)geocodeAddressString:(NSString *)addressString inRegion:(CLRegion *)region preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1907E3624;
  block[3] = &unk_1E5697F08;
  block[4] = region;
  block[5] = self;
  void block[7] = locale;
  block[8] = completionHandler;
  block[6] = addressString;
  dispatch_async(queue, block);
}

+ (void)hydrateGeoMapItemLocallyFromHandle:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1907E3AAC;
    v4[3] = &unk_1E5696D30;
    v4[4] = a3;
    v4[5] = a4;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

- (void)cancelGeocode
{
  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1907E3C9C;
  block[3] = &unk_1E5696BF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_ticket:(id)a3 didReturnError:(id)a4 partialResultForLocation:(id)a5
{
  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1907E3D90;
  block[3] = &unk_1E5696FA8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)_ticket:(id)a3 didReturnError:(id)a4
{
}

- (void)_notifyPartialResult:(id)a3
{
  [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:9 userInfo:0];

  MEMORY[0x1F4181798](self, sel__notifyResult_error_);
}

- (void)_notifyNoResult
{
  [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:8 userInfo:0];

  MEMORY[0x1F4181798](self, sel__notifyResult_error_);
}

- (void)_notifyCancel
{
  [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:10 userInfo:0];

  MEMORY[0x1F4181798](self, sel__notifyResult_error_);
}

- (void)_notifyError:(id)a3
{
  [MEMORY[0x1E4F28C58] errorWithDomain:@"kCLErrorDomain" code:2 userInfo:0];

  MEMORY[0x1F4181798](self, sel__notifyResult_error_);
}

- (void)geocodePostalAddress:(CNPostalAddress *)postalAddress completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
}

- (void)geocodePostalAddress:(CNPostalAddress *)postalAddress preferredLocale:(NSLocale *)locale completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSString *)[(CNPostalAddress *)postalAddress street] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress street](postalAddress, "street"), @"Thoroughfare");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress subLocality] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress subLocality](postalAddress, "subLocality"), @"SubLocality");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress city] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress city](postalAddress, "city"), @"City");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress subAdministrativeArea] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress subAdministrativeArea](postalAddress, "subAdministrativeArea"), @"SubAdministrativeArea");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress state] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress state](postalAddress, "state"), @"State");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress postalCode] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress postalCode](postalAddress, "postalCode"), @"ZIP");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress country] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress country](postalAddress, "country"), @"Country");
  }
  if ([(NSString *)[(CNPostalAddress *)postalAddress ISOCountryCode] length]) {
    objc_msgSend(v9, "setObject:forKey:", -[CNPostalAddress ISOCountryCode](postalAddress, "ISOCountryCode"), @"CountryCode");
  }
  [(CLGeocoder *)self geocodeAddressDictionary:v9 preferredLocale:locale completionHandler:completionHandler];
}

@end