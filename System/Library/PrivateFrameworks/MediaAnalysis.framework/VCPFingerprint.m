@interface VCPFingerprint
+ (id)fingerprintWithMaster:(id)a3 adjusted:(id)a4;
- (BOOL)isEqualToFingerprint:(id)a3;
- (NSString)adjusted;
- (NSString)master;
- (VCPFingerprint)init;
- (VCPFingerprint)initWithMaster:(id)a3 adjusted:(id)a4;
- (id)description;
@end

@implementation VCPFingerprint

- (VCPFingerprint)init
{
  return 0;
}

- (VCPFingerprint)initWithMaster:(id)a3 adjusted:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7
    && (v12.receiver = self,
        v12.super_class = (Class)VCPFingerprint,
        v9 = [(VCPFingerprint *)&v12 init],
        (self = v9) != 0))
  {
    objc_storeStrong((id *)&v9->_master, a3);
    objc_storeStrong((id *)&self->_adjusted, a4);
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fingerprintWithMaster:(id)a3 adjusted:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[VCPFingerprint alloc] initWithMaster:v5 adjusted:v6];

  return v7;
}

- (BOOL)isEqualToFingerprint:(id)a3
{
  id v4 = a3;
  master = self->_master;
  id v6 = [v4 master];
  LOBYTE(master) = [(NSString *)master isEqualToString:v6];

  if (master)
  {
    adjusted = self->_adjusted;
    if (!adjusted)
    {
      id v8 = [v4 adjusted];

      if (!v8)
      {
        char v10 = 1;
        goto LABEL_7;
      }
      adjusted = self->_adjusted;
    }
    v9 = [v4 adjusted];
    char v10 = [(NSString *)adjusted isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }
LABEL_7:

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ | %@", self->_master, self->_adjusted];
}

- (NSString)master
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)adjusted
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjusted, 0);
  objc_storeStrong((id *)&self->_master, 0);
}

@end