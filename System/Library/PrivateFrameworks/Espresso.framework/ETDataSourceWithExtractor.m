@interface ETDataSourceWithExtractor
- (ETDataSourceWithExtractor)initWithDataSource:(id)a3 extractor:(id)a4;
- (id)dataPointAtIndex:(int)a3;
- (int)numberOfDataPoints;
@end

@implementation ETDataSourceWithExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (int)numberOfDataPoints
{
  return [(ETDataSource *)self->_source numberOfDataPoints];
}

- (id)dataPointAtIndex:(int)a3
{
  v4 = [(ETDataSource *)self->_source dataPointAtIndex:*(void *)&a3];
  [(ETImageDescriptorExtractor *)self->_extractor extractForDataPoint:v4];

  return v4;
}

- (ETDataSourceWithExtractor)initWithDataSource:(id)a3 extractor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ETDataSourceWithExtractor;
  v9 = [(ETDataSourceWithExtractor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

@end