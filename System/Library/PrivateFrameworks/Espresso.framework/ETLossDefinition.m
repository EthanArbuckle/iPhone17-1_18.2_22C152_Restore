@interface ETLossDefinition
+ (id)BuiltInLoss:(id)a3;
+ (id)L2LossWithInputName:(id)a3 targetInputName:(id)a4 lossOutputName:(id)a5;
+ (id)crossEntropyLossWithInputName:(id)a3 targetInputName:(id)a4 lossOutputName:(id)a5;
- (ETLossDefinition)initWithMode:(unint64_t)a3 inputName:(id)a4 targetName:(id)a5 lossOutputName:(id)a6;
- (NSString)inputName;
- (NSString)lossOutputName;
- (NSString)outputName;
- (NSString)targetInputName;
- (unint64_t)mode;
- (void)setOutputName:(id)a3;
@end

@implementation ETLossDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_lossOutputName, 0);
  objc_storeStrong((id *)&self->_targetInputName, 0);

  objc_storeStrong((id *)&self->_inputName, 0);
}

- (void)setOutputName:(id)a3
{
}

- (NSString)outputName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)lossOutputName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)targetInputName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)inputName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (ETLossDefinition)initWithMode:(unint64_t)a3 inputName:(id)a4 targetName:(id)a5 lossOutputName:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ETLossDefinition;
  v14 = [(ETLossDefinition *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_inputName, a4);
    objc_storeStrong((id *)&v15->_targetInputName, a5);
    objc_storeStrong((id *)&v15->_lossOutputName, a6);
  }

  return v15;
}

+ (id)BuiltInLoss:(id)a3
{
  id v3 = a3;
  v4 = [[ETLossDefinition alloc] initWithMode:3 inputName:0 targetName:0 lossOutputName:v3];

  return v4;
}

+ (id)L2LossWithInputName:(id)a3 targetInputName:(id)a4 lossOutputName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[ETLossDefinition alloc] initWithMode:2 inputName:v9 targetName:v8 lossOutputName:v7];

  return v10;
}

+ (id)crossEntropyLossWithInputName:(id)a3 targetInputName:(id)a4 lossOutputName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[ETLossDefinition alloc] initWithMode:1 inputName:v9 targetName:v8 lossOutputName:v7];

  return v10;
}

@end