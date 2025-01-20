@interface ACXAppEventRecord
+ (BOOL)supportsSecureCoding;
- (ACXAppEventRecord)initWithCoder:(id)a3;
- (ACXAppEventRecord)initWithDictionaryRepresentation:(id)a3;
- (ACXAppEventRecord)initWithRecordType:(unint64_t)a3 bundleID:(id)a4 sequenceNumber:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)eventType;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ACXAppEventRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXAppEventRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACXAppEventRecord;
  v5 = [(ACXAppEventRecord *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventType"];
    v5->_eventType = (unint64_t)[v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    if (!v7)
    {
      v12 = 0;
      goto LABEL_6;
    }
    bundleID = v5->_bundleID;
    v5->_bundleID = v7;
    v9 = v7;

    uint64_t v10 = objc_opt_class();
    v11 = [v4 decodeObjectOfClass:v10 forKey:@"sequenceNumber"];
    v5->_sequenceNumber = (unint64_t)[v11 unsignedIntegerValue];
  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t eventType = self->_eventType;
  id v5 = a3;
  v6 = +[NSNumber numberWithUnsignedInteger:eventType];
  [v5 encodeObject:v6 forKey:@"eventType"];

  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_sequenceNumber];
  [v5 encodeObject:v7 forKey:@"sequenceNumber"];
}

- (ACXAppEventRecord)initWithRecordType:(unint64_t)a3 bundleID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACXAppEventRecord;
  uint64_t v10 = [(ACXAppEventRecord *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_unint64_t eventType = a3;
    objc_storeStrong((id *)&v10->_bundleID, a4);
    v11->_sequenceNumber = a5;
  }

  return v11;
}

- (ACXAppEventRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"R"];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = [v4 objectForKeyedSubscript:@"B"];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v4 objectForKeyedSubscript:@"S"];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v7 && v10 && v13)
  {
    self = -[ACXAppEventRecord initWithRecordType:bundleID:sequenceNumber:](self, "initWithRecordType:bundleID:sequenceNumber:", [v7 unsignedIntegerValue], v10, objc_msgSend(v13, "unsignedIntegerValue"));
    objc_super v14 = self;
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    objc_super v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  v8[0] = @"R";
  v3 = +[NSNumber numberWithUnsignedInteger:[(ACXAppEventRecord *)self eventType]];
  v9[0] = v3;
  v8[1] = @"B";
  id v4 = [(ACXAppEventRecord *)self bundleID];
  v9[1] = v4;
  v8[2] = @"S";
  id v5 = +[NSNumber numberWithUnsignedInteger:[(ACXAppEventRecord *)self sequenceNumber]];
  v9[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ACXAppEventRecord *)self eventType];
  id v4 = [(ACXAppEventRecord *)self bundleID];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(ACXAppEventRecord *)self sequenceNumber];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 eventType];
    if (v6 == (id)[(ACXAppEventRecord *)self eventType]
      && ([v5 bundleID],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(ACXAppEventRecord *)self bundleID],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v7 isEqualToString:v8],
          v8,
          v7,
          v9))
    {
      id v10 = [v5 sequenceNumber];
      BOOL v11 = v10 == (id)[(ACXAppEventRecord *)self sequenceNumber];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(ACXAppEventRecord *)self eventType];
  id v6 = [(ACXAppEventRecord *)self bundleID];
  id v7 = objc_msgSend(v4, "initWithRecordType:bundleID:sequenceNumber:", v5, v6, -[ACXAppEventRecord sequenceNumber](self, "sequenceNumber"));

  return v7;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void).cxx_destruct
{
}

@end