@interface ACXApplicationStatus
+ (BOOL)supportsSecureCoding;
- (ACXApplicationStatus)initWithCoder:(id)a3;
- (NSError)lastInstallationError;
- (NSString)uniqueInstallID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)watchKitCompatibility;
- (unint64_t)architectureCompatibility;
- (unint64_t)installStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setArchitectureCompatibility:(unint64_t)a3;
- (void)setInstallStatus:(unint64_t)a3;
- (void)setInstallStatusWithGizmoStatus:(unint64_t)a3;
- (void)setLastInstallationError:(id)a3;
- (void)setUniqueInstallID:(id)a3;
- (void)setWatchKitCompatibility:(int64_t)a3;
@end

@implementation ACXApplicationStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t installStatus = self->_installStatus;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInteger:installStatus];
  [v6 encodeObject:v7 forKey:@"installStatus"];

  [v6 encodeObject:self->_lastInstallationError forKey:@"lastInstallationError"];
  [v6 encodeObject:self->_uniqueInstallID forKey:@"uniqueInstallID"];
  [v6 encodeInteger:self->_watchKitCompatibility forKey:@"watchKitCompatibility"];
  id v8 = [NSNumber numberWithUnsignedInteger:self->_architectureCompatibility];
  [v6 encodeObject:v8 forKey:@"architectureCompatibility"];
}

- (ACXApplicationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACXApplicationStatus;
  v5 = [(ACXApplicationStatus *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installStatus"];
    v5->_unint64_t installStatus = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastInstallationError"];
    lastInstallationError = v5->_lastInstallationError;
    v5->_lastInstallationError = (NSError *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueInstallID"];
    uniqueInstallID = v5->_uniqueInstallID;
    v5->_uniqueInstallID = (NSString *)v9;

    v5->_watchKitCompatibility = [v4 decodeIntegerForKey:@"watchKitCompatibility"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"architectureCompatibility"];
    v5->_architectureCompatibility = [v11 unsignedIntegerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = [(ACXApplicationStatus *)self installStatus];
  uint64_t v5 = [(ACXApplicationStatus *)self lastInstallationError];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(ACXApplicationStatus *)self uniqueInstallID];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  v4[4] = [(ACXApplicationStatus *)self watchKitCompatibility];
  v4[5] = [(ACXApplicationStatus *)self architectureCompatibility];
  return v4;
}

- (void)setInstallStatusWithGizmoStatus:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1DD49C710[a3 - 1];
  }
  [(ACXApplicationStatus *)self setInstallStatus:v3];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(ACXApplicationStatus *)self installStatus];
  uint64_t v7 = [(ACXApplicationStatus *)self lastInstallationError];
  id v8 = [(ACXApplicationStatus *)self uniqueInstallID];
  uint64_t v9 = [v3 stringWithFormat:@"<%@<%p> installStatus=%lu lastError=%@ uniqueID=%@ wkCompatibility=%ld archCompatibility=%lu>", v5, self, v6, v7, v8, -[ACXApplicationStatus watchKitCompatibility](self, "watchKitCompatibility"), -[ACXApplicationStatus architectureCompatibility](self, "architectureCompatibility")];

  return v9;
}

- (unint64_t)installStatus
{
  return self->_installStatus;
}

- (void)setInstallStatus:(unint64_t)a3
{
  self->_unint64_t installStatus = a3;
}

- (NSError)lastInstallationError
{
  return self->_lastInstallationError;
}

- (void)setLastInstallationError:(id)a3
{
}

- (NSString)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
}

- (int64_t)watchKitCompatibility
{
  return self->_watchKitCompatibility;
}

- (void)setWatchKitCompatibility:(int64_t)a3
{
  self->_watchKitCompatibility = a3;
}

- (unint64_t)architectureCompatibility
{
  return self->_architectureCompatibility;
}

- (void)setArchitectureCompatibility:(unint64_t)a3
{
  self->_architectureCompatibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);

  objc_storeStrong((id *)&self->_lastInstallationError, 0);
}

@end