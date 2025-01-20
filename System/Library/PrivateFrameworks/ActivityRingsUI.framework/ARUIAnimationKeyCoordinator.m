@interface ARUIAnimationKeyCoordinator
+ (id)animationKeyCache;
+ (id)animationKeyForType:(unint64_t)a3 ringIndex:(int64_t)a4;
+ (id)animationKeyFormatForType:(unint64_t)a3;
@end

@implementation ARUIAnimationKeyCoordinator

+ (id)animationKeyForType:(unint64_t)a3 ringIndex:(int64_t)a4
{
  if ((unint64_t)a4 > 2)
  {
    v9 = NSString;
    v6 = [a1 animationKeyFormatForType:a3];
    v8 = objc_msgSend(v9, "stringWithFormat:", v6, a4);
  }
  else
  {
    v6 = [a1 animationKeyCache];
    v7 = [v6 objectAtIndexedSubscript:a3];
    v8 = [v7 objectAtIndexedSubscript:a4];
  }

  return v8;
}

+ (id)animationKeyCache
{
  if (animationKeyCache_onceToken != -1) {
    dispatch_once(&animationKeyCache_onceToken, &__block_literal_global);
  }
  v2 = (void *)animationKeyCache___animationKeyCache;

  return v2;
}

void __48__ARUIAnimationKeyCoordinator_animationKeyCache__block_invoke()
{
  v0 = (void *)animationKeyCache___animationKeyCache;
  animationKeyCache___animationKeyCache = (uint64_t)&unk_26CF0CAC8;
}

+ (id)animationKeyFormatForType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"percentage-%lu";
  }
  else {
    return off_264498AC0[a3 - 1];
  }
}

@end