@interface AVFragmentedMovieMinder
+ (AVFragmentedMovieMinder)fragmentedMovieMinderWithMovie:(AVFragmentedMovie *)movie mindingInterval:(NSTimeInterval)mindingInterval;
- (AVFragmentedMovieMinder)initWithMovie:(AVFragmentedMovie *)movie mindingInterval:(NSTimeInterval)mindingInterval;
- (BOOL)_throwsWhenAlreadyMindedAssetIsAdded;
- (NSArray)movies;
- (NSTimeInterval)mindingInterval;
- (void)addFragmentedMovie:(AVFragmentedMovie *)movie;
- (void)removeFragmentedMovie:(AVFragmentedMovie *)movie;
- (void)setMindingInterval:(NSTimeInterval)mindingInterval;
@end

@implementation AVFragmentedMovieMinder

+ (AVFragmentedMovieMinder)fragmentedMovieMinderWithMovie:(AVFragmentedMovie *)movie mindingInterval:(NSTimeInterval)mindingInterval
{
  v5 = movie;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMovie:v5 mindingInterval:mindingInterval];

  return (AVFragmentedMovieMinder *)v6;
}

- (AVFragmentedMovieMinder)initWithMovie:(AVFragmentedMovie *)movie mindingInterval:(NSTimeInterval)mindingInterval
{
  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedMovieMinder;
  return [(AVFragmentedAssetMinder *)&v5 initWithAsset:movie mindingInterval:mindingInterval];
}

- (BOOL)_throwsWhenAlreadyMindedAssetIsAdded
{
  return 0;
}

- (NSTimeInterval)mindingInterval
{
  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  [(AVFragmentedAssetMinder *)&v3 mindingInterval];
  return result;
}

- (void)setMindingInterval:(NSTimeInterval)mindingInterval
{
  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  [(AVFragmentedAssetMinder *)&v3 setMindingInterval:mindingInterval];
}

- (NSArray)movies
{
  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMovieMinder;
  v2 = [(AVFragmentedAssetMinder *)&v4 assets];
  return (NSArray *)v2;
}

- (void)addFragmentedMovie:(AVFragmentedMovie *)movie
{
  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  [(AVFragmentedAssetMinder *)&v3 addFragmentedAsset:movie];
}

- (void)removeFragmentedMovie:(AVFragmentedMovie *)movie
{
  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  [(AVFragmentedAssetMinder *)&v3 removeFragmentedAsset:movie];
}

@end