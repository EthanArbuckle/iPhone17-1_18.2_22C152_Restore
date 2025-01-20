@interface DIAttribute
+ (BOOL)supportsSecureCoding;
- (BOOL)dataNodeProof;
- (BOOL)hasLabel;
- (BOOL)holdLocally;
- (BOOL)incorrect;
- (BOOL)isAttributeTypeCamera;
- (BOOL)isAttributeTypeCustom;
- (BOOL)isAttributeTypeDate;
- (BOOL)isAttributeTypeDocument;
- (BOOL)isAttributeTypeFooter;
- (BOOL)isAttributeTypeLabel;
- (BOOL)isAttributeTypePicker;
- (BOOL)isAttributeTypeSMSOTP;
- (BOOL)isAttributeTypeText;
- (BOOL)isSensitive;
- (BOOL)notForVerification;
- (BOOL)optional;
- (DIAttribute)init;
- (DIAttribute)initWithCoder:(id)a3;
- (NSData)submissionValue;
- (NSObject)defaultValue;
- (NSObject)getCurrentValue;
- (NSString)clientValidationRegex;
- (NSString)codeOnError;
- (NSString)dataNodeProofGroup;
- (NSString)displayFormat;
- (NSString)group;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (NSString)localizedPlaceholder;
- (NSString)reason;
- (NSString)serverValidationURL;
- (NSString)submissionFormat;
- (NSString)submissionKey;
- (NSString)supportingData;
- (id)description;
- (id)submissionString;
- (unint64_t)attributeType;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeType:(unint64_t)a3;
- (void)setClientValidationRegex:(id)a3;
- (void)setCodeOnError:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDataNodeProof:(BOOL)a3;
- (void)setDataNodeProofGroup:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDisplayFormat:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHoldLocally:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncorrect:(BOOL)a3;
- (void)setIsSensitive:(BOOL)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setLocalizedPlaceholder:(id)a3;
- (void)setNotForVerification:(BOOL)a3;
- (void)setOptional:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setServerValidationURL:(id)a3;
- (void)setSubmissionFormat:(id)a3;
- (void)setSubmissionKey:(id)a3;
- (void)setSubmissionValue:(id)a3;
- (void)setSupportingData:(id)a3;
@end

@implementation DIAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeInteger:self->_attributeType forKey:@"attributeType"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_displayFormat forKey:@"displayFormat"];
  [v5 encodeObject:self->_localizedDisplayName forKey:@"localizedDisplayName"];
  [v5 encodeObject:self->_localizedPlaceholder forKey:@"localizedPlaceholder"];
  [v5 encodeObject:self->_submissionKey forKey:@"submissionKey"];
  [v5 encodeBool:self->_optional forKey:@"optional"];
  [v5 encodeBool:self->_incorrect forKey:@"incorrect"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_currentValue forKey:@"currentValue"];
  [v5 encodeObject:self->_defaultValue forKey:@"defaultValue"];

  os_unfair_lock_unlock(p_lock);
}

- (DIAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DIAttribute *)self init];
  if (v5)
  {
    v5->_attributeType = [v4 decodeIntegerForKey:@"attributeType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayFormat"];
    displayFormat = v5->_displayFormat;
    v5->_displayFormat = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedPlaceholder"];
    localizedPlaceholder = v5->_localizedPlaceholder;
    v5->_localizedPlaceholder = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submissionKey"];
    submissionKey = v5->_submissionKey;
    v5->_submissionKey = (NSString *)v14;

    v5->_optional = [v4 decodeBoolForKey:@"optional"];
    v5->_incorrect = [v4 decodeBoolForKey:@"incorrect"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v16;

    switch(v5->_attributeType)
    {
      case 1uLL:
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xAuLL:
        uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentValue"];
        currentValue = v5->_currentValue;
        v5->_currentValue = v18;

        uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
        defaultValue = v5->_defaultValue;
        v5->_defaultValue = v20;
        goto LABEL_7;
      case 3uLL:
        uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentValue"];
        v28 = v5->_currentValue;
        v5->_currentValue = v27;

        goto LABEL_6;
      case 4uLL:
      case 9uLL:
        v22 = (void *)MEMORY[0x263EFFA08];
        uint64_t v23 = objc_opt_class();
        v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
        uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"currentValue"];
        v26 = v5->_currentValue;
        v5->_currentValue = v25;

LABEL_6:
        defaultValue = v5->_defaultValue;
        v5->_defaultValue = 0;
LABEL_7:

        break;
      default:
        break;
    }
  }

  return v5;
}

- (DIAttribute)init
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttribute;
  result = [(DIAttribute *)&v3 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_attributeType = 0;
  }
  return result;
}

- (BOOL)isAttributeTypeText
{
  return [(DIAttribute *)self attributeType] == 1;
}

- (BOOL)isAttributeTypeDate
{
  return [(DIAttribute *)self attributeType] == 2;
}

- (BOOL)isAttributeTypePicker
{
  return [(DIAttribute *)self attributeType] == 5;
}

- (BOOL)isAttributeTypeDocument
{
  return [(DIAttribute *)self attributeType] == 4;
}

- (BOOL)isAttributeTypeSMSOTP
{
  return [(DIAttribute *)self attributeType] == 8;
}

- (BOOL)isAttributeTypeCamera
{
  return [(DIAttribute *)self attributeType] == 9;
}

- (BOOL)isAttributeTypeLabel
{
  return [(DIAttribute *)self attributeType] == 6;
}

- (BOOL)isAttributeTypeFooter
{
  return [(DIAttribute *)self attributeType] == 7;
}

- (BOOL)isAttributeTypeCustom
{
  return [(DIAttribute *)self attributeType] == 10;
}

- (void)setCurrentValue:(id)a3
{
  uint64_t v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentValue != v6)
  {
    id v4 = [v6 copyWithZone:0];
    currentValue = self->_currentValue;
    self->_currentValue = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDefaultValue:(id)a3
{
  uint64_t v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_defaultValue != v6)
  {
    id v4 = [v6 copyWithZone:0];
    defaultValue = self->_defaultValue;
    self->_defaultValue = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIdentifier:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_identifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAttributeType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_attributeType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayFormat:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_displayFormat != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    displayFormat = self->_displayFormat;
    self->_displayFormat = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocalizedDisplayName:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_localizedDisplayName != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    localizedDisplayName = self->_localizedDisplayName;
    self->_localizedDisplayName = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocalizedPlaceholder:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_localizedPlaceholder != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    localizedPlaceholder = self->_localizedPlaceholder;
    self->_localizedPlaceholder = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSubmissionKey:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_submissionKey != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    submissionKey = self->_submissionKey;
    self->_submissionKey = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSubmissionFormat:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_submissionFormat != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    submissionFormat = self->_submissionFormat;
    self->_submissionFormat = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)optional
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_optional;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOptional:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_optional = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIncorrect:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_incorrect = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsSensitive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isSensitive = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHoldLocally:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_holdLocally = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setNotForVerification:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_notForVerification = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDataNodeProof:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_dataNodeProof = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setGroup:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_group != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    group = self->_group;
    self->_group = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDataNodeProofGroup:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_dataNodeProofGroup != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    dataNodeProofGroup = self->_dataNodeProofGroup;
    self->_dataNodeProofGroup = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSubmissionValue:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_submissionValue != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    submissionValue = self->_submissionValue;
    self->_submissionValue = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setClientValidationRegex:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_clientValidationRegex != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    clientValidationRegex = self->_clientValidationRegex;
    self->_clientValidationRegex = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCodeOnError:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_codeOnError != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    codeOnError = self->_codeOnError;
    self->_codeOnError = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServerValidationURL:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serverValidationURL != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    serverValidationURL = self->_serverValidationURL;
    self->_serverValidationURL = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHasLabel:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasLabel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportingData:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_supportingData != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    supportingData = self->_supportingData;
    self->_supportingData = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setReason:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_reason != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    reason = self->_reason;
    self->_reason = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSObject)getCurrentValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_currentValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSObject)defaultValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_defaultValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)attributeType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t attributeType = self->_attributeType;
  os_unfair_lock_unlock(p_lock);
  return attributeType;
}

- (NSString)displayFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_displayFormat;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)localizedDisplayName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_localizedDisplayName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)localizedPlaceholder
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_localizedPlaceholder;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)submissionKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_submissionKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)submissionFormat
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_submissionFormat;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)incorrect
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_incorrect;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSensitive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isSensitive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)holdLocally
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_holdLocally;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)notForVerification
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_notForVerification;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)dataNodeProof
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_dataNodeProof;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)group
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_group;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)dataNodeProofGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_dataNodeProofGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSData)submissionValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_submissionValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)clientValidationRegex
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_clientValidationRegex;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)codeOnError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_codeOnError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)serverValidationURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_serverValidationURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasLabel
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasLabel;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)supportingData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_supportingData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)reason
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_reason;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)submissionString
{
  return 0;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  os_unfair_lock_lock(&self->_lock);
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  objc_msgSend(v3, "appendFormat:", @"attributeType: '%lu'; ", self->_attributeType);
  [v3 appendFormat:@"displayFormat: '%@'; ", self->_displayFormat];
  [v3 appendFormat:@"localizedDisplayName: '%@'; ", self->_localizedDisplayName];
  [v3 appendFormat:@"localizedPlaceholder: '%@'; ", self->_localizedPlaceholder];
  [v3 appendFormat:@"submissionKey: '%@'; ", self->_submissionKey];
  if (self->_optional) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"optional: '%@'; ", v4];
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_supportingData, 0);
  objc_storeStrong((id *)&self->_serverValidationURL, 0);
  objc_storeStrong((id *)&self->_codeOnError, 0);
  objc_storeStrong((id *)&self->_clientValidationRegex, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_dataNodeProofGroup, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_submissionFormat, 0);
  objc_storeStrong((id *)&self->_submissionKey, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
}

@end