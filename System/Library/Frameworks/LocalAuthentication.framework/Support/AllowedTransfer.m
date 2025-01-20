@interface AllowedTransfer
- (AllowedTransfer)initWithReceiverAuditTokenData:(id)a3 sender:(id)a4;
- (AllowedTransfer)initWithSender:(id)a3;
- (AllowedTransfer)initWithServerToken:(id)a3 sender:(id)a4;
- (BOOL)isReceiver:(id)a3 allowedToConnectWithServerToken:(id)a4 senderAuditTokenData:(id)a5;
- (id)description;
@end

@implementation AllowedTransfer

- (AllowedTransfer)initWithReceiverAuditTokenData:(id)a3 sender:(id)a4
{
  id v7 = a3;
  v8 = [(AllowedTransfer *)self initWithSender:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_receiverAuditTokenData, a3);
  }

  return v9;
}

- (AllowedTransfer)initWithServerToken:(id)a3 sender:(id)a4
{
  id v7 = a3;
  v8 = [(AllowedTransfer *)self initWithSender:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_serverToken, a3);
  }

  return v9;
}

- (AllowedTransfer)initWithSender:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AllowedTransfer;
  v6 = [(AllowedTransfer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sender, a3);
  }

  return v7;
}

- (id)description
{
  if (self->_receiverAuditTokenData)
  {
    id v3 = [(Caller *)self->_sender pid];
    v4 = [(Caller *)self->_sender auditTokenData];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<AllowedTransfer SPID: %d SAT: %x RAT: %x>", v3, [v4 hash], -[NSData hash](self->_receiverAuditTokenData, "hash"));
    v6 = LABEL_5:;

    goto LABEL_6;
  }
  if (self->_serverToken)
  {
    id v5 = [(Caller *)self->_sender pid];
    v4 = [(Caller *)self->_sender auditTokenData];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<AllowedTransfer SPID: %d SAT: %x ST: %x>", v5, [v4 hash], -[NSData hash](self->_serverToken, "hash"));
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)AllowedTransfer;
  v6 = [(AllowedTransfer *)&v8 description];
LABEL_6:

  return v6;
}

- (BOOL)isReceiver:(id)a3 allowedToConnectWithServerToken:(id)a4 senderAuditTokenData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(Caller *)self->_sender isEqualToAuditTokenData:a5]) {
    goto LABEL_7;
  }
  if (!self->_receiverAuditTokenData)
  {
    if (self->_serverToken)
    {
      unsigned __int8 v10 = objc_msgSend(v9, "isEqualToData:");
      goto LABEL_6;
    }
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  unsigned __int8 v10 = objc_msgSend(v8, "isEqualToAuditTokenData:");
LABEL_6:
  BOOL v11 = v10;
LABEL_8:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverAuditTokenData, 0);
  objc_storeStrong((id *)&self->_serverToken, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end