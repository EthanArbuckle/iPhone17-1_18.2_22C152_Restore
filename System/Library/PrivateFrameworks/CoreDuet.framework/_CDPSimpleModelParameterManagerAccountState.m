@interface _CDPSimpleModelParameterManagerAccountState
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)tuningValues;
- (_CDPModelTuningState)lastTuningState;
- (_CDPSimpleModelParameterManagerAccountState)init;
- (_CDPSimpleModelParameterManagerAccountState)initWithCoder:(id)a3;
- (_CDPSimpleModelParameterManagerTuningValue)previousBestTuningValue;
- (void)encodeWithCoder:(id)a3;
- (void)setLastTuningState:(id)a3;
- (void)setPreviousBestTuningValue:(id)a3;
- (void)setTuningValues:(id)a3;
@end

@implementation _CDPSimpleModelParameterManagerAccountState

- (_CDPSimpleModelParameterManagerAccountState)init
{
  v13.receiver = self;
  v13.super_class = (Class)_CDPSimpleModelParameterManagerAccountState;
  v2 = [(_CDPSimpleModelParameterManagerAccountState *)&v13 init];
  v3 = [_CDPSimpleModelParameterManagerTuningValue alloc];
  LODWORD(v4) = 30.0;
  LODWORD(v5) = 5.0;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 0.5;
  uint64_t v8 = [(_CDPSimpleModelParameterManagerTuningValue *)v3 initWithLambda:v4 w0:v5 threshold:v6 score:v7];
  previousBestTuningValue = v2->_previousBestTuningValue;
  v2->_previousBestTuningValue = (_CDPSimpleModelParameterManagerTuningValue *)v8;

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  tuningValues = v2->_tuningValues;
  v2->_tuningValues = (NSMutableArray *)v10;

  return v2;
}

- (_CDPSimpleModelParameterManagerAccountState)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(_CDPSimpleModelParameterManagerAccountState *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousBestTuningValue"];
  previousBestTuningValue = v5->_previousBestTuningValue;
  v5->_previousBestTuningValue = (_CDPSimpleModelParameterManagerTuningValue *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tuningValues"];
  tuningValues = v5->_tuningValues;
  v5->_tuningValues = (NSMutableArray *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastTuningState"];

  lastTuningState = v5->_lastTuningState;
  v5->_lastTuningState = (_CDPModelTuningState *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  previousBestTuningValue = self->_previousBestTuningValue;
  id v5 = a3;
  [v5 encodeObject:previousBestTuningValue forKey:@"previousBestTuningValue"];
  [v5 encodeObject:self->_tuningValues forKey:@"tuningValues"];
  [v5 encodeObject:self->_lastTuningState forKey:@"lastTuningState"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDPSimpleModelParameterManagerTuningValue)previousBestTuningValue
{
  return self->_previousBestTuningValue;
}

- (void)setPreviousBestTuningValue:(id)a3
{
}

- (NSMutableArray)tuningValues
{
  return self->_tuningValues;
}

- (void)setTuningValues:(id)a3
{
}

- (_CDPModelTuningState)lastTuningState
{
  return self->_lastTuningState;
}

- (void)setLastTuningState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTuningState, 0);
  objc_storeStrong((id *)&self->_tuningValues, 0);
  objc_storeStrong((id *)&self->_previousBestTuningValue, 0);
}

@end