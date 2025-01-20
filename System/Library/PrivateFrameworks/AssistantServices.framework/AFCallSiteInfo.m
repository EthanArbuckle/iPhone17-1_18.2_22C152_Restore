@interface AFCallSiteInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFCallSiteInfo)init;
- (AFCallSiteInfo)initWithBuilder:(id)a3;
- (AFCallSiteInfo)initWithCoder:(id)a3;
- (AFCallSiteInfo)initWithDictionaryRepresentation:(id)a3;
- (AFCallSiteInfo)initWithImagePath:(id)a3 symbolName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)imagePath;
- (NSString)symbolName;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFCallSiteInfo

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (AFCallSiteInfo)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _AFCallSiteInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFCallSiteInfo;
  v5 = [(AFCallSiteInfo *)&v15 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFCallSiteInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFCallSiteInfoMutation *)v7 isDirty])
    {
      v8 = [(_AFCallSiteInfoMutation *)v7 getImagePath];
      uint64_t v9 = [v8 copy];
      imagePath = v6->_imagePath;
      v6->_imagePath = (NSString *)v9;

      v11 = [(_AFCallSiteInfoMutation *)v7 getSymbolName];
      uint64_t v12 = [v11 copy];
      symbolName = v6->_symbolName;
      v6->_symbolName = (NSString *)v12;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  imagePath = self->_imagePath;
  if (imagePath) {
    [v3 setObject:imagePath forKey:@"imagePath"];
  }
  symbolName = self->_symbolName;
  if (symbolName) {
    [v4 setObject:symbolName forKey:@"symbolName"];
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (AFCallSiteInfo)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"imagePath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v8 = [v4 objectForKey:@"symbolName"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    self = [(AFCallSiteInfo *)self initWithImagePath:v6 symbolName:v9];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  imagePath = self->_imagePath;
  id v5 = a3;
  [v5 encodeObject:imagePath forKey:@"AFCallSiteInfo::imagePath"];
  [v5 encodeObject:self->_symbolName forKey:@"AFCallSiteInfo::symbolName"];
}

- (AFCallSiteInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFCallSiteInfo::imagePath"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFCallSiteInfo::symbolName"];

  v7 = [(AFCallSiteInfo *)self initWithImagePath:v5 symbolName:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFCallSiteInfo *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(AFCallSiteInfo *)v5 imagePath];
      imagePath = self->_imagePath;
      if (imagePath == v6 || [(NSString *)imagePath isEqual:v6])
      {
        v8 = [(AFCallSiteInfo *)v5 symbolName];
        symbolName = self->_symbolName;
        BOOL v10 = symbolName == v8 || [(NSString *)symbolName isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_imagePath hash];
  return [(NSString *)self->_symbolName hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFCallSiteInfo;
  id v5 = [(AFCallSiteInfo *)&v8 description];
  id v6 = (void *)[v4 initWithFormat:@"%@ {imagePath = %@, symbolName = %@}", v5, self->_imagePath, self->_symbolName];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFCallSiteInfo *)self _descriptionWithIndent:0];
}

- (AFCallSiteInfo)initWithImagePath:(id)a3 symbolName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__AFCallSiteInfo_initWithImagePath_symbolName___block_invoke;
  v12[3] = &unk_1E592A130;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFCallSiteInfo *)self initWithBuilder:v12];

  return v10;
}

void __47__AFCallSiteInfo_initWithImagePath_symbolName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImagePath:v3];
  [v4 setSymbolName:*(void *)(a1 + 40)];
}

- (AFCallSiteInfo)init
{
  return [(AFCallSiteInfo *)self initWithBuilder:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFCallSiteInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFCallSiteInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFCallSiteInfoMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFCallSiteInfo);
      id v7 = [(_AFCallSiteInfoMutation *)v5 getImagePath];
      uint64_t v8 = [v7 copy];
      imagePath = v6->_imagePath;
      v6->_imagePath = (NSString *)v8;

      BOOL v10 = [(_AFCallSiteInfoMutation *)v5 getSymbolName];
      uint64_t v11 = [v10 copy];
      symbolName = v6->_symbolName;
      v6->_symbolName = (NSString *)v11;
    }
    else
    {
      id v6 = (AFCallSiteInfo *)[(AFCallSiteInfo *)self copy];
    }
  }
  else
  {
    id v6 = (AFCallSiteInfo *)[(AFCallSiteInfo *)self copy];
  }

  return v6;
}

@end