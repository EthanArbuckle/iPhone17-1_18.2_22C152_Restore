@interface ClarusController
- (ClarusController)init;
- (void)start;
@end

@implementation ClarusController

- (void)start
{
  v2 = self;
  sub_100003634();
}

- (ClarusController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarusController();
  return [(ClarusController *)&v3 init];
}

@end