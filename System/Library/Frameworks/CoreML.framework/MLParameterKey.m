@interface MLParameterKey
+ (MLParameterKey)beta1;
+ (MLParameterKey)beta2;
+ (MLParameterKey)biases;
+ (MLParameterKey)epochs;
+ (MLParameterKey)eps;
+ (MLParameterKey)learningRate;
+ (MLParameterKey)linkedModelFileName;
+ (MLParameterKey)linkedModelSearchPath;
+ (MLParameterKey)miniBatchSize;
+ (MLParameterKey)momentum;
+ (MLParameterKey)numberOfNeighbors;
+ (MLParameterKey)seed;
+ (MLParameterKey)shuffle;
+ (MLParameterKey)weights;
+ (id)maxDepth;
+ (id)minChildWeight;
+ (id)numClasses;
+ (id)numTrees;
+ (id)objective;
+ (id)precisionRecallCurves;
+ (id)updateType;
- (MLParameterKey)initWithKeyName:(id)a3;
- (MLParameterKey)scopedTo:(NSString *)scope;
- (id)deletingPrefixingScope:(id)a3;
@end

@implementation MLParameterKey

- (MLParameterKey)initWithKeyName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MLParameterKey;
  return [(MLKey *)&v4 initWithKeyName:a3];
}

+ (MLParameterKey)numberOfNeighbors
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"numberOfNeighbors"];

  return v2;
}

+ (MLParameterKey)seed
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"seed"];

  return v2;
}

+ (MLParameterKey)shuffle
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"shuffle"];

  return v2;
}

+ (MLParameterKey)epochs
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"epochs"];

  return v2;
}

+ (MLParameterKey)eps
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"eps"];

  return v2;
}

+ (MLParameterKey)beta2
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"beta2"];

  return v2;
}

+ (MLParameterKey)beta1
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"beta1"];

  return v2;
}

+ (MLParameterKey)miniBatchSize
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"miniBatchSize"];

  return v2;
}

+ (MLParameterKey)momentum
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"momentum"];

  return v2;
}

+ (MLParameterKey)learningRate
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"learningRate"];

  return v2;
}

- (id)deletingPrefixingScope:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLParameterKey;
  v3 = [(MLKey *)&v5 deletingPrefixingScope:a3];

  return v3;
}

- (MLParameterKey)scopedTo:(NSString *)scope
{
  v5.receiver = self;
  v5.super_class = (Class)MLParameterKey;
  v3 = [(MLKey *)&v5 scopedTo:scope];

  return (MLParameterKey *)v3;
}

+ (id)updateType
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"updateType"];

  return v2;
}

+ (id)minChildWeight
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"minChildWeight"];

  return v2;
}

+ (id)numClasses
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"numClasses"];

  return v2;
}

+ (id)numTrees
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"numTrees"];

  return v2;
}

+ (id)objective
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"objective"];

  return v2;
}

+ (id)maxDepth
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"maxDepth"];

  return v2;
}

+ (MLParameterKey)biases
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"biases"];

  return v2;
}

+ (MLParameterKey)weights
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"weights"];

  return v2;
}

+ (MLParameterKey)linkedModelSearchPath
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"linkedModelSearchPath"];

  return v2;
}

+ (MLParameterKey)linkedModelFileName
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"linkedModelFileName"];

  return v2;
}

+ (id)precisionRecallCurves
{
  v2 = [[MLParameterKey alloc] initWithKeyName:@"precisionRecallCurves"];

  return v2;
}

@end