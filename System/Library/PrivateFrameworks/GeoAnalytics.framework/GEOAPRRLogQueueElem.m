@interface GEOAPRRLogQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPRRLogQueueElem)initWithData:(id)a3 createTime:(id)a4;
- (NSData)rrLogData;
- (id)copy;
- (unint64_t)hash;
@end

@implementation GEOAPRRLogQueueElem

- (GEOAPRRLogQueueElem)initWithData:(id)a3 createTime:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOAPRRLogQueueElem;
  v9 = [(GEOAPQueueElem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._createTime, a4);
    objc_storeStrong((id *)&v10->_rrLogData, a3);
  }

  return v10;
}

- (id)copy
{
  v3 = [GEOAPRRLogQueueElem alloc];
  rrLogData = self->_rrLogData;
  createTime = self->super._createTime;
  return [(GEOAPRRLogQueueElem *)v3 initWithData:rrLogData createTime:createTime];
}

- (unint64_t)hash
{
  v3 = [(GEOAPQueueElem *)self createTime];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(GEOAPRRLogQueueElem *)self rrLogData];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 createTime];
    id v7 = [(GEOAPQueueElem *)self createTime];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    double v10 = -v9;
    if (v9 >= 0.0) {
      double v10 = v9;
    }
    if (v10 >= 1.0)
    {
      char v13 = 0;
    }
    else
    {
      rrLogData = self->_rrLogData;
      objc_super v12 = [v5 rrLogData];
      LOBYTE(rrLogData) = [(NSData *)rrLogData isEqual:v12];

      char v13 = rrLogData ^ 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSData)rrLogData
{
  return self->_rrLogData;
}

- (void).cxx_destruct
{
}

@end