@interface HMMTagProcessorCreatorObserver
+ (void)addObserverForStartTags:(id)a3 usingCreatorBlock:(id)a4;
- (HMMTagProcessorCreatorObserver)initWithCreationBlock:(id)a3;
- (id)creationBlock;
- (void)observeTaggedEvent:(id)a3 addProcessorBlock:(id)a4;
@end

@implementation HMMTagProcessorCreatorObserver

- (void).cxx_destruct
{
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void)observeTaggedEvent:(id)a3 addProcessorBlock:(id)a4
{
  v9 = (void (**)(id, void *))a4;
  id v6 = a3;
  v7 = [(HMMTagProcessorCreatorObserver *)self creationBlock];
  v8 = ((void (**)(void, id))v7)[2](v7, v6);

  if (v8) {
    v9[2](v9, v8);
  }
}

- (HMMTagProcessorCreatorObserver)initWithCreationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTagProcessorCreatorObserver;
  v5 = [(HMMTagProcessorCreatorObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1D944EB70](v4);
    id creationBlock = v5->_creationBlock;
    v5->_id creationBlock = (id)v6;
  }
  return v5;
}

+ (void)addObserverForStartTags:(id)a3 usingCreatorBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v8 = [[HMMTagProcessorCreatorObserver alloc] initWithCreationBlock:v5];

  v7 = +[HMMTagManager sharedInstance];
  [v7 registerTagObserver:v8 forTags:v6];
}

@end