@interface _HKAuthorizationRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithStatus:(int64_t)a3 request:(int64_t)a4 mode:(int64_t)a5 anchorLimitModifiedDate:(id)a6;
- (BOOL)deniedReading;
- (BOOL)deniedSharing;
- (BOOL)isCompatibleStatus:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readingEnabled;
- (BOOL)requestedReading;
- (BOOL)requestedSharing;
- (BOOL)sharingEnabled;
- (NSDate)anchorLimitModifiedDate;
- (_HKAuthorizationRecord)initWithAuthorizationStatus:(int64_t)a3 authorizationRequest:(int64_t)a4 authorizationMode:(int64_t)a5 anchorLimitModifiedDate:(id)a6;
- (_HKAuthorizationRecord)initWithCoder:(id)a3;
- (_HKAuthorizationRecord)recordWithReadingDisabled;
- (_HKAuthorizationRecord)recordWithSharingDisabled;
- (id)_deepCopy;
- (id)description;
- (int64_t)mode;
- (int64_t)request;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation _HKAuthorizationRecord

- (_HKAuthorizationRecord)initWithAuthorizationStatus:(int64_t)a3 authorizationRequest:(int64_t)a4 authorizationMode:(int64_t)a5 anchorLimitModifiedDate:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_HKAuthorizationRecord;
  v11 = [(_HKAuthorizationRecord *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    v11->_request = a4;
    v11->_mode = a5;
    uint64_t v13 = [v10 copy];
    anchorLimitModifiedDate = v12->_anchorLimitModifiedDate;
    v12->_anchorLimitModifiedDate = (NSDate *)v13;
  }
  return v12;
}

+ (id)recordWithStatus:(int64_t)a3 request:(int64_t)a4 mode:(int64_t)a5 anchorLimitModifiedDate:(id)a6
{
  id v10 = a6;
  v11 = (void *)[objc_alloc((Class)a1) initWithAuthorizationStatus:a3 authorizationRequest:a4 authorizationMode:a5 anchorLimitModifiedDate:v10];

  return v11;
}

- (id)_deepCopy
{
  v3 = [_HKAuthorizationRecord alloc];
  int64_t v4 = [(_HKAuthorizationRecord *)self status];
  int64_t v5 = [(_HKAuthorizationRecord *)self request];
  int64_t v6 = [(_HKAuthorizationRecord *)self mode];
  v7 = [(_HKAuthorizationRecord *)self anchorLimitModifiedDate];
  v8 = [(_HKAuthorizationRecord *)v3 initWithAuthorizationStatus:v4 authorizationRequest:v5 authorizationMode:v6 anchorLimitModifiedDate:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = v4;
    int64_t v6 = v5;
    if (self->_status != v5[1] || self->_request != v5[2] || self->_mode != v5[3]) {
      goto LABEL_9;
    }
    anchorLimitModifiedDate = self->_anchorLimitModifiedDate;
    v8 = (NSDate *)v6[4];
    if (anchorLimitModifiedDate == v8)
    {
      char v9 = 1;
      goto LABEL_10;
    }
    if (v8) {
      char v9 = -[NSDate isEqualToDate:](anchorLimitModifiedDate, "isEqualToDate:");
    }
    else {
LABEL_9:
    }
      char v9 = 0;
LABEL_10:

    goto LABEL_11;
  }
  char v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  return self->_status ^ (self->_request << 8) ^ (self->_mode << 16);
}

- (BOOL)requestedSharing
{
  return (self->_request & 0xFFFFFFFFFFFFFFFDLL) == 201;
}

- (BOOL)requestedReading
{
  return (self->_request & 0xFFFFFFFFFFFFFFFELL) == 202;
}

- (BOOL)deniedSharing
{
  BOOL v3 = [(_HKAuthorizationRecord *)self requestedSharing];
  if (v3) {
    LOBYTE(v3) = (unint64_t)(self->_status - 103) < 2;
  }
  return v3;
}

- (BOOL)deniedReading
{
  BOOL v3 = [(_HKAuthorizationRecord *)self requestedReading];
  if (v3)
  {
    int64_t status = self->_status;
    LOBYTE(v3) = status == 104 || status == 102;
  }
  return v3;
}

- (BOOL)sharingEnabled
{
  BOOL v3 = [(_HKAuthorizationRecord *)self requestedSharing];
  if (v3) {
    LOBYTE(v3) = (unint64_t)(self->_status - 101) < 2;
  }
  return v3;
}

- (BOOL)readingEnabled
{
  BOOL v3 = [(_HKAuthorizationRecord *)self requestedReading];
  if (v3) {
    LOBYTE(v3) = ((self->_status - 101) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return v3;
}

- (BOOL)isCompatibleStatus:(int64_t)a3
{
  BOOL v5 = [(_HKAuthorizationRecord *)self requestedSharing];
  BOOL v6 = [(_HKAuthorizationRecord *)self requestedReading];
  BOOL result = 1;
  switch(a3)
  {
    case 'd':
    case 'h':
      return result;
    case 'e':
      BOOL result = v5 && v6;
      break;
    case 'f':
      BOOL result = v5;
      break;
    case 'g':
      BOOL result = v6;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (_HKAuthorizationRecord)recordWithReadingDisabled
{
  int64_t v3 = [(_HKAuthorizationRecord *)self status];
  if ([(_HKAuthorizationRecord *)self status] == 101)
  {
    int64_t v3 = 102;
  }
  else if ([(_HKAuthorizationRecord *)self status] == 103)
  {
    int64_t v3 = 104;
  }
  id v4 = [(_HKAuthorizationRecord *)self _deepCopy];
  [v4 setStatus:v3];

  return (_HKAuthorizationRecord *)v4;
}

- (_HKAuthorizationRecord)recordWithSharingDisabled
{
  int64_t v3 = [(_HKAuthorizationRecord *)self status];
  if ([(_HKAuthorizationRecord *)self status] == 101)
  {
    int64_t v3 = 103;
  }
  else if ([(_HKAuthorizationRecord *)self status] == 102)
  {
    int64_t v3 = 104;
  }
  id v4 = [(_HKAuthorizationRecord *)self _deepCopy];
  [v4 setStatus:v3];

  return (_HKAuthorizationRecord *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKAuthorizationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKAuthorizationRecord;
  BOOL v5 = [(_HKAuthorizationRecord *)&v9 init];
  if (v5)
  {
    v5->_int64_t status = [v4 decodeIntegerForKey:@"status"];
    v5->_request = [v4 decodeIntegerForKey:@"request"];
    v5->_mode = [v4 decodeIntegerForKey:@"mode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor_limit_mod_date"];
    anchorLimitModifiedDate = v5->_anchorLimitModifiedDate;
    v5->_anchorLimitModifiedDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status = self->_status;
  id v5 = a3;
  [v5 encodeInteger:status forKey:@"status"];
  [v5 encodeInteger:self->_request forKey:@"request"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
  [v5 encodeObject:self->_anchorLimitModifiedDate forKey:@"anchor_limit_mod_date"];
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_status - 100;
  if (v5 > 4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E58C9150[v5];
  }
  unint64_t v7 = self->_request - 200;
  if (v7 > 3) {
    v8 = 0;
  }
  else {
    v8 = off_1E58C9130[v7];
  }
  objc_super v9 = @"anchor-limited";
  int64_t mode = self->_mode;
  anchorLimitModifiedDate = self->_anchorLimitModifiedDate;
  if (mode != 1) {
    objc_super v9 = 0;
  }
  if (!mode) {
    objc_super v9 = @"unlimited";
  }
  if (anchorLimitModifiedDate)
  {
    v12 = NSString;
    uint64_t v13 = v9;
    v14 = [v12 stringWithFormat:@" anchor-updated:%@", anchorLimitModifiedDate];
    v15 = [v3 stringWithFormat:@"<%@:%p status:%@ request:%@ mode:%@%@>", v4, self, v6, v8, v13, v14, 0];
  }
  else
  {
    v14 = v9;
    v15 = [v3 stringWithFormat:@"<%@:%p status:%@ request:%@ mode:%@%@>", v4, self, v6, v8, v14, &stru_1EEC60288, 0];
  }

  return v15;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (int64_t)request
{
  return self->_request;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSDate)anchorLimitModifiedDate
{
  return self->_anchorLimitModifiedDate;
}

- (void).cxx_destruct
{
}

@end