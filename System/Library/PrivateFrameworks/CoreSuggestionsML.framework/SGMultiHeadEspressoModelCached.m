@interface SGMultiHeadEspressoModelCached
+ (id)classifierWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5;
- (SGMultiHeadEspressoModelCached)initWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5;
- (id)headDimensionality;
- (id)predict:(id)a3;
- (id)predict:(id)a3 heads:(id)a4;
- (unint64_t)inputNumParameters;
@end

@implementation SGMultiHeadEspressoModelCached

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

- (id)headDimensionality
{
  v3 = +[SGMultiHeadEspressoModelCache sharedInstance];
  v4 = [v3 headDimensionalityWithFile:self->_espressoModelFile inputName:self->_inputName headDimensionality:self->_headDimensionality];

  return v4;
}

- (unint64_t)inputNumParameters
{
  v3 = +[SGMultiHeadEspressoModelCache sharedInstance];
  unint64_t v4 = [v3 inputNumParametersWithFile:self->_espressoModelFile inputName:self->_inputName headDimensionality:self->_headDimensionality];

  return v4;
}

- (id)predict:(id)a3
{
  id v4 = a3;
  v5 = +[SGMultiHeadEspressoModelCache sharedInstance];
  v6 = [v5 predict:v4 withFile:self->_espressoModelFile inputName:self->_inputName headDimensionality:self->_headDimensionality];

  return v6;
}

- (id)predict:(id)a3 heads:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[SGMultiHeadEspressoModelCache sharedInstance];
  v9 = [v8 predict:v7 heads:v6 withFile:self->_espressoModelFile inputName:self->_inputName headDimensionality:self->_headDimensionality];

  return v9;
}

- (SGMultiHeadEspressoModelCached)initWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMultiHeadEspressoModelCached;
  v12 = [(SGMultiHeadEspressoModelCached *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_espressoModelFile, a3);
    objc_storeStrong((id *)&v13->_inputName, a4);
    objc_storeStrong((id *)&v13->_headDimensionality, a5);
  }

  return v13;
}

+ (id)classifierWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length]
    && (+[SGMultiHeadEspressoModelCache sharedInstance],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 setCachedEspressoClassifierWithFile:v8 inputName:v9 headDimensionality:v10],
        v11,
        v12))
  {
    v13 = (void *)[objc_alloc((Class)a1) initWithEspressoModelFile:v8 inputName:v9 headDimensionality:v10];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end