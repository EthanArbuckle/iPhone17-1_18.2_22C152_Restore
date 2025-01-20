@interface AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable
- (AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable)initWithDate:(id)a3;
- (BOOL)isOlderThan:(id)a3;
- (NSDate)date;
- (NSString)identifier;
@end

@implementation AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isOlderThan:(id)a3
{
  return [(NSDate *)self->_date compare:a3] == NSOrderedAscending;
}

- (AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable)initWithDate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable;
  v6 = [(AFOpportuneSpeakingModuleDataCollectionSanitizedSpeakable *)&v11 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_date, a3);
  }

  return v6;
}

@end