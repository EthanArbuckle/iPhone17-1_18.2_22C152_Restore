@interface _VNImageAnalyzerMultiDetectorSceneOperationPointsProvider
- (_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider)initWithOperationPointsCache:(id)a3 originatingRequestSpecifier:(id)a4;
- (id)operationPointsAndReturnError:(id *)a3;
@end

@implementation _VNImageAnalyzerMultiDetectorSceneOperationPointsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);

  objc_storeStrong((id *)&self->_operationPointsCache, 0);
}

- (id)operationPointsAndReturnError:(id *)a3
{
  return [(_VNImageAnalyzerMultiDetectorSceneOperationPointsCache *)self->_operationPointsCache sceneLabelOperationPointsForOriginatingRequestSpecifier:self->_originatingRequestSpecifier error:a3];
}

- (_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider)initWithOperationPointsCache:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider;
  v9 = [(_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operationPointsCache, a3);
    objc_storeStrong((id *)&v10->_originatingRequestSpecifier, a4);
  }

  return v10;
}

@end