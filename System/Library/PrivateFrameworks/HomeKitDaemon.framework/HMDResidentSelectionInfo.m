@interface HMDResidentSelectionInfo
- (HMDResidentSelectionInfo)initWithPreferredResidentIDSIdentifier:(id)a3 currentResidentSelectionModeType:(unint64_t)a4 selectionTimestamp:(id)a5;
- (HMDResidentSelectionInfo)initWithPreferredResidentIDSIdentifier:(id)a3 selectionTimestamp:(id)a4;
- (NSDate)selectionTimestamp;
- (NSUUID)preferredResidentIDSIdentifier;
- (id)description;
- (unint64_t)currentModeType;
- (void)setPreferredResidentIDSIdentifier:(id)a3;
@end

@implementation HMDResidentSelectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionTimestamp, 0);
  objc_storeStrong((id *)&self->_preferredResidentIDSIdentifier, 0);
}

- (NSDate)selectionTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)currentModeType
{
  return self->_currentModeType;
}

- (void)setPreferredResidentIDSIdentifier:(id)a3
{
}

- (NSUUID)preferredResidentIDSIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDResidentSelectionInfo *)self preferredResidentIDSIdentifier];
  unint64_t v5 = [(HMDResidentSelectionInfo *)self currentModeType];
  v6 = [(HMDResidentSelectionInfo *)self selectionTimestamp];
  v7 = [v6 localTimeDescription];
  v8 = [v3 stringWithFormat:@"Preferred resident IDS identifier: %@, Mode: %lu, Selection Timestamp: %@", v4, v5, v7];

  return v8;
}

- (HMDResidentSelectionInfo)initWithPreferredResidentIDSIdentifier:(id)a3 currentResidentSelectionModeType:(unint64_t)a4 selectionTimestamp:(id)a5
{
  v8 = (NSUUID *)a3;
  v9 = (NSDate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDResidentSelectionInfo;
  v10 = [(HMDResidentSelectionInfo *)&v15 init];
  preferredResidentIDSIdentifier = v10->_preferredResidentIDSIdentifier;
  v10->_preferredResidentIDSIdentifier = v8;
  v12 = v8;

  selectionTimestamp = v10->_selectionTimestamp;
  v10->_currentModeType = a4;
  v10->_selectionTimestamp = v9;

  return v10;
}

- (HMDResidentSelectionInfo)initWithPreferredResidentIDSIdentifier:(id)a3 selectionTimestamp:(id)a4
{
  return -[HMDResidentSelectionInfo initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:](self, "initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:");
}

@end