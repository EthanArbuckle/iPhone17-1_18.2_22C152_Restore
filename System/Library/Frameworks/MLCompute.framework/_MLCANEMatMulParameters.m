@interface _MLCANEMatMulParameters
+ (id)matMulUnitParametersWith:(id)a3 transposeXParams:(id)a4 transposeYParams:(id)a5 finalTransposeParams:(id)a6 gocParams:(id)a7;
- (NSDictionary)finalTransposeParams;
- (NSDictionary)gocParams;
- (NSDictionary)matMulParams;
- (NSDictionary)transposeXParams;
- (NSDictionary)transposeYParams;
- (_MLCANEMatMulParameters)initWithMatMulParams:(id)a3 transposeXParams:(id)a4 transposeYParams:(id)a5 finalTransposeParams:(id)a6 gocParams:(id)a7;
@end

@implementation _MLCANEMatMulParameters

+ (id)matMulUnitParametersWith:(id)a3 transposeXParams:(id)a4 transposeYParams:(id)a5 finalTransposeParams:(id)a6 gocParams:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) initWithMatMulParams:v16 transposeXParams:v15 transposeYParams:v14 finalTransposeParams:v13 gocParams:v12];

  return v17;
}

- (_MLCANEMatMulParameters)initWithMatMulParams:(id)a3 transposeXParams:(id)a4 transposeYParams:(id)a5 finalTransposeParams:(id)a6 gocParams:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_MLCANEMatMulParameters;
  v17 = [(_MLCANEMatMulParameters *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_matMulParams, a3);
    objc_storeStrong((id *)&v18->_transposeXParams, a4);
    objc_storeStrong((id *)&v18->_transposeYParams, a5);
    objc_storeStrong((id *)&v18->_finalTransposeParams, a6);
    objc_storeStrong((id *)&v18->_gocParams, a7);
  }

  return v18;
}

- (NSDictionary)matMulParams
{
  return self->_matMulParams;
}

- (NSDictionary)transposeXParams
{
  return self->_transposeXParams;
}

- (NSDictionary)transposeYParams
{
  return self->_transposeYParams;
}

- (NSDictionary)finalTransposeParams
{
  return self->_finalTransposeParams;
}

- (NSDictionary)gocParams
{
  return self->_gocParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gocParams, 0);
  objc_storeStrong((id *)&self->_finalTransposeParams, 0);
  objc_storeStrong((id *)&self->_transposeYParams, 0);
  objc_storeStrong((id *)&self->_transposeXParams, 0);

  objc_storeStrong((id *)&self->_matMulParams, 0);
}

@end