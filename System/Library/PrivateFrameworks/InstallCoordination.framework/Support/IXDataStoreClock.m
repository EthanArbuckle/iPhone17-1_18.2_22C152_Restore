@interface IXDataStoreClock
+ (BOOL)supportsSecureCoding;
+ (id)newClock;
+ (id)newClockWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IXDataStoreClock)initWithCoder:(id)a3;
- (IXDataStoreClock)initWithGUID:(id)a3 sequenceNumber:(unint64_t)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)notificationDictionary;
- (NSUUID)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)increment;
- (void)setGuid:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation IXDataStoreClock

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newClock
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = +[NSUUID UUID];
  id v4 = [v2 initWithGUID:v3 sequenceNumber:0];

  return v4;
}

+ (id)newClockWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"guid"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [v3 objectForKeyedSubscript:@"sequenceNumber"];

  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  id v10 = 0;
  if (v6 && v9)
  {
    id v11 = objc_alloc((Class)objc_opt_class());
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
    id v10 = objc_msgSend(v11, "initWithGUID:sequenceNumber:", v12, objc_msgSend(v9, "unsignedLongLongValue"));
  }
  return v10;
}

- (IXDataStoreClock)initWithGUID:(id)a3 sequenceNumber:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXDataStoreClock;
  id v8 = [(IXDataStoreClock *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_guid, a3);
    v9->_sequenceNumber = a4;
  }

  return v9;
}

- (void)increment
{
  unint64_t v3 = [(IXDataStoreClock *)self sequenceNumber];
  if (v3 == -1)
  {
    id v4 = +[NSUUID UUID];
    [(IXDataStoreClock *)self setGuid:v4];

    unint64_t v3 = 0;
  }

  [(IXDataStoreClock *)self setSequenceNumber:v3 + 1];
}

- (IXDataStoreClock)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXDataStoreClock;
  id v5 = [(IXDataStoreClock *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
    guid = v5->_guid;
    v5->_guid = (NSUUID *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceNumber"];
    v5->_sequenceNumber = (unint64_t)[v8 unsignedLongLongValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXDataStoreClock *)self guid];
  [v4 encodeObject:v5 forKey:@"guid"];

  id v6 = +[NSNumber numberWithUnsignedLongLong:[(IXDataStoreClock *)self sequenceNumber]];
  [v4 encodeObject:v6 forKey:@"sequenceNumber"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(IXDataStoreClock *)self guid];
  id v7 = [v6 copyWithZone:a3];
  id v8 = objc_msgSend(v5, "initWithGUID:sequenceNumber:", v7, -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXDataStoreClock *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(IXDataStoreClock *)self guid];
      id v7 = [(IXDataStoreClock *)v5 guid];
      id v8 = v6;
      id v9 = v7;
      objc_super v10 = v9;
      if ((v8 != 0) != (v9 != 0) || v8 && v9 && ![v8 isEqual:v9])
      {

        BOOL v12 = 0;
      }
      else
      {

        id v11 = [(IXDataStoreClock *)self sequenceNumber];
        BOOL v12 = v11 == (id)[(IXDataStoreClock *)v5 sequenceNumber];
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IXDataStoreClock *)self guid];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(IXDataStoreClock *)self sequenceNumber] ^ v4;

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[0] = @"sequenceNumber";
  unint64_t v3 = +[NSNumber numberWithUnsignedLongLong:[(IXDataStoreClock *)self sequenceNumber]];
  v8[1] = @"guid";
  v9[0] = v3;
  unint64_t v4 = [(IXDataStoreClock *)self guid];
  unint64_t v5 = [v4 UUIDString];
  v9[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (NSDictionary)notificationDictionary
{
  v8[0] = @"sequenceNumber";
  unint64_t v3 = +[NSNumber numberWithUnsignedLongLong:[(IXDataStoreClock *)self sequenceNumber]];
  v8[1] = @"guid";
  v9[0] = v3;
  unint64_t v4 = [(IXDataStoreClock *)self guid];
  unint64_t v5 = [v4 UUIDString];
  v9[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = [(IXDataStoreClock *)self guid];
  id v6 = +[NSString stringWithFormat:@"<%@ guid:%@ serialNumber:%llu>", v4, v5, [(IXDataStoreClock *)self sequenceNumber]];

  return v6;
}

- (NSUUID)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end