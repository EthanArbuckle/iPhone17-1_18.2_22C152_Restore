@interface DNDSModeAssertionInvalidationRequest
+ (id)requestWithPredicate:(id)a3 requestDate:(id)a4 details:(id)a5 source:(id)a6 reason:(unint64_t)a7 reasonOverride:(unint64_t)a8;
+ (id)requestWithPredicate:(id)a3 requestDate:(id)a4 source:(id)a5 reason:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertionInvalidationDetails)details;
- (DNDModeAssertionSource)source;
- (DNDSModeAssertionInvalidationPredicate)predicate;
- (DNDSModeAssertionInvalidationRequest)initWithUUID:(id)a3 predicate:(id)a4 requestDate:(id)a5 details:(id)a6 source:(id)a7 reason:(unint64_t)a8 reasonOverride:(unint64_t)a9;
- (NSDate)requestDate;
- (NSString)description;
- (NSUUID)UUID;
- (id)resolveWithExpectedRemoteDeviceIdentifier:(id)a3 localDeviceIdentifier:(id)a4 remoteDeviceIdentifier:(id)a5;
- (unint64_t)hash;
- (unint64_t)reason;
- (unint64_t)reasonOverride;
@end

@implementation DNDSModeAssertionInvalidationRequest

- (id)resolveWithExpectedRemoteDeviceIdentifier:(id)a3 localDeviceIdentifier:(id)a4 remoteDeviceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(DNDSModeAssertionInvalidationRequest *)self source];
  v12 = [v11 resolveWithExpectedRemoteDeviceIdentifier:v10 localDeviceIdentifier:v9 remoteDeviceIdentifier:v8];

  if (v11 == v12 || v11 && v12 && [v11 isEqual:v12])
  {
    v13 = self;
  }
  else
  {
    v14 = [DNDSModeAssertionInvalidationRequest alloc];
    v15 = [(DNDSModeAssertionInvalidationRequest *)self UUID];
    v16 = [(DNDSModeAssertionInvalidationRequest *)self predicate];
    v17 = [(DNDSModeAssertionInvalidationRequest *)self requestDate];
    v18 = [(DNDSModeAssertionInvalidationRequest *)self details];
    v13 = [(DNDSModeAssertionInvalidationRequest *)v14 initWithUUID:v15 predicate:v16 requestDate:v17 details:v18 source:v12 reason:[(DNDSModeAssertionInvalidationRequest *)self reason] reasonOverride:[(DNDSModeAssertionInvalidationRequest *)self reasonOverride]];
  }
  return v13;
}

+ (id)requestWithPredicate:(id)a3 requestDate:(id)a4 source:(id)a5 reason:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  v14 = [MEMORY[0x1E4F29128] UUID];
  v15 = (void *)[v13 initWithUUID:v14 predicate:v12 requestDate:v11 details:0 source:v10 reason:a6 reasonOverride:0];

  return v15;
}

+ (id)requestWithPredicate:(id)a3 requestDate:(id)a4 details:(id)a5 source:(id)a6 reason:(unint64_t)a7 reasonOverride:(unint64_t)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc((Class)a1);
  v19 = [MEMORY[0x1E4F29128] UUID];
  v20 = (void *)[v18 initWithUUID:v19 predicate:v17 requestDate:v16 details:v15 source:v14 reason:a7 reasonOverride:a8];

  return v20;
}

- (DNDSModeAssertionInvalidationRequest)initWithUUID:(id)a3 predicate:(id)a4 requestDate:(id)a5 details:(id)a6 source:(id)a7 reason:(unint64_t)a8 reasonOverride:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v32.receiver = self;
  v32.super_class = (Class)DNDSModeAssertionInvalidationRequest;
  v20 = [(DNDSModeAssertionInvalidationRequest *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    UUID = v20->_UUID;
    v20->_UUID = (NSUUID *)v21;

    uint64_t v23 = [v16 copy];
    predicate = v20->_predicate;
    v20->_predicate = (DNDSModeAssertionInvalidationPredicate *)v23;

    uint64_t v25 = [v17 copy];
    requestDate = v20->_requestDate;
    v20->_requestDate = (NSDate *)v25;

    uint64_t v27 = [v18 copy];
    details = v20->_details;
    v20->_details = (DNDModeAssertionInvalidationDetails *)v27;

    uint64_t v29 = [v19 copy];
    source = v20->_source;
    v20->_source = (DNDModeAssertionSource *)v29;

    v20->_reason = a8;
    v20->_reasonOverride = a9;
  }

  return v20;
}

- (unint64_t)hash
{
  v3 = [(DNDSModeAssertionInvalidationRequest *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSModeAssertionInvalidationRequest *)self predicate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSModeAssertionInvalidationRequest *)self requestDate];
  uint64_t v8 = [v7 hash];
  id v9 = [(DNDSModeAssertionInvalidationRequest *)self details];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(DNDSModeAssertionInvalidationRequest *)self source];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v12 ^ [(DNDSModeAssertionInvalidationRequest *)self reason];
  unint64_t v14 = v10 ^ v13 ^ [(DNDSModeAssertionInvalidationRequest *)self reasonOverride];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSModeAssertionInvalidationRequest *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDSModeAssertionInvalidationRequest *)self UUID];
      v7 = [(DNDSModeAssertionInvalidationRequest *)v5 UUID];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSModeAssertionInvalidationRequest *)self UUID];
        if (!v8)
        {
          BOOL v12 = 0;
          goto LABEL_71;
        }
        id v9 = (void *)v8;
        v72 = [(DNDSModeAssertionInvalidationRequest *)v5 UUID];
        if (!v72)
        {
          BOOL v12 = 0;
LABEL_70:

          goto LABEL_71;
        }
        uint64_t v10 = [(DNDSModeAssertionInvalidationRequest *)self UUID];
        id v11 = [(DNDSModeAssertionInvalidationRequest *)v5 UUID];
        if (![v10 isEqual:v11])
        {
          BOOL v12 = 0;
LABEL_69:

          goto LABEL_70;
        }
        v69 = v9;
        v70 = v11;
        v71 = v10;
      }
      unint64_t v13 = [(DNDSModeAssertionInvalidationRequest *)self predicate];
      unint64_t v14 = [(DNDSModeAssertionInvalidationRequest *)v5 predicate];
      if (v13 != v14)
      {
        uint64_t v15 = [(DNDSModeAssertionInvalidationRequest *)self predicate];
        if (!v15) {
          goto LABEL_65;
        }
        id v16 = (void *)v15;
        uint64_t v17 = [(DNDSModeAssertionInvalidationRequest *)v5 predicate];
        if (!v17)
        {

          goto LABEL_65;
        }
        id v18 = v13;
        v67 = (void *)v17;
        id v19 = [(DNDSModeAssertionInvalidationRequest *)self predicate];
        v20 = [(DNDSModeAssertionInvalidationRequest *)v5 predicate];
        if (([v19 isEqual:v20] & 1) == 0)
        {

LABEL_67:
          BOOL v12 = 0;
          goto LABEL_68;
        }
        v61 = v16;
        v62 = v19;
        v66 = v20;
        unint64_t v13 = v18;
      }
      uint64_t v21 = [(DNDSModeAssertionInvalidationRequest *)self requestDate];
      v22 = [(DNDSModeAssertionInvalidationRequest *)v5 requestDate];
      v68 = v21;
      if (v21 == v22)
      {
LABEL_23:
        uint64_t v27 = [(DNDSModeAssertionInvalidationRequest *)self details];
        uint64_t v28 = [(DNDSModeAssertionInvalidationRequest *)v5 details];
        v65 = (void *)v27;
        BOOL v29 = v27 == v28;
        v30 = (void *)v28;
        if (v29)
        {
          v58 = (void *)v28;
          v59 = v22;
LABEL_33:
          v36 = [(DNDSModeAssertionInvalidationRequest *)self source];
          v37 = [(DNDSModeAssertionInvalidationRequest *)v5 source];
          if (v36 == v37)
          {
            v53 = v13;
          }
          else
          {
            uint64_t v38 = [(DNDSModeAssertionInvalidationRequest *)self source];
            if (!v38)
            {

              BOOL v12 = 0;
              v43 = v65;
              goto LABEL_77;
            }
            v52 = (void *)v38;
            uint64_t v39 = [(DNDSModeAssertionInvalidationRequest *)v5 source];
            if (!v39)
            {
              v54 = v36;
              BOOL v12 = 0;
              v43 = v65;
LABEL_76:

LABEL_77:
              if (v43 != v58)
              {
              }
              if (v68 != v59)
              {
              }
              if (v13 == v14) {
                goto LABEL_90;
              }
              goto LABEL_89;
            }
            v48 = (void *)v39;
            v40 = [(DNDSModeAssertionInvalidationRequest *)self source];
            [(DNDSModeAssertionInvalidationRequest *)v5 source];
            v49 = v47 = v40;
            if (!objc_msgSend(v40, "isEqual:"))
            {
              v54 = v36;
              BOOL v12 = 0;
              v43 = v65;
LABEL_75:

              goto LABEL_76;
            }
            v53 = v13;
          }
          unint64_t v41 = [(DNDSModeAssertionInvalidationRequest *)self reason];
          if (v41 == [(DNDSModeAssertionInvalidationRequest *)v5 reason])
          {
            unint64_t v42 = [(DNDSModeAssertionInvalidationRequest *)self reasonOverride];
            BOOL v12 = v42 == [(DNDSModeAssertionInvalidationRequest *)v5 reasonOverride];
            v54 = v36;
            BOOL v29 = v36 == v37;
            unint64_t v13 = v53;
            v43 = v65;
            if (!v29) {
              goto LABEL_75;
            }
          }
          else
          {
            if (v36 != v37)
            {

              BOOL v12 = 0;
              v43 = v65;
              v45 = v58;
              unint64_t v13 = v53;
              if (v65 == v58)
              {
LABEL_86:

                if (v68 != v59)
                {
                }
                if (v13 == v14) {
                  goto LABEL_90;
                }
LABEL_89:

LABEL_90:
LABEL_68:
                id v11 = v70;
                uint64_t v10 = v71;
                id v9 = v69;
                if (v6 != v7) {
                  goto LABEL_69;
                }
LABEL_71:

                goto LABEL_72;
              }
LABEL_85:

              goto LABEL_86;
            }
            v54 = v36;
            BOOL v12 = 0;
            unint64_t v13 = v53;
            v43 = v65;
          }

          v45 = v58;
          if (v43 == v58) {
            goto LABEL_86;
          }
          goto LABEL_85;
        }
        uint64_t v31 = [(DNDSModeAssertionInvalidationRequest *)self details];
        if (!v31)
        {

          if (v68 == v22)
          {
          }
          else
          {
          }
          if (v13 == v14) {
            goto LABEL_65;
          }

          goto LABEL_64;
        }
        v57 = (void *)v31;
        uint64_t v32 = [(DNDSModeAssertionInvalidationRequest *)v5 details];
        if (v32)
        {
          v59 = v22;
          v55 = (void *)v32;
          v33 = [(DNDSModeAssertionInvalidationRequest *)self details];
          v34 = [(DNDSModeAssertionInvalidationRequest *)v5 details];
          if ([v33 isEqual:v34])
          {
            v50 = v34;
            v51 = v33;
            v58 = v30;
            goto LABEL_33;
          }

          v44 = v68;
          if (v68 != v59)
          {

            goto LABEL_58;
          }
        }
        else
        {

          v44 = v68;
          if (v68 != v22)
          {

            goto LABEL_58;
          }
        }

LABEL_58:
        if (v13 != v14)
        {
          v35 = v66;
          goto LABEL_60;
        }
LABEL_65:

        goto LABEL_66;
      }
      uint64_t v23 = [(DNDSModeAssertionInvalidationRequest *)self requestDate];
      if (v23)
      {
        v64 = (void *)v23;
        uint64_t v24 = [(DNDSModeAssertionInvalidationRequest *)v5 requestDate];
        if (v24)
        {
          v60 = (void *)v24;
          uint64_t v25 = [(DNDSModeAssertionInvalidationRequest *)self requestDate];
          v26 = [(DNDSModeAssertionInvalidationRequest *)v5 requestDate];
          if ([v25 isEqual:v26])
          {
            v56 = v25;
            v63 = v26;
            goto LABEL_23;
          }
        }
        if (v13 != v14)
        {

          goto LABEL_66;
        }
      }
      else
      {

        v35 = v66;
        if (v13 != v14)
        {
LABEL_60:

LABEL_64:
          goto LABEL_65;
        }
      }

LABEL_66:
      goto LABEL_67;
    }
    BOOL v12 = 0;
  }
LABEL_72:

  return v12;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSModeAssertionInvalidationRequest *)self UUID];
  uint64_t v6 = [(DNDSModeAssertionInvalidationRequest *)self predicate];
  v7 = [(DNDSModeAssertionInvalidationRequest *)self requestDate];
  uint64_t v8 = [(DNDSModeAssertionInvalidationRequest *)self details];
  id v9 = [(DNDSModeAssertionInvalidationRequest *)self source];
  [(DNDSModeAssertionInvalidationRequest *)self reason];
  uint64_t v10 = DNDModeAssertionInvalidationReasonToString();
  [(DNDSModeAssertionInvalidationRequest *)self reasonOverride];
  id v11 = DNDModeAssertionInvalidationReasonOverrideToString();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; UUID: %@; predicate: %@; requestDate: %@; details: %@; source: %@; reason: %@; reasonOverride: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  BOOL v12 = v11);

  return (NSString *)v12;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (DNDSModeAssertionInvalidationPredicate)predicate
{
  return self->_predicate;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (DNDModeAssertionInvalidationDetails)details
{
  return self->_details;
}

- (DNDModeAssertionSource)source
{
  return self->_source;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)reasonOverride
{
  return self->_reasonOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end