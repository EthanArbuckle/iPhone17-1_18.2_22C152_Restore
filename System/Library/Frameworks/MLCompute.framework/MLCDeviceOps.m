@interface MLCDeviceOps
- (BOOL)resultOfForwardNeededForGradient;
- (BOOL)sourceOfForwardNeededForGradient;
- (MLCDeviceOps)initWithSource:(id)a3 secondarySource:(id)a4 result:(id)a5 batchSize:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)result;
- (id)secondarySource;
- (id)source;
- (id)tertiarySource;
- (unint64_t)batchSize;
- (void)setBatchSize:(unint64_t)a3;
- (void)setResult:(id)a3;
- (void)setResultOfForwardNeededForGradient:(BOOL)a3;
- (void)setSecondarySource:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceOfForwardNeededForGradient:(BOOL)a3;
- (void)setTertiarySource:(id)a3;
@end

@implementation MLCDeviceOps

- (MLCDeviceOps)initWithSource:(id)a3 secondarySource:(id)a4 result:(id)a5 batchSize:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLCDeviceOps;
  v14 = [(MLCDeviceOps *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_source, a3);
    objc_storeStrong(&v15->_secondarySource, a4);
    objc_storeStrong(&v15->_result, a5);
    v15->_batchSize = a6;
    *(_WORD *)&v15->_sourceOfForwardNeededForGradient = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MLCDeviceOps *)self source];
  v6 = [(MLCDeviceOps *)self secondarySource];
  v7 = [(MLCDeviceOps *)self result];
  v8 = objc_msgSend(v4, "initWithSource:secondarySource:result:batchSize:", v5, v6, v7, -[MLCDeviceOps batchSize](self, "batchSize"));

  return v8;
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (id)secondarySource
{
  return self->_secondarySource;
}

- (void)setSecondarySource:(id)a3
{
}

- (id)tertiarySource
{
  return self->_tertiarySource;
}

- (void)setTertiarySource:(id)a3
{
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (BOOL)sourceOfForwardNeededForGradient
{
  return self->_sourceOfForwardNeededForGradient;
}

- (void)setSourceOfForwardNeededForGradient:(BOOL)a3
{
  self->_sourceOfForwardNeededForGradient = a3;
}

- (BOOL)resultOfForwardNeededForGradient
{
  return self->_resultOfForwardNeededForGradient;
}

- (void)setResultOfForwardNeededForGradient:(BOOL)a3
{
  self->_resultOfForwardNeededForGradient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_tertiarySource, 0);
  objc_storeStrong(&self->_secondarySource, 0);

  objc_storeStrong(&self->_source, 0);
}

@end