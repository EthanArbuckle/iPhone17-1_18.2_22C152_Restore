@interface HKHRAFibBurdenTimeOfDayHistogram
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHRAFibBurdenAnalysisResult)eightAMToNoonBurden;
- (HKHRAFibBurdenAnalysisResult)eightPMToMidnightBurden;
- (HKHRAFibBurdenAnalysisResult)fourAMtoEightAMBurden;
- (HKHRAFibBurdenAnalysisResult)fourPMToEightPMBurden;
- (HKHRAFibBurdenAnalysisResult)midnightToFourAMBurden;
- (HKHRAFibBurdenAnalysisResult)noonToFourPMBurden;
- (HKHRAFibBurdenTimeOfDayHistogram)initWithCoder:(id)a3;
- (HKHRAFibBurdenTimeOfDayHistogram)initWithMidnightToFourAMBurden:(id)a3 fourAMtoEightAMBurden:(id)a4 eightAMToNoonBurden:(id)a5 noonToFourPMBurden:(id)a6 fourPMToEightPMBurden:(id)a7 eightPMToMidnightBurden:(id)a8;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHRAFibBurdenTimeOfDayHistogram

- (HKHRAFibBurdenTimeOfDayHistogram)initWithMidnightToFourAMBurden:(id)a3 fourAMtoEightAMBurden:(id)a4 eightAMToNoonBurden:(id)a5 noonToFourPMBurden:(id)a6 fourPMToEightPMBurden:(id)a7 eightPMToMidnightBurden:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HKHRAFibBurdenTimeOfDayHistogram;
  v18 = [(HKHRAFibBurdenTimeOfDayHistogram *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_midnightToFourAMBurden, a3);
    objc_storeStrong((id *)&v19->_fourAMtoEightAMBurden, a4);
    objc_storeStrong((id *)&v19->_eightAMToNoonBurden, a5);
    objc_storeStrong((id *)&v19->_noonToFourPMBurden, a6);
    objc_storeStrong((id *)&v19->_fourPMToEightPMBurden, a7);
    objc_storeStrong((id *)&v19->_eightPMToMidnightBurden, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHRAFibBurdenTimeOfDayHistogram *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(HKHRAFibBurdenAnalysisResult *)self->_midnightToFourAMBurden isEqual:v5->_midnightToFourAMBurden]&& [(HKHRAFibBurdenAnalysisResult *)self->_fourAMtoEightAMBurden isEqual:v5->_fourAMtoEightAMBurden]&& [(HKHRAFibBurdenAnalysisResult *)self->_eightAMToNoonBurden isEqual:v5->_eightAMToNoonBurden]&& [(HKHRAFibBurdenAnalysisResult *)self->_noonToFourPMBurden isEqual:v5->_noonToFourPMBurden]&& [(HKHRAFibBurdenAnalysisResult *)self->_fourPMToEightPMBurden isEqual:v5->_fourPMToEightPMBurden]&& [(HKHRAFibBurdenAnalysisResult *)self->_eightPMToMidnightBurden isEqual:v5->_eightPMToMidnightBurden];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKHRAFibBurdenAnalysisResult *)self->_midnightToFourAMBurden hash];
  unint64_t v4 = [(HKHRAFibBurdenAnalysisResult *)self->_fourAMtoEightAMBurden hash] ^ v3;
  unint64_t v5 = [(HKHRAFibBurdenAnalysisResult *)self->_eightAMToNoonBurden hash];
  unint64_t v6 = v4 ^ v5 ^ [(HKHRAFibBurdenAnalysisResult *)self->_noonToFourPMBurden hash];
  unint64_t v7 = [(HKHRAFibBurdenAnalysisResult *)self->_fourPMToEightPMBurden hash];
  return v6 ^ v7 ^ [(HKHRAFibBurdenAnalysisResult *)self->_eightPMToMidnightBurden hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  midnightToFourAMBurden = self->_midnightToFourAMBurden;
  id v5 = a3;
  [v5 encodeObject:midnightToFourAMBurden forKey:@"MidnightToFourAMBurdenKey"];
  [v5 encodeObject:self->_fourAMtoEightAMBurden forKey:@"FourAMtoEightAMBurdenKey"];
  [v5 encodeObject:self->_eightAMToNoonBurden forKey:@"EightAMToNoonBurdenKey"];
  [v5 encodeObject:self->_noonToFourPMBurden forKey:@"NoonToFourPMBurdenKey"];
  [v5 encodeObject:self->_fourPMToEightPMBurden forKey:@"FourPMToEightPMBurdenKey"];
  [v5 encodeObject:self->_eightPMToMidnightBurden forKey:@"EightPMToMidnightBurdenKey"];
}

- (HKHRAFibBurdenTimeOfDayHistogram)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKHRAFibBurdenTimeOfDayHistogram;
  id v5 = [(HKHRAFibBurdenTimeOfDayHistogram *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MidnightToFourAMBurdenKey"];
    midnightToFourAMBurden = v5->_midnightToFourAMBurden;
    v5->_midnightToFourAMBurden = (HKHRAFibBurdenAnalysisResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FourAMtoEightAMBurdenKey"];
    fourAMtoEightAMBurden = v5->_fourAMtoEightAMBurden;
    v5->_fourAMtoEightAMBurden = (HKHRAFibBurdenAnalysisResult *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EightAMToNoonBurdenKey"];
    eightAMToNoonBurden = v5->_eightAMToNoonBurden;
    v5->_eightAMToNoonBurden = (HKHRAFibBurdenAnalysisResult *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NoonToFourPMBurdenKey"];
    noonToFourPMBurden = v5->_noonToFourPMBurden;
    v5->_noonToFourPMBurden = (HKHRAFibBurdenAnalysisResult *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FourPMToEightPMBurdenKey"];
    fourPMToEightPMBurden = v5->_fourPMToEightPMBurden;
    v5->_fourPMToEightPMBurden = (HKHRAFibBurdenAnalysisResult *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EightPMToMidnightBurdenKey"];
    eightPMToMidnightBurden = v5->_eightPMToMidnightBurden;
    v5->_eightPMToMidnightBurden = (HKHRAFibBurdenAnalysisResult *)v16;
  }
  return v5;
}

- (HKHRAFibBurdenAnalysisResult)midnightToFourAMBurden
{
  return self->_midnightToFourAMBurden;
}

- (HKHRAFibBurdenAnalysisResult)fourAMtoEightAMBurden
{
  return self->_fourAMtoEightAMBurden;
}

- (HKHRAFibBurdenAnalysisResult)eightAMToNoonBurden
{
  return self->_eightAMToNoonBurden;
}

- (HKHRAFibBurdenAnalysisResult)noonToFourPMBurden
{
  return self->_noonToFourPMBurden;
}

- (HKHRAFibBurdenAnalysisResult)fourPMToEightPMBurden
{
  return self->_fourPMToEightPMBurden;
}

- (HKHRAFibBurdenAnalysisResult)eightPMToMidnightBurden
{
  return self->_eightPMToMidnightBurden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eightPMToMidnightBurden, 0);
  objc_storeStrong((id *)&self->_fourPMToEightPMBurden, 0);
  objc_storeStrong((id *)&self->_noonToFourPMBurden, 0);
  objc_storeStrong((id *)&self->_eightAMToNoonBurden, 0);
  objc_storeStrong((id *)&self->_fourAMtoEightAMBurden, 0);

  objc_storeStrong((id *)&self->_midnightToFourAMBurden, 0);
}

@end