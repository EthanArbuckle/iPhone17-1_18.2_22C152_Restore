@interface CPLRecordStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isConfirmed;
- (BOOL)isQuarantined;
- (BOOL)isResetting;
- (BOOL)isShared;
- (BOOL)isUnknown;
- (BOOL)isUpdating;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (BOOL)isWaitingForUpdate;
- (BOOL)isWaitingForUpload;
- (CPLRecordChange)record;
- (CPLRecordStatus)initWithCoder:(id)a3;
- (CPLRecordStatus)initWithRecord:(id)a3 generation:(unint64_t)a4;
- (NSString)statusDescription;
- (id)description;
- (unint64_t)generation;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setQuarantined:(BOOL)a3;
- (void)setResetting:(BOOL)a3;
- (void)setShared:(BOOL)a3;
- (void)setUnknown:(BOOL)a3;
- (void)setUpdating:(BOOL)a3;
- (void)setUploaded:(BOOL)a3;
- (void)setUploading:(BOOL)a3;
- (void)setWaitingForUpdate:(BOOL)a3;
- (void)setWaitingForUpload:(BOOL)a3;
@end

@implementation CPLRecordStatus

- (void).cxx_destruct
{
}

- (unint64_t)generation
{
  return self->_generation;
}

- (CPLRecordChange)record
{
  return self->_record;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t generation = self->_generation;
  v6 = [(CPLRecordStatus *)self statusDescription];
  v7 = [v3 stringWithFormat:@"<%@ (%lu) for %@>", v4, generation, v6];

  return v7;
}

- (NSString)statusDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLRecordChange *)self->_record scopedIdentifier];
  v6 = (void *)[v3 initWithFormat:@"%@ %@:", v4, v5];

  BOOL v7 = [(CPLRecordStatus *)self isUnknown];
  if (v7) {
    [v6 appendString:@" unknown"];
  }
  if ([(CPLRecordStatus *)self isResetting])
  {
    [v6 appendString:@" resetting"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isQuarantined])
  {
    [v6 appendString:@" quarantined"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isUploaded])
  {
    [v6 appendString:@" uploaded"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isWaitingForUpload])
  {
    [v6 appendString:@" waitingForUpload"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isUploading])
  {
    [v6 appendString:@" uploading"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isWaitingForUpdate])
  {
    [v6 appendString:@" waitingForUpdate"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isUpdating])
  {
    [v6 appendString:@" updating"];
    BOOL v7 = 1;
  }
  if ([(CPLRecordStatus *)self isConfirmed])
  {
    [v6 appendString:@" confirmed"];
    if (![(CPLRecordStatus *)self isShared]) {
      goto LABEL_26;
    }
    v8 = @" shared";
  }
  else
  {
    BOOL v9 = [(CPLRecordStatus *)self isShared];
    if (v9) {
      v8 = @" shared";
    }
    else {
      v8 = @" no status";
    }
    if (!v9 && v7) {
      goto LABEL_26;
    }
  }
  [v6 appendString:v8];
LABEL_26:
  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v7 encodeObject:v5 forKey:@"rClass"];

  v6 = [(CPLRecordChange *)self->_record scopedIdentifier];
  [v7 encodeObject:v6 forKey:@"r"];

  [v7 encodeInteger:self->_generation forKey:@"g"];
  [v7 encodeInt:self->_status.packedStatus forKey:@"pS"];
}

- (CPLRecordStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPLRecordStatus;
  v5 = [(CPLRecordStatus *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rClass"];
    id v7 = v6;
    if (v6) {
      Class v8 = NSClassFromString(v6);
    }
    else {
      Class v8 = 0;
    }
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
    v10 = v9;
    if (!v8 || !v9)
    {

      v13 = 0;
      goto LABEL_10;
    }
    uint64_t v11 = [(objc_class *)v8 newRecordWithScopedIdentifier:v9];
    record = v5->_record;
    v5->_record = (CPLRecordChange *)v11;

    v5->_unint64_t generation = [v4 decodeIntegerForKey:@"g"];
    v5->_status.packedStatus = [v4 decodeIntForKey:@"pS"];
  }
  v13 = v5;
LABEL_10:

  return v13;
}

- (CPLRecordStatus)initWithRecord:(id)a3 generation:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLRecordStatus;
  Class v8 = [(CPLRecordStatus *)&v11 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_record, a3);
    v9->_unint64_t generation = a4;
  }

  return v9;
}

- (void)setShared:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFDFF | v3;
}

- (BOOL)isShared
{
  return (LOWORD(self->_status.packedStatus) >> 9) & 1;
}

- (void)setConfirmed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFEFF | v3;
}

- (BOOL)isConfirmed
{
  return HIBYTE(LOWORD(self->_status.packedStatus)) & 1;
}

- (void)setUpdating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFF7F | v3;
}

- (BOOL)isUpdating
{
  return (LOWORD(self->_status.packedStatus) >> 7) & 1;
}

- (void)setWaitingForUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFBF | v3;
}

- (BOOL)isWaitingForUpdate
{
  return (LOWORD(self->_status.packedStatus) >> 6) & 1;
}

- (void)setUploading:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFDF | v3;
}

- (BOOL)isUploading
{
  return (LOWORD(self->_status.packedStatus) >> 5) & 1;
}

- (void)setWaitingForUpload:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFEF | v3;
}

- (BOOL)isWaitingForUpload
{
  return (LOWORD(self->_status.packedStatus) >> 4) & 1;
}

- (void)setUploaded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFF7 | v3;
}

- (BOOL)isUploaded
{
  return (LOWORD(self->_status.packedStatus) >> 3) & 1;
}

- (void)setResetting:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFFB | v3;
}

- (BOOL)isResetting
{
  return (LOWORD(self->_status.packedStatus) >> 2) & 1;
}

- (void)setQuarantined:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFFD | v3;
}

- (BOOL)isQuarantined
{
  return (LOWORD(self->_status.packedStatus) >> 1) & 1;
}

- (void)setUnknown:(BOOL)a3
{
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFFE | a3;
}

- (BOOL)isUnknown
{
  return *(_WORD *)&self->_status.status & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end