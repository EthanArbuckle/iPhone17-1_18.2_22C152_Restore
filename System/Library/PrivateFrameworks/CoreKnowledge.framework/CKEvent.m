@interface CKEvent
- (BOOL)isEqual:(id)a3;
- (CKEvent)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (NSString)identifier;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation CKEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(CKEvent *)self identifier];
  v5 = [(CKEvent *)self startDate];
  v6 = [(CKEvent *)self endDate];
  v7 = [(CKEvent *)self metadata];
  v8 = [v3 stringWithFormat:@"%@[start=%@,end=%@,metadata=%@]", v4, v5, v6, v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(CKEvent *)self identifier];
  v5 = [(CKEvent *)self startDate];
  v6 = [(CKEvent *)self endDate];
  v7 = [v3 stringWithFormat:@"%@[start=%@,end=%@]", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = [(NSDate *)self->_startDate hash] ^ v3;
  return v4 ^ [(NSDate *)self->_endDate hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKEvent *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CKEvent *)self identifier];
      v6 = [(CKEvent *)v4 identifier];
      if ([v5 isEqualToString:v6])
      {
        v7 = [(CKEvent *)self startDate];
        v8 = [(CKEvent *)v4 startDate];
        if ([v7 compare:v8])
        {
          BOOL v9 = 0;
        }
        else
        {
          v10 = [(CKEvent *)self endDate];
          v11 = [(CKEvent *)v4 endDate];
          BOOL v9 = [v10 compare:v11] == 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (CKEvent)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKEvent;
  v15 = [(CKEvent *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_startDate, a4);
    objc_storeStrong((id *)&v16->_endDate, a5);
    if (v14) {
      v17 = (NSDictionary *)v14;
    }
    else {
      v17 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    metadata = v16->_metadata;
    v16->_metadata = v17;
  }
  return v16;
}

@end