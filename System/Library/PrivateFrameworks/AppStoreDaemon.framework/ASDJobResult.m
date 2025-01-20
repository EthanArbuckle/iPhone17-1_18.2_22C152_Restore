@interface ASDJobResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithExistingActivity:(int64_t)a3 bundleID:(id)a4;
+ (id)resultWithInvalidActivity:(int64_t)a3 bundleID:(id)a4;
+ (id)resultWithPersistentID:(id)a3 bundleID:(id)a4 status:(int64_t)a5 error:(id)a6;
+ (id)resultWithRestrictedActivity:(int64_t)a3 bundleID:(id)a4;
+ (id)resultWithValidActivity:(int64_t)a3 bundleID:(id)a4;
- (ASDJobResult)initWithCoder:(id)a3;
- (NSError)error;
- (NSNumber)persistentID;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDJobResult

+ (id)resultWithExistingActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  v7 = ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 506, 0, 0, 0);
  v8 = [NSNumber numberWithLongLong:a3];
  v9 = [a1 resultWithPersistentID:v8 bundleID:v6 status:0 error:v7];

  return v9;
}

+ (id)resultWithInvalidActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  v7 = ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 507, 0, 0, 0);
  v8 = [NSNumber numberWithLongLong:a3];
  v9 = [a1 resultWithPersistentID:v8 bundleID:v6 status:1 error:v7];

  return v9;
}

+ (id)resultWithRestrictedActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  v7 = ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 502, 0, 0, 0);
  v8 = [NSNumber numberWithLongLong:a3];
  v9 = [a1 resultWithPersistentID:v8 bundleID:v6 status:1 error:v7];

  return v9;
}

+ (id)resultWithValidActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithLongLong:a3];
  v9 = [a1 resultWithPersistentID:v8 bundleID:v7 status:2 error:0];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDJobResult allocWithZone:](ASDJobResult, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  uint64_t v8 = [(NSError *)self->_error copyWithZone:a3];
  error = v5->_error;
  v5->_error = (NSError *)v8;

  uint64_t v10 = [(NSNumber *)self->_persistentID copyWithZone:a3];
  persistentID = v5->_persistentID;
  v5->_persistentID = (NSNumber *)v10;

  v5->_status = self->_status;
  return v5;
}

- (id)description
{
  unint64_t status = self->_status;
  if (status > 2) {
    v3 = 0;
  }
  else {
    v3 = off_1E58B4A30[status];
  }
  return (id)[NSString stringWithFormat:@"%@ %@ %@", v3, self->_persistentID, self->_bundleID];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDJobResult;
  v5 = [(ASDJobResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSNumber *)v10;

    v5->_unint64_t status = [v4 decodeIntegerForKey:@"status"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_bundleID forKey:@"bundleID"];
  error = self->_error;
  if (error)
  {
    v5 = ASDErrorWithSafeUserInfo(error);
    [v6 encodeObject:v5 forKey:@"error"];
  }
  [v6 encodeObject:self->_persistentID forKey:@"persistentID"];
  [v6 encodeInteger:self->_status forKey:@"status"];
}

+ (id)resultWithPersistentID:(id)a3 bundleID:(id)a4 status:(int64_t)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = objc_opt_new();
  objc_super v13 = (void *)v12[3];
  v12[3] = v9;
  id v14 = v9;

  v15 = (void *)v12[1];
  v12[1] = v10;
  id v16 = v10;

  v12[4] = a5;
  v17 = (void *)v12[2];
  v12[2] = v11;

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end