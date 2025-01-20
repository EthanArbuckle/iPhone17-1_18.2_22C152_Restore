@interface CPAnalyticsBiomeBaseSample
- (CPAnalyticsBiomeBaseSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5;
- (NSDate)date;
- (NSString)identifier;
- (NSString)subset;
@end

@implementation CPAnalyticsBiomeBaseSample

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subset, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)subset
{
  return self->_subset;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CPAnalyticsBiomeBaseSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPAnalyticsBiomeBaseSample;
  v12 = [(CPAnalyticsBiomeBaseSample *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (NSString *)v11;
LABEL_6:
      subset = v13->_subset;
      v13->_subset = v14;

      goto LABEL_7;
    }
    if (v11)
    {
      v14 = [NSString stringWithFormat:@"%@", v11];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v13;
}

@end