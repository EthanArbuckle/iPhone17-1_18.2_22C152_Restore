@interface HTHangExtendedAttributes
- (HTHangExtendedAttributes)initWithFilePath:(id)a3;
- (NSString)bundleID;
- (NSString)creationDate;
- (NSString)duration;
- (NSString)hangID;
- (NSString)processPath;
- (id)getExtendedAttributeNamed:(id)a3 forFileAtPath:(id)a4;
@end

@implementation HTHangExtendedAttributes

- (HTHangExtendedAttributes)initWithFilePath:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HTHangExtendedAttributes;
  v5 = [(HTHangExtendedAttributes *)&v18 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(HTHangExtendedAttributes *)v5 getExtendedAttributeNamed:*MEMORY[0x263F427D0] forFileAtPath:v4];
    hangID = v6->_hangID;
    v6->_hangID = (NSString *)v7;

    uint64_t v9 = [(HTHangExtendedAttributes *)v6 getExtendedAttributeNamed:*MEMORY[0x263F427B8] forFileAtPath:v4];
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v9;

    uint64_t v11 = [(HTHangExtendedAttributes *)v6 getExtendedAttributeNamed:*MEMORY[0x263F427C0] forFileAtPath:v4];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSString *)v11;

    uint64_t v13 = [(HTHangExtendedAttributes *)v6 getExtendedAttributeNamed:*MEMORY[0x263F427C8] forFileAtPath:v4];
    duration = v6->_duration;
    v6->_duration = (NSString *)v13;

    uint64_t v15 = [(HTHangExtendedAttributes *)v6 getExtendedAttributeNamed:*MEMORY[0x263F427D8] forFileAtPath:v4];
    processPath = v6->_processPath;
    v6->_processPath = (NSString *)v15;
  }
  return v6;
}

- (id)getExtendedAttributeNamed:(id)a3 forFileAtPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (const char *)[v6 fileSystemRepresentation];
  id v8 = v5;
  ssize_t v9 = getxattr(v7, (const char *)[v8 UTF8String], 0, 0x2710uLL, 0, 0);
  if (v9 == -1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    size_t v10 = v9;
    uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:v9];
    v12 = (const char *)[v6 UTF8String];
    uint64_t v13 = (const char *)[v8 UTF8String];
    id v14 = v11;
    getxattr(v12, v13, (void *)[v14 mutableBytes], v10, 0, 0);
    uint64_t v15 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
  }

  return v15;
}

- (NSString)hangID
{
  return self->_hangID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)creationDate
{
  return self->_creationDate;
}

- (NSString)duration
{
  return self->_duration;
}

- (NSString)processPath
{
  return self->_processPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_hangID, 0);
}

@end