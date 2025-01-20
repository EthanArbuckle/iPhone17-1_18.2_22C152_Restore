@interface MLModelCollectionEntry
+ (MLModelCollectionEntry)entryWithModelIdentifier:(id)a3 modelURL:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelCollectionEntry:(MLModelCollectionEntry *)entry;
- (NSString)modelIdentifier;
- (NSURL)modelURL;
- (id)_initWithModelIdentifier:(id)a3 modelUrl:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLModelCollectionEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);

  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (id)_initWithModelIdentifier:(id)a3 modelUrl:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLModelCollectionEntry;
  v9 = [(MLModelCollectionEntry *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MLModelCollectionEntry *)self modelIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p, id: %@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(MLModelCollectionEntry *)self modelIdentifier];
  uint64_t v4 = [v3 hash];

  v5 = [(MLModelCollectionEntry *)self modelURL];
  unint64_t v6 = [v5 hash] + 37 * v4 + 1147;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MLModelCollectionEntry *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(MLModelCollectionEntry *)self isEqualToModelCollectionEntry:v4];
  }

  return v5;
}

- (BOOL)isEqualToModelCollectionEntry:(MLModelCollectionEntry *)entry
{
  uint64_t v4 = entry;
  BOOL v5 = [(MLModelCollectionEntry *)self modelIdentifier];
  unint64_t v6 = [(MLModelCollectionEntry *)v4 modelIdentifier];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(MLModelCollectionEntry *)self modelURL];
    id v8 = [(MLModelCollectionEntry *)v4 modelURL];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (MLModelCollectionEntry)entryWithModelIdentifier:(id)a3 modelURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MLModelCollectionEntry alloc] _initWithModelIdentifier:v6 modelUrl:v5];

  return (MLModelCollectionEntry *)v7;
}

@end