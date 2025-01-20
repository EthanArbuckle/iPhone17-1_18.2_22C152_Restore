@interface CSUDetectionPrintNetworkOutput
- (CSUDetectionPrintNetworkOutput)initWithDetectionPrintPerTapPoint:(id)a3;
- (NSArray)availableTapPointNames;
- (NSDictionary)detectionPrintPerTapPoint;
- (id)detectionPrintFeatureForTapPointName:(id)a3 error:(id *)a4;
@end

@implementation CSUDetectionPrintNetworkOutput

- (id)detectionPrintFeatureForTapPointName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10 = objc_msgSend_objectForKeyedSubscript_(self->_detectionPrintPerTapPoint, v7, (uint64_t)v6, v8, v9);

  if (v10)
  {
    v14 = objc_msgSend_objectForKeyedSubscript_(self->_detectionPrintPerTapPoint, v11, (uint64_t)v6, v12, v13);
  }
  else if (a4)
  {
    objc_msgSend_errorForInvalidArgument_named_(CSUError, v11, (uint64_t)v6, @"DetectionPrintTapPointName", v13);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CSUDetectionPrintNetworkOutput)initWithDetectionPrintPerTapPoint:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUDetectionPrintNetworkOutput;
  id v6 = [(CSUDetectionPrintNetworkOutput *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_detectionPrintPerTapPoint, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

- (NSArray)availableTapPointNames
{
  return (NSArray *)objc_msgSend_allKeys(self->_detectionPrintPerTapPoint, a2, v2, v3, v4);
}

- (NSDictionary)detectionPrintPerTapPoint
{
  return self->_detectionPrintPerTapPoint;
}

- (void).cxx_destruct
{
}

@end