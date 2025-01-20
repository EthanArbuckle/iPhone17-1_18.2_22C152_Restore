@interface CDMSsuInferenceGraphResponseCommand
+ (Class)innerProtoType;
+ (id)innerProtoPropertyName;
+ (id)serviceGraphName;
- (CDMSsuInferenceGraphResponseCommand)initWithSsuResponse:(id)a3;
- (SIRINLUEXTERNALSSU_INFERENCESsuInferenceResponse)ssuResponse;
@end

@implementation CDMSsuInferenceGraphResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUEXTERNALSSU_INFERENCESsuInferenceResponse)ssuResponse
{
  return self->_ssuResponse;
}

- (CDMSsuInferenceGraphResponseCommand)initWithSsuResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSsuInferenceGraphResponseCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ssuResponse, a3);
  }

  return v7;
}

+ (id)serviceGraphName
{
  return @"CDMSsuInferenceServiceGraph";
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)innerProtoPropertyName
{
  return @"ssuResponse";
}

@end