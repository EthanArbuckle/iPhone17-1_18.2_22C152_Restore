@interface IPCMessageObject
+ (BOOL)supportsSecureCoding;
+ (id)_dictionaryValueFromData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IPCMessageObject)init;
- (IPCMessageObject)initWithCoder:(id)a3;
- (IPCMessageObject)initWithDictionary:(id)a3;
- (id)_dataValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPCMessageObject

- (IPCMessageObject)init
{
  return [(IPCMessageObject *)self initWithDictionary:&__NSDictionary0__struct];
}

- (IPCMessageObject)initWithDictionary:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)IPCMessageObject;
    self = [(IPCMessageObject *)&v5 init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)dictionaryValue
{
  return &__NSDictionary0__struct;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [(IPCMessageObject *)self dictionaryValue];
    v6 = [v4 dictionaryValue];
    unsigned __int8 v7 = [v5 isEqualToDictionary:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(IPCMessageObject *)self dictionaryValue];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  objc_super v5 = [(IPCMessageObject *)self dictionaryValue];
  id v6 = [v5 copy];
  id v7 = [v4 initWithDictionary:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_dataValue
{
  v2 = [(IPCMessageObject *)self dictionaryValue];
  uint64_t v6 = 0;
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v6];

  id v4 = [v3 copy];

  return v4;
}

+ (id)_dictionaryValueFromData:(id)a3
{
  id v3 = a3;
  id v16 = 0;
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v16];

  id v5 = v16;
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    id v15 = 0;
    v13 = [v4 decodeTopLevelObjectOfClasses:v12 forKey:NSKeyedArchiveRootObjectKey error:&v15];
    id v6 = v15;

    id v7 = 0;
    if (!v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v13;
      }
      else {
        id v7 = 0;
      }
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IPCMessageObject *)self _dataValue];
  [v4 encodeObject:v5 forKey:@"dataValue"];
}

- (IPCMessageObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataValue"];

  id v6 = [(id)objc_opt_class() _dictionaryValueFromData:v5];
  if (v6)
  {
    self = [(IPCMessageObject *)self initWithDictionary:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end