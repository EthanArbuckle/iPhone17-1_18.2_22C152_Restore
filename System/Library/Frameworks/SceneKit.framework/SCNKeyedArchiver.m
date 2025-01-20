@interface SCNKeyedArchiver
+ (id)archivedDataWithRootObject:(id)a3 options:(id)a4;
- (BOOL)skipMorphTargets;
- (NSDictionary)options;
- (void)dealloc;
- (void)setOptions:(id)a3;
- (void)setSkipMorphTargets:(BOOL)a3;
@end

@implementation SCNKeyedArchiver

+ (id)archivedDataWithRootObject:(id)a3 options:(id)a4
{
  id v7 = (id)[objc_allocWithZone(MEMORY[0x263EFF990]) initWithLength:0];
  v8 = objc_opt_new();
  id v9 = (id)[objc_allocWithZone((Class)a1) initForWritingWithMutableData:v7];
  [v9 setOptions:a4];
  [v9 encodeObject:a3 forKey:*MEMORY[0x263F081D0]];
  [v9 finishEncoding];
  [v8 drain];
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNKeyedArchiver;
  [(NSKeyedArchiver *)&v3 dealloc];
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)skipMorphTargets
{
  return self->skipMorphTargets;
}

- (void)setSkipMorphTargets:(BOOL)a3
{
  self->skipMorphTargets = a3;
}

@end