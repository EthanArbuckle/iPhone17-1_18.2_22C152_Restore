@interface CRKFetchSignInHistoryResultObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isTruncated;
- (CRKFetchSignInHistoryResultObject)initWithCoder:(id)a3;
- (NSArray)history;
- (NSString)ownerAppleID;
- (unint64_t)historyVersion;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setHistory:(id)a3;
- (void)setHistoryVersion:(unint64_t)a3;
- (void)setIsTruncated:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setOwnerAppleID:(id)a3;
@end

@implementation CRKFetchSignInHistoryResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchSignInHistoryResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKFetchSignInHistoryResultObject;
  v5 = [(CATTaskResultObject *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"history"];
    history = v5->_history;
    v5->_history = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isTruncated"];
    v5->_isTruncated = [v11 BOOLValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
    v5->_limit = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historyVersion"];
    v5->_historyVersion = [v13 unsignedIntegerValue];

    v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"ownerAppleID"];
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchSignInHistoryResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v10 encodeWithCoder:v4];
  v5 = [(CRKFetchSignInHistoryResultObject *)self history];
  [v4 encodeObject:v5 forKey:@"history"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKFetchSignInHistoryResultObject isTruncated](self, "isTruncated"));
  [v4 encodeObject:v6 forKey:@"isTruncated"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKFetchSignInHistoryResultObject limit](self, "limit"));
  [v4 encodeObject:v7 forKey:@"limit"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKFetchSignInHistoryResultObject historyVersion](self, "historyVersion"));
  [v4 encodeObject:v8 forKey:@"historyVersion"];

  uint64_t v9 = [(CRKFetchSignInHistoryResultObject *)self ownerAppleID];
  [v4 encodeObject:v9 forKey:@"ownerAppleID"];
}

- (NSArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (void)setIsTruncated:(BOOL)a3
{
  self->_isTruncated = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)historyVersion
{
  return self->_historyVersion;
}

- (void)setHistoryVersion:(unint64_t)a3
{
  self->_historyVersion = a3;
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerAppleID, 0);

  objc_storeStrong((id *)&self->_history, 0);
}

@end