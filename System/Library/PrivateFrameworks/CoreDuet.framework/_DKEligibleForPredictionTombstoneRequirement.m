@interface _DKEligibleForPredictionTombstoneRequirement
- (id)eligibleForPredictionKey;
- (id)eventPredicate;
- (id)identifier;
- (id)predicate;
- (id)propertiesToFetch;
- (void)assignPropertiesToTombstone:(id)a3 extractedFromEvent:(id)a4;
- (void)assignPropertiesToTombstone:(id)a3 extractedFromPartialEvent:(id)a4;
@end

@implementation _DKEligibleForPredictionTombstoneRequirement

- (id)eligibleForPredictionKey
{
  v2 = +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  v3 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
  v4 = [v2 objectForKeyedSubscript:v3];

  v5 = [NSString stringWithFormat:@"structuredMetadata.%@", v4];

  return v5;
}

- (id)predicate
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = +[_DKSystemEventStreams appActivityStream];
  v5 = [v4 name];
  v6 = [(_DKEligibleForPredictionTombstoneRequirement *)self eligibleForPredictionKey];
  v7 = [v3 predicateWithFormat:@"streamName == %@ && %K == 1", v5, v6];

  return v7;
}

- (id)eventPredicate
{
  v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = +[_DKSystemEventStreams appActivityStream];
  v4 = [v3 name];
  v5 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
  v6 = [v2 predicateWithFormat:@"stream.name == %@ && metadata.%K == 1", v4, v5];

  return v6;
}

- (id)propertiesToFetch
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_DKEligibleForPredictionTombstoneRequirement *)self eligibleForPredictionKey];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 metadata];
  id v13 = (id)[v7 mutableCopy];

  v8 = [v5 metadata];

  v9 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
  v10 = [v8 objectForKeyedSubscript:v9];
  v11 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
  [v13 setObject:v10 forKeyedSubscript:v11];

  v12 = (void *)[v13 copy];
  [v6 setMetadata:v12];
}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromPartialEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 metadata];
  id v13 = (id)[v8 mutableCopy];

  v9 = [(_DKEligibleForPredictionTombstoneRequirement *)self eligibleForPredictionKey];
  v10 = [v6 objectForKeyedSubscript:v9];

  v11 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
  [v13 setObject:v10 forKeyedSubscript:v11];

  v12 = (void *)[v13 copy];
  [v7 setMetadata:v12];
}

- (id)identifier
{
  return (id)_DKTombstoneEligibleForPredictionIdentifier;
}

@end