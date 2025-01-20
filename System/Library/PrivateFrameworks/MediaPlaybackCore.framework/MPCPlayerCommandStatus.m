@interface MPCPlayerCommandStatus
- (MPCPlayerCommandDialog)dialog;
- (MPCPlayerCommandRequest)request;
- (MPCPlayerCommandStatus)initWithMPStatus:(id)a3 request:(id)a4;
- (MPRemoteCommandStatus)status;
- (NSData)customData;
- (NSError)error;
- (NSString)customDataType;
- (id)description;
- (int64_t)statusCode;
- (int64_t)type;
@end

@implementation MPCPlayerCommandStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_dialog, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (MPRemoteCommandStatus)status
{
  return self->_status;
}

- (MPCPlayerCommandDialog)dialog
{
  return self->_dialog;
}

- (MPCPlayerCommandRequest)request
{
  return self->_request;
}

- (NSString)customDataType
{
  return (NSString *)[(MPRemoteCommandStatus *)self->_status customDataType];
}

- (NSData)customData
{
  return (NSData *)[(MPRemoteCommandStatus *)self->_status customData];
}

- (NSError)error
{
  return (NSError *)[(MPRemoteCommandStatus *)self->_status error];
}

- (int64_t)statusCode
{
  return [(MPRemoteCommandStatus *)self->_status statusCode];
}

- (int64_t)type
{
  uint64_t v2 = [(MPRemoteCommandStatus *)self->_status type];
  int64_t v3 = 2;
  if (v2 == 999) {
    uint64_t v4 = 999;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v2 != 3) {
    int64_t v3 = v4;
  }
  int64_t v5 = 3;
  if (v2 != 2) {
    int64_t v5 = 0;
  }
  if (v2 == 1) {
    int64_t v5 = 1;
  }
  if (v2 <= 2) {
    return v5;
  }
  else {
    return v3;
  }
}

- (id)description
{
  int64_t v3 = [(MPRemoteCommandStatus *)self->_status mediaRemoteType];
  [v3 statusCode];
  uint64_t v4 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();

  int64_t v5 = [(MPCPlayerCommandStatus *)self type];
  switch(v5)
  {
    case 0:
      [NSString stringWithFormat:@"<%@: %p status=%@ unknown>", objc_opt_class(), self, v4, v16];
      goto LABEL_11;
    case 1:
      [NSString stringWithFormat:@"<%@: %p status=%@>", objc_opt_class(), self, v4, v16];
      goto LABEL_11;
    case 2:
      v11 = NSString;
      uint64_t v12 = objc_opt_class();
      v8 = [(MPCPlayerCommandStatus *)self error];
      [v11 stringWithFormat:@"<%@: %p status=%@ error=%@>", v12, self, v4, v8];
      goto LABEL_8;
    case 3:
      v13 = NSString;
      uint64_t v14 = objc_opt_class();
      v8 = [(MPCPlayerCommandStatus *)self dialog];
      [v13 stringWithFormat:@"<%@: %p status=%@ dialog=%@>", v14, self, v4, v8];
      v10 = LABEL_8:;
      goto LABEL_9;
    default:
      if (v5 == 999)
      {
        v6 = NSString;
        uint64_t v7 = objc_opt_class();
        v8 = [(MPCPlayerCommandStatus *)self customDataType];
        v9 = [(MPCPlayerCommandStatus *)self customData];
        v10 = [v6 stringWithFormat:@"<%@: %p status=%@ customData=%@/%lu bytes", v7, self, v4, v8, objc_msgSend(v9, "length")];

LABEL_9:
      }
      else
      {
        [NSString stringWithFormat:@"<%@: %p status=%@ unknown/type=%ld>", objc_opt_class(), self, v4, -[MPCPlayerCommandStatus type](self, "type")];
        v10 = LABEL_11:;
      }

      return v10;
  }
}

- (MPCPlayerCommandStatus)initWithMPStatus:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlayerCommandStatus;
  v9 = [(MPCPlayerCommandStatus *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a4);
    objc_storeStrong((id *)&v10->_status, a3);
    if ([(MPCPlayerCommandStatus *)v10 type] == 3)
    {
      v11 = [MPCPlayerCommandDialog alloc];
      uint64_t v12 = [(MPRemoteCommandStatus *)v10->_status dialog];
      uint64_t v13 = [(MPCPlayerCommandDialog *)v11 initWithMPDialog:v12 request:v8];
      dialog = v10->_dialog;
      v10->_dialog = (MPCPlayerCommandDialog *)v13;
    }
  }

  return v10;
}

@end