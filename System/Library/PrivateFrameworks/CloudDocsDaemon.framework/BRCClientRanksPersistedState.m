@interface BRCClientRanksPersistedState
+ (BOOL)supportsSecureCoding;
+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4;
- (BRCClientRanksPersistedState)init;
- (BRCClientRanksPersistedState)initWithCoder:(id)a3;
- (id)description;
- (int64_t)telemetryToken;
- (unint64_t)allocateItemRowID;
- (unint64_t)allocateNotifRank;
- (unint64_t)allocatePackageItemRank;
- (unint64_t)nextItemRowID;
- (unint64_t)nextNotifRank;
- (unint64_t)nextPackageItemRank;
- (unint64_t)telemetryMinRowID;
- (void)encodeWithCoder:(id)a3;
- (void)setNextNotifRank:(unint64_t)a3;
- (void)setNextPackageItemRank:(unint64_t)a3;
- (void)setTelemetryMinRowID:(unint64_t)a3;
- (void)setTelemetryToken:(int64_t)a3;
@end

@implementation BRCClientRanksPersistedState

- (unint64_t)nextItemRowID
{
  return self->_nextItemRowID;
}

- (unint64_t)allocateItemRowID
{
  [(BRCPersistedState *)self assertQueue];
  unint64_t result = self->_nextItemRowID;
  self->_nextItemRowID = result + 1;
  return result;
}

- (unint64_t)nextNotifRank
{
  return self->_nextNotifRank;
}

- (unint64_t)allocateNotifRank
{
  [(BRCPersistedState *)self assertQueue];
  unint64_t result = self->_nextNotifRank;
  self->_nextNotifRank = result + 1;
  return result;
}

- (void)setNextNotifRank:(unint64_t)a3
{
  [(BRCPersistedState *)self assertQueue];
  if (self->_nextNotifRank > a3)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCClientRanksPersistedState setNextNotifRank:]((uint64_t)v5, v6);
    }
  }
  self->_nextNotifRank = a3;
}

- (unint64_t)nextPackageItemRank
{
  return self->_nextPackageItemRank;
}

- (unint64_t)allocatePackageItemRank
{
  [(BRCPersistedState *)self assertQueue];
  unint64_t result = self->_nextPackageItemRank;
  self->_nextPackageItemRank = result + 1;
  return result;
}

- (void)setNextPackageItemRank:(unint64_t)a3
{
  [(BRCPersistedState *)self assertQueue];
  if (self->_nextPackageItemRank > a3)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCClientRanksPersistedState setNextPackageItemRank:]((uint64_t)v5, v6);
    }
  }
  self->_nextPackageItemRank = a3;
}

- (unint64_t)telemetryMinRowID
{
  return self->_telemetryMinRowID;
}

- (void)setTelemetryMinRowID:(unint64_t)a3
{
  self->_telemetryMinRowID = a3;
}

- (int64_t)telemetryToken
{
  return self->_telemetryToken;
}

- (void)setTelemetryToken:(int64_t)a3
{
  self->_telemetryToken = a3;
}

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  id v4 = a3;
  v5 = [v4 clientState];
  v6 = [v5 objectForKeyedSubscript:@"clientRanks"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = objc_opt_new();

    [v5 setObject:v9 forKeyedSubscript:@"clientRanks"];
    v6 = (void *)v9;
  }
  v7 = [v4 clientTruthWorkloop];
  [v6 setAssertionQueue:v7];

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"nextNotifRank:%llu nextPackageItemRank:%llu nextItemRowID:%llu", self->_nextNotifRank, self->_nextPackageItemRank, self->_nextItemRowID);
}

- (BRCClientRanksPersistedState)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRCClientRanksPersistedState;
  unint64_t result = [(BRCClientRanksPersistedState *)&v3 init];
  if (result)
  {
    result->_nextItemRowID = 1;
    result->_nextNotifRank = 1;
    result->_nextPackageItemRank = 1;
  }
  return result;
}

- (BRCClientRanksPersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCClientRanksPersistedState;
  v5 = [(BRCPersistedState *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_nextItemRowID = [v4 decodeInt64ForKey:@"nextItemRowID"];
    v5->_nextNotifRank = [v4 decodeInt64ForKey:@"nextNotifRank"];
    v5->_nextPackageItemRank = [v4 decodeInt64ForKey:@"nextPackageItemRank"];
    v5->_telemetryMinRowID = [v4 decodeInt64ForKey:@"telemetryRowID"];
    v5->_telemetryToken = [v4 decodeInt64ForKey:@"telemetryToken"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCClientRanksPersistedState;
  id v4 = a3;
  [(BRCPersistedState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_nextItemRowID, @"nextItemRowID", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_nextNotifRank forKey:@"nextNotifRank"];
  [v4 encodeInt64:self->_nextPackageItemRank forKey:@"nextPackageItemRank"];
  [v4 encodeInt64:self->_telemetryMinRowID forKey:@"telemetryRowID"];
  [v4 encodeInt64:self->_telemetryToken forKey:@"telemetryToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setNextNotifRank:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: nextNotifRank >= _nextNotifRank%@", (uint8_t *)&v2, 0xCu);
}

- (void)setNextPackageItemRank:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: nextPackageItemRank >= _nextPackageItemRank%@", (uint8_t *)&v2, 0xCu);
}

@end