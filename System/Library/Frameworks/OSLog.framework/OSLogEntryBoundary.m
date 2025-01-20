@interface OSLogEntryBoundary
+ (BOOL)supportsSecureCoding;
- (OSLogEntryBoundary)initWithCoder:(id)a3;
@end

@implementation OSLogEntryBoundary

- (OSLogEntryBoundary)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OSLogEntryBoundary;
  return [(OSLogEntry *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end