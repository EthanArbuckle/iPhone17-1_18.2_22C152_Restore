@interface CSLocationTag
- (CSLocationTag)initWithLocationID:(id)a3 lat:(double)a4 lng:(double)a5 confidence:(double)a6;
- (CSLocationTag)initWithPrimaryValue:(id)a3 components:(id)a4 confidence:(double)a5;
- (double)lat;
- (double)lng;
- (void)encodeWithCSCoder:(id)a3;
@end

@implementation CSLocationTag

- (CSLocationTag)initWithLocationID:(id)a3 lat:(double)a4 lng:(double)a5 confidence:(double)a6
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v10 = NSNumber;
  id v11 = a3;
  v12 = [v10 numberWithDouble:a4];
  v18[0] = v12;
  v13 = [NSNumber numberWithDouble:a5];
  v18[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  v17.receiver = self;
  v17.super_class = (Class)CSLocationTag;
  v15 = [(CSNumericAnalysisTag *)&v17 initWithPrimaryValue:v11 components:v14 confidence:a6];

  if (v15)
  {
    v15->_lat = a4;
    v15->_lng = a5;
  }

  return v15;
}

- (CSLocationTag)initWithPrimaryValue:(id)a3 components:(id)a4 confidence:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    if ([v9 count] == 2)
    {
      v13 = [v10 firstObject];
      [v13 doubleValue];
      double v12 = v14;
    }
    if ([v10 count] == 2)
    {
      v15 = [v10 lastObject];
      [v15 doubleValue];
      double v11 = v16;
    }
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }
  objc_super v17 = [(CSLocationTag *)self initWithLocationID:v8 lat:v12 lng:v11 confidence:a5];

  return v17;
}

- (double)lat
{
  return self->_lat;
}

- (double)lng
{
  return self->_lng;
}

- (void)encodeWithCSCoder:(id)a3
{
  id v10 = a3;
  [v10 beginType:"CSLocationTag"];
  uint64_t v4 = [(CSNumericAnalysisTag *)self primaryValue];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = &unk_1EDBD69E8;
  }
  [v10 encodeObject:v6];

  uint64_t v7 = [(CSNumericAnalysisTag *)self components];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  [v10 encodeObject:v9];

  [(CSNumericAnalysisTag *)self confidence];
  objc_msgSend(v10, "encodeDouble:");
  [v10 endType];
}

@end