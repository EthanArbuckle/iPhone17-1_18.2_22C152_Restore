@interface RTMapItemExtendedAttributes
+ (BOOL)supportsSecureCoding;
+ (id)fingerprintLabelTypeToString:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapItemExtendedAttributes:(id)a3;
- (BOOL)isMe;
- (NSString)addressIdentifier;
- (NSUUID)identifier;
- (RTMapItemExtendedAttributes)init;
- (RTMapItemExtendedAttributes)initWithAddressIdentifier:(id)a3 isMe:(BOOL)a4 wifiConfidence:(double)a5 wifiFingerprintLabelType:(int64_t)a6;
- (RTMapItemExtendedAttributes)initWithCoder:(id)a3;
- (RTMapItemExtendedAttributes)initWithExtendedAttributesMO:(id)a3;
- (RTMapItemExtendedAttributes)initWithIdentifier:(id)a3 addressIdentifier:(id)a4 isMe:(BOOL)a5 wifiConfidence:(double)a6 wifiFingerprintLabelType:(int64_t)a7;
- (double)wifiConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)wifiFingerprintLabelType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setWifiConfidence:(double)a3;
- (void)setWifiFingerprintLabelType:(int64_t)a3;
@end

@implementation RTMapItemExtendedAttributes

+ (id)fingerprintLabelTypeToString:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 3) {
    return off_1E5D74580[a3];
  }
  v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    v6 = "+[RTMapItemExtendedAttributes fingerprintLabelTypeToString:]";
    __int16 v7 = 1024;
    int v8 = 43;
    _os_log_error_impl(&dword_1A8FEF000, v4, OS_LOG_TYPE_ERROR, "unknown wifi fingerprint label (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (RTMapItemExtendedAttributes)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_addressIdentifier_isMe_wifiConfidence_wifiFingerprintLabelType_);
}

- (RTMapItemExtendedAttributes)initWithExtendedAttributesMO:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [v4 identifier];
    v6 = [v4 addressIdentifier];
    __int16 v7 = [v4 isMe];
    uint64_t v8 = [v7 BOOLValue];
    uint64_t v9 = [v4 wifiConfidence];
    [v9 doubleValue];
    double v11 = v10;
    v12 = [v4 wifiFingerprintLabelType];

    self = -[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:](self, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v5, v6, v8, [v12 integerValue], v11);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (RTMapItemExtendedAttributes)initWithIdentifier:(id)a3 addressIdentifier:(id)a4 isMe:(BOOL)a5 wifiConfidence:(double)a6 wifiFingerprintLabelType:(int64_t)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  if (!v13)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:]";
      __int16 v25 = 1024;
      int v26 = 71;
      _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }
  }
  if ((unint64_t)a7 >= 3)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:]";
      __int16 v25 = 1024;
      int v26 = 72;
      _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, "invalid wifi label type (in %s:%d)", buf, 0x12u);
    }
  }
  if (a6 < 0.0 || a6 > 1.0)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:]";
      __int16 v25 = 1024;
      int v26 = 73;
      _os_log_error_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_ERROR, "invalid wifiConfidence (in %s:%d)", buf, 0x12u);
    }
  }
  v18 = 0;
  if (v13 && a6 <= 1.0 && a6 >= 0.0 && (unint64_t)a7 <= 2)
  {
    v22.receiver = self;
    v22.super_class = (Class)RTMapItemExtendedAttributes;
    v19 = [(RTMapItemExtendedAttributes *)&v22 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      objc_storeStrong((id *)&v20->_addressIdentifier, a4);
      v20->_isMe = a5;
      v20->_wifiConfidence = a6;
      v20->_wifiFingerprintLabelType = a7;
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (RTMapItemExtendedAttributes)initWithAddressIdentifier:(id)a3 isMe:(BOOL)a4 wifiConfidence:(double)a5 wifiFingerprintLabelType:(int64_t)a6
{
  BOOL v8 = a4;
  double v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a3;
  v12 = [v10 UUID];
  id v13 = [(RTMapItemExtendedAttributes *)self initWithIdentifier:v12 addressIdentifier:v11 isMe:v8 wifiConfidence:a6 wifiFingerprintLabelType:a5];

  return v13;
}

- (id)description
{
  uint64_t v2 = NSString;
  identifier = self->_identifier;
  addressIdentifier = self->_addressIdentifier;
  if (self->_isMe) {
    int v5 = @"YES";
  }
  else {
    int v5 = @"NO";
  }
  double wifiConfidence = self->_wifiConfidence;
  __int16 v7 = [(id)objc_opt_class() fingerprintLabelTypeToString:self->_wifiFingerprintLabelType];
  BOOL v8 = [v2 stringWithFormat:@"identifier, %@, address identifier, %@, isMe, %@, wifiConfidence, %.3lf, labelType, %@", identifier, addressIdentifier, v5, *(void *)&wifiConfidence, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTMapItemExtendedAttributes *)a3;
  int v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTMapItemExtendedAttributes *)self isEqualToMapItemExtendedAttributes:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_addressIdentifier hash] ^ v3;
  int v5 = [NSNumber numberWithBool:self->_isMe];
  uint64_t v6 = v4 ^ [v5 hash];
  __int16 v7 = [NSNumber numberWithDouble:self->_wifiConfidence];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [NSNumber numberWithInteger:self->_wifiFingerprintLabelType];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqualToMapItemExtendedAttributes:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  identifier = self->_identifier;
  uint64_t v8 = identifier;
  if (identifier)
  {
LABEL_4:
    uint64_t v9 = [v6 identifier];
    char v10 = [(NSUUID *)v8 isEqual:v9];

    if (identifier) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v3 = [v5 identifier];
  if (v3)
  {
    uint64_t v8 = self->_identifier;
    goto LABEL_4;
  }
  char v10 = 1;
LABEL_7:

LABEL_8:
  addressIdentifier = self->_addressIdentifier;
  v12 = addressIdentifier;
  if (addressIdentifier) {
    goto LABEL_11;
  }
  uint64_t v3 = [v6 addressIdentifier];
  if (v3)
  {
    v12 = self->_addressIdentifier;
LABEL_11:
    id v13 = [v6 addressIdentifier];
    char v14 = [(NSString *)v12 isEqual:v13];

    if (addressIdentifier) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v14 = 1;
LABEL_14:

LABEL_15:
  int isMe = self->_isMe;
  int v16 = [v6 isMe];
  double wifiConfidence = self->_wifiConfidence;
  [v6 wifiConfidence];
  double v19 = v18;
  int64_t wifiFingerprintLabelType = self->_wifiFingerprintLabelType;
  uint64_t v21 = [v6 wifiFingerprintLabelType];
  char v22 = v10 & v14;
  if (isMe != v16) {
    char v22 = 0;
  }
  if (wifiConfidence != v19) {
    char v22 = 0;
  }
  if (wifiFingerprintLabelType == v21) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = 0;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTMapItemExtendedAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addressIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isMe"];
  [v4 decodeDoubleForKey:@"wifiConfidence"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeIntegerForKey:@"wifiFingerprintLabelType"];

  id v11 = [(RTMapItemExtendedAttributes *)self initWithIdentifier:v5 addressIdentifier:v6 isMe:v7 wifiConfidence:v10 wifiFingerprintLabelType:v9];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_addressIdentifier forKey:@"addressIdentifier"];
  [v5 encodeBool:self->_isMe forKey:@"isMe"];
  [v5 encodeDouble:@"wifiConfidence" forKey:self->_wifiConfidence];
  [v5 encodeInteger:self->_wifiFingerprintLabelType forKey:@"wifiFingerprintLabelType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  addressIdentifier = self->_addressIdentifier;
  BOOL isMe = self->_isMe;
  double wifiConfidence = self->_wifiConfidence;
  int64_t wifiFingerprintLabelType = self->_wifiFingerprintLabelType;
  identifier = self->_identifier;
  return (id)[v4 initWithIdentifier:identifier addressIdentifier:addressIdentifier isMe:isMe wifiConfidence:wifiFingerprintLabelType wifiFingerprintLabelType:wifiConfidence];
}

- (NSString)addressIdentifier
{
  return self->_addressIdentifier;
}

- (void)setAddressIdentifier:(id)a3
{
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_BOOL isMe = a3;
}

- (double)wifiConfidence
{
  return self->_wifiConfidence;
}

- (void)setWifiConfidence:(double)a3
{
  self->_double wifiConfidence = a3;
}

- (int64_t)wifiFingerprintLabelType
{
  return self->_wifiFingerprintLabelType;
}

- (void)setWifiFingerprintLabelType:(int64_t)a3
{
  self->_int64_t wifiFingerprintLabelType = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
}

@end