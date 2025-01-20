@interface VNOperationPoints
+ (BOOL)supportsSecureCoding;
+ (id)errorForUnimplementedMethod:(SEL)a3;
+ (id)errorForUnknownClassificationIdentifier:(id)a3;
+ (id)loadFromURL:(id)a3 error:(id *)a4;
+ (id)operationPointsForMLModel:(id)a3 error:(id *)p_isa;
+ (id)unspecifiedOperationPoints;
- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5;
- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6;
- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6;
- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5;
- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6;
- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6;
- (VNOperationPoints)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNOperationPoints

- (VNOperationPoints)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  [v5 failWithError:v6];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  [v4 failWithError:v5];
}

- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  }
  return 0;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  }
  return 0;
}

- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  }
  return 0;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  }
  return 0;
}

- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [(id)objc_opt_class() errorForUnimplementedMethod:a2];
  }
  return 0;
}

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  if (a5)
  {
    v6 = [NSString stringWithFormat:@"no operating points for identifier \"%@\"", a4];
    *a5 = +[VNError errorForDataUnavailableWithLocalizedDescription:v6];
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [a1 errorForUnimplementedMethod:a2];
  }
  return 0;
}

+ (id)unspecifiedOperationPoints
{
  v2 = objc_alloc_init(_VNUnspecifiedOperationPoints);

  return v2;
}

+ (id)errorForUnknownClassificationIdentifier:(id)a3
{
  v3 = [NSString stringWithFormat:@"unknown classification identifier \"%@\"", a3];
  id v4 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v3];

  return v4;
}

+ (id)errorForUnimplementedMethod:(SEL)a3
{
  id v4 = NSString;
  id v5 = NSStringFromClass((Class)a1);
  v6 = NSStringFromSelector(a3);
  v7 = [v4 stringWithFormat:@"%@ must implement %@", v5, v6];

  v8 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v7];

  return v8;
}

+ (id)operationPointsForMLModel:(id)a3 error:(id *)p_isa
{
  id v5 = a3;
  v6 = [v5 modelDescription];
  v7 = [v6 classLabels];
  if (!v7)
  {
    p_isa = +[VNOperationPoints unspecifiedOperationPoints];
    goto LABEL_11;
  }
  v8 = [MEMORY[0x1E4F1E9D0] precisionRecallCurves];
  v9 = [v5 parameterValueForKey:v8 error:0];

  if (v9)
  {
    uint64_t v10 = [v7 count];
    if (v10 != [v9 count])
    {
      if (p_isa)
      {
        id v12 = [NSString alloc];
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v15 = (void *)[v12 initWithFormat:@"%@ has a mismatch of %@ class labels and %@ precision/recall curve entries", v5, v13, v14];

        *p_isa = +[VNError errorForInvalidModelWithLocalizedDescription:v15];

        p_isa = 0;
      }
      goto LABEL_10;
    }
    v11 = [[_VNCoreMLOperationPoints alloc] initWithClassLabels:v7 precisionRecallCurves:v9];
  }
  else
  {
    v11 = +[VNOperationPoints unspecifiedOperationPoints];
  }
  p_isa = (id *)&v11->super.super.isa;
LABEL_10:

LABEL_11:

  return p_isa;
}

@end