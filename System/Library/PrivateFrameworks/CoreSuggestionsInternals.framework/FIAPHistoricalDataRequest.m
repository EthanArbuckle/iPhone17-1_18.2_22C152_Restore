@interface FIAPHistoricalDataRequest
+ (BOOL)supportsSecureCoding;
+ (id)historicalDataRequestWithPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (BOOL)_dateRangeIsSubsetOfHistoricalDataRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistoricalDataRequest:(id)a3;
- (BOOL)subsetOfHistoricalDataRequest:(id)a3;
- (FIAPHistoricalDataRequest)initWithCoder:(id)a3;
- (FIAPHistoricalDataRequest)initWithPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (FIAPHistoricalDataRequest)initWithRequestId:(unint64_t)a3 pluginIdentifier:(id)a4 personHandle:(id)a5 startDate:(id)a6 endDate:(id)a7;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)personHandle;
- (NSString)pluginIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestId;
- (void)encodeWithCoder:(id)a3;
- (void)setPluginIdentifier:(id)a3;
- (void)setRequestId:(unint64_t)a3;
@end

@implementation FIAPHistoricalDataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_personHandle, 0);
  objc_storeStrong((id *)&self->_pluginIdentifier, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)personHandle
{
  return self->_personHandle;
}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (unint64_t)requestId
{
  return self->_requestId;
}

- (BOOL)subsetOfHistoricalDataRequest:(id)a3
{
  v4 = (id *)a3;
  personHandle = self->_personHandle;
  v6 = (NSString *)v4[3];
  if (personHandle == v6)
  {

    goto LABEL_5;
  }
  v7 = v6;
  v8 = personHandle;
  char v9 = [(NSString *)v8 isEqual:v7];

  if (v9)
  {
LABEL_5:
    BOOL v10 = [(FIAPHistoricalDataRequest *)self _dateRangeIsSubsetOfHistoricalDataRequest:v4];
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)_dateRangeIsSubsetOfHistoricalDataRequest:(id)a3
{
  startDate = self->_startDate;
  uint64_t v5 = *((void *)a3 + 4);
  v6 = a3;
  unint64_t v7 = [(NSDate *)startDate compare:v5];
  endDate = self->_endDate;
  uint64_t v9 = v6[5];

  unint64_t v10 = [(NSDate *)endDate compare:v9] + 1;
  return v7 < 2 && v10 < 2;
}

- (BOOL)isEqualToHistoricalDataRequest:(id)a3
{
  v4 = (id *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  personHandle = self->_personHandle;
  unint64_t v7 = (NSString *)v4[3];
  if (personHandle == v7)
  {
  }
  else
  {
    v8 = v7;
    uint64_t v9 = personHandle;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_16;
    }
  }
  pluginIdentifier = self->_pluginIdentifier;
  v12 = (NSString *)v5[2];
  if (pluginIdentifier == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = pluginIdentifier;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_16;
    }
  }
  startDate = self->_startDate;
  v17 = (NSDate *)v5[4];
  if (startDate == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = startDate;
    char v20 = [(NSDate *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_16;
    }
  }
  endDate = self->_endDate;
  v22 = (NSDate *)v5[5];
  if (endDate == v22)
  {

    goto LABEL_19;
  }
  v23 = v22;
  v24 = endDate;
  char v25 = [(NSDate *)v24 isEqual:v23];

  if (v25)
  {
LABEL_19:
    BOOL v26 = self->_requestId == (void)v5[1];
    goto LABEL_17;
  }
LABEL_16:
  BOOL v26 = 0;
LABEL_17:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FIAPHistoricalDataRequest *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(FIAPHistoricalDataRequest *)self isEqualToHistoricalDataRequest:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  BOOL v6 = (void *)v5;
  if (v5)
  {
    *(void *)(v5 + 8) = self->_requestId;
    uint64_t v7 = [(NSString *)self->_pluginIdentifier copyWithZone:a3];
    v8 = (void *)v6[2];
    v6[2] = v7;

    uint64_t v9 = [(NSString *)self->_personHandle copyWithZone:a3];
    char v10 = (void *)v6[3];
    v6[3] = v9;

    uint64_t v11 = [(NSDate *)self->_startDate copyWithZone:a3];
    v12 = (void *)v6[4];
    v6[4] = v11;

    uint64_t v13 = [(NSDate *)self->_endDate copyWithZone:a3];
    v14 = (void *)v6[5];
    v6[5] = v13;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t requestId = self->_requestId;
  id v5 = a3;
  [v5 encodeInt64:requestId forKey:@"rid"];
  [v5 encodeObject:self->_pluginIdentifier forKey:@"pid"];
  [v5 encodeObject:self->_personHandle forKey:@"prh"];
  [v5 encodeObject:self->_startDate forKey:@"sdt"];
  [v5 encodeObject:self->_endDate forKey:@"edt"];
}

- (FIAPHistoricalDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"rid"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prh"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdt"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edt"];

  char v10 = [(FIAPHistoricalDataRequest *)self initWithRequestId:v5 pluginIdentifier:v6 personHandle:v7 startDate:v8 endDate:v9];
  return v10;
}

- (unint64_t)hash
{
  unint64_t requestId = self->_requestId;
  NSUInteger v4 = [(NSString *)self->_pluginIdentifier hash] - requestId + 32 * requestId;
  NSUInteger v5 = [(NSString *)self->_personHandle hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDate *)self->_startDate hash] - v5 + 32 * v5;
  return [(NSDate *)self->_endDate hash] - v6 + 32 * v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<FIAPHistoricalDataRequest id:%llu p:%@ s:%@ e:%@ plugin:%@>", self->_requestId, self->_personHandle, self->_startDate, self->_endDate, self->_pluginIdentifier];
  return v2;
}

- (void)setRequestId:(unint64_t)a3
{
  self->_unint64_t requestId = a3;
}

- (void)setPluginIdentifier:(id)a3
{
}

- (FIAPHistoricalDataRequest)initWithRequestId:(unint64_t)a3 pluginIdentifier:(id)a4 personHandle:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FIAPHistoricalDataRequest;
  v17 = [(FIAPHistoricalDataRequest *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_unint64_t requestId = a3;
    objc_storeStrong((id *)&v17->_pluginIdentifier, a4);
    objc_storeStrong((id *)&v18->_personHandle, a5);
    objc_storeStrong((id *)&v18->_startDate, a6);
    objc_storeStrong((id *)&v18->_endDate, a7);
  }

  return v18;
}

- (FIAPHistoricalDataRequest)initWithPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return [(FIAPHistoricalDataRequest *)self initWithRequestId:0 pluginIdentifier:0 personHandle:a3 startDate:a4 endDate:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)historicalDataRequestWithPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = [[FIAPHistoricalDataRequest alloc] initWithPersonHandle:v9 startDate:v8 endDate:v7];

  return v10;
}

@end