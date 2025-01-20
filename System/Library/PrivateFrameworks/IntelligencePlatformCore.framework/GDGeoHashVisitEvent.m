@interface GDGeoHashVisitEvent
- (BOOL)isEnter;
- (BOOL)isEqual:(id)a3;
- (GDGeoHashVisitEvent)initWithDate:(id)a3 geoHash:(unint64_t)a4 isEnter:(BOOL)a5 level:(int64_t)a6;
- (NSDate)date;
- (int64_t)level;
- (unint64_t)geoHash;
@end

@implementation GDGeoHashVisitEvent

- (void).cxx_destruct
{
}

- (int64_t)level
{
  return self->_level;
}

- (BOOL)isEnter
{
  return self->_isEnter;
}

- (unint64_t)geoHash
{
  return self->_geoHash;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GDGeoHashVisitEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    char isEqualToDate = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    int isEnter = self->_isEnter;
    if (isEnter == objc_msgSend_isEnter(v6, v8, v9, v10)
      && (unint64_t geoHash = self->_geoHash, geoHash == objc_msgSend_geoHash(v6, v11, v12, v13)))
    {
      date = self->_date;
      v19 = objc_msgSend_date(v6, v15, v16, v17);
      char isEqualToDate = objc_msgSend_isEqualToDate_(date, v20, (uint64_t)v19, v21);
    }
    else
    {
      char isEqualToDate = 0;
    }
  }
  else
  {
    char isEqualToDate = 0;
  }

  return isEqualToDate;
}

- (GDGeoHashVisitEvent)initWithDate:(id)a3 geoHash:(unint64_t)a4 isEnter:(BOOL)a5 level:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDGeoHashVisitEvent;
  uint64_t v12 = [(GDGeoHashVisitEvent *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a3);
    v13->_int isEnter = a5;
    v13->_unint64_t geoHash = a4;
    v13->_level = a6;
  }

  return v13;
}

@end