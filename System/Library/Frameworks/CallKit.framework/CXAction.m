@interface CXAction
+ (BOOL)supportsSecureCoding;
+ (double)timeout;
- (BOOL)isComplete;
- (BOOL)shouldTimeout;
- (CXAction)init;
- (CXAction)initWithCoder:(NSCoder *)aDecoder;
- (CXActionDelegate)delegate;
- (NSDate)commitDate;
- (NSDate)timeoutDate;
- (NSMutableString)customDescription;
- (NSString)description;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int64_t)failureReason;
- (int64_t)originator;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)fail;
- (void)fulfill;
- (void)setCommitDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailureReason:(int64_t)a3;
- (void)setOriginator:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)updateAsFailedWithReason:(int64_t)a3;
- (void)updateAsFulfilled;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXAction

- (CXAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXAction;
  v2 = [(CXAction *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;
  }
  return v2;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CXAction *)self UUID];
  v5 = [v4 UUIDString];
  [v3 appendFormat:@" UUID=%@", v5];

  int64_t v6 = [(CXAction *)self originator];
  if (v6)
  {
    unint64_t v7 = v6;
    v8 = NSStringFromSelector(sel_originator);
    self;
    if (v7 > 4) {
      v9 = 0;
    }
    else {
      v9 = off_1E5CADD50[v7 - 1];
    }
    [v3 appendFormat:@" %@=%@", v8, v9];
  }
  objc_msgSend(v3, "appendFormat:", @" state=%ld", -[CXAction state](self, "state"));
  v10 = [(CXAction *)self commitDate];
  [v3 appendFormat:@" commitDate=%@", v10];

  if ([(CXAction *)self state] == 2) {
    objc_msgSend(v3, "appendFormat:", @" failureReason=%ld", -[CXAction failureReason](self, "failureReason"));
  }
  v11 = [(CXAction *)self customDescription];
  [v3 appendString:v11];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (NSMutableString)customDescription
{
  return (NSMutableString *)[MEMORY[0x1E4F28E78] string];
}

+ (double)timeout
{
  return 5.0;
}

- (NSDate)timeoutDate
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(id)objc_opt_class() timeout];
  double v5 = v4;
  int64_t v6 = [(CXAction *)self commitDate];
  if (v6)
  {
    unint64_t v7 = [v3 dateWithTimeInterval:v6 sinceDate:v5];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    unint64_t v7 = [v3 dateWithTimeInterval:v8 sinceDate:v5];
  }

  return (NSDate *)v7;
}

- (BOOL)isComplete
{
  return [(CXAction *)self state] != 0;
}

- (void)fulfill
{
  id v3 = (id)[(CXAction *)self copy];
  [v3 updateAsFulfilled];
  v2 = [v3 delegate];
  [v2 actionCompleted:v3];
}

- (void)fail
{
  id v3 = (id)[(CXAction *)self copy];
  [v3 updateAsFailedWithReason:1];
  v2 = [v3 delegate];
  [v2 actionCompleted:v3];
}

- (BOOL)shouldTimeout
{
  return 1;
}

- (void)updateAsFulfilled
{
}

- (void)updateAsFailedWithReason:(int64_t)a3
{
  [(CXAction *)self setState:2];

  [(CXAction *)self setFailureReason:a3];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v5 = a3;
  int64_t v6 = [(CXAction *)self UUID];
  [v5 setUUID:v6];

  unint64_t v7 = [(CXAction *)self delegate];
  [v5 setDelegate:v7];

  objc_msgSend(v5, "setOriginator:", -[CXAction originator](self, "originator"));
  objc_msgSend(v5, "setState:", -[CXAction state](self, "state"));
  objc_msgSend(v5, "setFailureReason:", -[CXAction failureReason](self, "failureReason"));
  id v8 = [(CXAction *)self commitDate];
  [v5 setCommitDate:v8];
}

- (id)sanitizedCopy
{
  return [(CXAction *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXAction *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXAction *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXAction)initWithCoder:(NSCoder *)aDecoder
{
  double v4 = aDecoder;
  v18.receiver = self;
  v18.super_class = (Class)CXAction;
  id v5 = [(CXAction *)&v18 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    v10 = NSStringFromSelector(sel_originator);
    v5->_originator = [(NSCoder *)v4 decodeIntegerForKey:v10];

    v11 = NSStringFromSelector(sel_state);
    v5->_state = [(NSCoder *)v4 decodeIntegerForKey:v11];

    v12 = NSStringFromSelector(sel_failureReason);
    v5->_failureReason = [(NSCoder *)v4 decodeIntegerForKey:v12];

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_commitDate);
    uint64_t v15 = [(NSCoder *)v4 decodeObjectOfClass:v13 forKey:v14];
    commitDate = v5->_commitDate;
    v5->_commitDate = (NSDate *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CXAction *)self UUID];
  uint64_t v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(CXAction *)self originator];
  uint64_t v8 = NSStringFromSelector(sel_originator);
  [v4 encodeInteger:v7 forKey:v8];

  int64_t v9 = [(CXAction *)self state];
  v10 = NSStringFromSelector(sel_state);
  [v4 encodeInteger:v9 forKey:v10];

  int64_t v11 = [(CXAction *)self failureReason];
  v12 = NSStringFromSelector(sel_failureReason);
  [v4 encodeInteger:v11 forKey:v12];

  id v14 = [(CXAction *)self commitDate];
  uint64_t v13 = NSStringFromSelector(sel_commitDate);
  [v4 encodeObject:v14 forKey:v13];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (int64_t)originator
{
  return self->_originator;
}

- (void)setOriginator:(int64_t)a3
{
  self->_originator = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(int64_t)a3
{
  self->_failureReason = a3;
}

- (NSDate)commitDate
{
  return self->_commitDate;
}

- (void)setCommitDate:(id)a3
{
}

- (CXActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commitDate, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end