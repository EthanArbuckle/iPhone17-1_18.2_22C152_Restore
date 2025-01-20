@interface IDSPhoneTemporaryAliasDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)selected;
- (IDSPhoneTemporaryAliasDescription)initWithCoder:(id)a3;
- (IDSPhoneTemporaryAliasDescription)initWithURI:(id)a3 expirationDate:(id)a4 selected:(BOOL)a5;
- (IDSURI)URI;
- (NSDate)expirationDate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPhoneTemporaryAliasDescription

- (IDSPhoneTemporaryAliasDescription)initWithURI:(id)a3 expirationDate:(id)a4 selected:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSPhoneTemporaryAliasDescription;
  v11 = [(IDSPhoneTemporaryAliasDescription *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_URI, a3);
    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_selected = a5;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_selected) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; URI: %@, expirationDate: %@, selected: %@>",
               v4,
               self,
               self->_URI,
               self->_expirationDate,
               v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  URI = self->_URI;
  id v5 = a3;
  [v5 encodeObject:URI forKey:@"uri"];
  [v5 encodeObject:self->_expirationDate forKey:@"expiration"];
  [v5 encodeBool:self->_selected forKey:@"selected"];
}

- (IDSPhoneTemporaryAliasDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
  uint64_t v7 = [v4 decodeBoolForKey:@"selected"];

  v8 = [(IDSPhoneTemporaryAliasDescription *)self initWithURI:v5 expirationDate:v6 selected:v7];
  return v8;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_URI, 0);
}

@end