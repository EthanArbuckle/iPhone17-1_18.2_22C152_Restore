@interface MSPLowFuelDetails
+ (BOOL)supportsSecureCoding;
- (MSPLowFuelDetails)initWithCoder:(id)a3;
- (MSPLowFuelDetails)initWithTitle:(id)a3 subtitle:(id)a4 engineType:(id)a5;
- (NSData)iconData;
- (NSData)iconDataCarPlay;
- (NSNumber)engineType;
- (NSString)subtitle;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
- (void)setEngineType:(id)a3;
- (void)setIconData:(id)a3;
- (void)setIconDataCarPlay:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MSPLowFuelDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSPLowFuelDetails)initWithTitle:(id)a3 subtitle:(id)a4 engineType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSPLowFuelDetails;
  v12 = [(MSPLowFuelDetails *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_engineType, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_title forKey:@"title"];
  [v6 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v6 encodeObject:self->_engineType forKey:@"engineType"];
  iconData = self->_iconData;
  if (iconData) {
    [v6 encodeObject:iconData forKey:@"iconData"];
  }
  iconDataCarPlay = self->_iconDataCarPlay;
  if (iconDataCarPlay) {
    [v6 encodeObject:iconDataCarPlay forKey:@"iconDataCarPlay"];
  }
}

- (MSPLowFuelDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSPLowFuelDetails *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engineType"];
    engineType = v5->_engineType;
    v5->_engineType = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconDataCarPlay"];
    iconDataCarPlay = v5->_iconDataCarPlay;
    v5->_iconDataCarPlay = (NSData *)v14;
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSNumber)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(id)a3
{
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
}

- (NSData)iconDataCarPlay
{
  return self->_iconDataCarPlay;
}

- (void)setIconDataCarPlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDataCarPlay, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_engineType, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end