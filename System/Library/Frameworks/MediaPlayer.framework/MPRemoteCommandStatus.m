@interface MPRemoteCommandStatus
+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 customData:(id)a4 type:(id)a5;
+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 dialog:(id)a4;
+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 dialog:(id)a4 error:(id)a5;
+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 error:(id)a4;
+ (MPRemoteCommandStatus)successStatus;
+ (id)statusWithCode:(int64_t)a3;
- (MPRemoteCommandHandlerDialog)dialog;
- (MPRemoteCommandStatus)initWithMediaRemoteType:(id)a3;
- (MRSendCommandResultStatus)mediaRemoteType;
- (NSData)customData;
- (NSError)error;
- (NSString)customDataType;
- (id)analyticSignature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)statusCode;
- (int64_t)type;
@end

@implementation MPRemoteCommandStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialog, 0);

  objc_storeStrong((id *)&self->_mediaRemoteType, 0);
}

- (MRSendCommandResultStatus)mediaRemoteType
{
  return self->_mediaRemoteType;
}

- (id)analyticSignature
{
  v3 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  [v3 statusCode];
  v4 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();

  uint64_t v5 = [(MPRemoteCommandStatus *)self type];
  if (v5 <= 2)
  {
    if (v5 == 1)
    {
      [NSString stringWithFormat:@"code-%lld|%@", -[MPRemoteCommandStatus statusCode](self, "statusCode"), v4];
      goto LABEL_10;
    }
    if (v5 == 2)
    {
      [NSString stringWithFormat:@"dialog-%lld|%@", -[MPRemoteCommandStatus statusCode](self, "statusCode"), v4];
      v9 = LABEL_10:;
      goto LABEL_13;
    }
LABEL_8:
    [NSString stringWithFormat:@"%lld|%@", -[MPRemoteCommandStatus statusCode](self, "statusCode"), v4];
    goto LABEL_10;
  }
  if (v5 == 3)
  {
    v10 = NSString;
    int64_t v11 = [(MPRemoteCommandStatus *)self statusCode];
    v8 = [(MPRemoteCommandStatus *)self error];
    v12 = objc_msgSend(v8, "msv_analyticSignature");
    v9 = [v10 stringWithFormat:@"error-%lld|%@|%@", v11, v4, v12];
  }
  else
  {
    if (v5 != 999) {
      goto LABEL_8;
    }
    v6 = NSString;
    int64_t v7 = [(MPRemoteCommandStatus *)self statusCode];
    v8 = [(MPRemoteCommandStatus *)self customDataType];
    v9 = [v6 stringWithFormat:@"custom-%lld|%@|%@", v7, v4, v8];
  }

LABEL_13:

  return v9;
}

- (NSString)customDataType
{
  v2 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  v3 = [v2 customDataType];

  return (NSString *)v3;
}

- (NSData)customData
{
  v2 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  v3 = [v2 customData];

  return (NSData *)v3;
}

- (NSError)error
{
  v2 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  v3 = [v2 commandError];

  return (NSError *)v3;
}

- (MPRemoteCommandHandlerDialog)dialog
{
  return self->_dialog;
}

- (int64_t)type
{
  v2 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  uint64_t v3 = [v2 statusType];
  if (v3 == 999) {
    uint64_t v4 = 999;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v3 == 3) {
    uint64_t v4 = 3;
  }
  if (v3 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v3 == 1) {
    uint64_t v5 = 1;
  }
  if (v3 <= 2) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = v4;
  }

  return v6;
}

- (int64_t)statusCode
{
  v2 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  int64_t v3 = MPRemoteCommandHandlerStatusFromMRMediaRemoteCommandHandlerStatus([v2 statusCode]);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  uint64_t v5 = (void *)[v4 copyWithZone:a3];

  int64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMediaRemoteType:", v5);
  return v6;
}

- (id)description
{
  int64_t v3 = [(MPRemoteCommandStatus *)self mediaRemoteType];
  [v3 statusCode];
  uint64_t v4 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();

  int64_t v5 = [(MPRemoteCommandStatus *)self type];
  switch(v5)
  {
    case 0:
      [NSString stringWithFormat:@"<%@: %p status=%@ unknown>", objc_opt_class(), self, v4, v16];
      goto LABEL_11;
    case 1:
      [NSString stringWithFormat:@"<%@: %p status=%@>", objc_opt_class(), self, v4, v16];
      goto LABEL_11;
    case 2:
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      v8 = [(MPRemoteCommandStatus *)self dialog];
      v12 = [v10 stringWithFormat:@"<%@: %p status=%@ dialog=%@>", v11, self, v4, v8];
      goto LABEL_9;
    case 3:
      v13 = NSString;
      uint64_t v14 = objc_opt_class();
      v8 = [(MPRemoteCommandStatus *)self error];
      v9 = objc_msgSend(v8, "msv_description");
      [v13 stringWithFormat:@"<%@: %p status=%@ error=%@>", v14, self, v4, v9, v17];
      goto LABEL_8;
    default:
      if (v5 == 999)
      {
        int64_t v6 = NSString;
        uint64_t v7 = objc_opt_class();
        v8 = [(MPRemoteCommandStatus *)self customDataType];
        v9 = [(MPRemoteCommandStatus *)self customData];
        [v6 stringWithFormat:@"<%@: %p status=%@ customData=%@/%lu bytes", v7, self, v4, v8, objc_msgSend(v9, "length")];
        v12 = LABEL_8:;

LABEL_9:
      }
      else
      {
        [NSString stringWithFormat:@"<%@: %p status=%@ unknown/type=%ld>", objc_opt_class(), self, v4, -[MPRemoteCommandStatus type](self, "type")];
        v12 = LABEL_11:;
      }

      return v12;
  }
}

- (MPRemoteCommandStatus)initWithMediaRemoteType:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPRemoteCommandStatus;
  int64_t v6 = [(MPRemoteCommandStatus *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaRemoteType, a3);
    if ([(MPRemoteCommandStatus *)v7 type] == 2)
    {
      v8 = [MPRemoteCommandHandlerDialog alloc];
      v9 = [(MPRemoteCommandStatus *)v7 mediaRemoteType];
      v10 = [v9 dialog];
      uint64_t v11 = [(MPRemoteCommandHandlerDialog *)v8 initWithMediaRemoteType:v10];
      dialog = v7->_dialog;
      v7->_dialog = (MPRemoteCommandHandlerDialog *)v11;
    }
  }

  return v7;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 customData:(id)a4 type:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F770E8] statusWithCode:MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3) customData:v9 type:v8];

  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithMediaRemoteType:v10];

  return (MPRemoteCommandStatus *)v11;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 dialog:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3);
  uint64_t v11 = (void *)MEMORY[0x1E4F770E8];
  v12 = [v9 mediaRemoteType];

  v13 = [v11 statusWithCode:v10 dialog:v12 error:v8];

  objc_super v14 = (void *)[objc_alloc((Class)a1) initWithMediaRemoteType:v13];

  return (MPRemoteCommandStatus *)v14;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 dialog:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3);
  id v8 = (void *)MEMORY[0x1E4F770E8];
  id v9 = [v6 mediaRemoteType];

  uint64_t v10 = [v8 statusWithCode:v7 dialog:v9];

  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithMediaRemoteType:v10];

  return (MPRemoteCommandStatus *)v11;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F770E8] statusWithCode:MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3) error:v6];

  id v8 = (void *)[objc_alloc((Class)a1) initWithMediaRemoteType:v7];

  return (MPRemoteCommandStatus *)v8;
}

+ (id)statusWithCode:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F770E8] statusWithCode:MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3)];
  id v5 = (void *)[objc_alloc((Class)a1) initWithMediaRemoteType:v4];

  return v5;
}

+ (MPRemoteCommandStatus)successStatus
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MPRemoteCommandStatus_successStatus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (successStatus_onceToken != -1) {
    dispatch_once(&successStatus_onceToken, block);
  }
  v2 = (void *)successStatus___success;

  return (MPRemoteCommandStatus *)v2;
}

void __38__MPRemoteCommandStatus_successStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) statusWithCode:0];
  v2 = (void *)successStatus___success;
  successStatus___success = v1;
}

@end