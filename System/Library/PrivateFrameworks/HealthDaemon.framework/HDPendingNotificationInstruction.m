@interface HDPendingNotificationInstruction
- (BOOL)isEqual:(id)a3;
- (HDPendingNotificationInstruction)initWithMessageIdentifier:(id)a3 categoryIdentifier:(id)a4 sendingDeviceName:(id)a5;
- (NSString)categoryIdentifier;
- (NSString)messageIdentifier;
- (NSString)sendingDeviceName;
- (id)description;
- (unint64_t)hash;
@end

@implementation HDPendingNotificationInstruction

- (HDPendingNotificationInstruction)initWithMessageIdentifier:(id)a3 categoryIdentifier:(id)a4 sendingDeviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDPendingNotificationInstruction;
  v11 = [(HDPendingNotificationInstruction *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    messageIdentifier = v11->_messageIdentifier;
    v11->_messageIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    categoryIdentifier = v11->_categoryIdentifier;
    v11->_categoryIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    sendingDeviceName = v11->_sendingDeviceName;
    v11->_sendingDeviceName = (NSString *)v16;
  }
  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%@, c:%@ from:%@>", objc_opt_class(), self->_messageIdentifier, self->_categoryIdentifier, self->_sendingDeviceName];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDPendingNotificationInstruction *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      messageIdentifier = self->_messageIdentifier;
      v7 = v5->_messageIdentifier;
      if (messageIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](messageIdentifier, "isEqualToString:"))) {
        goto LABEL_14;
      }
      categoryIdentifier = self->_categoryIdentifier;
      id v9 = v5->_categoryIdentifier;
      if (categoryIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:"))) {
        goto LABEL_14;
      }
      sendingDeviceName = self->_sendingDeviceName;
      v11 = v5->_sendingDeviceName;
      if (sendingDeviceName == v11)
      {
        char v12 = 1;
        goto LABEL_15;
      }
      if (v11) {
        char v12 = -[NSString isEqualToString:](sendingDeviceName, "isEqualToString:");
      }
      else {
LABEL_14:
      }
        char v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    char v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_messageIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_categoryIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_sendingDeviceName hash];
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)sendingDeviceName
{
  return self->_sendingDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingDeviceName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);

  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end