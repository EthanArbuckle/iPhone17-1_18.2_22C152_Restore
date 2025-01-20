@interface CLMiLoServiceStatus
+ (BOOL)supportsSecureCoding;
- (CLMiLoLocationType)currentLocationOfInterestType;
- (CLMiLoServiceDescriptor)serviceDescriptor;
- (CLMiLoServiceMetaInfo)metaInfo;
- (CLMiLoServiceQualityInfo)serviceQualityInfo;
- (CLMiLoServiceStatus)initWithCoder:(id)a3;
- (CLMiLoServiceStatus)initWithServiceState:(unint64_t)a3 suspendReasons:(id)a4 serviceDescriptor:(id)a5 currentLocationOfInterestUuid:(id)a6 currentLocationOfInterestType:(id)a7 error:(id)a8 serviceQualityInfo:(id)a9 places:(id)a10 metaInfo:(id)a11;
- (NSArray)places;
- (NSArray)serviceSuspendReasons;
- (NSError)error;
- (NSUUID)currentLocationOfInterestUuid;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)serviceState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServiceStatus

- (CLMiLoServiceStatus)initWithServiceState:(unint64_t)a3 suspendReasons:(id)a4 serviceDescriptor:(id)a5 currentLocationOfInterestUuid:(id)a6 currentLocationOfInterestType:(id)a7 error:(id)a8 serviceQualityInfo:(id)a9 places:(id)a10 metaInfo:(id)a11
{
  v20.receiver = self;
  v20.super_class = (Class)CLMiLoServiceStatus;
  v17 = [(CLMiLoServiceStatus *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_serviceState = a3;
    v17->_serviceSuspendReasons = (NSArray *)a4;
    v18->_serviceDescriptor = (CLMiLoServiceDescriptor *)a5;
    v18->_currentLocationOfInterestUuid = (NSUUID *)[a6 copy];
    v18->_currentLocationOfInterestType = (CLMiLoLocationType *)a7;
    v18->_error = (NSError *)a8;
    v18->_serviceQualityInfo = (CLMiLoServiceQualityInfo *)a9;
    v18->_places = (NSArray *)a10;
    v18->_metaInfo = (CLMiLoServiceMetaInfo *)a11;
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceStatus;
  [(CLMiLoServiceStatus *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:", self->_serviceState, self->_serviceSuspendReasons, self->_serviceDescriptor, self->_currentLocationOfInterestUuid, self->_currentLocationOfInterestType, self->_error, self->_serviceQualityInfo, self->_places, self->_metaInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceStatus)initWithCoder:(id)a3
{
  uint64_t v16 = [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyServiceState"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyServiceSuspendReasons");
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyServiceDescriptor"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyCurrentLocationOfInterestUuid"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyCurrentLocationOfInterestType"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyServiceError"];
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyServiceQualityInfo"];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyPlaces");
  return -[CLMiLoServiceStatus initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:](self, "initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:", v16, v6, v7, v8, v9, v10, v11, v14, [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyServiceMetaInfo"]);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_serviceState forKey:@"kCLMiLoConnectionCodingKeyServiceState"];
  [a3 encodeObject:self->_serviceSuspendReasons forKey:@"kCLMiLoConnectionCodingKeyServiceSuspendReasons"];
  [a3 encodeObject:self->_serviceDescriptor forKey:@"kCLMiLoConnectionCodingKeyServiceDescriptor"];
  [a3 encodeObject:self->_currentLocationOfInterestUuid forKey:@"kCLMiLoConnectionCodingKeyCurrentLocationOfInterestUuid"];
  [a3 encodeObject:self->_currentLocationOfInterestType forKey:@"kCLMiLoConnectionCodingKeyCurrentLocationOfInterestType"];
  [a3 encodeObject:self->_error forKey:@"kCLMiLoConnectionCodingKeyServiceError"];
  [a3 encodeObject:self->_serviceQualityInfo forKey:@"kCLMiLoConnectionCodingKeyServiceQualityInfo"];
  [a3 encodeObject:self->_places forKey:@"kCLMiLoConnectionCodingKeyPlaces"];
  metaInfo = self->_metaInfo;

  [a3 encodeObject:metaInfo forKey:@"kCLMiLoConnectionCodingKeyServiceMetaInfo"];
}

- (unint64_t)serviceState
{
  return self->_serviceState;
}

- (NSArray)serviceSuspendReasons
{
  return self->_serviceSuspendReasons;
}

- (CLMiLoServiceDescriptor)serviceDescriptor
{
  return self->_serviceDescriptor;
}

- (NSUUID)currentLocationOfInterestUuid
{
  return self->_currentLocationOfInterestUuid;
}

- (CLMiLoLocationType)currentLocationOfInterestType
{
  return self->_currentLocationOfInterestType;
}

- (NSError)error
{
  return self->_error;
}

- (CLMiLoServiceQualityInfo)serviceQualityInfo
{
  return self->_serviceQualityInfo;
}

- (NSArray)places
{
  return self->_places;
}

- (CLMiLoServiceMetaInfo)metaInfo
{
  return self->_metaInfo;
}

@end