@interface CNChangeHistoryAnchor
+ (BOOL)supportsSecureCoding;
+ (id)limitedAccessHistoryAnchor;
- (CNChangeHistoryAnchor)initWithCoder:(id)a3;
- (CNChangeHistoryAnchor)initWithHistoryToken:(id)a3 error:(id *)a4;
- (CNChangeHistoryAnchor)initWithSequenceNumber:(int64_t)a3;
- (CNChangeHistoryAnchor)initWithSequenceNumber:(int64_t)a3 changeRecordID:(int64_t)a4;
- (NSData)historyToken;
- (id)description;
- (int64_t)changeRecordID;
- (int64_t)compare:(id)a3;
- (int64_t)sequenceNumber;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryAnchor

- (NSData)historyToken
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(CNChangeHistoryAnchor *)self encodeWithCoder:v3];
  [v3 finishEncoding];
  v4 = [v3 encodedData];

  return (NSData *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"_version"];
  [v5 encodeInteger:self->_sequenceNumber forKey:@"_sequenceNumber"];
  [v5 encodeInteger:self->_changeRecordID forKey:@"_changeRecordID"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryAnchor version](self, "version"));
  id v5 = (id)[v3 appendName:@"version" object:v4];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryAnchor sequenceNumber](self, "sequenceNumber"));
  id v7 = (id)[v3 appendName:@"sequenceNumber" object:v6];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryAnchor changeRecordID](self, "changeRecordID"));
  id v9 = (id)[v3 appendName:@"changeRecordID" object:v8];

  v10 = [v3 build];

  return v10;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int64_t)changeRecordID
{
  return self->_changeRecordID;
}

- (CNChangeHistoryAnchor)initWithSequenceNumber:(int64_t)a3 changeRecordID:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNChangeHistoryAnchor;
  v6 = [(CNChangeHistoryAnchor *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    v6->_changeRecordID = a4;
    v6->_sequenceNumber = a3;
    v6->_int64_t version = 2;
    v8 = v6;
  }

  return v7;
}

- (CNChangeHistoryAnchor)initWithSequenceNumber:(int64_t)a3
{
  return [(CNChangeHistoryAnchor *)self initWithSequenceNumber:a3 changeRecordID:-1];
}

+ (id)limitedAccessHistoryAnchor
{
  v2 = [[CNChangeHistoryAnchor alloc] initWithSequenceNumber:-1];

  return v2;
}

- (CNChangeHistoryAnchor)initWithHistoryToken:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  id v15 = 0;
  v8 = (void *)[[v6 alloc] initForReadingFromData:v7 error:&v15];

  id v9 = v15;
  if (v8)
  {
    objc_super v10 = [(CNChangeHistoryAnchor *)self initWithCoder:v8];
    [v8 finishDecoding];
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = [MEMORY[0x1E4F5A3F0] errorWithCode:6 underlyingError:v9];
    v13 = v12;
    if (a4) {
      *a4 = v12;
    }

    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNChangeHistoryAnchor;
  id v5 = [(CNChangeHistoryAnchor *)&v10 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  v5->_int64_t version = 1;
  if ([v4 containsValueForKey:@"_version"]) {
    v6->_int64_t version = [v4 decodeIntegerForKey:@"_version"];
  }
  if (![v4 containsValueForKey:@"_sequenceNumber"]) {
    goto LABEL_9;
  }
  uint64_t v7 = [v4 decodeIntegerForKey:@"_sequenceNumber"];
  v6->_changeRecordID = -1;
  v6->_sequenceNumber = v7;
  if (v6->_version >= 2)
  {
    if ([v4 containsValueForKey:@"_changeRecordID"])
    {
      v6->_changeRecordID = [v4 decodeIntegerForKey:@"_changeRecordID"];
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v8 = v6;
LABEL_10:

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNChangeHistoryAnchor *)self sequenceNumber];
  if (v5 < [v4 sequenceNumber])
  {
LABEL_5:
    int64_t v7 = -1;
    goto LABEL_6;
  }
  uint64_t v6 = [(CNChangeHistoryAnchor *)self sequenceNumber];
  if (v6 <= [v4 sequenceNumber])
  {
    uint64_t v8 = [(CNChangeHistoryAnchor *)self changeRecordID];
    if (v8 >= [v4 changeRecordID])
    {
      uint64_t v10 = [(CNChangeHistoryAnchor *)self changeRecordID];
      int64_t v7 = v10 > [v4 changeRecordID];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v7 = 1;
LABEL_6:

  return v7;
}

@end