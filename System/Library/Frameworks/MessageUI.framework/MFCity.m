@interface MFCity
- (BOOL)isEqual:(id)a3;
- (MFCity)initWithCityName:(id)a3 displayName:(id)a4 timeZone:(id)a5;
- (NSString)cityName;
- (NSString)displayName;
- (NSTimeZone)timeZone;
- (unint64_t)hash;
@end

@implementation MFCity

- (MFCity)initWithCityName:(id)a3 displayName:(id)a4 timeZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFCity;
  v12 = [(MFCity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cityName, a3);
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v13->_timeZone, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(MFCity *)self cityName];
  uint64_t v4 = [v3 hash];

  v5 = [(MFCity *)self displayName];
  uint64_t v6 = [v5 hash];

  v7 = [(MFCity *)self timeZone];
  unint64_t v8 = 33 * (33 * v4 + v6) + [v7 hash] + 35937;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MFCity *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MFCity *)self cityName];
      v7 = [(MFCity *)v5 cityName];
      if ([v6 isEqualToString:v7])
      {
        unint64_t v8 = [(MFCity *)self displayName];
        id v9 = [(MFCity *)v5 displayName];
        if ([v8 isEqualToString:v9])
        {
          id v10 = [(MFCity *)self timeZone];
          id v11 = [(MFCity *)v5 timeZone];
          char v12 = [v10 isEqualToTimeZone:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)cityName
{
  return self->_cityName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_cityName, 0);
}

@end