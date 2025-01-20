@interface _ATXUnifiedActivityStreamConversions
+ (id)sessionPublisherFromTransitionPublisher:(id)a3;
+ (id)transitionPublisherFromSessionPublisher:(id)a3;
@end

@implementation _ATXUnifiedActivityStreamConversions

+ (id)transitionPublisherFromSessionPublisher:(id)a3
{
  return (id)[a3 flatMapWithTransform:&__block_literal_global_185];
}

+ (id)sessionPublisherFromTransitionPublisher:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F93BB8];
  id v4 = a3;
  v5 = [v3 tupleWithFirst:0 second:0];
  v6 = [v4 scanWithInitial:v5 nextPartialResult:&__block_literal_global_9];

  v7 = [v6 filterWithIsIncluded:&__block_literal_global_12_1];
  v8 = [v7 mapWithTransform:&__block_literal_global_15_2];
  v9 = [v8 filterWithIsIncluded:&__block_literal_global_19_2];

  return v9;
}

@end