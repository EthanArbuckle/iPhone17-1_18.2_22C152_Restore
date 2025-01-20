@interface HAMenstrualAlgorithmsDeviationAnalysis
+ (BOOL)supportsSecureCoding;
- (HAMenstrualAlgorithmsDeviation)infrequentBleeding;
- (HAMenstrualAlgorithmsDeviation)irregularBleeding;
- (HAMenstrualAlgorithmsDeviation)prolongedBleeding;
- (HAMenstrualAlgorithmsDeviation)spotting;
- (HAMenstrualAlgorithmsDeviationAnalysis)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInfrequentBleeding:(id)a3;
- (void)setIrregularBleeding:(id)a3;
- (void)setProlongedBleeding:(id)a3;
- (void)setSpotting:(id)a3;
@end

@implementation HAMenstrualAlgorithmsDeviationAnalysis

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsDeviationAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HAMenstrualAlgorithmsDeviationAnalysis;
  v5 = [(HAMenstrualAlgorithmsDeviationAnalysis *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_irregularBleeding);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    irregularBleeding = v5->_irregularBleeding;
    v5->_irregularBleeding = (HAMenstrualAlgorithmsDeviation *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_infrequentBleeding);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    infrequentBleeding = v5->_infrequentBleeding;
    v5->_infrequentBleeding = (HAMenstrualAlgorithmsDeviation *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_prolongedBleeding);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    prolongedBleeding = v5->_prolongedBleeding;
    v5->_prolongedBleeding = (HAMenstrualAlgorithmsDeviation *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_spotting);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    spotting = v5->_spotting;
    v5->_spotting = (HAMenstrualAlgorithmsDeviation *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  irregularBleeding = self->_irregularBleeding;
  v5 = NSStringFromSelector(sel_irregularBleeding);
  [v12 encodeObject:irregularBleeding forKey:v5];

  infrequentBleeding = self->_infrequentBleeding;
  v7 = NSStringFromSelector(sel_infrequentBleeding);
  [v12 encodeObject:infrequentBleeding forKey:v7];

  prolongedBleeding = self->_prolongedBleeding;
  v9 = NSStringFromSelector(sel_prolongedBleeding);
  [v12 encodeObject:prolongedBleeding forKey:v9];

  spotting = self->_spotting;
  v11 = NSStringFromSelector(sel_spotting);
  [v12 encodeObject:spotting forKey:v11];
}

- (HAMenstrualAlgorithmsDeviation)irregularBleeding
{
  return self->_irregularBleeding;
}

- (void)setIrregularBleeding:(id)a3
{
}

- (HAMenstrualAlgorithmsDeviation)infrequentBleeding
{
  return self->_infrequentBleeding;
}

- (void)setInfrequentBleeding:(id)a3
{
}

- (HAMenstrualAlgorithmsDeviation)prolongedBleeding
{
  return self->_prolongedBleeding;
}

- (void)setProlongedBleeding:(id)a3
{
}

- (HAMenstrualAlgorithmsDeviation)spotting
{
  return self->_spotting;
}

- (void)setSpotting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotting, 0);
  objc_storeStrong((id *)&self->_prolongedBleeding, 0);
  objc_storeStrong((id *)&self->_infrequentBleeding, 0);
  objc_storeStrong((id *)&self->_irregularBleeding, 0);
}

@end