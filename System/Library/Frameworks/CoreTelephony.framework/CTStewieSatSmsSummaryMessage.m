@interface CTStewieSatSmsSummaryMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieSatSmsSummaryMessage)initWithCoder:(id)a3;
- (CTStewieSatSmsSummaryMessage)initWithPendingSatSmsTotalCount:(int64_t)a3 error:(id *)a4;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pendingSatSmsTotalCount;
- (void)encodeWithCoder:(id)a3;
- (void)setPendingSatSmsTotalCount:(int64_t)a3;
@end

@implementation CTStewieSatSmsSummaryMessage

- (CTStewieSatSmsSummaryMessage)initWithPendingSatSmsTotalCount:(int64_t)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CTStewieSatSmsSummaryMessage;
  v5 = [(CTStewieSatSmsSummaryMessage *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_pendingSatSmsTotalCount = a3;
    v7 = v5;
  }

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", pendingSatSmsTotalCount=%ld", -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount")];
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTStewieSatSmsSummaryMessage *)self pendingSatSmsTotalCount];
  LOBYTE(v5) = v5 == [v4 pendingSatSmsTotalCount];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieSatSmsSummaryMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieSatSmsSummaryMessage *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPendingSatSmsTotalCount:", -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount"), @"pendingSatSmsTotalCount");
}

- (CTStewieSatSmsSummaryMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[CTStewieSatSmsSummaryMessage initWithPendingSatSmsTotalCount:error:](self, "initWithPendingSatSmsTotalCount:error:", [v4 decodeIntegerForKey:@"pendingSatSmsTotalCount"], 0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pendingSatSmsTotalCount
{
  return self->_pendingSatSmsTotalCount;
}

- (void)setPendingSatSmsTotalCount:(int64_t)a3
{
  self->_pendingSatSmsTotalCount = a3;
}

@end