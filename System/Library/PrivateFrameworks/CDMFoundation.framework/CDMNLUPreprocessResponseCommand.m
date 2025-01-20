@interface CDMNLUPreprocessResponseCommand
+ (Class)innerProtoType;
+ (id)innerProtoPropertyName;
+ (id)serviceGraphName;
- (CDMNLUPreprocessResponseCommand)initWithPreprocessingWrapper:(id)a3;
- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper;
@end

@implementation CDMNLUPreprocessResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper
{
  return self->_preprocessingWrapper;
}

- (CDMNLUPreprocessResponseCommand)initWithPreprocessingWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMNLUPreprocessResponseCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preprocessingWrapper, a3);
  }

  return v7;
}

+ (id)serviceGraphName
{
  return @"CDMNLUPreprocessGraph";
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)innerProtoPropertyName
{
  return @"preprocessingWrapper";
}

@end