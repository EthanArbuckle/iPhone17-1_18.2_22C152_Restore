@interface IDSOffGridSummaryMessage
+ (BOOL)supportsSecureCoding;
- (IDSOffGridSummaryMessage)initWithCoder:(id)a3;
- (IDSOffGridSummaryMessage)initWithSummary:(id)a3 totalPendingMessagesCount:(id)a4;
- (NSDictionary)pendingCounts;
- (NSNumber)totalPendingMessagesCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSOffGridSummaryMessage

- (IDSOffGridSummaryMessage)initWithSummary:(id)a3 totalPendingMessagesCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSOffGridSummaryMessage;
    v9 = [(IDSOffGridSummaryMessage *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_pendingCounts, a3);
      objc_storeStrong(p_isa + 1, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridSummaryMessage)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"pc"];

  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tc"];

  v11 = [[IDSOffGridSummaryMessage alloc] initWithSummary:v9 totalPendingMessagesCount:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  pendingCounts = self->_pendingCounts;
  id v5 = a3;
  [v5 encodeObject:pendingCounts forKey:@"pc"];
  [v5 encodeObject:self->_totalPendingMessagesCount forKey:@"tc"];
}

- (NSNumber)totalPendingMessagesCount
{
  return self->_totalPendingMessagesCount;
}

- (NSDictionary)pendingCounts
{
  return self->_pendingCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCounts, 0);

  objc_storeStrong((id *)&self->_totalPendingMessagesCount, 0);
}

@end