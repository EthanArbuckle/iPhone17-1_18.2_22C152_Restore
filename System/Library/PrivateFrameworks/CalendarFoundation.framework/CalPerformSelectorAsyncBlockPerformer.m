@interface CalPerformSelectorAsyncBlockPerformer
- (id)performAfterDelay:(double)a3 block:(id)a4;
- (id)performAsync:(id)a3;
@end

@implementation CalPerformSelectorAsyncBlockPerformer

- (id)performAsync:(id)a3
{
  return [(CalPerformSelectorAsyncBlockPerformer *)self performAfterDelay:a3 block:0.0];
}

- (id)performAfterDelay:(double)a3 block:(id)a4
{
  id v5 = a4;
  v6 = [[CalCancelablePerformSelector alloc] initWithBlock:v5];

  [(CalCancelablePerformSelector *)v6 performAfterDelay:a3];

  return v6;
}

@end