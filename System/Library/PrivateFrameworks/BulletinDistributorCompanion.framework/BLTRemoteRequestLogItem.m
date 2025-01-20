@interface BLTRemoteRequestLogItem
+ (id)remoteRequestLogItemWithIDSTransmitIdentifier:(id)a3 IDSResponseIdentifier:(id)a4 requestDescription:(id)a5 sequenceNumber:(id)a6 sessionIdentifier:(id)a7 sessionState:(unint64_t)a8;
- (NSDate)cacheDate;
- (NSNumber)sequenceNumber;
- (NSString)idsResponseIdentifier;
- (NSString)idsTransmitIdentifier;
- (NSUUID)sessionIdentifier;
- (id)description;
- (id)requestDescription;
- (unint64_t)sessionState;
- (void)setCacheDate:(id)a3;
- (void)setIdsResponseIdentifier:(id)a3;
- (void)setIdsTransmitIdentifier:(id)a3;
- (void)setRequestDescription:(id)a3;
- (void)setSequenceNumber:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSessionState:(unint64_t)a3;
@end

@implementation BLTRemoteRequestLogItem

+ (id)remoteRequestLogItemWithIDSTransmitIdentifier:(id)a3 IDSResponseIdentifier:(id)a4 requestDescription:(id)a5 sequenceNumber:(id)a6 sessionIdentifier:(id)a7 sessionState:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init((Class)a1);
  [v19 setIdsTransmitIdentifier:v18];

  [v19 setIdsResponseIdentifier:v17];
  [v19 setRequestDescription:v16];

  v20 = [MEMORY[0x263EFF910] now];
  [v19 setCacheDate:v20];

  [v19 setSequenceNumber:v15];
  [v19 setSessionIdentifier:v14];

  [v19 setSessionState:a8];
  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(BLTRemoteRequestLogItem *)self idsTransmitIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"idsTransmitIdentifier" skipIfNil:0];

  v6 = [(BLTRemoteRequestLogItem *)self idsResponseIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"idsResponseIdentifier" skipIfNil:1];

  v8 = [(BLTRemoteRequestLogItem *)self requestDescription];
  id v9 = (id)[v3 appendObject:v8 withName:@"requestDescription" skipIfNil:0];

  v10 = [(BLTRemoteRequestLogItem *)self cacheDate];
  id v11 = (id)[v3 appendObject:v10 withName:@"cacheDate" skipIfNil:0];

  v12 = [(BLTRemoteRequestLogItem *)self sequenceNumber];
  id v13 = (id)[v3 appendObject:v12 withName:@"sequenceNumber" skipIfNil:0];

  id v14 = [(BLTRemoteRequestLogItem *)self sessionIdentifier];
  id v15 = (id)[v3 appendObject:v14 withName:@"sessionIdentifier" skipIfNil:0];

  id v16 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[BLTRemoteRequestLogItem sessionState](self, "sessionState"), @"sessionState");
  id v17 = [v3 build];

  return v17;
}

- (NSString)idsTransmitIdentifier
{
  return self->_idsTransmitIdentifier;
}

- (void)setIdsTransmitIdentifier:(id)a3
{
}

- (NSString)idsResponseIdentifier
{
  return self->_idsResponseIdentifier;
}

- (void)setIdsResponseIdentifier:(id)a3
{
}

- (id)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
}

- (NSDate)cacheDate
{
  return self->_cacheDate;
}

- (void)setCacheDate:(id)a3
{
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_cacheDate, 0);
  objc_storeStrong(&self->_requestDescription, 0);
  objc_storeStrong((id *)&self->_idsResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_idsTransmitIdentifier, 0);
}

@end