@interface BGRepeatingSystemTask
- (id)description;
@end

@implementation BGRepeatingSystemTask

- (id)description
{
  v2 = NSString;
  v3 = [(BGSystemTask *)self identifier];
  v4 = [v2 stringWithFormat:@"<BGRepeatingSystemTask: %@>", v3];

  return v4;
}

@end