@interface _VNCoreMLOperationPoints
- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5;
- (_VNCoreMLOperationPoints)initWithClassLabels:(id)a3 precisionRecallCurves:(id)a4;
@end

@implementation _VNCoreMLOperationPoints

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionRecallCurves, 0);

  objc_storeStrong((id *)&self->_classLabels, 0);
}

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  NSUInteger v9 = [(NSArray *)self->_classLabels indexOfObject:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      [(id)objc_opt_class() errorForUnknownClassificationIdentifier:v8];
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    v11 = [(NSArray *)self->_precisionRecallCurves objectAtIndex:v9];
    v12 = (void *)MEMORY[0x1E4FB3F58];
    v13 = [v11 precisionValues];
    v14 = [v11 precisionConfidenceThresholds];
    v15 = [v12 curveWithValuesArray:v13 confidencesArray:v14 error:a5];

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4FB3F58];
      v17 = [v11 recallValues];
      v18 = [v11 recallConfidenceThresholds];
      v19 = [v16 curveWithValuesArray:v17 confidencesArray:v18 error:a5];

      BOOL v10 = v19 != 0;
      if (v19)
      {
        id v20 = (id) [objc_alloc(MEMORY[0x1E4FB3E68]) initWithPrecisionCurve:v15 recallCurve:v19];
        *a3 = v20;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (_VNCoreMLOperationPoints)initWithClassLabels:(id)a3 precisionRecallCurves:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_VNCoreMLOperationPoints;
  id v8 = [(_VNCoreMLOperationPoints *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    classLabels = v8->_classLabels;
    v8->_classLabels = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    precisionRecallCurves = v8->_precisionRecallCurves;
    v8->_precisionRecallCurves = (NSArray *)v11;
  }
  return v8;
}

@end