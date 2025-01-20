@interface PHASEDirectivityModelParameters
+ (PHASEDirectivityModelParameters)new;
- (PHASEDirectivityModelParameters)init;
- (id)initInternal;
@end

@implementation PHASEDirectivityModelParameters

- (PHASEDirectivityModelParameters)init
{
  return 0;
}

+ (PHASEDirectivityModelParameters)new
{
  return 0;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEDirectivityModelParameters;
  return [(PHASEDirectivityModelParameters *)&v3 init];
}

@end