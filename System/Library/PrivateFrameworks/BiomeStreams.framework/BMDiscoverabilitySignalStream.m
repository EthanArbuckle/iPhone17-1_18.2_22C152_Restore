@interface BMDiscoverabilitySignalStream
- (NSString)identifier;
- (id)source;
@end

@implementation BMDiscoverabilitySignalStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"DiscoverabilitySignal"];
}

- (id)source
{
  v3 = [BMCoreDuetDiscoverabilitySignalsSource alloc];
  v4 = [(BMDiscoverabilitySignalStream *)self identifier];
  v5 = [(BMSource *)v3 initWithIdentifier:v4];

  return v5;
}

@end