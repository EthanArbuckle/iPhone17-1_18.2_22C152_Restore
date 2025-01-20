@interface MLNeuralNetworksCompileTimeParams
+ (BOOL)supportsSecureCoding;
- (BOOL)writeUpdatableParamsToURL:(id)a3 error:(id *)a4;
- (MLNeuralNetworksCompileTimeParams)initWithCoder:(id)a3;
- (MLNeuralNetworksCompileTimeParams)initWithLossType:(int64_t)a3 optimizerType:(int64_t)a4 optimizerParameters:(id)a5 lossParameters:(id)a6 trainableLayerNames:(id)a7 updateParameters:(id)a8;
- (NSArray)trainableLayerNames;
- (NSDictionary)lossParameters;
- (NSDictionary)optimizerParameters;
- (NSDictionary)updateParameters;
- (id)unarchiveUpdatableParamsAtURL:(id)a3 error:(id *)a4;
- (int64_t)lossType;
- (int64_t)optimizerType;
- (void)encodeWithCoder:(id)a3;
- (void)setLossParameters:(id)a3;
- (void)setLossType:(int64_t)a3;
- (void)setOptimizerParameters:(id)a3;
- (void)setOptimizerType:(int64_t)a3;
- (void)setTrainableLayerNames:(id)a3;
- (void)setUpdateParameters:(id)a3;
@end

@implementation MLNeuralNetworksCompileTimeParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_trainableLayerNames, 0);
  objc_storeStrong((id *)&self->_lossParameters, 0);

  objc_storeStrong((id *)&self->_optimizerParameters, 0);
}

- (void)setUpdateParameters:(id)a3
{
}

- (NSDictionary)updateParameters
{
  return self->_updateParameters;
}

- (void)setTrainableLayerNames:(id)a3
{
}

- (NSArray)trainableLayerNames
{
  return self->_trainableLayerNames;
}

- (void)setLossParameters:(id)a3
{
}

- (NSDictionary)lossParameters
{
  return self->_lossParameters;
}

- (void)setOptimizerParameters:(id)a3
{
}

- (NSDictionary)optimizerParameters
{
  return self->_optimizerParameters;
}

- (void)setOptimizerType:(int64_t)a3
{
  self->_optimizerType = a3;
}

- (int64_t)optimizerType
{
  return self->_optimizerType;
}

- (void)setLossType:(int64_t)a3
{
  self->_lossType = a3;
}

- (int64_t)lossType
{
  return self->_lossType;
}

- (id)unarchiveUpdatableParamsAtURL:(id)a3 error:(id *)a4
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5 options:2 error:a4];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    v11[3] = objc_opt_class();
    v11[4] = objc_opt_class();
    v11[5] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];
    [v7 addObjectsFromArray:v8];

    [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"MLNeuralNetworksCompileTimeParams"];
    v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v6 error:a4];
  }
  else if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"Error in unarchiving updatable params."];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)writeUpdatableParamsToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  v8 = v7;
  if (v7)
  {
    char v9 = [v7 writeToURL:v6 options:1 error:a4];
  }
  else if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"Error in archiving updatable params."];
    char v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (MLNeuralNetworksCompileTimeParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLNeuralNetworksCompileTimeParams;
  id v5 = [(MLNeuralNetworksCompileTimeParams *)&v15 init];
  if (v5)
  {
    v5->_lossType = [v4 decodeIntegerForKey:@"lossType"];
    v5->_optimizerType = [v4 decodeIntegerForKey:@"optimizerType"];
    uint64_t v6 = [v4 decodeObjectForKey:@"optimizerParameters"];
    optimizerParameters = v5->_optimizerParameters;
    v5->_optimizerParameters = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"lossParameters"];
    lossParameters = v5->_lossParameters;
    v5->_lossParameters = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"trainableLayerNames"];
    trainableLayerNames = v5->_trainableLayerNames;
    v5->_trainableLayerNames = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"updateParameters"];
    updateParameters = v5->_updateParameters;
    v5->_updateParameters = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[MLNeuralNetworksCompileTimeParams lossType](self, "lossType"), @"lossType");
  objc_msgSend(v8, "encodeInteger:forKey:", -[MLNeuralNetworksCompileTimeParams optimizerType](self, "optimizerType"), @"optimizerType");
  id v4 = [(MLNeuralNetworksCompileTimeParams *)self optimizerParameters];
  [v8 encodeObject:v4 forKey:@"optimizerParameters"];

  id v5 = [(MLNeuralNetworksCompileTimeParams *)self lossParameters];
  [v8 encodeObject:v5 forKey:@"lossParameters"];

  uint64_t v6 = [(MLNeuralNetworksCompileTimeParams *)self trainableLayerNames];
  [v8 encodeObject:v6 forKey:@"trainableLayerNames"];

  id v7 = [(MLNeuralNetworksCompileTimeParams *)self updateParameters];
  [v8 encodeObject:v7 forKey:@"updateParameters"];
}

- (MLNeuralNetworksCompileTimeParams)initWithLossType:(int64_t)a3 optimizerType:(int64_t)a4 optimizerParameters:(id)a5 lossParameters:(id)a6 trainableLayerNames:(id)a7 updateParameters:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MLNeuralNetworksCompileTimeParams;
  v18 = [(MLNeuralNetworksCompileTimeParams *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_lossType = a3;
    v18->_optimizerType = a4;
    objc_storeStrong((id *)&v18->_optimizerParameters, a5);
    objc_storeStrong((id *)&v19->_lossParameters, a6);
    objc_storeStrong((id *)&v19->_trainableLayerNames, a7);
    objc_storeStrong((id *)&v19->_updateParameters, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end