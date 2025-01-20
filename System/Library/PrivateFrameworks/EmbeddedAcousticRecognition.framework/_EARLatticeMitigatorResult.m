@interface _EARLatticeMitigatorResult
- (BOOL)processed;
- (NSString)version;
- (_EARLatticeMitigatorResult)initWithVersion:(id)a3 score:(float)a4 threshold:(float)a5 calibrationScale:(float)a6 calibrationOffset:(float)a7 processed:(BOOL)a8;
- (float)calibrationOffset;
- (float)calibrationScale;
- (float)score;
- (float)threshold;
- (id)description;
@end

@implementation _EARLatticeMitigatorResult

- (_EARLatticeMitigatorResult)initWithVersion:(id)a3 score:(float)a4 threshold:(float)a5 calibrationScale:(float)a6 calibrationOffset:(float)a7 processed:(BOOL)a8
{
  id v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EARLatticeMitigatorResult;
  v15 = [(_EARLatticeMitigatorResult *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    version = v15->_version;
    v15->_version = (NSString *)v16;

    v15->_score = a4;
    v15->_threshold = a5;
    v15->_calibrationScale = a6;
    v15->_calibrationOffset = a7;
    v15->_processed = a8;
  }

  return v15;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(ver=%@, score=%f, threshold=%f)", self->_version, self->_score, self->_threshold];
}

- (NSString)version
{
  return self->_version;
}

- (float)score
{
  return self->_score;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)calibrationScale
{
  return self->_calibrationScale;
}

- (float)calibrationOffset
{
  return self->_calibrationOffset;
}

- (BOOL)processed
{
  return self->_processed;
}

- (void).cxx_destruct
{
}

@end