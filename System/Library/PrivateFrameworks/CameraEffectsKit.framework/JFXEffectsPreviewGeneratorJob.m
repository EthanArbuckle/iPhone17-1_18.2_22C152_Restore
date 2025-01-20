@interface JFXEffectsPreviewGeneratorJob
- (JFXEffectsPreviewGeneratorJob)init;
- (JFXEffectsPreviewGeneratorJob)initWithRenderOutputs:(id)a3 callbackKeys:(id)a4;
- (NSArray)callbackKeys;
- (NSArray)outputNodes;
@end

@implementation JFXEffectsPreviewGeneratorJob

- (JFXEffectsPreviewGeneratorJob)init
{
  return [(JFXEffectsPreviewGeneratorJob *)self initWithRenderOutputs:0 callbackKeys:0];
}

- (JFXEffectsPreviewGeneratorJob)initWithRenderOutputs:(id)a3 callbackKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectsPreviewGeneratorJob;
  v9 = [(JFXEffectsPreviewGeneratorJob *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputNodes, a3);
    objc_storeStrong((id *)&v10->_callbackKeys, a4);
  }

  return v10;
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- (NSArray)callbackKeys
{
  return self->_callbackKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackKeys, 0);
  objc_storeStrong((id *)&self->_outputNodes, 0);
}

@end