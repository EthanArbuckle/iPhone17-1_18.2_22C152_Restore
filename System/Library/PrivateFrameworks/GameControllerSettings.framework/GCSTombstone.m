@interface GCSTombstone
+ (BOOL)supportsSecureCoding;
+ (double)timeToLiveSeconds;
+ (id)archivalClasses;
- (GCSJSONObject)jsonObject;
- (GCSTombstone)initWithCoder:(id)a3;
- (GCSTombstone)initWithIdentifier:(id)a3 creationDate:(id)a4 recordType:(int64_t)a5;
- (GCSTombstone)initWithJSONObject:(id)a3;
- (NSDate)creationDate;
- (NSString)identifier;
- (int64_t)recordType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSTombstone

+ (double)timeToLiveSeconds
{
  return 2592000.0;
}

- (GCSTombstone)initWithIdentifier:(id)a3 creationDate:(id)a4 recordType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSTombstone;
  v11 = [(GCSTombstone *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_creationDate, a4);
    v12->_recordType = a5;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSTombstone)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[GCSTombstone archivalClasses];
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"_jsonObject"];

  v7 = [(GCSTombstone *)self initWithJSONObject:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCSTombstone *)self jsonObject];
  [v4 encodeObject:v5 forKey:@"_jsonObject"];
}

- (GCSTombstone)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)GCSTombstone;
    v6 = [(GCSTombstone *)&v14 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"identifier");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v7;

      uint64_t v9 = objc_msgSend(v5, "_gcs_dateForJSONKey:", @"creationDate");
      creationDate = v6->_creationDate;
      v6->_creationDate = (NSDate *)v9;

      v11 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"recordType");
      v6->_recordType = [v11 longValue];
    }
    self = v6;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (GCSJSONObject)jsonObject
{
  identifier = self->_identifier;
  creationDate = self->_creationDate;
  v10[0] = identifier;
  v9[0] = @"identifier";
  v9[1] = @"creationDate";
  id v5 = [(NSDate *)creationDate jsonObject];
  v10[1] = v5;
  v9[2] = @"recordType";
  v6 = +[NSNumber numberWithInteger:self->_recordType];
  v10[2] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (GCSJSONObject *)v7;
}

@end