@interface CDMPlannerGraphResponseCommand
+ (Class)innerProtoType;
+ (id)innerProtoPropertyName;
+ (id)serviceGraphName;
- (CDMPlannerGraphResponseCommand)initWithPlannerResponse:(id)a3;
- (SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse)plannerResponse;
@end

@implementation CDMPlannerGraphResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse)plannerResponse
{
  return self->_plannerResponse;
}

- (CDMPlannerGraphResponseCommand)initWithPlannerResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMPlannerGraphResponseCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plannerResponse, a3);
  }

  return v7;
}

+ (id)serviceGraphName
{
  return @"CDMPlannerServiceGraph";
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)innerProtoPropertyName
{
  return @"plannerResponse";
}

@end