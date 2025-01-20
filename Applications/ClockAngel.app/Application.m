@interface Application
- (BOOL)_supportsAlwaysOnDisplay;
- (_TtC10ClockAngel11Application)init;
@end

@implementation Application

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

- (_TtC10ClockAngel11Application)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Application();
  return [(Application *)&v3 init];
}

@end