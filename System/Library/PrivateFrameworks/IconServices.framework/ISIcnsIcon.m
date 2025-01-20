@interface ISIcnsIcon
+ (BOOL)supportsSecureCoding;
- (ISIcns)icns;
- (ISIcns)internalICNS;
- (ISIcnsIcon)initWithCoder:(id)a3;
- (ISIcnsIcon)initWithContentOfURL:(id)a3;
- (ISIcnsIcon)initWithIcns:(id)a3;
- (ISIcnsIcon)initWithIcnsData:(id)a3;
- (NSData)icnsData;
- (id)makeResourceProvider;
- (void)encodeWithCoder:(id)a3;
- (void)setInternalICNS:(id)a3;
@end

@implementation ISIcnsIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISIcnsIcon)initWithContentOfURL:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithData:", 0);
  v9.receiver = self;
  v9.super_class = (Class)ISIcnsIcon;
  v5 = [(ISConcreteIcon *)&v9 initWithDigest:v4];
  v6 = v5;
  if (v5)
  {
    icnsData = v5->_icnsData;
    v5->_icnsData = 0;
  }
  return v6;
}

- (ISIcnsIcon)initWithIcns:(id)a3
{
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithData:", 0);
  v11.receiver = self;
  v11.super_class = (Class)ISIcnsIcon;
  v7 = [(ISConcreteIcon *)&v11 initWithDigest:v6];
  v8 = v7;
  if (v7)
  {
    icnsData = v7->_icnsData;
    v7->_icnsData = 0;

    objc_storeStrong((id *)&v8->_internalICNS, a3);
  }

  return v8;
}

- (ISIcnsIcon)initWithIcnsData:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithData:", v4);
  v10.receiver = self;
  v10.super_class = (Class)ISIcnsIcon;
  v6 = [(ISConcreteIcon *)&v10 initWithDigest:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    icnsData = v6->_icnsData;
    v6->_icnsData = (NSData *)v7;
  }
  return v6;
}

- (ISIcnsIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIcnsIcon;
  id v5 = [(ISConcreteIcon *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icnsData"];
    icnsData = v5->_icnsData;
    v5->_icnsData = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISIcnsIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_icnsData, @"icnsData", v5.receiver, v5.super_class);
}

- (ISIcns)icns
{
  return 0;
}

- (id)makeResourceProvider
{
  return 0;
}

- (NSData)icnsData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (ISIcns)internalICNS
{
  return (ISIcns *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalICNS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalICNS, 0);
  objc_storeStrong((id *)&self->_icnsData, 0);
}

@end