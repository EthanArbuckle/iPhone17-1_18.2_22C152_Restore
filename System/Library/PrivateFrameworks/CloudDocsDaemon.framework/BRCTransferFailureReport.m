@interface BRCTransferFailureReport
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransferFailureReport:(id)a3;
- (BRCTransferFailureReport)initWithError:(id)a3;
- (NSDate)lastFailureDate;
- (NSDictionary)privateDBErrorCountByPCSAndEDPState;
- (NSDictionary)shareDBErrorCountByPCSAndEDPState;
- (NSError)error;
- (id)description;
- (unint64_t)hash;
- (void)encounteredErrorWithPCSState:(unsigned int)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 privateDB:(BOOL)a5 atDate:(id)a6;
- (void)encounteredErrors:(unint64_t)a3 atDate:(id)a4;
- (void)setLastFailureDate:(id)a3;
@end

@implementation BRCTransferFailureReport

- (BRCTransferFailureReport)initWithError:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCTransferFailureReport;
  v6 = [(BRCTransferFailureReport *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    uint64_t v8 = objc_opt_new();
    privateDBErrorCountByPCSAndEDPState = v7->_privateDBErrorCountByPCSAndEDPState;
    v7->_privateDBErrorCountByPCSAndEDPState = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    shareDBErrorCountByPCSAndEDPState = v7->_shareDBErrorCountByPCSAndEDPState;
    v7->_shareDBErrorCountByPCSAndEDPState = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)setLastFailureDate:(id)a3
{
  id v5 = a3;
  lastFailureDate = self->_lastFailureDate;
  p_lastFailureDate = &self->_lastFailureDate;
  id v12 = v5;
  if (lastFailureDate)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v8 <= 0.0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v12 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (v11 > 0.0) {
LABEL_3:
  }
    objc_storeStrong((id *)p_lastFailureDate, a3);
LABEL_4:
}

- (void)encounteredErrorWithPCSState:(unsigned int)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 privateDB:(BOOL)a5 atDate:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v10 = 16;
  if (a5) {
    uint64_t v10 = 8;
  }
  id v20 = *(id *)((char *)&self->super.isa + v10);
  double v11 = (void *)MEMORY[0x1E4F594F8];
  id v12 = NSNumber;
  id v13 = a6;
  v14 = [v12 numberWithUnsignedInt:v8];
  v15 = [NSNumber numberWithBool:v7];
  v16 = [v11 pairWithLeft:v14 andRight:v15];

  v17 = [v20 objectForKeyedSubscript:v16];
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "longLongValue") + 1);
  }
  else
  {
    v19 = &unk_1F2B26DC0;
  }
  [v20 setObject:v19 forKeyedSubscript:v16];
  [(BRCTransferFailureReport *)self setLastFailureDate:v13];
}

- (void)encounteredErrors:(unint64_t)a3 atDate:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F594F8];
  BOOL v7 = NSNumber;
  id v8 = a4;
  v9 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v10 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "supportsEnhancedDrivePrivacy"));
  id v14 = [v6 pairWithLeft:&unk_1F2B26DD8 andRight:v10];

  double v11 = [(NSMutableDictionary *)self->_privateDBErrorCountByPCSAndEDPState objectForKeyedSubscript:v14];
  if (v11)
  {
    id v12 = v11;
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue") + a3);
  }
  else
  {
    id v13 = [NSNumber numberWithUnsignedLongLong:a3];
  }
  [(NSMutableDictionary *)self->_privateDBErrorCountByPCSAndEDPState setObject:v13 forKeyedSubscript:v14];
  [(BRCTransferFailureReport *)self setLastFailureDate:v8];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p e:%@ ppcs:%@ spcs:%@>", objc_opt_class(), self, self->_error, self->_privateDBErrorCountByPCSAndEDPState, self->_shareDBErrorCountByPCSAndEDPState];
}

- (unint64_t)hash
{
  v3 = [(NSError *)self->_error domain];
  uint64_t v4 = [v3 hash];
  NSInteger v5 = [(NSError *)self->_error code] ^ v4;
  v6 = [(NSError *)self->_error brc_cloudKitErrorMessage];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BRCTransferFailureReport *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRCTransferFailureReport *)self isEqualToTransferFailureReport:v4];
  }

  return v5;
}

- (BOOL)isEqualToTransferFailureReport:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSError *)self->_error userInfo];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  unint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v8 = [v4 error];
  v9 = [v8 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:v6];

  double v11 = [(NSError *)self->_error domain];
  id v12 = [v4 error];
  id v13 = [v12 domain];
  if (([v11 isEqualToString:v13] & 1) == 0) {
    goto LABEL_7;
  }
  NSInteger v14 = [(NSError *)self->_error code];
  v15 = [v4 error];
  if (v14 != [v15 code])
  {

LABEL_7:
    goto LABEL_8;
  }
  *(void *)&long long v28 = v10;
  *((void *)&v28 + 1) = v7;
  v16 = [(NSError *)self->_error brc_cloudKitErrorMessage];
  v17 = [v4 error];
  uint64_t v18 = objc_msgSend(v17, "brc_cloudKitErrorMessage");
  if (v16 == (void *)v18)
  {

LABEL_12:
    unint64_t v7 = (void *)*((void *)&v28 + 1);
    uint64_t v10 = (void *)v28;
    if (v28 == 0)
    {
      BOOL v23 = 1;
      goto LABEL_10;
    }
    double v11 = [*((id *)&v28 + 1) domain];
    id v12 = [(id)v28 domain];
    if ([v11 isEqualToString:v12])
    {
      uint64_t v25 = [*((id *)&v28 + 1) code];
      BOOL v23 = v25 == [(id)v28 code];
      goto LABEL_9;
    }
LABEL_8:
    BOOL v23 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v19 = (void *)v18;
  id v20 = [(NSError *)self->_error brc_cloudKitErrorMessage];
  [v4 error];
  v21 = v26 = v16;
  v22 = objc_msgSend(v21, "brc_cloudKitErrorMessage");
  char v27 = [v20 isEqualToString:v22];

  if (v27) {
    goto LABEL_12;
  }
  BOOL v23 = 0;
  unint64_t v7 = (void *)*((void *)&v28 + 1);
  uint64_t v10 = (void *)v28;
LABEL_10:

  return v23;
}

- (NSError)error
{
  return self->_error;
}

- (NSDate)lastFailureDate
{
  return self->_lastFailureDate;
}

- (NSDictionary)privateDBErrorCountByPCSAndEDPState
{
  return &self->_privateDBErrorCountByPCSAndEDPState->super;
}

- (NSDictionary)shareDBErrorCountByPCSAndEDPState
{
  return &self->_shareDBErrorCountByPCSAndEDPState->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailureDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_shareDBErrorCountByPCSAndEDPState, 0);
  objc_storeStrong((id *)&self->_privateDBErrorCountByPCSAndEDPState, 0);
}

@end