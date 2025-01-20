@interface AKFollowUpTearDownContext
+ (BOOL)supportsSecureCoding;
- (AKFollowUpTearDownContext)initWithCoder:(id)a3;
- (BOOL)isContinuityPush;
- (NSString)akAction;
- (NSString)altDSID;
- (NSString)idmsData;
- (NSString)itemIdentifier;
- (NSString)txnid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAkAction:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setIdmsData:(id)a3;
- (void)setIsContinuityPush:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setTxnid:(id)a3;
@end

@implementation AKFollowUpTearDownContext

- (AKFollowUpTearDownContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKFollowUpTearDownContext;
  v5 = [(AKFollowUpTearDownContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_akAction"];
    akAction = v5->_akAction;
    v5->_akAction = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_txnid"];
    txnid = v5->_txnid;
    v5->_txnid = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_idmsData"];
    idmsData = v5->_idmsData;
    v5->_idmsData = (NSString *)v14;

    v5->_isContinuityPush = [v4 decodeBoolForKey:@"_isContinuityPush"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_akAction forKey:@"_akAction"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"_itemIdentifier"];
  [v5 encodeObject:self->_txnid forKey:@"_txnid"];
  [v5 encodeObject:self->_idmsData forKey:@"_idmsData"];
  [v5 encodeBool:self->_isContinuityPush forKey:@"_isContinuityPush"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> identifier: %@, action: %@, altDSID: %@, txnid: %@", objc_opt_class(), self, self->_itemIdentifier, self->_akAction, self->_altDSID, self->_txnid];
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)akAction
{
  return self->_akAction;
}

- (void)setAkAction:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)txnid
{
  return self->_txnid;
}

- (void)setTxnid:(id)a3
{
}

- (NSString)idmsData
{
  return self->_idmsData;
}

- (void)setIdmsData:(id)a3
{
}

- (BOOL)isContinuityPush
{
  return self->_isContinuityPush;
}

- (void)setIsContinuityPush:(BOOL)a3
{
  self->_isContinuityPush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_txnid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_akAction, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end