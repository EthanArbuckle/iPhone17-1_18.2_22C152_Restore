@interface IDSTapToRadarPushPayload
- (IDSTapToRadarPushPayload)initWithPushPayload:(id)a3;
- (NSArray)radarKeywords;
- (NSArray)radarQueryParameter;
- (NSString)errorCode;
- (NSString)promptMessage;
- (NSString)promptTitle;
- (NSString)radarClassification;
- (NSString)radarComponentId;
- (NSString)radarComponentName;
- (NSString)radarComponentVersion;
- (NSString)radarDescription;
- (NSString)radarReproducibility;
- (NSString)radarTitle;
- (NSString)serverErrorDetail;
@end

@implementation IDSTapToRadarPushPayload

- (IDSTapToRadarPushPayload)initWithPushPayload:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v50 = +[NSAssertionHandler currentHandler];
    [v50 handleFailureInMethod:a2, self, @"IDSTapToRadarPushPayload.m", 16, @"Invalid parameter not satisfying: %@", @"pushPayload" object file lineNumber description];
  }
  v51.receiver = self;
  v51.super_class = (Class)IDSTapToRadarPushPayload;
  v6 = [(IDSTapToRadarPushPayload *)&v51 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = sub_1002B4B18(v7, v5, @"e");
    errorCode = v6->_errorCode;
    v6->_errorCode = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = sub_1002B4B18(v10, v5, @"s");
    serverErrorDetail = v6->_serverErrorDetail;
    v6->_serverErrorDetail = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = sub_1002B4B18(v13, v5, @"m");
    promptMessage = v6->_promptMessage;
    v6->_promptMessage = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = sub_1002B4B18(v16, v5, @"t");
    promptTitle = v6->_promptTitle;
    v6->_promptTitle = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = sub_1002B4B18(v19, v5, @"rt");
    radarTitle = v6->_radarTitle;
    v6->_radarTitle = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v23 = sub_1002B4B18(v22, v5, @"rd");
    radarDescription = v6->_radarDescription;
    v6->_radarDescription = (NSString *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v26 = sub_1002B4B18(v25, v5, @"cn");
    radarComponentName = v6->_radarComponentName;
    v6->_radarComponentName = (NSString *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v29 = sub_1002B4B18(v28, v5, @"cv");
    radarComponentVersion = v6->_radarComponentVersion;
    v6->_radarComponentVersion = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    v32 = sub_1002B4B18(v31, v5, @"ci");
    v33 = v32;
    if (v32)
    {
      uint64_t v34 = [v32 stringValue];
      radarComponentId = v6->_radarComponentId;
      v6->_radarComponentId = (NSString *)v34;
    }
    else
    {
      radarComponentId = v6->_radarComponentId;
      v6->_radarComponentId = 0;
    }

    uint64_t v36 = objc_opt_class();
    uint64_t v37 = sub_1002B4B18(v36, v5, @"z");
    radarClassification = v6->_radarClassification;
    v6->_radarClassification = (NSString *)v37;

    uint64_t v39 = objc_opt_class();
    uint64_t v40 = sub_1002B4B18(v39, v5, @"r");
    radarReproducibility = v6->_radarReproducibility;
    v6->_radarReproducibility = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    v43 = sub_1002B4B18(v42, v5, @"k");
    uint64_t v44 = objc_msgSend(v43, "__imArrayByApplyingBlock:", &stru_10098B858);
    radarKeywords = v6->_radarKeywords;
    v6->_radarKeywords = (NSArray *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v47 = sub_1002B4B18(v46, v5, @"qp");
    radarQueryParameter = v6->_radarQueryParameter;
    v6->_radarQueryParameter = (NSArray *)v47;
  }
  return v6;
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (NSString)serverErrorDetail
{
  return self->_serverErrorDetail;
}

- (NSString)promptMessage
{
  return self->_promptMessage;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (NSString)radarComponentId
{
  return self->_radarComponentId;
}

- (NSString)radarClassification
{
  return self->_radarClassification;
}

- (NSString)radarReproducibility
{
  return self->_radarReproducibility;
}

- (NSArray)radarKeywords
{
  return self->_radarKeywords;
}

- (NSArray)radarQueryParameter
{
  return self->_radarQueryParameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarQueryParameter, 0);
  objc_storeStrong((id *)&self->_radarKeywords, 0);
  objc_storeStrong((id *)&self->_radarReproducibility, 0);
  objc_storeStrong((id *)&self->_radarClassification, 0);
  objc_storeStrong((id *)&self->_radarComponentId, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);
  objc_storeStrong((id *)&self->_serverErrorDetail, 0);

  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end