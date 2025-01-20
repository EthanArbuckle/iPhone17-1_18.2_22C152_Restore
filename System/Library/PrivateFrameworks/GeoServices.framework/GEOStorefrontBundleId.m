@interface GEOStorefrontBundleId
- (GEOStorefrontBundleId)init;
- (GEOStorefrontBundleId)initWithBundleId:(id)a3;
- (NSDate)date;
- (unint64_t)identifier;
@end

@implementation GEOStorefrontBundleId

- (GEOStorefrontBundleId)init
{
  result = (GEOStorefrontBundleId *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOStorefrontBundleId)initWithBundleId:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if ((~*((unsigned __int8 *)v4 + 24) & 3) != 0) {
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)GEOStorefrontBundleId;
  v6 = [(GEOStorefrontBundleId *)&v11 init];
  self = v6;
  if (!v6) {
    goto LABEL_6;
  }
  v6->_identifier = v5[1];
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(unint64_t)v5[2]];
  date = self->_date;
  self->_date = v7;

  if (self->_date)
  {
    self = self;
    v9 = self;
  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end