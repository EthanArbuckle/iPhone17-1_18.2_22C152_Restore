@interface HDNotificationInstruction
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (HDNotificationInstruction)initWithMessageIdentifier:(id)a3 creationDate:(id)a4 receivedDate:(id)a5 modificationDate:(id)a6 sendingDeviceName:(id)a7 sendingDeviceInfo:(id)a8 action:(int64_t)a9 clientIdentifier:(id)a10 categoryIdentifier:(id)a11 expirationDate:(id)a12 criteria:(id)a13 isInvalid:(BOOL)a14;
- (HDNotificationInstruction)initWithMessageIdentifier:(id)a3 receivedDate:(id)a4 sendingDeviceName:(id)a5 message:(id)a6;
- (HDNotificationInstructionCriteria)criteria;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)modificationDate;
- (NSDate)receivedDate;
- (NSString)categoryIdentifier;
- (NSString)clientIdentifier;
- (NSString)messageIdentifier;
- (NSString)sendingDeviceInfo;
- (NSString)sendingDeviceName;
- (id)description;
- (int64_t)action;
- (int64_t)isValidWithDatabaseTransaction:(id)a3 date:(id)a4 error:(id *)a5;
- (unint64_t)hash;
@end

@implementation HDNotificationInstruction

- (HDNotificationInstruction)initWithMessageIdentifier:(id)a3 creationDate:(id)a4 receivedDate:(id)a5 modificationDate:(id)a6 sendingDeviceName:(id)a7 sendingDeviceInfo:(id)a8 action:(int64_t)a9 clientIdentifier:(id)a10 categoryIdentifier:(id)a11 expirationDate:(id)a12 criteria:(id)a13 isInvalid:(BOOL)a14
{
  id v51 = a3;
  id v50 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  v52.receiver = self;
  v52.super_class = (Class)HDNotificationInstruction;
  v28 = [(HDNotificationInstruction *)&v52 init];
  if (v28)
  {
    uint64_t v29 = [v51 copy];
    messageIdentifier = v28->_messageIdentifier;
    v28->_messageIdentifier = (NSString *)v29;

    uint64_t v31 = [v22 copy];
    sendingDeviceName = v28->_sendingDeviceName;
    v28->_sendingDeviceName = (NSString *)v31;

    uint64_t v33 = [v23 copy];
    sendingDeviceInfo = v28->_sendingDeviceInfo;
    v28->_sendingDeviceInfo = (NSString *)v33;

    v28->_action = a9;
    uint64_t v35 = [v24 copy];
    clientIdentifier = v28->_clientIdentifier;
    v28->_clientIdentifier = (NSString *)v35;

    uint64_t v37 = [v25 copy];
    categoryIdentifier = v28->_categoryIdentifier;
    v28->_categoryIdentifier = (NSString *)v37;

    uint64_t v39 = [v50 copy];
    creationDate = v28->_creationDate;
    v28->_creationDate = (NSDate *)v39;

    uint64_t v41 = [v20 copy];
    receivedDate = v28->_receivedDate;
    v28->_receivedDate = (NSDate *)v41;

    uint64_t v43 = [v26 copy];
    expirationDate = v28->_expirationDate;
    v28->_expirationDate = (NSDate *)v43;

    uint64_t v45 = [v21 copy];
    modificationDate = v28->_modificationDate;
    v28->_modificationDate = (NSDate *)v45;

    uint64_t v47 = [v27 copy];
    criteria = v28->_criteria;
    v28->_criteria = (HDNotificationInstructionCriteria *)v47;

    v28->_isInvalid = a14;
  }

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDNotificationInstruction *)a3;
  if (self == v4)
  {
    BOOL v26 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_action != v5->_action) {
        goto LABEL_37;
      }
      categoryIdentifier = self->_categoryIdentifier;
      v7 = v5->_categoryIdentifier;
      if (categoryIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:"))) {
        goto LABEL_37;
      }
      clientIdentifier = self->_clientIdentifier;
      v9 = v5->_clientIdentifier;
      if (clientIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](clientIdentifier, "isEqualToString:"))) {
        goto LABEL_37;
      }
      creationDate = self->_creationDate;
      v11 = v5->_creationDate;
      if (creationDate != v11 && (!v11 || !-[NSDate isEqualToDate:](creationDate, "isEqualToDate:"))) {
        goto LABEL_37;
      }
      receivedDate = self->_receivedDate;
      v13 = v5->_receivedDate;
      if (receivedDate != v13 && (!v13 || !-[NSDate isEqualToDate:](receivedDate, "isEqualToDate:"))) {
        goto LABEL_37;
      }
      expirationDate = self->_expirationDate;
      v15 = v5->_expirationDate;
      if (expirationDate != v15 && (!v15 || !-[NSDate isEqualToDate:](expirationDate, "isEqualToDate:"))) {
        goto LABEL_37;
      }
      modificationDate = self->_modificationDate;
      v17 = v5->_modificationDate;
      if (modificationDate != v17 && (!v17 || !-[NSDate isEqualToDate:](modificationDate, "isEqualToDate:"))) {
        goto LABEL_37;
      }
      messageIdentifier = self->_messageIdentifier;
      v19 = v5->_messageIdentifier;
      if (messageIdentifier != v19 && (!v19 || !-[NSString isEqualToString:](messageIdentifier, "isEqualToString:"))) {
        goto LABEL_37;
      }
      if (((sendingDeviceName = self->_sendingDeviceName, id v21 = v5->_sendingDeviceName, sendingDeviceName == v21)
         || v21 && -[NSString isEqualToString:](sendingDeviceName, "isEqualToString:"))
        && ((sendingDeviceInfo = self->_sendingDeviceInfo, id v23 = v5->_sendingDeviceInfo, sendingDeviceInfo == v23)
         || v23 && -[NSString isEqualToString:](sendingDeviceInfo, "isEqualToString:"))
        && ((criteria = self->_criteria, id v25 = v5->_criteria, criteria == v25)
         || v25 && -[HDNotificationInstructionCriteria isEqual:](criteria, "isEqual:")))
      {
        BOOL v26 = self->_isInvalid == v5->_isInvalid;
      }
      else
      {
LABEL_37:
        BOOL v26 = 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }

  return v26;
}

- (unint64_t)hash
{
  int64_t action = self->_action;
  NSUInteger v4 = [(NSString *)self->_categoryIdentifier hash] ^ action;
  NSUInteger v5 = [(NSString *)self->_clientIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_creationDate hash];
  uint64_t v7 = [(NSDate *)self->_receivedDate hash];
  uint64_t v8 = v7 ^ [(NSDate *)self->_expirationDate hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSDate *)self->_modificationDate hash];
  NSUInteger v10 = [(NSString *)self->_messageIdentifier hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_sendingDeviceName hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_sendingDeviceInfo hash];
  return v9 ^ v12 ^ [(HDNotificationInstructionCriteria *)self->_criteria hash] ^ self->_isInvalid;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  NSUInteger v5 = NSStringFromHKNotificationInstructionAction();
  long long v13 = *(_OWORD *)&self->_receivedDate;
  long long v14 = *(_OWORD *)&self->_messageIdentifier;
  long long v12 = *(_OWORD *)&self->_clientIdentifier;
  long long v11 = *(_OWORD *)&self->_expirationDate;
  sendingDeviceName = self->_sendingDeviceName;
  sendingDeviceInfo = self->_sendingDeviceInfo;
  uint64_t v8 = [NSNumber numberWithBool:self->_isInvalid];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%@ mID:%@ ctime:%@ rtime:%@ mtime:%@ %@:%@ expires:%@ criteria:%@ device:%@;%@ invalid:%@>",
    v4,
    v5,
    v14,
    v13,
    v12,
    v11,
    sendingDeviceName,
    sendingDeviceInfo,
  uint64_t v9 = v8);

  return v9;
}

- (HDNotificationInstruction)initWithMessageIdentifier:(id)a3 receivedDate:(id)a4 sendingDeviceName:(id)a5 message:(id)a6
{
  uint64_t v7 = 0;
  if (a3 && a6)
  {
    id v11 = a6;
    id v25 = a5;
    id v12 = a4;
    id v13 = a3;
    id v24 = [v11 creationDate];
    id v23 = [v11 creationDate];
    long long v14 = [v11 sendingDeviceInfo];
    uint64_t v15 = [v11 action];
    id v22 = [v11 clientIdentifier];
    v16 = [v11 categoryIdentifier];
    v17 = [v11 expirationDate];
    v18 = [v11 criteria];

    LOBYTE(v21) = 0;
    v19 = [(HDNotificationInstruction *)self initWithMessageIdentifier:v13 creationDate:v24 receivedDate:v12 modificationDate:v23 sendingDeviceName:v25 sendingDeviceInfo:v14 action:v15 clientIdentifier:v22 categoryIdentifier:v16 expirationDate:v17 criteria:v18 isInvalid:v21];

    self = v19;
    uint64_t v7 = self;
  }

  return v7;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)sendingDeviceName
{
  return self->_sendingDeviceName;
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

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_sendingDeviceName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(HDNotificationInstruction *)self isInvalid]
    || ([(HDNotificationInstruction *)self expirationDate],
        NSUInteger v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_msgSend(v9, "hk_isAfterDate:", v10),
        v10,
        (v11 & 1) != 0))
  {
    int64_t v12 = 2;
  }
  else
  {
    long long v14 = [(HDNotificationInstruction *)self criteria];

    if (v14)
    {
      uint64_t v15 = [(HDNotificationInstruction *)self criteria];
      int64_t v12 = [v15 isValidWithDatabaseTransaction:v8 error:a5];
    }
    else
    {
      int64_t v12 = 1;
    }
  }

  return v12;
}

@end