@interface MLAppleImageFeatureExtractorObjectPrintParameters
- (NSArray)expectedKeys;
- (NSArray)expectedShapes;
- (id)initObjectPrintParameters:(unint64_t)a3 expectedShapes:(id)a4 expectedKeys:(id)a5 error:(id *)a6;
- (unint64_t)objectPrintVersion;
@end

@implementation MLAppleImageFeatureExtractorObjectPrintParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedKeys, 0);

  objc_storeStrong((id *)&self->_expectedShapes, 0);
}

- (NSArray)expectedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)expectedShapes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)objectPrintVersion
{
  return self->_objectPrintVersion;
}

- (id)initObjectPrintParameters:(unint64_t)a3 expectedShapes:(id)a4 expectedKeys:(id)a5 error:(id *)a6
{
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLAppleImageFeatureExtractorObjectPrintParameters;
  v13 = [(MLAppleImageFeatureExtractorObjectPrintParameters *)&v17 init];
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    v13->_objectPrintVersion = a3;
    objc_storeStrong((id *)&v13->_expectedShapes, a4);
    objc_storeStrong(p_isa + 3, a5);
    v15 = p_isa;
  }
  else if (a6)
  {
    *a6 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of sceneprint parameters failed"];
  }

  return p_isa;
}

@end