@interface HDNotificationInstructionMessage
- (BOOL)isEqual:(id)a3;
- (HDCodableNotificationInstructionMessage)codableMessage;
- (HDNotificationInstructionCriteria)criteria;
- (HDNotificationInstructionMessage)initWithCodableNotificationInstructionMessage:(id)a3 criteriaClasses:(id)a4;
- (HDNotificationInstructionMessage)initWithCreationDate:(id)a3 sendingDeviceInfo:(id)a4 action:(int64_t)a5 clientIdentifier:(id)a6 categoryIdentifier:(id)a7 expirationDate:(id)a8 criteria:(id)a9;
- (HDNotificationInstructionMessage)initWithMessageDictionary:(id)a3 criteriaClasses:(id)a4;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDictionary)messageDictionary;
- (NSString)categoryIdentifier;
- (NSString)clientIdentifier;
- (NSString)sendingDeviceInfo;
- (id)_initWithMinimumCompatibleVersion:(void *)a3 creationDateTimeIntervalNumber:(void *)a4 sendingDeviceInfo:(void *)a5 actionNumber:(void *)a6 clientIdentifier:(void *)a7 categoryIdentifier:(void *)a8 expirationDateTimeIntervalNumber:(void *)a9 criteria:;
- (id)description;
- (int64_t)action;
- (unint64_t)hash;
@end

@implementation HDNotificationInstructionMessage

- (id)_initWithMinimumCompatibleVersion:(void *)a3 creationDateTimeIntervalNumber:(void *)a4 sendingDeviceInfo:(void *)a5 actionNumber:(void *)a6 clientIdentifier:(void *)a7 categoryIdentifier:(void *)a8 expirationDateTimeIntervalNumber:(void *)a9 criteria:
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (a1 && v16 && [v16 integerValue] <= 1)
  {
    id v24 = 0;
    if (v17 && v18 && v19 && v20 && v21 && v22)
    {
      v26 = (void *)MEMORY[0x1E4F1C9C8];
      [v17 doubleValue];
      v33 = objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
      uint64_t v32 = [v19 integerValue];
      v27 = (void *)MEMORY[0x1E4F1C9C8];
      [v22 doubleValue];
      v28 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
      if ((unint64_t)(v32 - 1) > 2)
      {
        id v24 = 0;
      }
      else
      {
        v29 = a1;
        v30 = v28;
        id v31 = (id)objc_msgSend(v29, "initWithCreationDate:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:", v33, v18, v23);
        v28 = v30;
        a1 = v31;
        id v24 = v31;
      }
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (HDNotificationInstructionMessage)initWithCreationDate:(id)a3 sendingDeviceInfo:(id)a4 action:(int64_t)a5 clientIdentifier:(id)a6 categoryIdentifier:(id)a7 expirationDate:(id)a8 criteria:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)HDNotificationInstructionMessage;
  id v21 = [(HDNotificationInstructionMessage *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    sendingDeviceInfo = v21->_sendingDeviceInfo;
    v21->_sendingDeviceInfo = (NSString *)v22;

    v21->_action = a5;
    uint64_t v24 = [v17 copy];
    clientIdentifier = v21->_clientIdentifier;
    v21->_clientIdentifier = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    categoryIdentifier = v21->_categoryIdentifier;
    v21->_categoryIdentifier = (NSString *)v26;

    uint64_t v28 = [v15 copy];
    creationDate = v21->_creationDate;
    v21->_creationDate = (NSDate *)v28;

    uint64_t v30 = [v19 copy];
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = (NSDate *)v30;

    uint64_t v32 = [v20 copy];
    criteria = v21->_criteria;
    v21->_criteria = (HDNotificationInstructionCriteria *)v32;
  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDNotificationInstructionMessage *)a3;
  if (self == v4)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_action != v5->_action) {
        goto LABEL_24;
      }
      categoryIdentifier = self->_categoryIdentifier;
      v7 = v5->_categoryIdentifier;
      if (categoryIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:"))) {
        goto LABEL_24;
      }
      clientIdentifier = self->_clientIdentifier;
      v9 = v5->_clientIdentifier;
      if (clientIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](clientIdentifier, "isEqualToString:"))) {
        goto LABEL_24;
      }
      creationDate = self->_creationDate;
      v11 = v5->_creationDate;
      if (creationDate != v11 && (!v11 || !-[NSDate isEqualToDate:](creationDate, "isEqualToDate:"))) {
        goto LABEL_24;
      }
      expirationDate = self->_expirationDate;
      v13 = v5->_expirationDate;
      if (expirationDate != v13 && (!v13 || !-[NSDate isEqualToDate:](expirationDate, "isEqualToDate:"))) {
        goto LABEL_24;
      }
      sendingDeviceInfo = self->_sendingDeviceInfo;
      id v15 = v5->_sendingDeviceInfo;
      if (sendingDeviceInfo != v15 && (!v15 || !-[NSString isEqualToString:](sendingDeviceInfo, "isEqualToString:"))) {
        goto LABEL_24;
      }
      criteria = self->_criteria;
      id v17 = v5->_criteria;
      if (criteria == v17)
      {
        char v18 = 1;
        goto LABEL_25;
      }
      if (v17) {
        char v18 = -[HDNotificationInstructionCriteria isEqual:](criteria, "isEqual:");
      }
      else {
LABEL_24:
      }
        char v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    char v18 = 0;
  }
LABEL_26:

  return v18;
}

- (unint64_t)hash
{
  int64_t action = self->_action;
  NSUInteger v4 = [(NSString *)self->_categoryIdentifier hash] ^ action;
  NSUInteger v5 = [(NSString *)self->_clientIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_creationDate hash];
  uint64_t v7 = [(NSDate *)self->_expirationDate hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_sendingDeviceInfo hash];
  return v6 ^ v8 ^ [(HDNotificationInstructionCriteria *)self->_criteria hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  NSUInteger v5 = NSStringFromHKNotificationInstructionAction();
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%@ ctime:%@ %@:%@ expires:%@ criteria:%@ device:%@>", v4, v5, self->_creationDate, self->_clientIdentifier, self->_categoryIdentifier, self->_expirationDate, self->_criteria, self->_sendingDeviceInfo];

  return v6;
}

- (HDNotificationInstructionMessage)initWithMessageDictionary:(id)a3 criteriaClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"criteriaIdentifier", 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "hk_safeDictionaryForKeyPath:error:", @"criteria", 0);
    if (v9)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __78__HDNotificationInstructionMessage_initWithMessageDictionary_criteriaClasses___block_invoke;
      v21[3] = &unk_1E63034B8;
      id v22 = v8;
      v10 = (HDNotificationInstructionMessage *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "hk_firstObjectPassingTest:", v21)), "initWithMessageDictionary:", v9);

      if (!v10) {
        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }
    id v19 = v8;
    id v20 = v7;
  }
  else
  {
    id v19 = 0;
    id v20 = v7;
    v10 = 0;
  }
  v11 = objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", @"minimumCompatibleVersion", 0);
  v12 = objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", @"creationDate", 0);
  v13 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"sendingDeviceInfo", 0);
  v14 = objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", @"action", 0);
  id v15 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"clientIdentifier", 0);
  id v16 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"categoryIdentifier", 0);
  id v17 = objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", @"expirationDate", 0);
  self = (HDNotificationInstructionMessage *)-[HDNotificationInstructionMessage _initWithMinimumCompatibleVersion:creationDateTimeIntervalNumber:sendingDeviceInfo:actionNumber:clientIdentifier:categoryIdentifier:expirationDateTimeIntervalNumber:criteria:](self, v11, v12, v13, v14, v15, v16, v17, v10);

  v9 = v10;
  v10 = self;
  NSUInteger v8 = v19;
  id v7 = v20;
LABEL_9:

  return v10;
}

uint64_t __78__HDNotificationInstructionMessage_initWithMessageDictionary_criteriaClasses___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 criteriaIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (NSDictionary)messageDictionary
{
  v19[8] = *MEMORY[0x1E4F143B8];
  v18[0] = @"currentCompatibilityVersion";
  v18[1] = @"minimumCompatibleVersion";
  v19[0] = &unk_1F17EDDE8;
  v19[1] = &unk_1F17EDE00;
  v18[2] = @"creationDate";
  v3 = NSNumber;
  [(NSDate *)self->_creationDate timeIntervalSinceReferenceDate];
  uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
  sendingDeviceInfo = self->_sendingDeviceInfo;
  int64_t action = self->_action;
  v19[2] = v4;
  v19[3] = sendingDeviceInfo;
  v18[3] = @"sendingDeviceInfo";
  v18[4] = @"action";
  id v7 = [NSNumber numberWithInteger:action];
  clientIdentifier = self->_clientIdentifier;
  categoryIdentifier = self->_categoryIdentifier;
  v19[4] = v7;
  v19[5] = clientIdentifier;
  v18[5] = @"clientIdentifier";
  v18[6] = @"categoryIdentifier";
  v19[6] = categoryIdentifier;
  v18[7] = @"expirationDate";
  v10 = NSNumber;
  [(NSDate *)self->_expirationDate timeIntervalSinceReferenceDate];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v19[7] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:8];
  v13 = (void *)[v12 mutableCopy];

  if (self->_criteria)
  {
    v14 = [(id)objc_opt_class() criteriaIdentifier];
    [v13 setObject:v14 forKeyedSubscript:@"criteriaIdentifier"];

    id v15 = [(HDNotificationInstructionCriteria *)self->_criteria messageDictionary];
    [v13 setObject:v15 forKeyedSubscript:@"criteria"];
  }
  id v16 = (void *)[v13 copy];

  return (NSDictionary *)v16;
}

- (HDNotificationInstructionMessage)initWithCodableNotificationInstructionMessage:(id)a3 criteriaClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 hasCriteria])
  {
    v9 = 0;
LABEL_6:
    int v28 = [v6 hasMinimumCompatibleVersion];
    if (v28)
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "minimumCompatibleVersion"));
    }
    else
    {
      uint64_t v10 = 0;
    }
    int v25 = [v6 hasCreationDateTimeInterval];
    if (v25)
    {
      v11 = NSNumber;
      [v6 creationDateTimeInterval];
      id v31 = objc_msgSend(v11, "numberWithDouble:");
    }
    else
    {
      id v31 = 0;
    }
    int v12 = [v6 hasSendingDeviceInfo];
    if (v12)
    {
      uint64_t v24 = [v6 sendingDeviceInfo];
    }
    else
    {
      uint64_t v24 = 0;
    }
    int v26 = [v6 hasAction];
    if (v26)
    {
      uint64_t v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "action"));
    }
    else
    {
      uint64_t v30 = 0;
    }
    int v13 = [v6 hasClientIdentifier];
    if (v13)
    {
      v29 = [v6 clientIdentifier];
    }
    else
    {
      v29 = 0;
    }
    int v14 = [v6 hasCategoryIdentifier];
    if (v14)
    {
      id v15 = [v6 categoryIdentifier];
    }
    else
    {
      id v15 = 0;
    }
    v27 = (void *)v10;
    if ([v6 hasExpirationDateTimeInterval])
    {
      id v16 = v7;
      id v17 = NSNumber;
      [v6 expirationDateTimeInterval];
      char v18 = objc_msgSend(v17, "numberWithDouble:");
      id v19 = (void *)v10;
      id v20 = v24;
      self = (HDNotificationInstructionMessage *)-[HDNotificationInstructionMessage _initWithMinimumCompatibleVersion:creationDateTimeIntervalNumber:sendingDeviceInfo:actionNumber:clientIdentifier:categoryIdentifier:expirationDateTimeIntervalNumber:criteria:](self, v19, v31, v24, v30, v29, v15, v18, v9);

      id v7 = v16;
    }
    else
    {
      id v21 = (void *)v10;
      id v20 = v24;
      self = (HDNotificationInstructionMessage *)-[HDNotificationInstructionMessage _initWithMinimumCompatibleVersion:creationDateTimeIntervalNumber:sendingDeviceInfo:actionNumber:clientIdentifier:categoryIdentifier:expirationDateTimeIntervalNumber:criteria:](self, v21, v31, v24, v30, v29, v15, 0, v9);
    }
    if (v14) {

    }
    if (v13) {
    if (v26)
    }
    {

      if (!v12)
      {
LABEL_33:
        if (!v25) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    else if (!v12)
    {
      goto LABEL_33;
    }

    if (!v25)
    {
LABEL_35:
      id v22 = self;
      id v8 = v27;
      if (!v28) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
LABEL_34:

    goto LABEL_35;
  }
  id v8 = [v6 criteria];
  if ([v8 hasIdentifier])
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __98__HDNotificationInstructionMessage_initWithCodableNotificationInstructionMessage_criteriaClasses___block_invoke;
    v32[3] = &unk_1E63034B8;
    id v8 = v8;
    id v33 = v8;
    v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "hk_firstObjectPassingTest:", v32)), "initWithCodableNotificationInstructionCriteria:", v8);

    if (v9)
    {

      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
  }
  id v22 = 0;
LABEL_42:

LABEL_43:
  return v22;
}

uint64_t __98__HDNotificationInstructionMessage_initWithCodableNotificationInstructionMessage_criteriaClasses___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 criteriaIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (HDCodableNotificationInstructionMessage)codableMessage
{
  v3 = objc_alloc_init(HDCodableNotificationInstructionMessage);
  [(HDCodableNotificationInstructionMessage *)v3 setCurrentCompatibilityVersion:2];
  [(HDCodableNotificationInstructionMessage *)v3 setMinimumCompatibleVersion:1];
  [(NSDate *)self->_creationDate timeIntervalSinceReferenceDate];
  -[HDCodableNotificationInstructionMessage setCreationDateTimeInterval:](v3, "setCreationDateTimeInterval:");
  [(HDCodableNotificationInstructionMessage *)v3 setSendingDeviceInfo:self->_sendingDeviceInfo];
  [(HDCodableNotificationInstructionMessage *)v3 setAction:self->_action];
  [(HDCodableNotificationInstructionMessage *)v3 setClientIdentifier:self->_clientIdentifier];
  [(HDCodableNotificationInstructionMessage *)v3 setCategoryIdentifier:self->_categoryIdentifier];
  [(NSDate *)self->_expirationDate timeIntervalSinceReferenceDate];
  -[HDCodableNotificationInstructionMessage setExpirationDateTimeInterval:](v3, "setExpirationDateTimeInterval:");
  criteria = self->_criteria;
  if (criteria)
  {
    uint64_t v5 = [(HDNotificationInstructionCriteria *)criteria codableCriteria];
    [(HDCodableNotificationInstructionMessage *)v3 setCriteria:v5];
  }

  return v3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)sendingDeviceInfo
{
  return self->_sendingDeviceInfo;
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HDNotificationInstructionCriteria)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end