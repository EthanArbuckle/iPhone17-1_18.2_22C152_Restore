@interface DYGTGPUToolsVersionInfo
+ (BOOL)supportsSecureCoding;
- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3;
- (NSDictionary)infoPlist;
- (NSDictionary)versionPlist;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)interposeVersionGL;
- (unsigned)interposeVersionMetal;
- (void)encodeWithCoder:(id)a3;
- (void)setInfoPlist:(id)a3;
- (void)setInterposeVersionGL:(unsigned int)a3;
- (void)setInterposeVersionMetal:(unsigned int)a3;
- (void)setVersionPlist:(id)a3;
@end

@implementation DYGTGPUToolsVersionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_infoPlist copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSDictionary *)self->_versionPlist copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(_DWORD *)(v5 + 8) = self->_interposeVersionGL;
  *(_DWORD *)(v5 + 12) = self->_interposeVersionMetal;
  return (id)v5;
}

- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DYGTGPUToolsVersionInfo;
  uint64_t v5 = [(DYGTGPUToolsVersionInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"infoPlist"];
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v4 decodeDictionaryWithKeysOfClass:v11 objectsOfClass:objc_opt_class() forKey:@"versionPlist"];
    versionPlist = v5->_versionPlist;
    v5->_versionPlist = (NSDictionary *)v12;

    v5->_interposeVersionGL = [v4 decodeInt32ForKey:@"interposeVersion"];
    v5->_interposeVersionMetal = [v4 decodeInt32ForKey:@"interposeVersionMetal"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  infoPlist = self->_infoPlist;
  id v5 = a3;
  [v5 encodeObject:infoPlist forKey:@"infoPlist"];
  [v5 encodeObject:self->_versionPlist forKey:@"versionPlist"];
  [v5 encodeInt32:self->_interposeVersionGL forKey:@"interposeVersion"];
  [v5 encodeInt32:self->_interposeVersionMetal forKey:@"interposeVersionMetal"];
}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
}

- (NSDictionary)versionPlist
{
  return self->_versionPlist;
}

- (void)setVersionPlist:(id)a3
{
}

- (unsigned)interposeVersionGL
{
  return self->_interposeVersionGL;
}

- (void)setInterposeVersionGL:(unsigned int)a3
{
  self->_interposeVersionGL = a3;
}

- (unsigned)interposeVersionMetal
{
  return self->_interposeVersionMetal;
}

- (void)setInterposeVersionMetal:(unsigned int)a3
{
  self->_interposeVersionMetal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionPlist, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
}

@end