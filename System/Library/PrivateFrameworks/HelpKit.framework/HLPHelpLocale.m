@interface HLPHelpLocale
- (HLPHelpLocale)initWithDictionary:(id)a3;
- (NSArray)isoCodes;
- (NSString)path;
- (id)debugDescription;
- (void)setIsoCodes:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation HLPHelpLocale

- (HLPHelpLocale)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HLPHelpLocale;
  v5 = [(HLPHelpLocale *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"folder"];
    [(HLPHelpLocale *)v5 setPath:v6];

    v7 = [v4 objectForKeyedSubscript:@"isoCodes"];
    [(HLPHelpLocale *)v5 setIsoCodes:v7];
  }
  return v5;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F089D8] stringWithString:&stru_26D29FC58];
  id v4 = [(HLPHelpLocale *)self path];
  [v3 appendFormat:@"path: %@\n", v4];

  v5 = [(HLPHelpLocale *)self isoCodes];
  [v3 appendFormat:@"isoCodes: %@\n", v5];

  return v3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSArray)isoCodes
{
  return self->_isoCodes;
}

- (void)setIsoCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCodes, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end