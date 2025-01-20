@interface WCSessionFileTransfer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransferring;
- (NSDate)transferDate;
- (NSError)transferError;
- (NSProgress)internalProgress;
- (NSProgress)progress;
- (NSString)transferIdentifier;
- (WCSessionFile)file;
- (WCSessionFileTransfer)init;
- (WCSessionFileTransfer)initWithCoder:(id)a3;
- (WCSessionFileTransfer)initWithFile:(id)a3;
- (id)description;
- (id)progressToken;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)initializeProgress;
- (void)setInternalProgress:(id)a3;
- (void)setProgressToken:(id)a3;
- (void)setTransferDate:(id)a3;
- (void)setTransferError:(id)a3;
- (void)setTransferIdentifier:(id)a3;
- (void)setTransferring:(BOOL)a3;
@end

@implementation WCSessionFileTransfer

- (WCSessionFileTransfer)init
{
  v9.receiver = self;
  v9.super_class = (Class)WCSessionFileTransfer;
  v2 = [(WCSessionFileTransfer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    transferError = v2->_transferError;
    v2->_transferError = 0;

    v5 = objc_opt_new();
    uint64_t v6 = [v5 UUIDString];
    transferIdentifier = v3->_transferIdentifier;
    v3->_transferIdentifier = (NSString *)v6;

    [(WCSessionFileTransfer *)v3 initializeProgress];
  }
  return v3;
}

- (WCSessionFileTransfer)initWithFile:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(WCSessionFileTransfer *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_file, a3);
  }

  return v7;
}

- (void)cancel
{
  v3 = +[WCSession defaultSession];
  [v3 cancelFileTransfer:self];

  self->_transferring = 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(WCSessionFileTransfer *)self file];
  uint64_t v6 = [v4 file];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)initializeProgress
{
  v3 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
  progress = self->_progress;
  self->_progress = v3;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__WCSessionFileTransfer_initializeProgress__block_invoke;
  v5[3] = &unk_26463C6C0;
  objc_copyWeak(&v6, &location);
  [(NSProgress *)self->_progress setCancellationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__WCSessionFileTransfer_initializeProgress__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[WCSessionFileTransfer initializeProgress]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (id)description
{
  v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WCSessionFileTransfer *)self file];
  BOOL v7 = [(WCSessionFileTransfer *)self isTransferring];
  v8 = "NO";
  if (v7) {
    v8 = "YES";
  }
  objc_super v9 = [v3 stringWithFormat:@"<%@: %p, session file: %@, transferring: %s>", v5, self, v6, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (WCSessionFileTransfer *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(WCSessionFileTransfer *)self transferIdentifier];
      BOOL v7 = [(WCSessionFileTransfer *)v5 transferIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(WCSessionFileTransfer *)self transferIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  transferDate = self->_transferDate;
  id v5 = a3;
  [v5 encodeObject:transferDate forKey:@"transferDate"];
  [v5 encodeObject:self->_transferIdentifier forKey:@"transferIdentifier"];
  [v5 encodeObject:self->_file forKey:@"file"];
  [v5 encodeBool:self->_transferring forKey:@"transferring"];
}

- (WCSessionFileTransfer)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WCSessionFileTransfer;
  id v5 = [(WCSessionFileTransfer *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferDate"];
    transferDate = v5->_transferDate;
    v5->_transferDate = (NSDate *)v6;

    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferIdentifier"];
    uint64_t v9 = [v8 copy];
    transferIdentifier = v5->_transferIdentifier;
    v5->_transferIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
    file = v5->_file;
    v5->_file = (WCSessionFile *)v11;

    v5->_transferring = [v4 decodeBoolForKey:@"transferring"];
    [(WCSessionFileTransfer *)v5 initializeProgress];
  }

  return v5;
}

- (WCSessionFile)file
{
  return self->_file;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isTransferring
{
  return self->_transferring;
}

- (void)setTransferring:(BOOL)a3
{
  self->_transferring = a3;
}

- (NSDate)transferDate
{
  return self->_transferDate;
}

- (void)setTransferDate:(id)a3
{
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransferIdentifier:(id)a3
{
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransferError:(id)a3
{
}

- (NSProgress)internalProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInternalProgress:(id)a3
{
}

- (id)progressToken
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setProgressToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_transferDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_file, 0);
}

@end