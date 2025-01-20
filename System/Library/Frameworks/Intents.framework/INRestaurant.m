@interface INRestaurant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)location:(id)a3 equalToLocation:(id)a4;
- (CLLocation)location;
- (INRestaurant)init;
- (INRestaurant)initWithCoder:(id)a3;
- (INRestaurant)initWithLocation:(CLLocation *)location name:(NSString *)name vendorIdentifier:(NSString *)vendorIdentifier restaurantIdentifier:(NSString *)restaurantIdentifier;
- (NSString)description;
- (NSString)name;
- (NSString)restaurantIdentifier;
- (NSString)vendorIdentifier;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(CLLocation *)location;
- (void)setName:(NSString *)name;
- (void)setRestaurantIdentifier:(NSString *)restaurantIdentifier;
- (void)setVendorIdentifier:(NSString *)vendorIdentifier;
@end

@implementation INRestaurant

- (BOOL)isEqual:(id)a3
{
  v4 = (INRestaurant *)a3;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(INRestaurant *)v5 location];
      v7 = [(INRestaurant *)self location];
      BOOL v8 = [(INRestaurant *)self location:v6 equalToLocation:v7];

      v9 = [(INRestaurant *)self name];
      v10 = [(INRestaurant *)v5 name];
      LOBYTE(v6) = [v9 isEqualToString:v10];

      v11 = [(INRestaurant *)v5 vendorIdentifier];
      v12 = [(INRestaurant *)self vendorIdentifier];
      char v13 = [v11 isEqualToString:v12];

      v14 = [(INRestaurant *)v5 restaurantIdentifier];

      v15 = [(INRestaurant *)self restaurantIdentifier];
      LOBYTE(v5) = [v14 isEqualToString:v15];

      char v16 = v8 & v6 & v13 & v5;
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setRestaurantIdentifier:(NSString *)restaurantIdentifier
{
}

- (NSString)restaurantIdentifier
{
  return self->_restaurantIdentifier;
}

- (void)setVendorIdentifier:(NSString *)vendorIdentifier
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setName:(NSString *)name
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setLocation:(CLLocation *)location
{
}

- (CLLocation)location
{
  return self->_location;
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"location";
  location = self->_location;
  v4 = location;
  if (!location)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"name";
  name = self->_name;
  uint64_t v6 = name;
  if (!name)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"vendorIdentifier";
  vendorIdentifier = self->_vendorIdentifier;
  BOOL v8 = vendorIdentifier;
  if (!vendorIdentifier)
  {
    BOOL v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"restaurantIdentifier";
  restaurantIdentifier = self->_restaurantIdentifier;
  v10 = restaurantIdentifier;
  if (!restaurantIdentifier)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (restaurantIdentifier)
  {
    if (vendorIdentifier) {
      goto LABEL_11;
    }
  }
  else
  {

    if (vendorIdentifier)
    {
LABEL_11:
      if (name) {
        goto LABEL_12;
      }
LABEL_18:

      if (location) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!name) {
    goto LABEL_18;
  }
LABEL_12:
  if (location) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRestaurant;
  uint64_t v6 = [(INRestaurant *)&v11 description];
  v7 = [(INRestaurant *)self _dictionaryRepresentation];
  BOOL v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRestaurant *)self descriptionAtIndent:0];
}

- (BOOL)location:(id)a3 equalToLocation:(id)a4
{
  [a3 distanceFromLocation:a4];
  return v4 < 5.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [+[INRestaurant allocWithZone:a3] init];
  v5 = [(INRestaurant *)self location];
  [(INRestaurant *)v4 setLocation:v5];

  uint64_t v6 = [(INRestaurant *)self name];
  [(INRestaurant *)v4 setName:v6];

  v7 = [(INRestaurant *)self vendorIdentifier];
  [(INRestaurant *)v4 setVendorIdentifier:v7];

  BOOL v8 = [(INRestaurant *)self restaurantIdentifier];
  [(INRestaurant *)v4 setRestaurantIdentifier:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  location = self->_location;
  id v5 = a3;
  [v5 encodeObject:location forKey:@"location"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_vendorIdentifier forKey:@"vendorIdentifier"];
  [v5 encodeObject:self->_restaurantIdentifier forKey:@"restaurantIdentifier"];
}

- (INRestaurant)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INRestaurant *)self init];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  if (!v6)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v17 = 136315394;
    v18 = "-[INRestaurant initWithCoder:]";
    __int16 v19 = 2080;
    v20 = "_location";
LABEL_16:
    _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Null value for %s", (uint8_t *)&v17, 0x16u);
    goto LABEL_17;
  }
  location = v5->_location;
  v5->_location = (CLLocation *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (!v8)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v17 = 136315394;
    v18 = "-[INRestaurant initWithCoder:]";
    __int16 v19 = 2080;
    v20 = "_name";
    goto LABEL_16;
  }
  name = v5->_name;
  v5->_name = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorIdentifier"];
  if (!v10)
  {
    v15 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v17 = 136315394;
    v18 = "-[INRestaurant initWithCoder:]";
    __int16 v19 = 2080;
    v20 = "_vendorIdentifier";
    goto LABEL_16;
  }
  vendorIdentifier = v5->_vendorIdentifier;
  v5->_vendorIdentifier = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restaurantIdentifier"];
  if (!v12)
  {
    v15 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[INRestaurant initWithCoder:]";
      __int16 v19 = 2080;
      v20 = "_restaurantIdentifier";
      goto LABEL_16;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  restaurantIdentifier = v5->_restaurantIdentifier;
  v5->_restaurantIdentifier = (NSString *)v12;

LABEL_7:
  v14 = v5;
LABEL_18:

  return v14;
}

- (INRestaurant)initWithLocation:(CLLocation *)location name:(NSString *)name vendorIdentifier:(NSString *)vendorIdentifier restaurantIdentifier:(NSString *)restaurantIdentifier
{
  uint64_t v10 = location;
  objc_super v11 = name;
  uint64_t v12 = vendorIdentifier;
  char v13 = restaurantIdentifier;
  v24.receiver = self;
  v24.super_class = (Class)INRestaurant;
  v14 = [(INRestaurant *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [(CLLocation *)v10 copy];
    char v16 = v14->_location;
    v14->_location = (CLLocation *)v15;

    uint64_t v17 = [(NSString *)v11 copy];
    v18 = v14->_name;
    v14->_name = (NSString *)v17;

    uint64_t v19 = [(NSString *)v12 copy];
    v20 = v14->_vendorIdentifier;
    v14->_vendorIdentifier = (NSString *)v19;

    uint64_t v21 = [(NSString *)v13 copy];
    v22 = v14->_restaurantIdentifier;
    v14->_restaurantIdentifier = (NSString *)v21;
  }
  return v14;
}

- (INRestaurant)init
{
  v3 = objc_opt_new();
  id v4 = [(INRestaurant *)self initWithLocation:v3 name:&stru_1EDA6DB28 vendorIdentifier:&stru_1EDA6DB28 restaurantIdentifier:&stru_1EDA6DB28];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end