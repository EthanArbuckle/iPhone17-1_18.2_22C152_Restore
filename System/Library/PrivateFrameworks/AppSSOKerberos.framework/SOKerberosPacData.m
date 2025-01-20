@interface SOKerberosPacData
- (BOOL)passwordNeverExpires;
- (NSDate)passwordCanChange;
- (NSDate)passwordLastSet;
- (NSDate)passwordMustChange;
- (NSString)effectiveName;
- (NSString)fullName;
- (NSString)homeDirectory;
- (SOKerberosPacData)initWithValidationInfo:(id *)a3;
- (id)convertFromFileTime:(unint64_t)a3;
- (id)description;
- (void)setEffectiveName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHomeDirectory:(id)a3;
- (void)setPasswordCanChange:(id)a3;
- (void)setPasswordLastSet:(id)a3;
- (void)setPasswordMustChange:(id)a3;
- (void)setPasswordNeverExpires:(BOOL)a3;
@end

@implementation SOKerberosPacData

- (SOKerberosPacData)initWithValidationInfo:(id *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SOKerberosPacData;
  v4 = [(SOKerberosPacData *)&v22 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(SOKerberosPacData *)v4 convertFromFileTime:a3->var3];
    passwordLastSet = v5->_passwordLastSet;
    v5->_passwordLastSet = (NSDate *)v6;

    uint64_t v8 = [(SOKerberosPacData *)v5 convertFromFileTime:a3->var4];
    passwordCanChange = v5->_passwordCanChange;
    v5->_passwordCanChange = (NSDate *)v8;

    if (a3->var5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      passwordMustChange = v5->_passwordMustChange;
      v5->_passwordMustChange = 0;
      char v11 = 1;
    }
    else
    {
      uint64_t v12 = -[SOKerberosPacData convertFromFileTime:](v5, "convertFromFileTime:");
      char v11 = 0;
      passwordMustChange = v5->_passwordMustChange;
      v5->_passwordMustChange = (NSDate *)v12;
    }

    v5->_passwordNeverExpires = v11;
    uint64_t v13 = [[NSString alloc] initWithCharacters:a3->var10.var6 length:a3->var10.var3];
    homeDirectory = v5->_homeDirectory;
    v5->_homeDirectory = (NSString *)v13;

    uint64_t v15 = [[NSString alloc] initWithCharacters:a3->var6.var6 length:a3->var6.var3];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_26D3372C0;
    }
    objc_storeStrong((id *)&v5->_effectiveName, v17);

    uint64_t v18 = [[NSString alloc] initWithCharacters:a3->var7.var6 length:a3->var7.var3];
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = &stru_26D3372C0;
    }
    objc_storeStrong((id *)&v5->_fullName, v20);
  }
  return v5;
}

- (id)convertFromFileTime:(unint64_t)a3
{
  return (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)((a3 - 116444736000000000) / 0x989680)];
}

- (id)description
{
  v3 = NSString;
  v4 = [(SOKerberosPacData *)self passwordLastSet];
  v5 = [(SOKerberosPacData *)self passwordCanChange];
  uint64_t v6 = [(SOKerberosPacData *)self passwordMustChange];
  if ([(SOKerberosPacData *)self passwordNeverExpires]) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  uint64_t v8 = [(SOKerberosPacData *)self homeDirectory];
  v9 = [v3 stringWithFormat:@"passwordLastSet: %@, passwordCanChange: %@, passwordMustChange: %@, passwordNeverExpires: %@, homeDirectory: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSDate)passwordLastSet
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasswordLastSet:(id)a3
{
}

- (NSDate)passwordCanChange
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPasswordCanChange:(id)a3
{
}

- (NSDate)passwordMustChange
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPasswordMustChange:(id)a3
{
}

- (BOOL)passwordNeverExpires
{
  return self->_passwordNeverExpires;
}

- (void)setPasswordNeverExpires:(BOOL)a3
{
  self->_passwordNeverExpires = a3;
}

- (NSString)homeDirectory
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeDirectory:(id)a3
{
}

- (NSString)effectiveName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEffectiveName:(id)a3
{
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFullName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_effectiveName, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_passwordMustChange, 0);
  objc_storeStrong((id *)&self->_passwordCanChange, 0);
  objc_storeStrong((id *)&self->_passwordLastSet, 0);
}

@end