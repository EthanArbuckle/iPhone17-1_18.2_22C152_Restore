@interface _AXMVisionEngineAnalysisTask
+ (id)itemWithSource:(id)a3 context:(id)a4;
- (AXMSourceNode)source;
- (AXMVisionPipelineContext)context;
- (NSUUID)identifier;
- (_AXMVisionEngineAnalysisTask)initWithSource:(id)a3 context:(id)a4;
- (void)setContext:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation _AXMVisionEngineAnalysisTask

+ (id)itemWithSource:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_AXMVisionEngineAnalysisTask alloc] initWithSource:v6 context:v5];

  return v7;
}

- (_AXMVisionEngineAnalysisTask)initWithSource:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AXMVisionEngineAnalysisTask;
  v8 = [(_AXMVisionEngineAnalysisTask *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(_AXMVisionEngineAnalysisTask *)v8 setSource:v6];
    [(_AXMVisionEngineAnalysisTask *)v9 setContext:v7];
    v10 = [MEMORY[0x1E4F29128] UUID];
    [(_AXMVisionEngineAnalysisTask *)v9 setIdentifier:v10];
  }
  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (AXMVisionPipelineContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AXMSourceNode)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end