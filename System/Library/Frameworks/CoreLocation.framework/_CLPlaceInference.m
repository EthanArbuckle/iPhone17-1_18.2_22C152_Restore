@interface _CLPlaceInference
+ (BOOL)supportsSecureCoding;
+ (unint64_t)_placeInferencePlaceTypeFromRTPlaceType:(unint64_t)a3;
+ (unint64_t)_userSpecificPlaceTypeFromRTUserType:(unint64_t)a3;
- (CLLocation)referenceLocation;
- (CLPlacemark)placemark;
- (NSString)preferredName;
- (NSUUID)_loiIdentifier;
- (_CLPlaceInference)initWithCoder:(id)a3;
- (_CLPlaceInference)initWithUserType:(unint64_t)a3 placeType:(unint64_t)a4 placemark:(id)a5 referenceLocation:(id)a6 confidence:(double)a7 preferredName:(id)a8 loiIdentifier:(id)a9;
- (double)confidence;
- (id)_initWithRTPlaceInference:(id)a3;
- (id)description;
- (unint64_t)placeType;
- (unint64_t)userType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLPlaceInference

- (id)_initWithRTPlaceInference:(id)a3
{
  id v5 = -[CLLocation _initWithRTLocation:]([CLLocation alloc], "_initWithRTLocation:", objc_msgSend((id)objc_msgSend(a3, "mapItem"), "location"));
  id v6 = -[CLLocation _initWithRTLocation:]([CLLocation alloc], "_initWithRTLocation:", [a3 referenceLocation]);
  id v7 = -[CLPlacemark _initWithRTMapItem:location:]([CLPlacemark alloc], "_initWithRTMapItem:location:", [a3 mapItem], v5);
  unint64_t v8 = +[_CLPlaceInference _userSpecificPlaceTypeFromRTUserType:](_CLPlaceInference, "_userSpecificPlaceTypeFromRTUserType:", [a3 userType]);
  unint64_t v9 = +[_CLPlaceInference _placeInferencePlaceTypeFromRTPlaceType:](_CLPlaceInference, "_placeInferencePlaceTypeFromRTPlaceType:", [a3 placeType]);
  [a3 confidence];
  double v11 = v10;
  uint64_t v12 = [a3 preferredName];
  uint64_t v13 = [a3 loiIdentifier];

  return [(_CLPlaceInference *)self initWithUserType:v8 placeType:v9 placemark:v7 referenceLocation:v6 confidence:v12 preferredName:v13 loiIdentifier:v11];
}

+ (unint64_t)_userSpecificPlaceTypeFromRTUserType:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 >= 5)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005680);
    }
    v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "Please update userSpecificPlaceTypeFromRTUserType", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005680);
      }
      id v5 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[_CLPlaceInference(_CLRoutineExtensions) _userSpecificPlaceTypeFromRTUserType:]", "CoreLocation: %s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    return 0;
  }
  return a3;
}

+ (unint64_t)_placeInferencePlaceTypeFromRTPlaceType:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 < 5) {
    return qword_1908821B0[a3];
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005680);
  }
  v4 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_FAULT, "Please update placeInferencePlaceTypeFromRTPlaceType", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005680);
    }
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[_CLPlaceInference(_CLRoutineExtensions) _placeInferencePlaceTypeFromRTPlaceType:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  return 2;
}

- (_CLPlaceInference)initWithUserType:(unint64_t)a3 placeType:(unint64_t)a4 placemark:(id)a5 referenceLocation:(id)a6 confidence:(double)a7 preferredName:(id)a8 loiIdentifier:(id)a9
{
  v19.receiver = self;
  v19.super_class = (Class)_CLPlaceInference;
  v16 = [(_CLPlaceInference *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_userType = a3;
    v16->_placeType = a4;
    v16->_placemark = (CLPlacemark *)a5;
    v17->_referenceLocation = (CLLocation *)a6;
    v17->_confidence = a7;
    v17->_preferredName = (NSString *)a8;
    v17->__loiIdentifier = (NSUUID *)a9;
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLPlaceInference;
  [(_CLPlaceInference *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLPlaceInference)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLPlaceInference.m", 54, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"kCLPlaceInferenceUserType"), "unsignedIntegerValue");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"kCLPlaceInferencePlaceType"), "unsignedIntegerValue");
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlaceInferencePlacemark"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlaceInferenceReferenceLocation"];
  [a3 decodeDoubleForKey:@"kCLPlaceInferenceConfidence"];
  double v11 = v10;
  uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlaceInferencePreferredName"];
  uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPlaceInferenceLoiIdentifier"];

  return [(_CLPlaceInference *)self initWithUserType:v6 placeType:v7 placemark:v8 referenceLocation:v9 confidence:v12 preferredName:v13 loiIdentifier:v11];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLPlaceInference.m", 72, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_userType), @"kCLPlaceInferenceUserType");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_placeType), @"kCLPlaceInferencePlaceType");
  [a3 encodeObject:self->_placemark forKey:@"kCLPlaceInferencePlacemark"];
  [a3 encodeObject:self->_referenceLocation forKey:@"kCLPlaceInferenceReferenceLocation"];
  [a3 encodeDouble:@"kCLPlaceInferenceConfidence" forKey:self->_confidence];
  [a3 encodeObject:self->_preferredName forKey:@"kCLPlaceInferencePreferredName"];
  loiIdentifier = self->__loiIdentifier;

  [a3 encodeObject:loiIdentifier forKey:@"kCLPlaceInferenceLoiIdentifier"];
}

- (id)description
{
  objc_super v3 = NSString;
  [(CLLocation *)[(_CLPlaceInference *)self referenceLocation] coordinate];
  uint64_t v5 = v4;
  [(CLLocation *)[(_CLPlaceInference *)self referenceLocation] coordinate];
  uint64_t v7 = v6;
  [(CLLocation *)[(_CLPlaceInference *)self referenceLocation] horizontalAccuracy];
  uint64_t v9 = v8;
  unint64_t v10 = [(_CLPlaceInference *)self userType];
  unint64_t v11 = [(_CLPlaceInference *)self placeType];
  uint64_t v12 = [(_CLPlaceInference *)self placemark];
  uint64_t v13 = [(_CLPlaceInference *)self preferredName];
  [(_CLPlaceInference *)self confidence];
  return (id)[v3 stringWithFormat:@"CLPlaceInference, ref, <%f,%f> +/- %f, userType, %lu, placeType, %lu, placemark, %@, preferredName, %@, confidence, %f, related loi identifier, %@", v5, v7, v9, v10, v11, v12, v13, v14, -[_CLPlaceInference _loiIdentifier](self, "_loiIdentifier")];
}

- (unint64_t)userType
{
  return self->_userType;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (NSUUID)_loiIdentifier
{
  return self->__loiIdentifier;
}

@end