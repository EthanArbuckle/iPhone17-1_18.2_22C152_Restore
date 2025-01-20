@interface LACProcessingConfiguration
+ (id)defaultConfiguration;
- (LACEvaluationRequestProcessor)nextProcessor;
- (LACProcessingConfiguration)initWithNextProcessor:(id)a3;
@end

@implementation LACProcessingConfiguration

- (void).cxx_destruct
{
}

- (LACEvaluationRequestProcessor)nextProcessor
{
  return self->_nextProcessor;
}

+ (id)defaultConfiguration
{
  v2 = [LACProcessingConfiguration alloc];
  v3 = objc_opt_new();
  v4 = [(LACProcessingConfiguration *)v2 initWithNextProcessor:v3];

  return v4;
}

- (LACProcessingConfiguration)initWithNextProcessor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACProcessingConfiguration;
  v6 = [(LACProcessingConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nextProcessor, a3);
  }

  return v7;
}

@end