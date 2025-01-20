@interface BGProcessingTask
- (id)_initWithIdentifier:(id)a3 activity:(id)a4;
- (id)description;
@end

@implementation BGProcessingTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BGProcessingTask;
  return [(BGTask *)&v5 _initWithIdentifier:a3 activity:a4];
}

- (id)description
{
  v2 = NSString;
  v3 = [(BGTask *)self identifier];
  v4 = [v2 stringWithFormat:@"<BGProcessingTask: %@>", v3];

  return v4;
}

@end