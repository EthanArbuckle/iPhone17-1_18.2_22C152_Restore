@interface CNIndexClientState
+ (BOOL)supportsSecureCoding;
+ (CNIndexClientState)clientStateWithData:(id)a3 logger:(id)a4;
- (BOOL)isFullSyncDone;
- (CNChangeHistoryAnchor)fullSyncSnapshotAnchor;
- (CNIndexClientState)init;
- (CNIndexClientState)initWithCoder:(id)a3;
- (id)data;
- (id)description;
- (int64_t)fullSyncOffset;
- (int64_t)indexVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setFullSyncOffset:(int64_t)a3;
- (void)setFullSyncSnapshotAnchor:(id)a3;
- (void)setIndexVersion:(int64_t)a3;
- (void)setIsFullSyncDone:(BOOL)a3;
@end

@implementation CNIndexClientState

- (CNIndexClientState)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNIndexClientState;
  v2 = [(CNIndexClientState *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_isFullSyncDone = 0;
    fullSyncSnapshotAnchor = v2->_fullSyncSnapshotAnchor;
    v2->_indexVersion = 4;
    v2->_fullSyncSnapshotAnchor = 0;

    v3->_fullSyncOffset = 0;
    v5 = v3;
  }

  return v3;
}

+ (CNIndexClientState)clientStateWithData:(id)a3 logger:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = (CNIndexClientState *)&unk_1EC217000;
  v8 = objc_alloc_init(CNIndexClientState);
  id v13 = 0;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v13];
  id v10 = v13;
  if (v9)
  {
    objc_super v7 = [[CNIndexClientState alloc] initWithCoder:v9];
    int v11 = 1;
  }
  else
  {
    [v6 failedToCreateUnarchiverForClientStateWithError:v10];
    int v11 = 0;
  }

  [v9 finishDecoding];
  if ((v11 | 2) == 2) {
    objc_super v7 = v8;
  }

  return v7;
}

- (id)data
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(CNIndexClientState *)self encodeWithCoder:v3];
  v4 = [v3 encodedData];

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [NSNumber numberWithInteger:self->_indexVersion];
  id v5 = [NSNumber numberWithBool:self->_isFullSyncDone];
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryAnchor sequenceNumber](self->_fullSyncSnapshotAnchor, "sequenceNumber"));
  objc_super v7 = [NSNumber numberWithInteger:self->_fullSyncOffset];
  id v8 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"indexVersion", v4, @"isFullSyncDone", v5, @"fullSyncSnapshotAnchor.sequenceNumber", v6, @"fullSyncOffset", v7, 0);

  v9 = [v3 build];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNIndexClientState)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNIndexClientState;
  id v5 = [(CNIndexClientState *)&v10 init];
  if (v5)
  {
    v5->_indexVersion = [v4 decodeIntegerForKey:@"1"];
    v5->_isFullSyncDone = [v4 decodeBoolForKey:@"2"];
    id v6 = -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", [v4 decodeIntegerForKey:@"3"]);
    fullSyncSnapshotAnchor = v5->_fullSyncSnapshotAnchor;
    v5->_fullSyncSnapshotAnchor = v6;

    v5->_fullSyncOffset = [v4 decodeIntegerForKey:@"4"];
    id v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CNIndexClientState indexVersion](self, "indexVersion"), @"1");
  objc_msgSend(v5, "encodeBool:forKey:", -[CNIndexClientState isFullSyncDone](self, "isFullSyncDone"), @"2");
  id v4 = [(CNIndexClientState *)self fullSyncSnapshotAnchor];
  objc_msgSend(v5, "encodeInteger:forKey:", objc_msgSend(v4, "sequenceNumber"), @"3");

  objc_msgSend(v5, "encodeInteger:forKey:", -[CNIndexClientState fullSyncOffset](self, "fullSyncOffset"), @"4");
}

- (int64_t)indexVersion
{
  return self->_indexVersion;
}

- (void)setIndexVersion:(int64_t)a3
{
  self->_indexVersion = a3;
}

- (BOOL)isFullSyncDone
{
  return self->_isFullSyncDone;
}

- (void)setIsFullSyncDone:(BOOL)a3
{
  self->_isFullSyncDone = a3;
}

- (CNChangeHistoryAnchor)fullSyncSnapshotAnchor
{
  return self->_fullSyncSnapshotAnchor;
}

- (void)setFullSyncSnapshotAnchor:(id)a3
{
}

- (int64_t)fullSyncOffset
{
  return self->_fullSyncOffset;
}

- (void)setFullSyncOffset:(int64_t)a3
{
  self->_fullSyncOffset = a3;
}

- (void).cxx_destruct
{
}

@end