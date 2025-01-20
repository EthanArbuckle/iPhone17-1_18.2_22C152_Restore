@interface CTStewieIMessageLiteSummaryPendingCount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieIMessageLiteSummaryPendingCount)initWithCoder:(id)a3;
- (CTStewieIMessageLiteSummaryPendingCount)initWithOtherShortHandle:(id)a3 pendingCount:(int64_t)a4 error:(id *)p_isa;
- (NSNumber)otherShortHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pendingCount;
- (void)encodeWithCoder:(id)a3;
- (void)setOtherShortHandle:(id)a3;
- (void)setPendingCount:(int64_t)a3;
@end

@implementation CTStewieIMessageLiteSummaryPendingCount

- (CTStewieIMessageLiteSummaryPendingCount)initWithOtherShortHandle:(id)a3 pendingCount:(int64_t)a4 error:(id *)p_isa
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v9 = (_anonymous_namespace_ *)a3;
  {
    v15.receiver = self;
    v15.super_class = (Class)CTStewieIMessageLiteSummaryPendingCount;
    v11 = [(CTStewieIMessageLiteSummaryPendingCount *)&v15 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_otherShortHandle, a3);
      p_isa[2] = (id)a4;
      self = p_isa;
      p_isa = (id *)&self->super.isa;
    }
    else
    {
      self = 0;
    }
  }
  else if (p_isa)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Invalid otherShortHandle";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *p_isa = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v13];

    p_isa = 0;
  }

  return (CTStewieIMessageLiteSummaryPendingCount *)p_isa;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v6 = a3;
  v7 = [(CTStewieIMessageLiteSummaryPendingCount *)self otherShortHandle];
  v8 = [v6 otherShortHandle];
  if (v7 != v8)
  {
    v3 = [(CTStewieIMessageLiteSummaryPendingCount *)self otherShortHandle];
    v4 = [v6 otherShortHandle];
    if (![v3 isEqual:v4])
    {
      BOOL v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  int64_t v10 = [(CTStewieIMessageLiteSummaryPendingCount *)self pendingCount];
  BOOL v9 = v10 == [v6 pendingCount];
  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieIMessageLiteSummaryPendingCount *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieIMessageLiteSummaryPendingCount *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CTStewieIMessageLiteSummaryPendingCount *)self otherShortHandle];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setOtherShortHandle:v7];

  objc_msgSend(v5, "setPendingCount:", -[CTStewieIMessageLiteSummaryPendingCount pendingCount](self, "pendingCount"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTStewieIMessageLiteSummaryPendingCount *)self otherShortHandle];
  [v5 encodeObject:v4 forKey:@"otherShortHandle"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieIMessageLiteSummaryPendingCount pendingCount](self, "pendingCount"), @"pendingCount");
}

- (CTStewieIMessageLiteSummaryPendingCount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherShortHandle"];
  id v6 = -[CTStewieIMessageLiteSummaryPendingCount initWithOtherShortHandle:pendingCount:error:](self, "initWithOtherShortHandle:pendingCount:error:", v5, [v4 decodeIntegerForKey:@"pendingCount"], 0);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)otherShortHandle
{
  return self->_otherShortHandle;
}

- (void)setOtherShortHandle:(id)a3
{
}

- (int64_t)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(int64_t)a3
{
  self->_pendingCount = a3;
}

- (void).cxx_destruct
{
}

@end