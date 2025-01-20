@interface CTStewieIMessageLiteSummaryMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieIMessageLiteSummaryMessage)initWithCoder:(id)a3;
- (CTStewieIMessageLiteSummaryMessage)initWithPendingIMessageLiteTotalCount:(int64_t)a3 pendingCounts:(id)a4 error:(id *)p_isa;
- (NSArray)pendingCounts;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pendingIMessageLiteTotalCount;
- (void)encodeWithCoder:(id)a3;
- (void)setPendingCounts:(id)a3;
- (void)setPendingIMessageLiteTotalCount:(int64_t)a3;
@end

@implementation CTStewieIMessageLiteSummaryMessage

- (CTStewieIMessageLiteSummaryMessage)initWithPendingIMessageLiteTotalCount:(int64_t)a3 pendingCounts:(id)a4 error:(id *)p_isa
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)CTStewieIMessageLiteSummaryMessage;
    v10 = [(CTStewieIMessageLiteSummaryMessage *)&v14 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      v10->_pendingIMessageLiteTotalCount = a3;
      objc_storeStrong((id *)&v10->_pendingCounts, a4);
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
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Pending counts are missing";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *p_isa = [v11 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];

    p_isa = 0;
  }

  return (CTStewieIMessageLiteSummaryMessage *)p_isa;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", pendingIMessageLiteTotalCount=%ld", -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount")];
  v4 = [(CTStewieIMessageLiteSummaryMessage *)self pendingCounts];
  [v3 appendFormat:@", pendingCounts=%@", v4];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTStewieIMessageLiteSummaryMessage *)self pendingIMessageLiteTotalCount];
  if (v5 == [v4 pendingIMessageLiteTotalCount])
  {
    v6 = [(CTStewieIMessageLiteSummaryMessage *)self pendingCounts];
    v7 = [v4 pendingCounts];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(CTStewieIMessageLiteSummaryMessage *)self pendingCounts];
      id v9 = [v4 pendingCounts];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieIMessageLiteSummaryMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieIMessageLiteSummaryMessage *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPendingIMessageLiteTotalCount:", -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount"));
  v6 = [(CTStewieIMessageLiteSummaryMessage *)self pendingCounts];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setPendingCounts:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount"), @"pendingIMessageLiteTotalCount");
  id v4 = [(CTStewieIMessageLiteSummaryMessage *)self pendingCounts];
  [v5 encodeObject:v4 forKey:@"pendingCounts"];
}

- (CTStewieIMessageLiteSummaryMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"pendingIMessageLiteTotalCount"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"pendingCounts"];
  char v10 = [(CTStewieIMessageLiteSummaryMessage *)self initWithPendingIMessageLiteTotalCount:v5 pendingCounts:v9 error:0];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pendingIMessageLiteTotalCount
{
  return self->_pendingIMessageLiteTotalCount;
}

- (void)setPendingIMessageLiteTotalCount:(int64_t)a3
{
  self->_pendingIMessageLiteTotalCount = a3;
}

- (NSArray)pendingCounts
{
  return self->_pendingCounts;
}

- (void)setPendingCounts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end