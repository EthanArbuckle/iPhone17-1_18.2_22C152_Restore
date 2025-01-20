@interface DNDSEventBehaviorResolution
+ (id)resolutionForDate:(id)a3 eventBehavior:(id)a4 clientIdentifier:(id)a5 outcome:(unint64_t)a6 reason:(unint64_t)a7;
- (BOOL)isEqual:(id)a3;
- (DNDClientEventBehavior)eventBehavior;
- (NSDate)date;
- (NSString)clientIdentifier;
- (NSUUID)UUID;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)_initWithUUID:(id)a3 date:(id)a4 eventBehavior:(id)a5 clientIdentifier:(id)a6 outcome:(unint64_t)a7 reason:(unint64_t)a8;
- (id)description;
- (id)redactedDescription;
- (unint64_t)hash;
- (unint64_t)outcome;
- (unint64_t)reason;
@end

@implementation DNDSEventBehaviorResolution

+ (id)resolutionForDate:(id)a3 eventBehavior:(id)a4 clientIdentifier:(id)a5 outcome:(unint64_t)a6 reason:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc((Class)a1);
  v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = (void *)[v15 _initWithUUID:v16 date:v14 eventBehavior:v13 clientIdentifier:v12 outcome:a6 reason:a7];

  return v17;
}

- (id)_initWithUUID:(id)a3 date:(id)a4 eventBehavior:(id)a5 clientIdentifier:(id)a6 outcome:(unint64_t)a7 reason:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DNDSEventBehaviorResolution;
  v18 = [(DNDSEventBehaviorResolution *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    UUID = v18->_UUID;
    v18->_UUID = (NSUUID *)v19;

    uint64_t v21 = [v15 copy];
    date = v18->_date;
    v18->_date = (NSDate *)v21;

    uint64_t v23 = [v16 copy];
    eventBehavior = v18->_eventBehavior;
    v18->_eventBehavior = (DNDClientEventBehavior *)v23;

    uint64_t v25 = [v17 copy];
    clientIdentifier = v18->_clientIdentifier;
    v18->_clientIdentifier = (NSString *)v25;

    v18->_outcome = a7;
    v18->_reason = a8;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(DNDSEventBehaviorResolution *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSEventBehaviorResolution *)self date];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSEventBehaviorResolution *)self eventBehavior];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSEventBehaviorResolution *)self clientIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(DNDSEventBehaviorResolution *)self outcome];
  unint64_t v12 = v10 ^ v11 ^ [(DNDSEventBehaviorResolution *)self reason];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (DNDSEventBehaviorResolution *)a3;
  if (self == v6)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      uint64_t v8 = [(DNDSEventBehaviorResolution *)self UUID];
      v9 = [(DNDSEventBehaviorResolution *)v7 UUID];
      if (v8 != v9)
      {
        uint64_t v10 = [(DNDSEventBehaviorResolution *)self UUID];
        if (!v10)
        {
          BOOL v13 = 0;
          goto LABEL_65;
        }
        v3 = (void *)v10;
        unint64_t v11 = [(DNDSEventBehaviorResolution *)v7 UUID];
        if (!v11)
        {
          BOOL v13 = 0;
LABEL_64:

          goto LABEL_65;
        }
        unint64_t v12 = [(DNDSEventBehaviorResolution *)self UUID];
        uint64_t v4 = [(DNDSEventBehaviorResolution *)v7 UUID];
        if (![v12 isEqual:v4])
        {
          BOOL v13 = 0;
LABEL_63:

          goto LABEL_64;
        }
        v57 = v3;
        v54 = v4;
        v55 = v12;
        v56 = v11;
      }
      id v14 = [(DNDSEventBehaviorResolution *)self date];
      id v15 = [(DNDSEventBehaviorResolution *)v7 date];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSEventBehaviorResolution *)self date];
        if (v16)
        {
          id v17 = (void *)v16;
          v58 = v14;
          uint64_t v18 = [(DNDSEventBehaviorResolution *)v7 date];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            v3 = [(DNDSEventBehaviorResolution *)self date];
            uint64_t v4 = [(DNDSEventBehaviorResolution *)v7 date];
            if ([v3 isEqual:v4])
            {
              v47 = v19;
              v48 = v17;
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
LABEL_45:
        BOOL v13 = 0;
        goto LABEL_62;
      }
      v58 = v14;
LABEL_17:
      v20 = [(DNDSEventBehaviorResolution *)self eventBehavior];
      uint64_t v21 = [(DNDSEventBehaviorResolution *)v7 eventBehavior];
      if (v20 == v21)
      {
        v50 = v20;
        v51 = v4;
        v53 = v3;
LABEL_26:
        uint64_t v26 = [(DNDSEventBehaviorResolution *)self clientIdentifier];
        v27 = [(DNDSEventBehaviorResolution *)v7 clientIdentifier];
        v52 = (void *)v26;
        if ((void *)v26 == v27)
        {
          v44 = v20;
        }
        else
        {
          uint64_t v28 = [(DNDSEventBehaviorResolution *)self clientIdentifier];
          v29 = v20;
          if (!v28)
          {

            BOOL v13 = 0;
            goto LABEL_53;
          }
          v43 = (void *)v28;
          uint64_t v30 = [(DNDSEventBehaviorResolution *)v7 clientIdentifier];
          if (!v30)
          {
            BOOL v13 = 0;
LABEL_52:

LABEL_53:
            v37 = v50;
            if (v50 != v21)
            {
              v39 = v45;
LABEL_58:
            }
LABEL_59:

            if (v58 != v15)
            {
            }
LABEL_62:
            unint64_t v11 = v56;
            v3 = v57;
            uint64_t v4 = v54;
            unint64_t v12 = v55;
            if (v8 != v9) {
              goto LABEL_63;
            }
LABEL_65:

            goto LABEL_66;
          }
          v42 = (void *)v30;
          uint64_t v31 = [(DNDSEventBehaviorResolution *)self clientIdentifier];
          uint64_t v32 = [(DNDSEventBehaviorResolution *)v7 clientIdentifier];
          v41 = (void *)v31;
          v33 = (void *)v31;
          v20 = (void *)v32;
          if (![v33 isEqual:v32])
          {
            BOOL v13 = 0;
LABEL_51:

            goto LABEL_52;
          }
          v44 = v29;
        }
        unint64_t v34 = [(DNDSEventBehaviorResolution *)self outcome];
        if (v34 != [(DNDSEventBehaviorResolution *)v7 outcome])
        {
          if (v52 != v27)
          {

            BOOL v13 = 0;
            v37 = v50;
            BOOL v38 = v50 == v21;
            v29 = v44;
            goto LABEL_57;
          }
          BOOL v13 = 0;
          v29 = v44;
LABEL_56:

          v37 = v50;
          BOOL v38 = v50 == v21;
LABEL_57:
          v39 = v45;
          if (!v38) {
            goto LABEL_58;
          }
          goto LABEL_59;
        }
        unint64_t v35 = [(DNDSEventBehaviorResolution *)self reason];
        BOOL v13 = v35 == [(DNDSEventBehaviorResolution *)v7 reason];
        v29 = v44;
        if (v52 == v27) {
          goto LABEL_56;
        }
        goto LABEL_51;
      }
      uint64_t v22 = [(DNDSEventBehaviorResolution *)self eventBehavior];
      if (v22)
      {
        v49 = (void *)v22;
        uint64_t v23 = [(DNDSEventBehaviorResolution *)v7 eventBehavior];
        if (v23)
        {
          v51 = v4;
          v53 = v3;
          v46 = (void *)v23;
          v24 = [(DNDSEventBehaviorResolution *)self eventBehavior];
          uint64_t v25 = [(DNDSEventBehaviorResolution *)v7 eventBehavior];
          if ([v24 isEqual:v25])
          {
            v50 = v20;
            v20 = v24;
            v45 = v25;
            goto LABEL_26;
          }

          v36 = v58;
          if (v58 != v15)
          {

            goto LABEL_42;
          }
          goto LABEL_43;
        }
      }
      v36 = v58;
      if (v58 != v15)
      {

LABEL_42:
LABEL_44:

        goto LABEL_45;
      }
LABEL_43:

      goto LABEL_44;
    }
    BOOL v13 = 0;
  }
LABEL_66:

  return v13;
}

- (id)description
{
  return [(DNDSEventBehaviorResolution *)self _descriptionForRedacted:0];
}

- (id)redactedDescription
{
  return [(DNDSEventBehaviorResolution *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(DNDSEventBehaviorResolution *)self UUID];
  v7 = [(DNDSEventBehaviorResolution *)self date];
  uint64_t v8 = [(DNDSEventBehaviorResolution *)self eventBehavior];
  v9 = v8;
  uint64_t v10 = v8;
  if (v3)
  {
    uint64_t v10 = [v8 redactedDescription];
  }
  unint64_t v11 = [(DNDSEventBehaviorResolution *)self clientIdentifier];
  unint64_t v12 = DNDSResolutionOutcomeToString([(DNDSEventBehaviorResolution *)self outcome]);
  [(DNDSEventBehaviorResolution *)self reason];
  BOOL v13 = DNDResolutionReasonToString();
  objc_msgSend(v16, "stringWithFormat:", @"<%@: %p; UUID: %@; date: %@; eventBehavior: %@; clientIdentifier: '%@'; outcome: %@; reason: %@>",
    v5,
    self,
    v6,
    v7,
    v10,
    v11,
    v12,
  id v14 = v13);

  if (v3) {
  return v14;
  }
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)date
{
  return self->_date;
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)outcome
{
  return self->_outcome;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end