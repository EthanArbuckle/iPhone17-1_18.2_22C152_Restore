@interface HAMenstrualAlgorithmsDeviationInput
+ (BOOL)supportsSecureCoding;
- (HAMenstrualAlgorithmsDeviationInput)initWithCoder:(id)a3;
- (NSNumber)julianDayMinAnalysisWindowEndInfrequent;
- (NSNumber)julianDayMinAnalysisWindowEndIrregular;
- (NSNumber)julianDayMinAnalysisWindowEndProlonged;
- (NSNumber)julianDayMinAnalysisWindowEndSpotting;
- (NSNumber)julianDayMinAnalysisWindowStartInfrequent;
- (NSNumber)julianDayMinAnalysisWindowStartIrregular;
- (NSNumber)julianDayMinAnalysisWindowStartProlonged;
- (NSNumber)julianDayMinAnalysisWindowStartSpotting;
- (void)encodeWithCoder:(id)a3;
- (void)setJulianDayMinAnalysisWindowEndInfrequent:(id)a3;
- (void)setJulianDayMinAnalysisWindowEndIrregular:(id)a3;
- (void)setJulianDayMinAnalysisWindowEndProlonged:(id)a3;
- (void)setJulianDayMinAnalysisWindowEndSpotting:(id)a3;
- (void)setJulianDayMinAnalysisWindowStartInfrequent:(id)a3;
- (void)setJulianDayMinAnalysisWindowStartIrregular:(id)a3;
- (void)setJulianDayMinAnalysisWindowStartProlonged:(id)a3;
- (void)setJulianDayMinAnalysisWindowStartSpotting:(id)a3;
@end

@implementation HAMenstrualAlgorithmsDeviationInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndSpotting, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndProlonged, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndInfrequent, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndIrregular, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartSpotting, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartProlonged, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartInfrequent, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartIrregular, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  julianDayMinAnalysisWindowStartIrregular = self->_julianDayMinAnalysisWindowStartIrregular;
  v5 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartIrregular);
  [v20 encodeObject:julianDayMinAnalysisWindowStartIrregular forKey:v5];

  julianDayMinAnalysisWindowStartInfrequent = self->_julianDayMinAnalysisWindowStartInfrequent;
  v7 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartInfrequent);
  [v20 encodeObject:julianDayMinAnalysisWindowStartInfrequent forKey:v7];

  julianDayMinAnalysisWindowStartProlonged = self->_julianDayMinAnalysisWindowStartProlonged;
  v9 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartProlonged);
  [v20 encodeObject:julianDayMinAnalysisWindowStartProlonged forKey:v9];

  julianDayMinAnalysisWindowStartSpotting = self->_julianDayMinAnalysisWindowStartSpotting;
  v11 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartSpotting);
  [v20 encodeObject:julianDayMinAnalysisWindowStartSpotting forKey:v11];

  julianDayMinAnalysisWindowEndIrregular = self->_julianDayMinAnalysisWindowEndIrregular;
  v13 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndIrregular);
  [v20 encodeObject:julianDayMinAnalysisWindowEndIrregular forKey:v13];

  julianDayMinAnalysisWindowEndInfrequent = self->_julianDayMinAnalysisWindowEndInfrequent;
  v15 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndInfrequent);
  [v20 encodeObject:julianDayMinAnalysisWindowEndInfrequent forKey:v15];

  julianDayMinAnalysisWindowEndProlonged = self->_julianDayMinAnalysisWindowEndProlonged;
  v17 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndProlonged);
  [v20 encodeObject:julianDayMinAnalysisWindowEndProlonged forKey:v17];

  julianDayMinAnalysisWindowEndSpotting = self->_julianDayMinAnalysisWindowEndSpotting;
  v19 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndSpotting);
  [v20 encodeObject:julianDayMinAnalysisWindowEndSpotting forKey:v19];
}

- (HAMenstrualAlgorithmsDeviationInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAMenstrualAlgorithmsDeviationInput *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartIrregular);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    julianDayMinAnalysisWindowStartIrregular = v5->_julianDayMinAnalysisWindowStartIrregular;
    v5->_julianDayMinAnalysisWindowStartIrregular = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartInfrequent);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    julianDayMinAnalysisWindowStartInfrequent = v5->_julianDayMinAnalysisWindowStartInfrequent;
    v5->_julianDayMinAnalysisWindowStartInfrequent = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartProlonged);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    julianDayMinAnalysisWindowStartProlonged = v5->_julianDayMinAnalysisWindowStartProlonged;
    v5->_julianDayMinAnalysisWindowStartProlonged = (NSNumber *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_julianDayMinAnalysisWindowStartSpotting);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    julianDayMinAnalysisWindowStartSpotting = v5->_julianDayMinAnalysisWindowStartSpotting;
    v5->_julianDayMinAnalysisWindowStartSpotting = (NSNumber *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndIrregular);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    julianDayMinAnalysisWindowEndIrregular = v5->_julianDayMinAnalysisWindowEndIrregular;
    v5->_julianDayMinAnalysisWindowEndIrregular = (NSNumber *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndInfrequent);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    julianDayMinAnalysisWindowEndInfrequent = v5->_julianDayMinAnalysisWindowEndInfrequent;
    v5->_julianDayMinAnalysisWindowEndInfrequent = (NSNumber *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndProlonged);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    julianDayMinAnalysisWindowEndProlonged = v5->_julianDayMinAnalysisWindowEndProlonged;
    v5->_julianDayMinAnalysisWindowEndProlonged = (NSNumber *)v32;

    uint64_t v34 = objc_opt_class();
    v35 = NSStringFromSelector(sel_julianDayMinAnalysisWindowEndSpotting);
    uint64_t v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    julianDayMinAnalysisWindowEndSpotting = v5->_julianDayMinAnalysisWindowEndSpotting;
    v5->_julianDayMinAnalysisWindowEndSpotting = (NSNumber *)v36;

    v38 = v5;
  }

  return v5;
}

- (void)setJulianDayMinAnalysisWindowStartSpotting:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowStartProlonged:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowStartIrregular:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowStartInfrequent:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowEndSpotting:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowEndProlonged:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowEndIrregular:(id)a3
{
}

- (void)setJulianDayMinAnalysisWindowEndInfrequent:(id)a3
{
}

- (NSNumber)julianDayMinAnalysisWindowStartSpotting
{
  return self->_julianDayMinAnalysisWindowStartSpotting;
}

- (NSNumber)julianDayMinAnalysisWindowStartProlonged
{
  return self->_julianDayMinAnalysisWindowStartProlonged;
}

- (NSNumber)julianDayMinAnalysisWindowStartIrregular
{
  return self->_julianDayMinAnalysisWindowStartIrregular;
}

- (NSNumber)julianDayMinAnalysisWindowStartInfrequent
{
  return self->_julianDayMinAnalysisWindowStartInfrequent;
}

- (NSNumber)julianDayMinAnalysisWindowEndSpotting
{
  return self->_julianDayMinAnalysisWindowEndSpotting;
}

- (NSNumber)julianDayMinAnalysisWindowEndProlonged
{
  return self->_julianDayMinAnalysisWindowEndProlonged;
}

- (NSNumber)julianDayMinAnalysisWindowEndIrregular
{
  return self->_julianDayMinAnalysisWindowEndIrregular;
}

- (NSNumber)julianDayMinAnalysisWindowEndInfrequent
{
  return self->_julianDayMinAnalysisWindowEndInfrequent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end