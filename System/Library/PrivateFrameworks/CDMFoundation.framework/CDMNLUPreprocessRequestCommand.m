@interface CDMNLUPreprocessRequestCommand
+ (Class)innerProtoType;
+ (id)innerProtoPropertyName;
+ (id)serviceGraphName;
- (CDMNLUPreprocessRequestCommand)initWithNLURequest:(id)a3;
- (SIRINLUEXTERNALCDMNluRequest)siriNLUTypeObj;
@end

@implementation CDMNLUPreprocessRequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUEXTERNALCDMNluRequest)siriNLUTypeObj
{
  return self->_siriNLUTypeObj;
}

- (CDMNLUPreprocessRequestCommand)initWithNLURequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMNLUPreprocessRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_siriNLUTypeObj, a3);
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
  return @"siriNLUTypeObj";
}

@end