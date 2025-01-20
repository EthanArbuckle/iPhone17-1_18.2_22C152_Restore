@interface CNLimitedAccessSyncData
+ (BOOL)supportsSecureCoding;
- (BOOL)fullSyncRequired;
- (CNLimitedAccessSyncData)initWithCoder:(id)a3;
- (NSArray)syncEventsArray;
- (NSEnumerator)syncEvents;
- (int64_t)currentSequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentSequenceNumber:(int64_t)a3;
- (void)setFullSyncRequired:(BOOL)a3;
- (void)setSyncEventsArray:(id)a3;
@end

@implementation CNLimitedAccessSyncData

- (NSEnumerator)syncEvents
{
  v2 = [(CNLimitedAccessSyncData *)self syncEventsArray];
  v3 = [v2 objectEnumerator];

  return (NSEnumerator *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t currentSequenceNumber = self->_currentSequenceNumber;
  id v5 = a3;
  [v5 encodeInteger:currentSequenceNumber forKey:@"_currentSequenceNumber"];
  [v5 encodeBool:self->_fullSyncRequired forKey:@"_fullSyncRequired"];
  [v5 encodeObject:self->_syncEventsArray forKey:@"_syncEventsArray"];
}

- (CNLimitedAccessSyncData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNLimitedAccessSyncData;
  id v5 = [(CNLimitedAccessSyncData *)&v14 init];
  if (v5)
  {
    v5->_int64_t currentSequenceNumber = [v4 decodeIntegerForKey:@"_currentSequenceNumber"];
    v5->_fullSyncRequired = [v4 decodeBoolForKey:@"_fullSyncRequired"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_syncEventsArray"];
    uint64_t v10 = [v9 copy];
    syncEventsArray = v5->_syncEventsArray;
    v5->_syncEventsArray = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (int64_t)currentSequenceNumber
{
  return self->_currentSequenceNumber;
}

- (void)setCurrentSequenceNumber:(int64_t)a3
{
  self->_int64_t currentSequenceNumber = a3;
}

- (BOOL)fullSyncRequired
{
  return self->_fullSyncRequired;
}

- (void)setFullSyncRequired:(BOOL)a3
{
  self->_fullSyncRequired = a3;
}

- (NSArray)syncEventsArray
{
  return self->_syncEventsArray;
}

- (void)setSyncEventsArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end