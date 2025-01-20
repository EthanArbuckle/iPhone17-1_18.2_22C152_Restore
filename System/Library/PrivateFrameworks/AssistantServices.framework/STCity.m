@interface STCity
+ (BOOL)supportsSecureCoding;
- (STCity)initWithCoder:(id)a3;
- (id)_initWithName:(id)a3 unlocalizedName:(id)a4 countryName:(id)a5 unlocalizedCountryName:(id)a6 timeZone:(id)a7 latitude:(id)a8 longitude:(id)a9 alCityID:(id)a10;
- (id)alCityValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STCity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alCityID, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_unlocalizedCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (STCity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnlocalizedName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CountryName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnlocalizedCountryName"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimeZone"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Latitude"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Longitude"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ALCityID"];

  v13 = [(STCity *)self _initWithName:v5 unlocalizedName:v6 countryName:v7 unlocalizedCountryName:v8 timeZone:v9 latitude:v10 longitude:v11 alCityID:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"Name"];
  [v5 encodeObject:self->_unlocalizedName forKey:@"UnlocalizedName"];
  [v5 encodeObject:self->_countryName forKey:@"CountryName"];
  [v5 encodeObject:self->_unlocalizedCountryName forKey:@"UnlocalizedName"];
  [v5 encodeObject:self->_timeZone forKey:@"TimeZone"];
  [v5 encodeObject:self->_latitude forKey:@"Latitude"];
  [v5 encodeObject:self->_longitude forKey:@"Longitude"];
  [v5 encodeObject:self->_alCityID forKey:@"ALCityID"];
}

- (id)alCityValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4BE30]);
  alCityID = self->_alCityID;
  if (alCityID) {
    objc_msgSend(v3, "setIdentifier:", -[NSNumber intValue](alCityID, "intValue"));
  }
  latitude = self->_latitude;
  if (latitude)
  {
    [(NSNumber *)latitude floatValue];
    objc_msgSend(v3, "setLatitude:");
  }
  longitude = self->_longitude;
  if (longitude)
  {
    [(NSNumber *)longitude floatValue];
    objc_msgSend(v3, "setLongitude:");
  }
  [v3 setName:self->_name];
  [v3 setUnlocalizedName:self->_unlocalizedName];
  [v3 setCountryName:self->_countryName];
  [v3 setUnlocalizedCountryName:self->_unlocalizedCountryName];
  [v3 setTimeZone:self->_timeZone];
  return v3;
}

- (id)_initWithName:(id)a3 unlocalizedName:(id)a4 countryName:(id)a5 unlocalizedCountryName:(id)a6 timeZone:(id)a7 latitude:(id)a8 longitude:(id)a9 alCityID:(id)a10
{
  id v35 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v34 = a8;
  id v20 = a9;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)STCity;
  v22 = [(STCity *)&v36 init];
  if (v22)
  {
    uint64_t v23 = objc_msgSend(v35, "copy", v34);
    name = v22->_name;
    v22->_name = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    unlocalizedName = v22->_unlocalizedName;
    v22->_unlocalizedName = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    countryName = v22->_countryName;
    v22->_countryName = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    unlocalizedCountryName = v22->_unlocalizedCountryName;
    v22->_unlocalizedCountryName = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    timeZone = v22->_timeZone;
    v22->_timeZone = (NSString *)v31;

    objc_storeStrong((id *)&v22->_latitude, a8);
    objc_storeStrong((id *)&v22->_longitude, a9);
    objc_storeStrong((id *)&v22->_alCityID, a10);
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end