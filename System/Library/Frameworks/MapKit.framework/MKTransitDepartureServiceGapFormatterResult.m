@interface MKTransitDepartureServiceGapFormatterResult
- (MKTransitDepartureServiceGapFormatterResult)initWithFormat:(id)a3 dateDescription:(id)a4 dateFormat:(unint64_t)a5;
- (NSString)dateDescription;
- (NSString)format;
- (NSString)formattedString;
- (unint64_t)dateFormat;
@end

@implementation MKTransitDepartureServiceGapFormatterResult

- (MKTransitDepartureServiceGapFormatterResult)initWithFormat:(id)a3 dateDescription:(id)a4 dateFormat:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MKTransitDepartureServiceGapFormatterResult;
  v10 = [(MKTransitDepartureServiceGapFormatterResult *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    format = v10->_format;
    v10->_format = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    dateDescription = v10->_dateDescription;
    v10->_dateDescription = (NSString *)v13;

    v10->_dateFormat = a5;
  }

  return v10;
}

- (NSString)formattedString
{
  if (self->_dateDescription)
  {
    objc_msgSend(NSString, "stringWithFormat:", self->_format, self->_dateDescription);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_format;
  }

  return v2;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)dateDescription
{
  return self->_dateDescription;
}

- (unint64_t)dateFormat
{
  return self->_dateFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateDescription, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

@end