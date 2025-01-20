@interface ScoreController
- (ScoreController)init;
- (ScoreControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation ScoreController

- (ScoreControllerDelegate)delegate
{
  v2 = (void *)ScoreController.delegate.getter();

  return (ScoreControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ScoreController.delegate.setter();
}

- (ScoreController)init
{
  return (ScoreController *)ScoreController.init()();
}

- (void).cxx_destruct
{
}

@end