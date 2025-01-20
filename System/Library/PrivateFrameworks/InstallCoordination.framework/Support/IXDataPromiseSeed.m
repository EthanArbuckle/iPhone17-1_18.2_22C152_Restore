@interface IXDataPromiseSeed
+ (BOOL)supportsSecureCoding;
- (IXDataPromiseSeed)initWithCoder:(id)a3;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)creatorIdentifier;
- (unint64_t)totalBytesNeededOnDisk;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatorIdentifier:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setTotalBytesNeededOnDisk:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation IXDataPromiseSeed

- (IXDataPromiseSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IXDataPromiseSeed;
  v5 = [(IXDataPromiseSeed *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creatorIdentifier"];
    v5->_creatorIdentifier = (unint64_t)[v8 unsignedIntegerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBytesNeededOnDisk"];
    v5->_totalBytesNeededOnDisk = (unint64_t)[v11 unsignedLongLongValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXDataPromiseSeed *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(IXDataPromiseSeed *)self creatorIdentifier]];
  [v4 encodeObject:v6 forKey:@"creatorIdentifier"];

  v7 = [(IXDataPromiseSeed *)self uniqueIdentifier];
  [v4 encodeObject:v7 forKey:@"uniqueIdentifier"];

  id v8 = +[NSNumber numberWithUnsignedLongLong:[(IXDataPromiseSeed *)self totalBytesNeededOnDisk]];
  [v4 encodeObject:v8 forKey:@"totalBytesNeededOnDisk"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(IXDataPromiseSeed *)self name];
  [v4 setName:v5];

  objc_msgSend(v4, "setCreatorIdentifier:", -[IXDataPromiseSeed creatorIdentifier](self, "creatorIdentifier"));
  uint64_t v6 = [(IXDataPromiseSeed *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v6];

  objc_msgSend(v4, "setTotalBytesNeededOnDisk:", -[IXDataPromiseSeed totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk"));
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)creatorIdentifier
{
  return self->_creatorIdentifier;
}

- (void)setCreatorIdentifier:(unint64_t)a3
{
  self->_creatorIdentifier = a3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)totalBytesNeededOnDisk
{
  return self->_totalBytesNeededOnDisk;
}

- (void)setTotalBytesNeededOnDisk:(unint64_t)a3
{
  self->_totalBytesNeededOnDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end