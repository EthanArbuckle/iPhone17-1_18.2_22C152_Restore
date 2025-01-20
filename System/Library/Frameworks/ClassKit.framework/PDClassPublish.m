@interface PDClassPublish
- (BOOL)acceptsPayloadType:(int)a3;
- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4;
- (Class)expectedResponseClass;
- (NSMutableDictionary)erroredIDs;
- (id)acceptContentType;
- (id)createActionPDDPEEPayloadFromCLSObject:(id)a3;
- (id)deleteActionPDDPEEPayloadFromCLSObject:(id)a3;
- (id)endpointIdentifier;
- (id)logSubsystem;
- (id)payloadForCLSObject:(id)a3;
- (id)requestContentType;
- (id)requestData;
- (id)updateActionPDDPEEPayloadFromCLSObject:(id)a3;
- (void)setErroredIDs:(id)a3;
@end

@implementation PDClassPublish

- (NSMutableDictionary)erroredIDs
{
  v3 = *(NSMutableDictionary **)((char *)&self->_classMemberIDsByError + 2);
  if (!v3)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    id v5 = *(id *)((char *)&self->_clsClass + 2);
    v6 = (char *)[v5 count];
    id v7 = *(id *)((char *)&self->_membersToInsert + 2);
    v8 = (NSMutableDictionary *)objc_msgSend(v4, "initWithCapacity:", &v6[(void)objc_msgSend(v7, "count")]);
    v9 = *(NSMutableDictionary **)((char *)&self->_classMemberIDsByError + 2);
    *(NSMutableDictionary **)((char *)&self->_classMemberIDsByError + 2) = v8;

    v3 = *(NSMutableDictionary **)((char *)&self->_classMemberIDsByError + 2);
  }

  return (NSMutableDictionary *)v3;
}

- (id)logSubsystem
{
  return CLSLogClasses;
}

- (BOOL)acceptsPayloadType:(int)a3
{
  return (a3 < 8) & (0xC3u >> a3);
}

- (id)endpointIdentifier
{
  return @"ee.publishClass";
}

- (id)requestContentType
{
  return @"application/x-protobuf";
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (id)requestData
{
  if ([(PDOperation *)self isFinished])
  {
    v3 = 0;
    goto LABEL_57;
  }
  id v4 = objc_alloc_init((Class)PBDataWriter);
  id v5 = objc_alloc_init(PDDPPublishClassRequest);
  v67 = [(PDURLRequestOperation *)self operationID];
  id v60 = *(id *)((char *)&self->_action + 2);
  v6 = -[PDClassPublish payloadForCLSObject:](self, "payloadForCLSObject:");
  [(PDDPPublishClassRequest *)v5 addPayload:v6];
  [(PDDPPublishClassRequest *)v5 writeTo:v4];
  [(PDDPPublishClassRequest *)v5 clearPayloads];
  id v7 = [v4 data];
  id v8 = [v7 length];
  v9 = [(PDURLRequestOperation *)self stats];
  if (v9) {
    v9[10] = v8;
  }

  v10 = [(PDURLRequestOperation *)self stats];
  if (v10) {
    ++v10[14];
  }

  CLSInitLog();
  v11 = [(PDClassPublish *)self logSubsystem];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_opt_class();
    id v13 = v12;
    v14 = [v6 dictionaryRepresentation];
    *(_DWORD *)buf = 138543874;
    v79 = v12;
    __int16 v80 = 2114;
    v81 = v67;
    __int16 v82 = 2112;
    v83 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);
  }
  v59 = v6;

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = *(id *)((char *)&self->_clsClass + 2);
  id v65 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v73;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v73 != v63) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v72 + 1) + 8 * v15);
      v18 = [(PDClassPublish *)self payloadForCLSObject:v16];
      [(PDDPPublishClassRequest *)v5 addPayload:v18];
      [(PDDPPublishClassRequest *)v5 writeTo:v4];
      [(PDDPPublishClassRequest *)v5 clearPayloads];
      v19 = [v4 data];
      id v20 = [v19 length];
      v21 = [(PDURLRequestOperation *)self stats];
      if (v21) {
        v21[10] = v20;
      }

      v22 = [(PDURLRequestOperation *)self stats];
      if (v22) {
        ++v22[14];
      }

      CLSInitLog();
      v23 = [(PDClassPublish *)self logSubsystem];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_opt_class();
        id v25 = v24;
        v26 = [v18 dictionaryRepresentation];
        *(_DWORD *)buf = 138543874;
        v79 = v24;
        __int16 v80 = 2114;
        v81 = v67;
        __int16 v82 = 2112;
        v83 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);
      }
      uint64_t v27 = [(PDURLRequestOperation *)self stats];
      v28 = (void *)v27;
      uint64_t v29 = v27 ? *(void *)(v27 + 80) : 0;
      uint64_t v30 = [(PDURLRequestOperation *)self stats];
      v31 = (void *)v30;
      uint64_t v32 = v30 ? *(void *)(v30 + 112) : 0;
      unsigned __int8 v33 = [(PDEndpointRequestOperation *)self hasReachedRequestPayloadLimitBytes:v29 count:v32];

      if (v33) {
        break;
      }
      if (v65 == (id)++v15)
      {
        id v34 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
        id v65 = v34;
        if (v34) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obja = *(id *)((char *)&self->_membersToInsert + 2);
  id v66 = [obja countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v66)
  {
    uint64_t v64 = *(void *)v69;
LABEL_32:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v69 != v64) {
        objc_enumerationMutation(obja);
      }
      uint64_t v36 = *(void *)(*((void *)&v68 + 1) + 8 * v35);
      v38 = [(PDClassPublish *)self deleteActionPDDPEEPayloadFromCLSObject:v36];
      [(PDDPPublishClassRequest *)v5 addPayload:v38];
      [(PDDPPublishClassRequest *)v5 writeTo:v4];
      [(PDDPPublishClassRequest *)v5 clearPayloads];
      v39 = [v4 data];
      id v40 = [v39 length];
      v41 = [(PDURLRequestOperation *)self stats];
      if (v41) {
        v41[10] = v40;
      }

      v42 = [(PDURLRequestOperation *)self stats];
      if (v42) {
        ++v42[14];
      }

      CLSInitLog();
      v43 = [(PDClassPublish *)self logSubsystem];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = objc_opt_class();
        id v45 = v44;
        v46 = [v38 dictionaryRepresentation];
        *(_DWORD *)buf = 138543874;
        v79 = v44;
        __int16 v80 = 2114;
        v81 = v67;
        __int16 v82 = 2112;
        v83 = v46;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ added payload item %@ ", buf, 0x20u);
      }
      uint64_t v47 = [(PDURLRequestOperation *)self stats];
      v48 = (void *)v47;
      uint64_t v49 = v47 ? *(void *)(v47 + 80) : 0;
      uint64_t v50 = [(PDURLRequestOperation *)self stats];
      v51 = (void *)v50;
      uint64_t v52 = v50 ? *(void *)(v50 + 112) : 0;
      unsigned __int8 v53 = [(PDEndpointRequestOperation *)self hasReachedRequestPayloadLimitBytes:v49 count:v52];

      if (v53) {
        break;
      }
      if (v66 == (id)++v35)
      {
        id v54 = [obja countByEnumeratingWithState:&v68 objects:v76 count:16];
        id v66 = v54;
        if (v54) {
          goto LABEL_32;
        }
        break;
      }
    }
  }

  v55 = [(PDURLRequestOperation *)self stats];
  if (!v55)
  {
    v57 = v59;
    goto LABEL_55;
  }
  uint64_t v56 = v55[14];

  v57 = v59;
  if (!v56)
  {
LABEL_55:
    [(PDEndpointRequestOperation *)self markAsFinished];
    v3 = 0;
    goto LABEL_56;
  }
  v3 = [v4 immutableData];
LABEL_56:

LABEL_57:

  return v3;
}

- (id)payloadForCLSObject:(id)a3
{
  id v4 = a3;
  if (self)
  {
    int v5 = *(_DWORD *)((char *)&self->super._unresolvedMissingEntityIDs + 2);
    switch(v5)
    {
      case 3:
        uint64_t v6 = [(PDClassPublish *)self deleteActionPDDPEEPayloadFromCLSObject:v4];
        goto LABEL_10;
      case 2:
        uint64_t v6 = [(PDClassPublish *)self updateActionPDDPEEPayloadFromCLSObject:v4];
        goto LABEL_10;
      case 1:
        uint64_t v6 = [(PDClassPublish *)self createActionPDDPEEPayloadFromCLSObject:v4];
LABEL_10:
        id v8 = (void *)v6;
        goto LABEL_11;
    }
  }
  CLSInitLog();
  id v7 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      int v10 = *(_DWORD *)((char *)&self->super._unresolvedMissingEntityIDs + 2);
    }
    else {
      int v10 = 0;
    }
    v11[0] = 67109120;
    v11[1] = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "PDClassPublish- Unknown action type: %d", (uint8_t *)v11, 8u);
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)createActionPDDPEEPayloadFromCLSObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setType:7];
    int v5 = sub_100079EB8(v3);
    [v4 setClassMember:v5];

    uint64_t v6 = [v3 objectID];
    [v4 setTempObjectId:v6];

    id v7 = [v3 parentObjectID];
    [v4 setTempParentObjectId:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    [v4 setType:6];
    id v8 = v3;
    id v7 = objc_alloc_init(PDDPClass);
    v9 = [v8 customClassName];
    [(PDDPClass *)v7 setDisplayName:v9];

    int v10 = [v8 locationID];
    [(PDDPClass *)v7 setLocationId:v10];

    v11 = [v8 iconID];
    [(PDDPClass *)v7 setIconIdentifier:v11];

    v12 = [v8 dateCreated];
    id v13 = sub_1000F3E0C(v12);
    [(PDDPClass *)v7 setDateCreated:v13];

    v14 = [v8 dateLastModified];
    uint64_t v15 = sub_1000F3E0C(v14);
    [(PDDPClass *)v7 setDateLastModified:v15];

    uint64_t v16 = objc_alloc_init(PDDPEntityMeta);
    [(PDDPClass *)v7 setEntityMeta:v16];

    id v17 = [v8 source];
    v18 = [(PDDPClass *)v7 entityMeta];
    [v18 setSource:v17];

    [v4 setClassInfo:v7];
    v19 = [v8 objectID];

    [v4 setTempObjectId:v19];
  }

LABEL_6:
  [v4 setAction:1];

  return v4;
}

- (id)updateActionPDDPEEPayloadFromCLSObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setType:7];
    int v5 = sub_100079EB8(v3);
    [v4 setClassMember:v5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    [v4 setType:6];
    int v5 = sub_100079BB4(v3);
    [v4 setClassInfo:v5];
  }

  [v4 setAction:1];
LABEL_6:

  return v4;
}

- (id)deleteActionPDDPEEPayloadFromCLSObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setType:6];
    int v5 = sub_100079BB4(v3);
    [v4 setClassInfo:v5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    [v4 setType:7];
    int v5 = sub_100079EB8(v3);
    [v4 setClassMember:v5];
  }

LABEL_6:
  [v4 setAction:2];

  return v4;
}

- (BOOL)processPayloadFromResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PDClassPublish;
  BOOL v7 = [(PDASMPayloadOperation *)&v26 processPayloadFromResponse:v6 error:a4];
  if (*a4 && [v6 type] == 7 && objc_msgSend(v6, "hasClassMember"))
  {
    id v8 = *a4;
    v9 = [v6 classMember];
    int v10 = sub_10007A450(v9);

    v11 = [v6 status];
    id v12 = [v11 code];
    if ((int)v12 > 299)
    {
      switch((int)v12)
      {
        case 800:
          id v13 = @"E_NOT_APPLICABLE_TYPE";
          break;
        case 801:
          id v13 = @"E_ENTITY_NOT_FOUND";
          break;
        case 802:
          id v13 = @"E_ENTITY_PRIVILEGE_CHANGE";
          break;
        case 803:
          id v13 = @"E_MUST_ACCEPT_TERMS";
          break;
        case 804:
          id v13 = @"E_ENTITY_EXPIRED";
          break;
        case 805:
          id v13 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
          break;
        case 806:
          id v13 = @"E_DISALLOWED_EMAIL_DOMAIN";
          break;
        default:
          if (v12 == 300)
          {
            id v13 = @"E_DEVICE_UNSUPPORTED";
          }
          else if (v12 == 500)
          {
            id v13 = @"E_INVALID_FIELD_VALUE";
          }
          else
          {
LABEL_46:
            id v13 = +[NSString stringWithFormat:@"(unknown: %i)", v12];
          }
          break;
      }
    }
    else
    {
      switch((int)v12)
      {
        case 'd':
          id v13 = @"E_BOOTSTRAP_REQUIRED";
          break;
        case 'e':
          id v13 = @"E_AUTHENTICATION_FAILED";
          break;
        case 'f':
          id v13 = @"E_NOT_AUTHORIZED";
          break;
        case 'g':
          id v13 = @"E_MESCAL_SIGNATURE_REQUIRED";
          break;
        case 'h':
          id v13 = @"E_MESCAL_BAD_SIGNATURE";
          break;
        case 'i':
          id v13 = @"E_MESCAL_PARSE_ERROR";
          break;
        case 'j':
          id v13 = @"E_BAD_REQUEST";
          break;
        case 'k':
          id v13 = @"E_BAD_PROTOCOL_VERSION";
          break;
        case 'l':
          id v13 = @"E_REQUEST_TOO_LARGE";
          break;
        case 'm':
          id v13 = @"E_REQUEST_TOO_MANY_ITEMS";
          break;
        case 'n':
          id v13 = @"E_SERVER_BUSY";
          break;
        case 'o':
          id v13 = @"E_ACCESS_DENIED";
          break;
        case 'p':
          id v13 = @"E_CONFLICT";
          break;
        case 'q':
          id v13 = @"E_INVALID_STATE";
          break;
        case 'r':
          id v13 = @"E_LOCK_TAKEN";
          break;
        case 's':
          id v13 = @"E_DOWNSTREAM_SERVICE_FAILED";
          break;
        case 't':
          id v13 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
          break;
        case 'u':
          id v13 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
          break;
        case 'v':
          id v13 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
          break;
        case 'w':
          id v13 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
          break;
        case 'x':
          id v13 = @"E_RECORD_LIMIT_EXCEEDED";
          break;
        case 'y':
          id v13 = @"E_DISALLOWED_COUNTRY_CODE";
          break;
        default:
          id v13 = @"UNKNOWN_CODE";
          switch((int)v12)
          {
            case 0:
              goto LABEL_47;
            case 1:
              id v13 = @"S_OK";
              break;
            case 2:
              id v13 = @"E_ERROR";
              break;
            case 3:
              id v13 = @"S_MIXED_RESPONSE";
              break;
            case 4:
              id v13 = @"S_OK_HAS_MORE_DATA";
              break;
            case 5:
              id v13 = @"S_PROCESSING";
              break;
            default:
              goto LABEL_46;
          }
          break;
      }
    }
LABEL_47:

    v14 = [(PDClassPublish *)self erroredIDs];
    uint64_t v15 = [v8 description];
    uint64_t v16 = [v14 objectForKey:v15];

    if (v16)
    {
      id v17 = [(PDClassPublish *)self erroredIDs];
      id v18 = [v17 valueForKey:v13];
    }
    else
    {
      id v19 = objc_alloc((Class)NSMutableArray);
      if (self) {
        id v20 = *(CLSClass **)((char *)&self->_clsClass + 2);
      }
      else {
        id v20 = 0;
      }
      id v17 = v20;
      v21 = (char *)[v17 count];
      if (self) {
        v22 = *(NSArray **)((char *)&self->_membersToInsert + 2);
      }
      else {
        v22 = 0;
      }
      id v18 = objc_msgSend(v19, "initWithCapacity:", &v21[(void)objc_msgSend(v22, "count")]);
    }
    v23 = v18;

    [v23 addObjectsFromArray:v10];
    v24 = [(PDClassPublish *)self erroredIDs];
    [v24 setObject:v23 forKey:v13];
  }
  return v7;
}

- (void)setErroredIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_classMemberIDsByError + 2), 0);
  objc_storeStrong((id *)((char *)&self->_membersToDelete + 2), 0);
  objc_storeStrong((id *)((char *)&self->_membersToInsert + 2), 0);
  objc_storeStrong((id *)((char *)&self->_clsClass + 2), 0);

  objc_storeStrong((id *)((char *)&self->_action + 2), 0);
}

@end