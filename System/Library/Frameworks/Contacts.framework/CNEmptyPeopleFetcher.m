@interface CNEmptyPeopleFetcher
- (void)fetchNextBatchWithReply:(id)a3;
@end

@implementation CNEmptyPeopleFetcher

- (void)fetchNextBatchWithReply:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5A3C0];
  v4 = (void (**)(id, id, uint64_t, void))a3;
  id v5 = [v3 emptyResponse];
  v4[2](v4, v5, 1, 0);
}

@end