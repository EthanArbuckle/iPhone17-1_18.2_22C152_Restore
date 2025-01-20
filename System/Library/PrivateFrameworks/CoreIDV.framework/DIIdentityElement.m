@interface DIIdentityElement
+ (DIIdentityElement)addressElement;
+ (DIIdentityElement)ageElement;
+ (DIIdentityElement)dateOfBirthElement;
+ (DIIdentityElement)documentDHSComplianceStatusElement;
+ (DIIdentityElement)documentExpirationDateElement;
+ (DIIdentityElement)documentIssueDateElement;
+ (DIIdentityElement)documentNumberElement;
+ (DIIdentityElement)drivingPrivilegesElement;
+ (DIIdentityElement)familyNameElement;
+ (DIIdentityElement)givenNameElement;
+ (DIIdentityElement)issuingAuthorityElement;
+ (DIIdentityElement)portraitElement;
+ (DIIdentityElement)sexElement;
+ (id)ageThresholdElementWithAge:(int64_t)a3;
- (DIIdentityElement)initWithIdentifier:(id)a3;
- (NSString)identifier;
@end

@implementation DIIdentityElement

- (DIIdentityElement)initWithIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)DIIdentityElement;
  v5 = [(DIIdentityElement *)&v8 init];
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

+ (DIIdentityElement)givenNameElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys givenName];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)familyNameElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys familyName];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)sexElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys sex];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)portraitElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys portrait];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)addressElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys address];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)issuingAuthorityElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys issuingAuthority];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)documentDHSComplianceStatusElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys documentDHSComplianceStatus];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)documentExpirationDateElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys documentExpirationDate];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)documentNumberElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys documentNumber];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)documentIssueDateElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys documentIssueDate];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)drivingPrivilegesElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys drivingPrivileges];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)ageElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys age];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (DIIdentityElement)dateOfBirthElement
{
  v2 = [DIIdentityElement alloc];
  v3 = +[IdentityElementRawValueKeys dateOfBirth];
  v4 = [(DIIdentityElement *)v2 initWithIdentifier:v3];

  return v4;
}

+ (id)ageThresholdElementWithAge:(int64_t)a3
{
  v4 = [DIIdentityElement alloc];
  v5 = +[IdentityElementRawValueKeys ageIsOver:a3];
  v6 = [(DIIdentityElement *)v4 initWithIdentifier:v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end