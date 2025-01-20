@interface CLSPublicEventPerformer
+ (BOOL)supportsSecureCoding;
- (CLSPublicEventPerformer)initWithCoder:(id)a3;
- (CLSPublicEventPerformer)initWithLocalizedName:(id)a3 iTunesIdentifier:(id)a4;
- (NSString)iTunesIdentifier;
- (NSString)localizedName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSPublicEventPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (NSString)iTunesIdentifier
{
  return self->_iTunesIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLSPublicEventPerformer;
  v4 = [(CLSPublicEventPerformer *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ localizedName: %@, localizedName: %@", v4, self->_localizedName, self->_iTunesIdentifier];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedName = self->_localizedName;
  id v5 = a3;
  [v5 encodeObject:localizedName forKey:@"name"];
  [v5 encodeObject:self->_iTunesIdentifier forKey:@"iTunesIdentifier"];
}

- (CLSPublicEventPerformer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesIdentifier"];

  objc_super v7 = [(CLSPublicEventPerformer *)self initWithLocalizedName:v5 iTunesIdentifier:v6];
  return v7;
}

- (CLSPublicEventPerformer)initWithLocalizedName:(id)a3 iTunesIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSPublicEventPerformer;
  v9 = [(CLSPublicEventPerformer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedName, a3);
    objc_storeStrong((id *)&v10->_iTunesIdentifier, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end