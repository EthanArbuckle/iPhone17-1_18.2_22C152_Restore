@interface MLCompilerEvent
- (MLCompilerEvent)init;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)milUpgradeStatus;
- (NSNumber)modelOrigin;
- (NSNumber)modelType;
- (NSString)compilerVersion;
- (NSString)milUpgradeFailureReason;
- (NSString)modelCompiledWithVersion;
- (NSString)modelHash;
- (NSString)modelName;
- (NSString)modelVersion;
- (NSString)name;
- (void)setCompilerVersion:(id)a3;
- (void)setMilUpgradeFailureReason:(id)a3;
- (void)setMilUpgradeStatus:(id)a3;
- (void)setModelCompiledWithVersion:(id)a3;
- (void)setModelHash:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelOrigin:(id)a3;
- (void)setModelType:(id)a3;
- (void)setModelVersion:(id)a3;
@end

@implementation MLCompilerEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milUpgradeFailureReason, 0);
  objc_storeStrong((id *)&self->_milUpgradeStatus, 0);
  objc_storeStrong((id *)&self->_compilerVersion, 0);
  objc_storeStrong((id *)&self->_modelCompiledWithVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelOrigin, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelHash, 0);

  objc_storeStrong((id *)&self->_modelName, 0);
}

- (void)setMilUpgradeFailureReason:(id)a3
{
}

- (NSString)milUpgradeFailureReason
{
  return self->_milUpgradeFailureReason;
}

- (void)setMilUpgradeStatus:(id)a3
{
}

- (NSNumber)milUpgradeStatus
{
  return self->_milUpgradeStatus;
}

- (void)setCompilerVersion:(id)a3
{
}

- (NSString)compilerVersion
{
  return self->_compilerVersion;
}

- (void)setModelCompiledWithVersion:(id)a3
{
}

- (NSString)modelCompiledWithVersion
{
  return self->_modelCompiledWithVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelOrigin:(id)a3
{
}

- (NSNumber)modelOrigin
{
  return self->_modelOrigin;
}

- (void)setModelType:(id)a3
{
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (void)setModelHash:(id)a3
{
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(MLCompilerEvent *)self modelName];
  [v3 setObject:v4 forKeyedSubscript:@"modelName"];

  v5 = [(MLCompilerEvent *)self modelHash];
  [v3 setObject:v5 forKeyedSubscript:@"modelHash"];

  v6 = [(MLCompilerEvent *)self modelType];
  [v3 setObject:v6 forKeyedSubscript:@"modelType"];

  v7 = [(MLCompilerEvent *)self modelOrigin];
  [v3 setObject:v7 forKeyedSubscript:@"modelOrigin"];

  v8 = [(MLCompilerEvent *)self modelVersion];
  [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];

  v9 = [(MLCompilerEvent *)self modelCompiledWithVersion];
  [v3 setObject:v9 forKeyedSubscript:@"modelCompiledWithVersion"];

  v10 = [(MLCompilerEvent *)self compilerVersion];
  [v3 setObject:v10 forKeyedSubscript:@"compilerVersion"];

  v11 = [(MLCompilerEvent *)self milUpgradeStatus];
  [v3 setObject:v11 forKeyedSubscript:@"milUpgradeStatus"];

  v12 = [(MLCompilerEvent *)self milUpgradeFailureReason];
  [v3 setObject:v12 forKeyedSubscript:@"milUpgradeFailureReason"];

  return (NSDictionary *)v3;
}

- (NSString)name
{
  v2 = @"com.apple.CoreML.MLCompiler";
  return (NSString *)@"com.apple.CoreML.MLCompiler";
}

- (MLCompilerEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MLCompilerEvent;
  v2 = [(MLCompilerEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    modelName = v2->_modelName;
    v2->_modelName = 0;
  }
  return v3;
}

@end