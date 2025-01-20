@interface STSiriLocation
+ (BOOL)supportsSecureCoding;
- (NSData)geoResult;
- (NSString)addressLabel;
- (NSString)contactName;
- (NSString)description;
- (NSURL)addressBookID;
- (STSiriLocation)initWithCoder:(id)a3;
- (int64_t)resultType;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressBookID:(id)a3;
- (void)setAddressLabel:(id)a3;
- (void)setContactName:(id)a3;
- (void)setGeoResult:(id)a3;
- (void)setResultType:(int64_t)a3;
@end

@implementation STSiriLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoResult, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_addressBookID, 0);
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setGeoResult:(id)a3
{
}

- (NSData)geoResult
{
  return self->_geoResult;
}

- (void)setContactName:(id)a3
{
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setAddressLabel:(id)a3
{
}

- (NSString)addressLabel
{
  return self->_addressLabel;
}

- (void)setAddressBookID:(id)a3
{
}

- (NSURL)addressBookID
{
  return self->_addressBookID;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[STSiriLocation resultType](self, "resultType"));
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSData length](self->_geoResult, "length"));
  v6 = [v3 stringWithFormat:@"type: %@, data length: %@", v4, v5];

  if (self->_addressBookID) {
    [v6 appendFormat:@"\\ %@", self->_addressBookID];
  }
  if (self->_addressLabel) {
    [v6 appendFormat:@"\\ %@", self->_addressLabel];
  }
  if (self->_contactName) {
    [v6 appendFormat:@"\\ %@", self->_contactName];
  }
  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  addressBookID = self->_addressBookID;
  id v5 = a3;
  [v5 encodeObject:addressBookID forKey:@"kSTSiriLocationAddressBookIDKey"];
  [v5 encodeObject:self->_addressLabel forKey:@"kSTSiriLocationAddressLabelKey"];
  [v5 encodeObject:self->_contactName forKey:@"kSTSiriLocationContactNameKey"];
  [v5 encodeObject:self->_geoResult forKey:@"kSTSiriLocationGeoResultKey"];
  [v5 encodeInteger:self->_resultType forKey:@"kSTSiriLocationResultTypeKey"];
}

- (STSiriLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSiriLocation;
  id v5 = [(STSiriLocation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTSiriLocationAddressBookIDKey"];
    addressBookID = v5->_addressBookID;
    v5->_addressBookID = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTSiriLocationAddressLabelKey"];
    addressLabel = v5->_addressLabel;
    v5->_addressLabel = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTSiriLocationContactNameKey"];
    contactName = v5->_contactName;
    v5->_contactName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTSiriLocationGeoResultKey"];
    geoResult = v5->_geoResult;
    v5->_geoResult = (NSData *)v12;

    v5->_resultType = [v4 decodeIntegerForKey:@"kSTSiriLocationResultTypeKey"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end