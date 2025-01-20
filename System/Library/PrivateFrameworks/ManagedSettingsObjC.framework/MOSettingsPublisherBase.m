@interface MOSettingsPublisherBase
- (MOPublisher)upstream;
- (MOSettingsPublisherBase)initWithUpstream:(id)a3 interestedGroups:(id)a4 startBlock:(id)a5 stopBlock:(id)a6;
- (NSSet)interestedGroups;
- (id)startBlock;
- (id)stopBlock;
- (void)subscribe:(id)a3;
@end

@implementation MOSettingsPublisherBase

- (MOSettingsPublisherBase)initWithUpstream:(id)a3 interestedGroups:(id)a4 startBlock:(id)a5 stopBlock:(id)a6
{
  v10 = (MOPublisher *)a3;
  v11 = (NSSet *)a4;
  v24.receiver = self;
  v24.super_class = (Class)MOSettingsPublisherBase;
  id v12 = a6;
  id v13 = a5;
  v14 = [(MOPublisher *)&v24 initPublisher];
  upstream = v14->_upstream;
  v14->_upstream = v10;
  v16 = v10;

  interestedGroups = v14->_interestedGroups;
  v14->_interestedGroups = v11;
  v18 = v11;

  uint64_t v19 = MEMORY[0x1BA9CEAC0](v13);
  id startBlock = v14->_startBlock;
  v14->_id startBlock = (id)v19;

  uint64_t v21 = MEMORY[0x1BA9CEAC0](v12);
  id stopBlock = v14->_stopBlock;
  v14->_id stopBlock = (id)v21;

  return v14;
}

- (void)subscribe:(id)a3
{
  id v5 = a3;
  if ([(NSSet *)self->_interestedGroups count])
  {
    v4 = [[MOSettingsPublisherConduit alloc] initWithDownstream:v5 interestedGroups:self->_interestedGroups startBlock:self->_startBlock stopBlock:self->_stopBlock];
    [(MOPublisher *)self->_upstream subscribe:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_interestedGroups, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (MOPublisher)upstream
{
  return self->_upstream;
}

- (NSSet)interestedGroups
{
  return self->_interestedGroups;
}

- (id)startBlock
{
  return self->_startBlock;
}

- (id)stopBlock
{
  return self->_stopBlock;
}

@end