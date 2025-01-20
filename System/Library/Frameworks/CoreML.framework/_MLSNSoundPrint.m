@interface _MLSNSoundPrint
- (MLModelDescription)modelDescription;
- (_MLSNSoundPrint)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _MLSNSoundPrint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);

  objc_storeStrong((id *)&self->_featureEmbeddingModel, 0);
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return (id)[(MLCustomModel *)self->_featureEmbeddingModel predictionFromFeatures:a3 options:a4 error:a5];
}

- (_MLSNSoundPrint)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = +[_MLSNFrameworkHandle sharedHandle];
  if (!v11)
  {
    if (!a5) {
      goto LABEL_17;
    }
    v17 = @"Framework not available on this version.";
LABEL_16:
    +[MLModelErrorUtils errorWithCode:5 format:v17];
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!NSClassFromString(&cfstr_Snsoundprintaf.isa))
  {
    if (!a5) {
      goto LABEL_17;
    }
    v17 = @"Sound Print not available on this version.";
    goto LABEL_16;
  }
  if (([NSClassFromString(&cfstr_Snsoundprintaf.isa) conformsToProtocol:&unk_1EF11E650] & 1) == 0)
  {
    if (!a5) {
      goto LABEL_17;
    }
    v17 = @"Sound print model does not conform to custom model protocol.";
    goto LABEL_16;
  }
  v19.receiver = self;
  v19.super_class = (Class)_MLSNSoundPrint;
  self = [(_MLSNSoundPrint *)&v19 init];
  if (self)
  {
    v12 = (MLCustomModel *)objc_alloc(NSClassFromString(&cfstr_Snsoundprintaf.isa));
    featureEmbeddingModel = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v12;

    v14 = [(MLCustomModel *)self->_featureEmbeddingModel initWithModelDescription:v9 parameterDictionary:v10 error:a5];
    v15 = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v14;

    if (self->_featureEmbeddingModel)
    {
      objc_storeStrong((id *)&self->_modelDescription, a3);
      goto LABEL_7;
    }
    if (a5)
    {
      v17 = @"Sound print failed to init.";
      goto LABEL_16;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
LABEL_7:
  self = self;
  v16 = self;
LABEL_18:

  return v16;
}

@end