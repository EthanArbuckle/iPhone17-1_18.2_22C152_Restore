@interface BMMediaUsageStream
- (NSString)identifier;
- (id)source;
@end

@implementation BMMediaUsageStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"MediaUsage"];
}

- (id)source
{
  v3 = [BMCoreDuetMediaUsageSource alloc];
  v4 = [(BMMediaUsageStream *)self identifier];
  v5 = [(BMCoreDuetMediaUsageSource *)v3 initWithIdentifier:v4];

  return v5;
}

@end