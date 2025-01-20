@interface SKReferenceNode
+ (BOOL)supportsSecureCoding;
+ (SKReferenceNode)nodeWithFileNamed:(id)a3;
+ (SKReferenceNode)referenceNodeWithFileNamed:(NSString *)fileName;
+ (SKReferenceNode)referenceNodeWithURL:(NSURL *)referenceURL;
- (NSString)referenceFileName;
- (NSURL)referenceURL;
- (SKReferenceNode)init;
- (SKReferenceNode)initWithCoder:(NSCoder *)aDecoder;
- (SKReferenceNode)initWithFileNamed:(NSString *)fileName;
- (SKReferenceNode)initWithURL:(NSURL *)url;
- (id)_resolveReferenceNode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resolvedNode;
- (void)encodeWithCoder:(id)a3;
- (void)resolveNodeFromArchiveData:(id)a3;
- (void)resolveReferenceNode;
- (void)setReferenceFileName:(id)a3;
- (void)setReferenceURL:(id)a3;
@end

@implementation SKReferenceNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKReferenceNode)init
{
  return [(SKReferenceNode *)self initWithFileNamed:&stru_26BEEFD10];
}

- (SKReferenceNode)initWithURL:(NSURL *)url
{
  v4 = url;
  v11.receiver = self;
  v11.super_class = (Class)SKReferenceNode;
  v5 = [(SKNode *)&v11 init];
  v6 = v5;
  if (v5)
  {
    referenceURL = v5->_referenceURL;
    v5->_referenceURL = 0;

    referenceFileName = v6->_referenceFileName;
    v6->_referenceFileName = 0;

    resolvedNode = v6->_resolvedNode;
    v6->_resolvedNode = 0;

    v6->_hasResolvedURL = 0;
    [(SKReferenceNode *)v6 setReferenceURL:v4];
  }

  return v6;
}

- (SKReferenceNode)initWithFileNamed:(NSString *)fileName
{
  v4 = fileName;
  v11.receiver = self;
  v11.super_class = (Class)SKReferenceNode;
  v5 = [(SKNode *)&v11 init];
  v6 = v5;
  if (v5)
  {
    referenceURL = v5->_referenceURL;
    v5->_referenceURL = 0;

    referenceFileName = v6->_referenceFileName;
    v6->_referenceFileName = 0;

    resolvedNode = v6->_resolvedNode;
    v6->_resolvedNode = 0;

    v6->_hasResolvedURL = 0;
    [(SKReferenceNode *)v6 setReferenceFileName:v4];
  }

  return v6;
}

- (void)setReferenceFileName:(id)a3
{
  id v10 = a3;
  v4 = [(SKReferenceNode *)self referenceFileName];
  char v5 = [v10 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = (NSString *)[v10 copy];
    referenceFileName = self->_referenceFileName;
    self->_referenceFileName = v6;

    resolvedNode = self->_resolvedNode;
    if (resolvedNode)
    {
      [(SKNode *)resolvedNode removeFromParent];
      v9 = self->_resolvedNode;
      self->_resolvedNode = 0;
    }
    self->_hasResolvedURL = 0;
    [(SKReferenceNode *)self resolveReferenceNode];
  }
}

- (NSString)referenceFileName
{
  return self->_referenceFileName;
}

- (void)setReferenceURL:(id)a3
{
  id v10 = a3;
  v4 = [(SKReferenceNode *)self referenceURL];
  char v5 = [v10 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = (NSURL *)[v10 copy];
    referenceURL = self->_referenceURL;
    self->_referenceURL = v6;

    resolvedNode = self->_resolvedNode;
    if (resolvedNode)
    {
      [(SKNode *)resolvedNode removeFromParent];
      v9 = self->_resolvedNode;
      self->_resolvedNode = 0;
    }
    self->_hasResolvedURL = 0;
    [(SKReferenceNode *)self resolveReferenceNode];
  }
}

- (NSURL)referenceURL
{
  return self->_referenceURL;
}

+ (SKReferenceNode)referenceNodeWithURL:(NSURL *)referenceURL
{
  v3 = referenceURL;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v3];

  return (SKReferenceNode *)v4;
}

+ (SKReferenceNode)referenceNodeWithFileNamed:(NSString *)fileName
{
  v3 = fileName;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFileNamed:v3];

  return (SKReferenceNode *)v4;
}

+ (SKReferenceNode)nodeWithFileNamed:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFileNamed:v3];

  return (SKReferenceNode *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  resolvedNode = self->_resolvedNode;
  if (resolvedNode) {
    [(SKNode *)resolvedNode removeFromParent];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKReferenceNode;
  [(SKNode *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_referenceURL forKey:@"_referenceURL"];
  [v4 encodeObject:self->_referenceFileName forKey:@"_referenceFileName"];
  if (self->_resolvedNode) {
    -[SKNode addChild:](self, "addChild:");
  }
}

- (SKReferenceNode)initWithCoder:(NSCoder *)aDecoder
{
  id v4 = aDecoder;
  v13.receiver = self;
  v13.super_class = (Class)SKReferenceNode;
  char v5 = [(SKNode *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_referenceURL"];
    referenceURL = v5->_referenceURL;
    v5->_referenceURL = (NSURL *)v6;

    uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_referenceFileName"];
    referenceFileName = v5->_referenceFileName;
    v5->_referenceFileName = (NSString *)v8;

    resolvedNode = v5->_resolvedNode;
    v5->_resolvedNode = 0;

    v5->_hasResolvedURL = 0;
    if (v5->_referenceFileName || v5->_referenceURL)
    {
      objc_super v11 = [(SKNode *)v5 scene];

      if (!v11) {
        [(SKReferenceNode *)v5 resolveReferenceNode];
      }
    }
  }

  return v5;
}

- (id)_resolveReferenceNode
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  p_resolvedNode = (id *)&self->_resolvedNode;
  if (self->_resolvedNode)
  {
    -[SKNode removeChild:](self, "removeChild:");
    id v4 = *p_resolvedNode;
    id *p_resolvedNode = 0;
  }
  char v5 = self->_referenceURL;
  if (v5)
  {
LABEL_4:
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:1 error:0];
    if (v6)
    {
      id v31 = 0;
      v7 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v6 error:&v31];
      id v8 = v31;
      [v7 setRequiresSecureCoding:0];
      uint64_t v9 = [v7 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
      id v10 = *p_resolvedNode;
      id *p_resolvedNode = (id)v9;

      [v7 finishDecoding];
      objc_super v11 = (void *)v6;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  referenceFileName = self->_referenceFileName;
  if (referenceFileName)
  {
    if ([(NSString *)referenceFileName isAbsolutePath])
    {
      char v5 = [NSURL URLWithString:self->_referenceFileName];
      if (v5) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
    objc_super v13 = self->_referenceFileName;
    if (v13 && [(NSString *)v13 length])
    {
      v14 = self->_referenceFileName;
      v15 = [(NSString *)v14 pathExtension];
      uint64_t v16 = [v15 length];

      if (!v16)
      {
        uint64_t v17 = [(NSString *)v14 stringByAppendingPathExtension:@"sks"];

        v14 = (NSString *)v17;
      }
      v18 = SKGetResourceBundle();
      char v5 = [v18 URLForResource:v14 withExtension:0];

      if (v5) {
        goto LABEL_4;
      }
LABEL_15:
      objc_super v11 = 0;
      goto LABEL_17;
    }
  }
  objc_super v11 = 0;
  char v5 = 0;
LABEL_17:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = objc_opt_new();
    [*p_resolvedNode children];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_msgSend(v24, "removeFromParent", (void)v27);
          [v19 addChild:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }

    objc_storeStrong(p_resolvedNode, v19);
    [(SKNode *)self addChild:*p_resolvedNode];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKNode *)self addChild:*p_resolvedNode];
    }
  }
  self->_hasResolvedURL = 1;
  -[SKReferenceNode didLoadReferenceNode:](self, "didLoadReferenceNode:", *p_resolvedNode, (void)v27);
  id v25 = *p_resolvedNode;

  return v25;
}

- (void)resolveReferenceNode
{
  id v2 = [(SKReferenceNode *)self _resolveReferenceNode];
}

- (void)resolveNodeFromArchiveData:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_resolvedNode = (id *)&self->_resolvedNode;
  if (self->_resolvedNode)
  {
    -[SKNode removeChild:](self, "removeChild:");
    id v6 = *p_resolvedNode;
    id *p_resolvedNode = 0;
  }
  if (v4)
  {
    id v21 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:&v21];
    id v8 = v21;
    [v7 setRequiresSecureCoding:0];
    uint64_t v9 = [v7 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    id v10 = *p_resolvedNode;
    id *p_resolvedNode = (id)v9;

    [v7 finishDecoding];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v11 = objc_opt_new();
    [*p_resolvedNode children];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "removeFromParent", (void)v17);
          [v11 addChild:v16];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }

    objc_storeStrong((id *)&self->_resolvedNode, v11);
    [(SKNode *)self addChild:*p_resolvedNode];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKNode *)self addChild:*p_resolvedNode];
    }
  }
  self->_hasResolvedURL = 1;
  -[SKReferenceNode didLoadReferenceNode:](self, "didLoadReferenceNode:", *p_resolvedNode, (void)v17);
}

- (id)resolvedNode
{
  if (!self->_hasResolvedURL) {
    id v3 = [(SKReferenceNode *)self _resolveReferenceNode];
  }
  resolvedNode = self->_resolvedNode;

  return resolvedNode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  resolvedNode = self->_resolvedNode;
  if (resolvedNode) {
    [(SKNode *)resolvedNode removeFromParent];
  }
  v10.receiver = self;
  v10.super_class = (Class)SKReferenceNode;
  id v6 = [(SKNode *)&v10 copyWithZone:a3];
  v7 = [(SKReferenceNode *)self referenceURL];
  [v6 setReferenceURL:v7];

  id v8 = [(SKReferenceNode *)self referenceFileName];
  [v6 setReferenceFileName:v8];

  if (self->_resolvedNode) {
    -[SKNode addChild:](self, "addChild:");
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedNode, 0);
  objc_storeStrong((id *)&self->_referenceFileName, 0);

  objc_storeStrong((id *)&self->_referenceURL, 0);
}

@end