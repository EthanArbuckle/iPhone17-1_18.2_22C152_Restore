@interface HKElectrocardiogramRegulatedVersion
- (BOOL)_validateSourceVersion:(id)a3 algorithmVersion:(int64_t)a4;
- (HKElectrocardiogramRegulatedVersion)initWithSourceVersion:(id)a3 algorithmVersion:(int64_t)a4;
- (NSString)featureVersion;
- (NSString)updateVersion;
- (id)_featureVersionFromUpdateVersion:(id)a3;
- (id)_updateVersionFromSourceVersion:(id)a3 algorithmVersion:(int64_t)a4;
@end

@implementation HKElectrocardiogramRegulatedVersion

- (HKElectrocardiogramRegulatedVersion)initWithSourceVersion:(id)a3 algorithmVersion:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramRegulatedVersion;
  v7 = [(HKElectrocardiogramRegulatedVersion *)&v15 init];
  v8 = v7;
  if (v7)
  {
    if (![(HKElectrocardiogramRegulatedVersion *)v7 _validateSourceVersion:v6 algorithmVersion:a4])
    {
      v13 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = [(HKElectrocardiogramRegulatedVersion *)v8 _updateVersionFromSourceVersion:v6 algorithmVersion:a4];
    updateVersion = v8->_updateVersion;
    v8->_updateVersion = (NSString *)v9;

    uint64_t v11 = [(HKElectrocardiogramRegulatedVersion *)v8 _featureVersionFromUpdateVersion:v8->_updateVersion];
    featureVersion = v8->_featureVersion;
    v8->_featureVersion = (NSString *)v11;
  }
  v13 = v8;
LABEL_6:

  return v13;
}

- (BOOL)_validateSourceVersion:(id)a3 algorithmVersion:(int64_t)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (id)_updateVersionFromSourceVersion:(id)a3 algorithmVersion:(int64_t)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  MEMORY[0x1E4E3FC80](&v7, a3, a2);
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", a4, v8);
  return v5;
}

- (id)_featureVersionFromUpdateVersion:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
}

- (NSString)updateVersion
{
  return self->_updateVersion;
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVersion, 0);
  objc_storeStrong((id *)&self->_updateVersion, 0);
}

@end