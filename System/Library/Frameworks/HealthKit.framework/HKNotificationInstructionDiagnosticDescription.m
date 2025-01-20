@interface HKNotificationInstructionDiagnosticDescription
+ (BOOL)supportsSecureCoding;
+ (NSArray)propertyNames;
- (BOOL)isEqual:(id)a3;
- (HKNotificationInstructionDiagnosticDescription)initWithCoder:(id)a3;
- (HKNotificationInstructionDiagnosticDescription)initWithMessageIdentifier:(id)a3 creationDate:(id)a4 receivedDate:(id)a5 modificationDate:(id)a6 sendingDeviceName:(id)a7 sendingDeviceInfo:(id)a8 action:(id)a9 clientIdentifier:(id)a10 categoryIdentifier:(id)a11 expirationDate:(id)a12 criteria:(id)a13 isInvalid:(id)a14;
- (NSArray)propertyValues;
- (NSString)action;
- (NSString)categoryIdentifier;
- (NSString)clientIdentifier;
- (NSString)creationDate;
- (NSString)criteria;
- (NSString)expirationDate;
- (NSString)isInvalid;
- (NSString)messageIdentifier;
- (NSString)modificationDate;
- (NSString)receivedDate;
- (NSString)sendingDeviceInfo;
- (NSString)sendingDeviceName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKNotificationInstructionDiagnosticDescription

- (HKNotificationInstructionDiagnosticDescription)initWithMessageIdentifier:(id)a3 creationDate:(id)a4 receivedDate:(id)a5 modificationDate:(id)a6 sendingDeviceName:(id)a7 sendingDeviceInfo:(id)a8 action:(id)a9 clientIdentifier:(id)a10 categoryIdentifier:(id)a11 expirationDate:(id)a12 criteria:(id)a13 isInvalid:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  v22 = v20;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)HKNotificationInstructionDiagnosticDescription;
  v29 = [(HKNotificationInstructionDiagnosticDescription *)&v59 init];
  if (v29)
  {
    uint64_t v30 = [v19 copy];
    messageIdentifier = v29->_messageIdentifier;
    v29->_messageIdentifier = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    creationDate = v29->_creationDate;
    v29->_creationDate = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    receivedDate = v29->_receivedDate;
    v29->_receivedDate = (NSString *)v34;

    uint64_t v36 = [v58 copy];
    modificationDate = v29->_modificationDate;
    v29->_modificationDate = (NSString *)v36;

    uint64_t v38 = [v57 copy];
    sendingDeviceName = v29->_sendingDeviceName;
    v29->_sendingDeviceName = (NSString *)v38;

    uint64_t v40 = [v56 copy];
    sendingDeviceInfo = v29->_sendingDeviceInfo;
    v29->_sendingDeviceInfo = (NSString *)v40;

    uint64_t v42 = [v23 copy];
    action = v29->_action;
    v29->_action = (NSString *)v42;

    uint64_t v44 = [v24 copy];
    clientIdentifier = v29->_clientIdentifier;
    v29->_clientIdentifier = (NSString *)v44;

    uint64_t v46 = [v25 copy];
    categoryIdentifier = v29->_categoryIdentifier;
    v29->_categoryIdentifier = (NSString *)v46;

    uint64_t v48 = [v26 copy];
    expirationDate = v29->_expirationDate;
    v29->_expirationDate = (NSString *)v48;

    uint64_t v50 = [v27 copy];
    criteria = v29->_criteria;
    v29->_criteria = (NSString *)v50;

    uint64_t v52 = [v28 copy];
    isInvalid = v29->_isInvalid;
    v29->_isInvalid = (NSString *)v52;
  }
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKNotificationInstructionDiagnosticDescription *)a3;
  if (self == v4)
  {
    char v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      action = self->_action;
      v7 = v5->_action;
      if (action != v7 && (!v7 || !-[NSString isEqualToString:](action, "isEqualToString:"))) {
        goto LABEL_41;
      }
      categoryIdentifier = self->_categoryIdentifier;
      v9 = v5->_categoryIdentifier;
      if (categoryIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:"))) {
        goto LABEL_41;
      }
      clientIdentifier = self->_clientIdentifier;
      v11 = v5->_clientIdentifier;
      if (clientIdentifier != v11 && (!v11 || !-[NSString isEqualToString:](clientIdentifier, "isEqualToString:"))) {
        goto LABEL_41;
      }
      creationDate = self->_creationDate;
      v13 = v5->_creationDate;
      if (creationDate != v13 && (!v13 || !-[NSString isEqualToString:](creationDate, "isEqualToString:"))) {
        goto LABEL_41;
      }
      criteria = self->_criteria;
      v15 = v5->_criteria;
      if (criteria != v15 && (!v15 || !-[NSString isEqualToString:](criteria, "isEqualToString:"))) {
        goto LABEL_41;
      }
      expirationDate = self->_expirationDate;
      v17 = v5->_expirationDate;
      if (expirationDate != v17 && (!v17 || !-[NSString isEqualToString:](expirationDate, "isEqualToString:"))) {
        goto LABEL_41;
      }
      isInvalid = self->_isInvalid;
      id v19 = v5->_isInvalid;
      if (isInvalid != v19 && (!v19 || !-[NSString isEqualToString:](isInvalid, "isEqualToString:"))) {
        goto LABEL_41;
      }
      messageIdentifier = self->_messageIdentifier;
      id v21 = v5->_messageIdentifier;
      if (messageIdentifier != v21 && (!v21 || !-[NSString isEqualToString:](messageIdentifier, "isEqualToString:"))) {
        goto LABEL_41;
      }
      modificationDate = self->_modificationDate;
      id v23 = v5->_modificationDate;
      if (modificationDate != v23 && (!v23 || !-[NSString isEqualToString:](modificationDate, "isEqualToString:"))) {
        goto LABEL_41;
      }
      receivedDate = self->_receivedDate;
      id v25 = v5->_receivedDate;
      if (receivedDate != v25 && (!v25 || !-[NSString isEqualToString:](receivedDate, "isEqualToString:"))) {
        goto LABEL_41;
      }
      sendingDeviceInfo = self->_sendingDeviceInfo;
      id v27 = v5->_sendingDeviceInfo;
      if (sendingDeviceInfo != v27 && (!v27 || !-[NSString isEqualToString:](sendingDeviceInfo, "isEqualToString:"))) {
        goto LABEL_41;
      }
      sendingDeviceName = self->_sendingDeviceName;
      v29 = v5->_sendingDeviceName;
      if (sendingDeviceName == v29)
      {
        char v30 = 1;
        goto LABEL_42;
      }
      if (v29) {
        char v30 = -[NSString isEqualToString:](sendingDeviceName, "isEqualToString:");
      }
      else {
LABEL_41:
      }
        char v30 = 0;
LABEL_42:

      goto LABEL_43;
    }
    char v30 = 0;
  }
LABEL_43:

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_action hash];
  NSUInteger v4 = [(NSString *)self->_categoryIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_clientIdentifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_creationDate hash];
  NSUInteger v7 = [(NSString *)self->_criteria hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_expirationDate hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_isInvalid hash];
  NSUInteger v10 = [(NSString *)self->_messageIdentifier hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_modificationDate hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_receivedDate hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_sendingDeviceInfo hash];
  return v13 ^ [(NSString *)self->_sendingDeviceName hash];
}

+ (NSArray)propertyNames
{
  return (NSArray *)&unk_1EECE6DB0;
}

- (NSArray)propertyValues
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)&self->_messageIdentifier;
  receivedDate = self->_receivedDate;
  long long v8 = *(_OWORD *)&self->_modificationDate;
  sendingDeviceInfo = self->_sendingDeviceInfo;
  long long v2 = *(_OWORD *)&self->_categoryIdentifier;
  long long v10 = *(_OWORD *)&self->_action;
  long long v11 = v2;
  isInvalid = self->_isInvalid;
  criteria = self->_criteria;
  NSUInteger v13 = isInvalid;
  NSUInteger v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:12];

  return (NSArray *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNotificationInstructionDiagnosticDescription)initWithCoder:(id)a3
{
  id v3 = a3;
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"messageIdentifier"];
  NSUInteger v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  NSUInteger v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"receivedDate"];
  long long v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sendingDeviceName"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sendingDeviceInfo"];
  NSUInteger v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  NSUInteger v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
  long long v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"categoryIdentifier"];
  NSUInteger v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  long long v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"criteria"];
  long long v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isInvalid"];

  v15 = [(HKNotificationInstructionDiagnosticDescription *)self initWithMessageIdentifier:v18 creationDate:v4 receivedDate:v5 modificationDate:v6 sendingDeviceName:v17 sendingDeviceInfo:v16 action:v7 clientIdentifier:v13 categoryIdentifier:v8 expirationDate:v9 criteria:v10 isInvalid:v11];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  messageIdentifier = self->_messageIdentifier;
  id v5 = a3;
  [v5 encodeObject:messageIdentifier forKey:@"messageIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_receivedDate forKey:@"receivedDate"];
  [v5 encodeObject:self->_modificationDate forKey:@"modificationDate"];
  [v5 encodeObject:self->_sendingDeviceName forKey:@"sendingDeviceName"];
  [v5 encodeObject:self->_sendingDeviceInfo forKey:@"sendingDeviceInfo"];
  [v5 encodeObject:self->_action forKey:@"action"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_categoryIdentifier forKey:@"categoryIdentifier"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_criteria forKey:@"criteria"];
  [v5 encodeObject:self->_isInvalid forKey:@"isInvalid"];
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSString)creationDate
{
  return self->_creationDate;
}

- (NSString)receivedDate
{
  return self->_receivedDate;
}

- (NSString)modificationDate
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

- (NSString)action
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

- (NSString)expirationDate
{
  return self->_expirationDate;
}

- (NSString)criteria
{
  return self->_criteria;
}

- (NSString)isInvalid
{
  return self->_isInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInvalid, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_sendingDeviceName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end