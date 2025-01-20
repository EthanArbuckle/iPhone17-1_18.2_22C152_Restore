@interface _DKAppIntentsStreamTombstoneRequirement
- (id)eventPredicate;
- (id)predicate;
@end

@implementation _DKAppIntentsStreamTombstoneRequirement

- (id)predicate
{
  v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = +[_DKSystemEventStreams appIntentsStream];
  v4 = [v3 name];
  v5 = [v2 predicateWithFormat:@"streamName == %@", v4];

  return v5;
}

- (id)eventPredicate
{
  v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = +[_DKSystemEventStreams appIntentsStream];
  v4 = [v3 name];
  v5 = [v2 predicateWithFormat:@"stream.name == %@", v4];

  return v5;
}

@end