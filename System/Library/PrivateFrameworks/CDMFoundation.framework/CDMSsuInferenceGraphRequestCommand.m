@interface CDMSsuInferenceGraphRequestCommand
+ (Class)innerProtoType;
+ (id)innerProtoPropertyName;
+ (id)serviceGraphName;
- (CDMSsuInferenceGraphRequestCommand)initWithSsuRequest:(id)a3;
- (SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest)ssuRequest;
@end

@implementation CDMSsuInferenceGraphRequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest)ssuRequest
{
  return self->_ssuRequest;
}

- (CDMSsuInferenceGraphRequestCommand)initWithSsuRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSsuInferenceGraphRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ssuRequest, a3);
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
  return @"ssuRequest";
}

@end