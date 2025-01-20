@interface SKGLocation
- (BOOL)isEqual:(id)a3;
- (BOOL)relatedTo:(id)a3;
- (double)lat;
- (double)lng;
- (id)description;
- (unint64_t)geoID;
- (void)setGeoID:(unint64_t)a3;
- (void)setLat:(double)a3;
- (void)setLng:(double)a3;
@end

@implementation SKGLocation

- (BOOL)relatedTo:(id)a3
{
  id v4 = a3;
  [(SKGLocation *)self lat];
  double v6 = v5;
  [v4 lat];
  if (v6 <= v7 && (-[SKGLocation lng](self, "lng"), double v9 = v8, [v4 lng], v9 <= v10))
  {
    BOOL v14 = 1;
  }
  else
  {
    [v4 lat];
    double v12 = v11;
    [(SKGLocation *)self lat];
    if (v12 <= v13)
    {
      [v4 lng];
      double v16 = v15;
      [(SKGLocation *)self lng];
      BOOL v14 = v16 <= v17;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(SKGLocation *)self lat];
    double v7 = v6;
    [v5 lat];
    if (v7 == v8 && (-[SKGLocation lng](self, "lng"), double v10 = v9, [v5 lng], v10 == v11))
    {
      v14.receiver = self;
      v14.super_class = (Class)SKGLocation;
      BOOL v12 = [(SKGEntity *)&v14 isEqual:v5];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(SKGLocation *)self lat];
  uint64_t v5 = v4;
  [(SKGLocation *)self lng];
  uint64_t v7 = v6;
  [(SKGEntity *)self score];
  return +[NSString stringWithFormat:@"<%@: %f %f %f>", v3, v5, v7, v8];
}

- (unint64_t)geoID
{
  return self->_geoID;
}

- (void)setGeoID:(unint64_t)a3
{
  self->_geoID = a3;
}

- (double)lat
{
  return self->_lat;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (double)lng
{
  return self->_lng;
}

- (void)setLng:(double)a3
{
  self->_lng = a3;
}

@end