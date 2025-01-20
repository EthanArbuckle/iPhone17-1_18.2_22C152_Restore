@interface AFCommandExecutionInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFCommandExecutionInfo)init;
- (AFCommandExecutionInfo)initWithBuilder:(id)a3;
- (AFCommandExecutionInfo)initWithCoder:(id)a3;
- (AFCommandExecutionInfo)initWithDictionaryRepresentation:(id)a3;
- (AFCommandExecutionInfo)initWithExecutionID:(id)a3 requestID:(id)a4 turnId:(id)a5 originPeerInfo:(id)a6 currentHomeInfo:(id)a7 endpointInfo:(id)a8 instanceInfo:(id)a9 speechInfo:(id)a10 requestHandlingContextSnapshot:(id)a11 deviceRestrictions:(id)a12 userInfo:(id)a13;
- (AFEndpointInfo)endpointInfo;
- (AFHomeInfo)currentHomeInfo;
- (AFInstanceInfo)instanceInfo;
- (AFPeerInfo)originPeerInfo;
- (AFRequestHandlingContext)requestHandlingContextSnapshot;
- (AFSpeechInfo)speechInfo;
- (BOOL)isEqual:(id)a3;
- (NSArray)deviceRestrictions;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)executionID;
- (NSString)requestID;
- (NSUUID)turnId;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFCommandExecutionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_requestHandlingContextSnapshot, 0);
  objc_storeStrong((id *)&self->_speechInfo, 0);
  objc_storeStrong((id *)&self->_instanceInfo, 0);
  objc_storeStrong((id *)&self->_endpointInfo, 0);
  objc_storeStrong((id *)&self->_currentHomeInfo, 0);
  objc_storeStrong((id *)&self->_originPeerInfo, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_executionID, 0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (AFRequestHandlingContext)requestHandlingContextSnapshot
{
  return self->_requestHandlingContextSnapshot;
}

- (AFSpeechInfo)speechInfo
{
  return self->_speechInfo;
}

- (AFInstanceInfo)instanceInfo
{
  return self->_instanceInfo;
}

- (AFEndpointInfo)endpointInfo
{
  return self->_endpointInfo;
}

- (AFHomeInfo)currentHomeInfo
{
  return self->_currentHomeInfo;
}

- (AFPeerInfo)originPeerInfo
{
  return self->_originPeerInfo;
}

- (NSUUID)turnId
{
  return self->_turnId;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)executionID
{
  return self->_executionID;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  executionID = self->_executionID;
  if (executionID) {
    [v3 setObject:executionID forKey:@"executionID"];
  }
  requestID = self->_requestID;
  if (requestID) {
    [v4 setObject:requestID forKey:@"requestID"];
  }
  turnId = self->_turnId;
  if (turnId) {
    [v4 setObject:turnId forKey:@"turnId"];
  }
  originPeerInfo = self->_originPeerInfo;
  if (originPeerInfo)
  {
    v9 = [(AFPeerInfo *)originPeerInfo buildDictionaryRepresentation];
    [v4 setObject:v9 forKey:@"originPeerInfo"];
  }
  currentHomeInfo = self->_currentHomeInfo;
  if (currentHomeInfo)
  {
    v11 = [(AFHomeInfo *)currentHomeInfo buildDictionaryRepresentation];
    [v4 setObject:v11 forKey:@"currentHomeInfo"];
  }
  endpointInfo = self->_endpointInfo;
  if (endpointInfo)
  {
    v13 = [(AFEndpointInfo *)endpointInfo buildDictionaryRepresentation];
    [v4 setObject:v13 forKey:@"endpointInfo"];
  }
  instanceInfo = self->_instanceInfo;
  if (instanceInfo)
  {
    v15 = [(AFInstanceInfo *)instanceInfo buildDictionaryRepresentation];
    [v4 setObject:v15 forKey:@"instanceInfo"];
  }
  speechInfo = self->_speechInfo;
  if (speechInfo)
  {
    v17 = [(AFSpeechInfo *)speechInfo buildDictionaryRepresentation];
    [v4 setObject:v17 forKey:@"speechInfo"];
  }
  requestHandlingContextSnapshot = self->_requestHandlingContextSnapshot;
  if (requestHandlingContextSnapshot)
  {
    v19 = [(AFRequestHandlingContext *)requestHandlingContextSnapshot buildDictionaryRepresentation];
    [v4 setObject:v19 forKey:@"requestHandlingContextSnapshot"];
  }
  if (self->_deviceRestrictions)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_deviceRestrictions, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v21 = self->_deviceRestrictions;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(v20, "addObject:", *(void *)(*((void *)&v30 + 1) + 8 * i), (void)v30);
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v23);
    }

    v26 = (void *)[v20 copy];
    [v4 setObject:v26 forKey:@"deviceRestrictions"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v4 setObject:userInfo forKey:@"userInfo"];
  }
  v28 = objc_msgSend(v4, "copy", (void)v30);

  return v28;
}

- (AFCommandExecutionInfo)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"executionID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v45 = v6;
    }
    else {
      id v45 = 0;
    }

    v8 = [v5 objectForKey:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v44 = v8;
    }
    else {
      id v44 = 0;
    }

    v9 = [v5 objectForKey:@"turnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v43 = v9;
    }
    else {
      id v43 = 0;
    }

    v10 = [v5 objectForKey:@"originPeerInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v42 = [[AFPeerInfo alloc] initWithDictionaryRepresentation:v10];
    }
    else {
      v42 = 0;
    }

    v11 = [v5 objectForKey:@"currentHomeInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v41 = [[AFHomeInfo alloc] initWithDictionaryRepresentation:v11];
    }
    else {
      v41 = 0;
    }

    v12 = [v5 objectForKey:@"endpointInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v40 = [[AFEndpointInfo alloc] initWithDictionaryRepresentation:v12];
    }
    else {
      v40 = 0;
    }

    v13 = [v5 objectForKey:@"instanceInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v39 = [[AFInstanceInfo alloc] initWithDictionaryRepresentation:v13];
    }
    else {
      v39 = 0;
    }

    v14 = [v5 objectForKey:@"speechInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v38 = [[AFSpeechInfo alloc] initWithDictionaryRepresentation:v14];
    }
    else {
      v38 = 0;
    }

    v15 = [v5 objectForKey:@"requestHandlingContextSnapshot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v37 = [[AFRequestHandlingContext alloc] initWithDictionaryRepresentation:v15];
    }
    else {
      v37 = 0;
    }

    v16 = [v5 objectForKey:@"deviceRestrictions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v51 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(id *)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v23;

              if (v24) {
                [v17 addObject:v24];
              }
            }
            else
            {

              id v24 = 0;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v20);
      }

      v36 = (void *)[v17 copy];
    }
    else
    {
      v36 = 0;
    }

    v25 = [v5 objectForKey:@"userInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v25, "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v27 = v25;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v47 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v33 = [v27 objectForKey:v32];
              [v26 setObject:v33 forKey:v32];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v29);
      }

      v34 = (void *)[v26 copy];
    }
    else
    {
      v34 = 0;
    }

    self = [(AFCommandExecutionInfo *)self initWithExecutionID:v45 requestID:v44 turnId:v43 originPeerInfo:v42 currentHomeInfo:v41 endpointInfo:v40 instanceInfo:v39 speechInfo:v38 requestHandlingContextSnapshot:v37 deviceRestrictions:v36 userInfo:v34];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  executionID = self->_executionID;
  id v5 = a3;
  [v5 encodeObject:executionID forKey:@"AFCommandExecutionInfo::executionID"];
  [v5 encodeObject:self->_requestID forKey:@"AFCommandExecutionInfo::requestID"];
  [v5 encodeObject:self->_turnId forKey:@"AFCommandExecutionInfo::turnId"];
  [v5 encodeObject:self->_originPeerInfo forKey:@"AFCommandExecutionInfo::originPeerInfo"];
  [v5 encodeObject:self->_currentHomeInfo forKey:@"AFCommandExecutionInfo::currentHomeInfo"];
  [v5 encodeObject:self->_endpointInfo forKey:@"AFCommandExecutionInfo::endpointInfo"];
  [v5 encodeObject:self->_instanceInfo forKey:@"AFCommandExecutionInfo::instanceInfo"];
  [v5 encodeObject:self->_speechInfo forKey:@"AFCommandExecutionInfo::speechInfo"];
  [v5 encodeObject:self->_requestHandlingContextSnapshot forKey:@"AFCommandExecutionInfo::requestHandlingContextSnapshot"];
  [v5 encodeObject:self->_deviceRestrictions forKey:@"AFCommandExecutionInfo::deviceRestrictions"];
  [v5 encodeObject:self->_userInfo forKey:@"AFCommandExecutionInfo::userInfo"];
}

- (AFCommandExecutionInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::executionID"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::requestID"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::turnId"];
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::originPeerInfo"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::currentHomeInfo"];
  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::endpointInfo"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::instanceInfo"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::speechInfo"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCommandExecutionInfo::requestHandlingContextSnapshot"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v3 decodeObjectOfClasses:v11 forKey:@"AFCommandExecutionInfo::deviceRestrictions"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v3 decodeObjectOfClasses:v15 forKey:@"AFCommandExecutionInfo::userInfo"];

  uint64_t v22 = [(AFCommandExecutionInfo *)self initWithExecutionID:v23 requestID:v18 turnId:v4 originPeerInfo:v20 currentHomeInfo:v5 endpointInfo:v19 instanceInfo:v6 speechInfo:v7 requestHandlingContextSnapshot:v8 deviceRestrictions:v12 userInfo:v16];
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFCommandExecutionInfo *)a3;
  if (self == v4)
  {
    BOOL v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFCommandExecutionInfo *)v5 executionID];
      executionID = self->_executionID;
      if (executionID == v6 || [(NSString *)executionID isEqual:v6])
      {
        v8 = [(AFCommandExecutionInfo *)v5 requestID];
        requestID = self->_requestID;
        if (requestID == v8 || [(NSString *)requestID isEqual:v8])
        {
          uint64_t v10 = [(AFCommandExecutionInfo *)v5 turnId];
          turnId = self->_turnId;
          if (turnId == v10 || [(NSUUID *)turnId isEqual:v10])
          {
            v12 = [(AFCommandExecutionInfo *)v5 originPeerInfo];
            originPeerInfo = self->_originPeerInfo;
            if (originPeerInfo == v12 || [(AFPeerInfo *)originPeerInfo isEqual:v12])
            {
              uint64_t v14 = [(AFCommandExecutionInfo *)v5 currentHomeInfo];
              currentHomeInfo = self->_currentHomeInfo;
              if (currentHomeInfo == v14 || [(AFHomeInfo *)currentHomeInfo isEqual:v14])
              {
                v16 = [(AFCommandExecutionInfo *)v5 endpointInfo];
                endpointInfo = self->_endpointInfo;
                if (endpointInfo == v16 || [(AFEndpointInfo *)endpointInfo isEqual:v16])
                {
                  id v18 = [(AFCommandExecutionInfo *)v5 instanceInfo];
                  instanceInfo = self->_instanceInfo;
                  if (instanceInfo == v18 || [(AFInstanceInfo *)instanceInfo isEqual:v18])
                  {
                    v34 = v18;
                    uint64_t v20 = [(AFCommandExecutionInfo *)v5 speechInfo];
                    speechInfo = self->_speechInfo;
                    if (speechInfo == v20 || [(AFSpeechInfo *)speechInfo isEqual:v20])
                    {
                      long long v33 = v20;
                      uint64_t v22 = [(AFCommandExecutionInfo *)v5 requestHandlingContextSnapshot];
                      requestHandlingContextSnapshot = self->_requestHandlingContextSnapshot;
                      if (requestHandlingContextSnapshot == v22
                        || [(AFRequestHandlingContext *)requestHandlingContextSnapshot isEqual:v22])
                      {
                        uint64_t v32 = v22;
                        id v24 = [(AFCommandExecutionInfo *)v5 deviceRestrictions];
                        deviceRestrictions = self->_deviceRestrictions;
                        if (deviceRestrictions == v24
                          || [(NSArray *)deviceRestrictions isEqual:v24])
                        {
                          v26 = [(AFCommandExecutionInfo *)v5 userInfo];
                          userInfo = self->_userInfo;
                          BOOL v30 = 1;
                          if (userInfo != v26)
                          {
                            uint64_t v28 = v26;
                            int v29 = [(NSDictionary *)userInfo isEqual:v26];
                            v26 = v28;
                            if (!v29) {
                              BOOL v30 = 0;
                            }
                          }
                        }
                        else
                        {
                          BOOL v30 = 0;
                        }

                        uint64_t v22 = v32;
                      }
                      else
                      {
                        BOOL v30 = 0;
                      }

                      uint64_t v20 = v33;
                    }
                    else
                    {
                      BOOL v30 = 0;
                    }

                    id v18 = v34;
                  }
                  else
                  {
                    BOOL v30 = 0;
                  }
                }
                else
                {
                  BOOL v30 = 0;
                }
              }
              else
              {
                BOOL v30 = 0;
              }
            }
            else
            {
              BOOL v30 = 0;
            }
          }
          else
          {
            BOOL v30 = 0;
          }
        }
        else
        {
          BOOL v30 = 0;
        }
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_executionID hash];
  NSUInteger v4 = [(NSString *)self->_requestID hash] ^ v3;
  uint64_t v5 = [(NSUUID *)self->_turnId hash];
  unint64_t v6 = v4 ^ v5 ^ [(AFPeerInfo *)self->_originPeerInfo hash];
  unint64_t v7 = [(AFHomeInfo *)self->_currentHomeInfo hash];
  unint64_t v8 = v7 ^ [(AFEndpointInfo *)self->_endpointInfo hash];
  unint64_t v9 = v6 ^ v8 ^ [(AFInstanceInfo *)self->_instanceInfo hash];
  unint64_t v10 = [(AFSpeechInfo *)self->_speechInfo hash];
  unint64_t v11 = v10 ^ [(AFRequestHandlingContext *)self->_requestHandlingContextSnapshot hash];
  uint64_t v12 = v11 ^ [(NSArray *)self->_deviceRestrictions hash];
  return v9 ^ v12 ^ [(NSDictionary *)self->_userInfo hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFCommandExecutionInfo;
  uint64_t v5 = [(AFCommandExecutionInfo *)&v8 description];
  unint64_t v6 = (void *)[v4 initWithFormat:@"%@ {executionID = %@, requestID = %@, turnId = %@, originPeerInfo = %@, currentHomeInfo = %@, endpointInfo = %@, instanceInfo = %@, speechInfo = %@, requestHandlingContextSnapshot = %@, deviceRestrictions = %@, userInfo = %@}", v5, self->_executionID, self->_requestID, self->_turnId, self->_originPeerInfo, self->_currentHomeInfo, self->_endpointInfo, self->_instanceInfo, self->_speechInfo, self->_requestHandlingContextSnapshot, self->_deviceRestrictions, self->_userInfo];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFCommandExecutionInfo *)self _descriptionWithIndent:0];
}

- (AFCommandExecutionInfo)initWithExecutionID:(id)a3 requestID:(id)a4 turnId:(id)a5 originPeerInfo:(id)a6 currentHomeInfo:(id)a7 endpointInfo:(id)a8 instanceInfo:(id)a9 speechInfo:(id)a10 requestHandlingContextSnapshot:(id)a11 deviceRestrictions:(id)a12 userInfo:(id)a13
{
  id v39 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __190__AFCommandExecutionInfo_initWithExecutionID_requestID_turnId_originPeerInfo_currentHomeInfo_endpointInfo_instanceInfo_speechInfo_requestHandlingContextSnapshot_deviceRestrictions_userInfo___block_invoke;
  v43[3] = &unk_1E592BDC0;
  id v44 = v39;
  id v45 = v18;
  id v46 = v19;
  id v47 = v20;
  id v48 = v21;
  id v49 = v22;
  id v50 = v23;
  id v51 = v24;
  id v52 = v25;
  id v53 = v26;
  id v54 = v27;
  id v41 = v27;
  id v40 = v26;
  id v28 = v25;
  id v29 = v24;
  id v30 = v23;
  id v31 = v22;
  id v32 = v21;
  id v33 = v20;
  id v34 = v19;
  id v35 = v18;
  id v36 = v39;
  v37 = [(AFCommandExecutionInfo *)self initWithBuilder:v43];

  return v37;
}

void __190__AFCommandExecutionInfo_initWithExecutionID_requestID_turnId_originPeerInfo_currentHomeInfo_endpointInfo_instanceInfo_speechInfo_requestHandlingContextSnapshot_deviceRestrictions_userInfo___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setExecutionID:v3];
  [v4 setRequestID:a1[5]];
  [v4 setTurnId:a1[6]];
  [v4 setOriginPeerInfo:a1[7]];
  [v4 setCurrentHomeInfo:a1[8]];
  [v4 setEndpointInfo:a1[9]];
  [v4 setInstanceInfo:a1[10]];
  [v4 setSpeechInfo:a1[11]];
  [v4 setRequestHandlingContextSnapshot:a1[12]];
  [v4 setDeviceRestrictions:a1[13]];
  [v4 setUserInfo:a1[14]];
}

- (AFCommandExecutionInfo)init
{
  return [(AFCommandExecutionInfo *)self initWithBuilder:0];
}

- (AFCommandExecutionInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFCommandExecutionInfoMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)AFCommandExecutionInfo;
  uint64_t v5 = [(AFCommandExecutionInfo *)&v42 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFCommandExecutionInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFCommandExecutionInfoMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFCommandExecutionInfoMutation *)v7 getExecutionID];
      uint64_t v9 = [v8 copy];
      executionID = v6->_executionID;
      v6->_executionID = (NSString *)v9;

      unint64_t v11 = [(_AFCommandExecutionInfoMutation *)v7 getRequestID];
      uint64_t v12 = [v11 copy];
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v12;

      uint64_t v14 = [(_AFCommandExecutionInfoMutation *)v7 getTurnId];
      uint64_t v15 = [v14 copy];
      turnId = v6->_turnId;
      v6->_turnId = (NSUUID *)v15;

      v17 = [(_AFCommandExecutionInfoMutation *)v7 getOriginPeerInfo];
      uint64_t v18 = [v17 copy];
      originPeerInfo = v6->_originPeerInfo;
      v6->_originPeerInfo = (AFPeerInfo *)v18;

      id v20 = [(_AFCommandExecutionInfoMutation *)v7 getCurrentHomeInfo];
      uint64_t v21 = [v20 copy];
      currentHomeInfo = v6->_currentHomeInfo;
      v6->_currentHomeInfo = (AFHomeInfo *)v21;

      id v23 = [(_AFCommandExecutionInfoMutation *)v7 getEndpointInfo];
      uint64_t v24 = [v23 copy];
      endpointInfo = v6->_endpointInfo;
      v6->_endpointInfo = (AFEndpointInfo *)v24;

      id v26 = [(_AFCommandExecutionInfoMutation *)v7 getInstanceInfo];
      uint64_t v27 = [v26 copy];
      instanceInfo = v6->_instanceInfo;
      v6->_instanceInfo = (AFInstanceInfo *)v27;

      id v29 = [(_AFCommandExecutionInfoMutation *)v7 getSpeechInfo];
      uint64_t v30 = [v29 copy];
      speechInfo = v6->_speechInfo;
      v6->_speechInfo = (AFSpeechInfo *)v30;

      id v32 = [(_AFCommandExecutionInfoMutation *)v7 getRequestHandlingContextSnapshot];
      uint64_t v33 = [v32 copy];
      requestHandlingContextSnapshot = v6->_requestHandlingContextSnapshot;
      v6->_requestHandlingContextSnapshot = (AFRequestHandlingContext *)v33;

      id v35 = [(_AFCommandExecutionInfoMutation *)v7 getDeviceRestrictions];
      uint64_t v36 = [v35 copy];
      deviceRestrictions = v6->_deviceRestrictions;
      v6->_deviceRestrictions = (NSArray *)v36;

      v38 = [(_AFCommandExecutionInfoMutation *)v7 getUserInfo];
      uint64_t v39 = [v38 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v39;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFCommandExecutionInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFCommandExecutionInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFCommandExecutionInfoMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFCommandExecutionInfo);
      unint64_t v7 = [(_AFCommandExecutionInfoMutation *)v5 getExecutionID];
      uint64_t v8 = [v7 copy];
      executionID = v6->_executionID;
      v6->_executionID = (NSString *)v8;

      unint64_t v10 = [(_AFCommandExecutionInfoMutation *)v5 getRequestID];
      uint64_t v11 = [v10 copy];
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v11;

      v13 = [(_AFCommandExecutionInfoMutation *)v5 getTurnId];
      uint64_t v14 = [v13 copy];
      turnId = v6->_turnId;
      v6->_turnId = (NSUUID *)v14;

      v16 = [(_AFCommandExecutionInfoMutation *)v5 getOriginPeerInfo];
      uint64_t v17 = [v16 copy];
      originPeerInfo = v6->_originPeerInfo;
      v6->_originPeerInfo = (AFPeerInfo *)v17;

      id v19 = [(_AFCommandExecutionInfoMutation *)v5 getCurrentHomeInfo];
      uint64_t v20 = [v19 copy];
      currentHomeInfo = v6->_currentHomeInfo;
      v6->_currentHomeInfo = (AFHomeInfo *)v20;

      id v22 = [(_AFCommandExecutionInfoMutation *)v5 getEndpointInfo];
      uint64_t v23 = [v22 copy];
      endpointInfo = v6->_endpointInfo;
      v6->_endpointInfo = (AFEndpointInfo *)v23;

      id v25 = [(_AFCommandExecutionInfoMutation *)v5 getInstanceInfo];
      uint64_t v26 = [v25 copy];
      instanceInfo = v6->_instanceInfo;
      v6->_instanceInfo = (AFInstanceInfo *)v26;

      id v28 = [(_AFCommandExecutionInfoMutation *)v5 getSpeechInfo];
      uint64_t v29 = [v28 copy];
      speechInfo = v6->_speechInfo;
      v6->_speechInfo = (AFSpeechInfo *)v29;

      id v31 = [(_AFCommandExecutionInfoMutation *)v5 getRequestHandlingContextSnapshot];
      uint64_t v32 = [v31 copy];
      requestHandlingContextSnapshot = v6->_requestHandlingContextSnapshot;
      v6->_requestHandlingContextSnapshot = (AFRequestHandlingContext *)v32;

      id v34 = [(_AFCommandExecutionInfoMutation *)v5 getDeviceRestrictions];
      uint64_t v35 = [v34 copy];
      deviceRestrictions = v6->_deviceRestrictions;
      v6->_deviceRestrictions = (NSArray *)v35;

      v37 = [(_AFCommandExecutionInfoMutation *)v5 getUserInfo];
      uint64_t v38 = [v37 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v38;
    }
    else
    {
      unint64_t v6 = (AFCommandExecutionInfo *)[(AFCommandExecutionInfo *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFCommandExecutionInfo *)[(AFCommandExecutionInfo *)self copy];
  }

  return v6;
}

@end