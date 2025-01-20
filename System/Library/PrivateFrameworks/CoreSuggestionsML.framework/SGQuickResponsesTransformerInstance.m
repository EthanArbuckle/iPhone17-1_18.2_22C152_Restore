@interface SGQuickResponsesTransformerInstance
- (PMLTransformerProtocol)featurizer;
- (PMLTransformerProtocol)labeler;
- (SGModelSampler)sampler;
- (SGModelSource)source;
- (SGQuickResponsesConfig)config;
- (SGQuickResponsesTransformerInstance)initWithConfig:(id)a3 featurizer:(id)a4 source:(id)a5 labeler:(id)a6 sampler:(id)a7;
@end

@implementation SGQuickResponsesTransformerInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_labeler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (SGModelSampler)sampler
{
  return self->_sampler;
}

- (PMLTransformerProtocol)labeler
{
  return self->_labeler;
}

- (SGModelSource)source
{
  return self->_source;
}

- (PMLTransformerProtocol)featurizer
{
  return self->_featurizer;
}

- (SGQuickResponsesConfig)config
{
  return self->_config;
}

- (SGQuickResponsesTransformerInstance)initWithConfig:(id)a3 featurizer:(id)a4 source:(id)a5 labeler:(id)a6 sampler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id obj = a7;
  id v16 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 415, @"Invalid parameter not satisfying: %@", @"config" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 416, @"Invalid parameter not satisfying: %@", @"featurizer" object file lineNumber description];

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_15:
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 417, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

  if (v15) {
    goto LABEL_7;
  }
LABEL_5:
  if ([v12 mode] != 1)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 418, @"Invalid parameter not satisfying: %@", @"labeler != nil || config.mode == SGModelModePrediction" object file lineNumber description];
  }
LABEL_7:
  if (!v16 && [v12 mode] != 1)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SGQuickResponsesModel.m", 419, @"Invalid parameter not satisfying: %@", @"sampler != nil || config.mode == SGModelModePrediction" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)SGQuickResponsesTransformerInstance;
  v17 = [(SGQuickResponsesTransformerInstance *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_config, a3);
    objc_storeStrong((id *)&v18->_featurizer, a4);
    objc_storeStrong((id *)&v18->_source, a5);
    objc_storeStrong((id *)&v18->_labeler, a6);
    objc_storeStrong((id *)&v18->_sampler, obj);
  }

  return v18;
}

@end