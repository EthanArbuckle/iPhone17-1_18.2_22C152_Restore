@interface BDSReadingHistoryServiceStatusInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryServiceStatus)status;
- (BDSReadingHistoryServiceStatusInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryServiceStatusInfo)initWithIsLoaded:(BOOL)a3;
- (BOOL)isLoaded;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSReadingHistoryServiceStatusInfo

- (BDSReadingHistoryServiceStatusInfo)initWithIsLoaded:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BDSReadingHistoryServiceStatusInfo;
  v4 = [(BDSReadingHistoryServiceStatusInfo *)&v8 init];
  if (v4)
  {
    v5 = [[BDSReadingHistoryServiceStatus alloc] initWithIsLoaded:v3];
    status = v4->_status;
    v4->_status = v5;
  }
  return v4;
}

- (BOOL)isLoaded
{
  v2 = [(BDSReadingHistoryServiceStatusInfo *)self status];
  unsigned __int8 v3 = [v2 isLoaded];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return +[BDSReadingHistoryServiceStatus supportsSecureCoding];
}

- (BDSReadingHistoryServiceStatusInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingHistoryServiceStatusInfo *)self init];
  if (v5)
  {
    v6 = [[BDSReadingHistoryServiceStatus alloc] initWithCoder:v4];
    status = v5->_status;
    v5->_status = v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSReadingHistoryServiceStatusInfo *)self status];
  [v5 encodeWithCoder:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BDSReadingHistoryServiceStatusInfo alloc];
  BOOL v5 = [(BDSReadingHistoryServiceStatusInfo *)self isLoaded];
  return [(BDSReadingHistoryServiceStatusInfo *)v4 initWithIsLoaded:v5];
}

- (id)description
{
  v2 = [(BDSReadingHistoryServiceStatusInfo *)self status];
  unsigned __int8 v3 = [v2 description];

  return v3;
}

- (BDSReadingHistoryServiceStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end