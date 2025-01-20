@interface PKInkFunction
- (NSMutableArray)controlPoints;
- (NSMutableArray)inputPoints;
- (NSMutableArray)maxOutputPoints;
- (NSMutableArray)minOutputPoints;
- (NSMutableArray)outputPoints;
- (PKInkFunction)initWithInputPoints:(id)a3 outputPoints:(id)a4 functionType:(unint64_t)a5;
- (PKInkFunction)initWithProperty:(unint64_t)a3 input:(unint64_t)a4 inputMask:(unint64_t)a5 deviceMask:(unint64_t)a6 inputPoints:(id)a7 minOutputPoints:(id)a8 maxOutputPoints:(id)a9 outputPoints:(id)a10 controlPoints:(id)a11 functionType:(unint64_t)a12;
- (double)solveForInput:(double)a3;
- (id)description;
- (unint64_t)deviceMask;
- (unint64_t)functionType;
- (unint64_t)inkInput;
- (unint64_t)inkProperty;
- (unint64_t)inputMask;
- (void)setControlPoints:(id)a3;
- (void)setDeviceMask:(unint64_t)a3;
- (void)setFunctionType:(unint64_t)a3;
- (void)setInkInput:(unint64_t)a3;
- (void)setInkProperty:(unint64_t)a3;
- (void)setInputMask:(unint64_t)a3;
- (void)setInputPoints:(id)a3;
- (void)setMaxOutputPoints:(id)a3;
- (void)setMinOutputPoints:(id)a3;
- (void)setOutputPoints:(id)a3;
@end

@implementation PKInkFunction

- (PKInkFunction)initWithProperty:(unint64_t)a3 input:(unint64_t)a4 inputMask:(unint64_t)a5 deviceMask:(unint64_t)a6 inputPoints:(id)a7 minOutputPoints:(id)a8 maxOutputPoints:(id)a9 outputPoints:(id)a10 controlPoints:(id)a11 functionType:(unint64_t)a12
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v26 = a10;
  id v18 = a11;
  v27.receiver = self;
  v27.super_class = (Class)PKInkFunction;
  v19 = [(PKInkFunction *)&v27 init];
  v20 = v19;
  if (v19)
  {
    v19->_inkProperty = a3;
    v19->_inkInput = a4;
    v19->_inputMask = a5;
    v19->_deviceMask = a6;
    objc_storeStrong((id *)&v19->_inputPoints, a7);
    objc_storeStrong((id *)&v20->_outputPoints, a10);
    objc_storeStrong((id *)&v20->_controlPoints, a11);
    objc_storeStrong((id *)&v20->_minOutputPoints, a8);
    objc_storeStrong((id *)&v20->_maxOutputPoints, a9);
    v20->_functionType = a12;
  }

  return v20;
}

- (PKInkFunction)initWithInputPoints:(id)a3 outputPoints:(id)a4 functionType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKInkFunction;
  v11 = [(PKInkFunction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputPoints, a3);
    objc_storeStrong((id *)&v12->_outputPoints, a4);
    objc_storeStrong((id *)&v12->_minOutputPoints, a4);
    objc_storeStrong((id *)&v12->_maxOutputPoints, a4);
    v12->_functionType = a5;
  }

  return v12;
}

- (void)setControlPoints:(id)a3
{
  id v18 = a3;
  p_controlPoints = &self->_controlPoints;
  objc_storeStrong((id *)&self->_controlPoints, a3);
  self->_functionType = 0;
  if ([(NSMutableArray *)self->_controlPoints count] == 4)
  {
    v6 = [(NSMutableArray *)*p_controlPoints objectAtIndexedSubscript:0];
    [v6 floatValue];
    float v8 = v7;
    id v9 = [(NSMutableArray *)*p_controlPoints objectAtIndexedSubscript:1];
    [v9 floatValue];
    float v11 = v10;
    v12 = [(NSMutableArray *)*p_controlPoints objectAtIndexedSubscript:2];
    [v12 floatValue];
    float v14 = v13;
    id v15 = [(NSMutableArray *)*p_controlPoints objectAtIndexedSubscript:3];
    [v15 floatValue];
    double v17 = v16;

    self->_functionType = +[PKInkProperties functionTypeForBezierControlPoints:](PKInkProperties, "functionTypeForBezierControlPoints:", v8, v11, v14, v17);
  }
}

- (double)solveForInput:(double)a3
{
  +[PKInkBehavior outputFunctionFromInkFunction:self];
  v4 = v8;
  double v5 = (**v8)(v8, a3, 0.0);
  ((void (*)(double (***)(void, double, double)))(*v4)[5])(v4);
  return v5;
}

- (id)description
{
  v3 = +[PKInkProperties inkPropertyNames];
  v4 = [NSNumber numberWithUnsignedInteger:self->_inkProperty];
  double v5 = [v3 allKeysForObject:v4];
  v6 = [v5 objectAtIndexedSubscript:0];

  float v7 = +[PKInkProperties inputNames];
  float v8 = [NSNumber numberWithUnsignedInteger:self->_inkInput];
  id v9 = [v7 allKeysForObject:v8];
  float v10 = [v9 objectAtIndexedSubscript:0];

  float v11 = [NSString stringWithFormat:@"<PKInkFunction: %p %@ -> %@>", self, v10, v6];

  return v11;
}

- (unint64_t)inkProperty
{
  return self->_inkProperty;
}

- (void)setInkProperty:(unint64_t)a3
{
  self->_inkProperty = a3;
}

- (unint64_t)inkInput
{
  return self->_inkInput;
}

- (void)setInkInput:(unint64_t)a3
{
  self->_inkInput = a3;
}

- (unint64_t)inputMask
{
  return self->_inputMask;
}

- (void)setInputMask:(unint64_t)a3
{
  self->_inputMask = a3;
}

- (unint64_t)deviceMask
{
  return self->_deviceMask;
}

- (void)setDeviceMask:(unint64_t)a3
{
  self->_deviceMask = a3;
}

- (NSMutableArray)inputPoints
{
  return self->_inputPoints;
}

- (void)setInputPoints:(id)a3
{
}

- (NSMutableArray)minOutputPoints
{
  return self->_minOutputPoints;
}

- (void)setMinOutputPoints:(id)a3
{
}

- (NSMutableArray)maxOutputPoints
{
  return self->_maxOutputPoints;
}

- (void)setMaxOutputPoints:(id)a3
{
}

- (NSMutableArray)outputPoints
{
  return self->_outputPoints;
}

- (void)setOutputPoints:(id)a3
{
}

- (unint64_t)functionType
{
  return self->_functionType;
}

- (void)setFunctionType:(unint64_t)a3
{
  self->_functionType = a3;
}

- (NSMutableArray)controlPoints
{
  return self->_controlPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPoints, 0);
  objc_storeStrong((id *)&self->_outputPoints, 0);
  objc_storeStrong((id *)&self->_maxOutputPoints, 0);
  objc_storeStrong((id *)&self->_minOutputPoints, 0);

  objc_storeStrong((id *)&self->_inputPoints, 0);
}

@end