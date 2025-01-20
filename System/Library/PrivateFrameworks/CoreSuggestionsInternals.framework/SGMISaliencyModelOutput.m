@interface SGMISaliencyModelOutput
- (MLMultiArray)data;
- (SGMISaliencyModelOutput)initWithData:(id)a3;
- (double)regularScore;
- (double)salientScore;
- (void)setData:(id)a3;
@end

@implementation SGMISaliencyModelOutput

- (void).cxx_destruct
{
}

- (void)setData:(id)a3
{
}

- (MLMultiArray)data
{
  return self->_data;
}

- (double)salientScore
{
  v2 = [(MLMultiArray *)self->_data objectForKeyedSubscript:&unk_1F25369E0];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)regularScore
{
  v2 = [(MLMultiArray *)self->_data objectForKeyedSubscript:&unk_1F25369C8];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (SGMISaliencyModelOutput)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMISaliencyModelOutput;
  v6 = [(SGMISaliencyModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

@end