@interface BGFastPassSystemTask
- (id)description;
@end

@implementation BGFastPassSystemTask

- (id)description
{
  v2 = NSString;
  v3 = [(BGSystemTask *)self identifier];
  v4 = [v2 stringWithFormat:@"<BGFastPassSystemTask: %@>", v3];

  return v4;
}

@end