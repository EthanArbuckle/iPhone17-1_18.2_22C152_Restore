@interface IPInstallableProgress
- (IPInstallableProgress)initWithSource:(id)a3 progressSnapshot:(id)a4;
- (IPInstallableProgressSource)source;
- (double)overallFractionCompleted;
- (double)phaseFractionCompleted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)phase;
- (unint64_t)phaseCompletedUnitCount;
- (unint64_t)phaseTotalUnitCount;
@end

@implementation IPInstallableProgress

- (IPInstallableProgress)initWithSource:(id)a3 progressSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IPInstallableProgress;
  v9 = [(IPInstallableProgress *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    uint64_t v11 = [v8 copy];
    data = v10->_data;
    v10->_data = (IPInstallableProgressData *)v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  data = self->_data;
  source = self->_source;

  return (id)[v4 initWithSource:source progressSnapshot:data];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p { %@ }>", objc_opt_class(), self, self->_data];
}

- (double)overallFractionCompleted
{
  [(IPInstallableProgressData *)self->_data fractionCompleted];
  return result;
}

- (unint64_t)phase
{
  return [(IPInstallableProgressData *)self->_data installPhase];
}

- (unint64_t)phaseTotalUnitCount
{
  data = self->_data;
  uint64_t v3 = [(IPInstallableProgressData *)data installPhase];

  return [(IPInstallableProgressData *)data totalUnitCountForPhase:v3];
}

- (unint64_t)phaseCompletedUnitCount
{
  data = self->_data;
  uint64_t v3 = [(IPInstallableProgressData *)data installPhase];

  return [(IPInstallableProgressData *)data completedUnitCountForPhase:v3];
}

- (double)phaseFractionCompleted
{
  unint64_t v3 = [(IPInstallableProgressData *)self->_data totalUnitCountForPhase:[(IPInstallableProgressData *)self->_data installPhase]];
  unint64_t v4 = [(IPInstallableProgressData *)self->_data completedUnitCountForPhase:[(IPInstallableProgressData *)self->_data installPhase]];
  if (v3) {
    return (double)v4 / (double)v3;
  }
  else {
    return 1.0;
  }
}

- (IPInstallableProgressSource)source
{
  return (IPInstallableProgressSource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end