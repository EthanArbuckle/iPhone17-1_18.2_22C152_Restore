@interface GTFileEntry
+ (BOOL)supportsSecureCoding;
- (GTFileEntry)initWithCoder:(id)a3;
- (GTFileEntry)initWithLink:(id)a3 destination:(id)a4;
- (GTFileEntry)initWithPath:(id)a3 fileSize:(unint64_t)a4;
- (NSString)destination;
- (NSString)path;
- (id)description;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTFileEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTFileEntry)initWithPath:(id)a3 fileSize:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTFileEntry;
  v8 = [(GTFileEntry *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    destination = v9->_destination;
    v9->_destination = 0;

    v9->_fileSize = a4;
  }

  return v9;
}

- (GTFileEntry)initWithLink:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTFileEntry;
  v9 = [(GTFileEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
    v10->_fileSize = 0;
  }

  return v10;
}

- (GTFileEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTFileEntry;
  v5 = [(GTFileEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    destination = v5->_destination;
    v5->_destination = (NSString *)v8;

    v5->_fileSize = [v4 decodeIntegerForKey:@"fileSize"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"path"];
  [v5 encodeObject:self->_destination forKey:@"destination"];
  [v5 encodeInteger:self->_fileSize forKey:@"fileSize"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(GTFileEntry *)self path];
  id v7 = [(GTFileEntry *)self destination];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, Path: %@, Destination: %@, Size: %lu>", v5, self, v6, v7, -[GTFileEntry fileSize](self, "fileSize")];

  return v8;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)destination
{
  return self->_destination;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end