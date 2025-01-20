@interface RequestThrottleRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RequestThrottleRecord)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RequestThrottleRecord

- (BOOL)isEqual:(id)a3
{
  v4 = (RequestThrottleRecord *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      unsigned __int8 v9 = 1;
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      itemID = self->_itemID;
      v8 = v6->_itemID;
      if (itemID == v8) {
        goto LABEL_8;
      }
      unsigned __int8 v9 = 0;
      if (itemID && v8)
      {
        if (-[NSString isEqual:](itemID, "isEqual:"))
        {
LABEL_8:
          externalVersionID = self->_externalVersionID;
          v11 = v6->_externalVersionID;
          if (externalVersionID == v11)
          {
            unsigned __int8 v9 = 1;
          }
          else
          {
            unsigned __int8 v9 = 0;
            if (externalVersionID && v11) {
              unsigned __int8 v9 = -[NSString isEqual:](externalVersionID, "isEqual:");
            }
          }
          goto LABEL_16;
        }
        unsigned __int8 v9 = 0;
      }
LABEL_16:

      goto LABEL_17;
    }
  }
  unsigned __int8 v9 = 0;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_itemID hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RequestThrottleRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RequestThrottleRecord;
  v5 = [(RequestThrottleRecord *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalVersionID"];
    externalVersionID = v5->_externalVersionID;
    v5->_externalVersionID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestDate"];
    requestDate = v5->_requestDate;
    v5->_requestDate = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self->_error)
  {
    id v4 = ASDErrorWithSafeUserInfo();
    [v5 encodeObject:v4 forKey:@"_error"];
  }
  [v5 encodeObject:self->_itemID forKey:@"_itemID"];
  [v5 encodeObject:self->_externalVersionID forKey:@"_externalVersionID"];
  [v5 encodeObject:self->_requestDate forKey:@"_requestDate"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end