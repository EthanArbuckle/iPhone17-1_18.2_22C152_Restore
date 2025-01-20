@interface AKWalrusContext
+ (BOOL)supportsSecureCoding;
- (AKWalrusContext)initWithCoder:(id)a3;
- (BOOL)cliMode;
- (NSString)altDSID;
- (NSString)description;
- (NSUUID)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCliMode:(BOOL)a3;
@end

@implementation AKWalrusContext

- (AKWalrusContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKWalrusContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_cliMode = [v4 decodeBoolForKey:@"_cliMode"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeBool:self->_cliMode forKey:@"_cliMode"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = self->_cliMode;
  id v5 = [(NSString *)self->_altDSID copy];
  uint64_t v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  id v7 = [(NSUUID *)self->_identifier copy];
  uint64_t v8 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v7;

  return v4;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"WalrusContext:%@, altDSID: %@, cliMode: %i", self->_identifier, self->_altDSID, self->_cliMode];
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end