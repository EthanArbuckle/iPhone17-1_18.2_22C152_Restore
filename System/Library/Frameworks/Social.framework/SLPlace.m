@interface SLPlace
+ (BOOL)supportsSecureCoding;
- (CLLocationCoordinate2D)coordinate;
- (NSString)category;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSURL)pictureURL;
- (SLPlace)initWithCoder:(id)a3;
- (double)distance;
- (double)latitude;
- (double)longitude;
- (id)encodableProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDistance:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setName:(id)a3;
- (void)setPictureURL:(id)a3;
@end

@implementation SLPlace

- (CLLocationCoordinate2D)coordinate
{
  [(SLPlace *)self latitude];
  CLLocationDegrees v4 = v3;
  [(SLPlace *)self longitude];

  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v4, v5);
  double longitude = v8.longitude;
  double latitude = v8.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)encodableProperties
{
  return &unk_1F1E40E10;
}

- (SLPlace)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLPlace;
  CLLocationDegrees v5 = [(SLPlace *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pictureURL"];
    pictureURL = v5->_pictureURL;
    v5->_pictureURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CLLocationDegrees v5 = [(SLPlace *)self encodableProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [(SLPlace *)self valueForKey:v10];
        [v4 encodeObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  double v3 = NSString;
  id v4 = [(SLPlace *)self name];
  CLLocationDegrees v5 = [(SLPlace *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"SLPlace name=\"%@\" identifier=%@", v4, v5];

  return (NSString *)v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSURL)pictureURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPictureURL:(id)a3
{
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCategory:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_pictureURL, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end