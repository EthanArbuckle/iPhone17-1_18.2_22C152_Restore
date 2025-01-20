@interface APCoordinatedRankRequestBox
- (APContext)context;
- (APCoordinatedRankRequestBox)initWithDelegate:(id)a3 contents:(id)a4 placement:(unint64_t)a5 handler:(id)a6;
- (NSArray)contentDatas;
- (id)completionHandler;
- (unint64_t)placement;
@end

@implementation APCoordinatedRankRequestBox

- (APCoordinatedRankRequestBox)initWithDelegate:(id)a3 contents:(id)a4 placement:(unint64_t)a5 handler:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)APCoordinatedRankRequestBox;
  v13 = [(APCoordinatedRetryBox *)&v18 initWithType:1 delegate:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentDatas, a4);
    v14->_placement = a5;
    uint64_t v15 = MEMORY[0x22A64D220](v12);
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = (id)v15;
  }
  return v14;
}

- (NSArray)contentDatas
{
  return self->_contentDatas;
}

- (APContext)context
{
  return self->_context;
}

- (unint64_t)placement
{
  return self->_placement;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentDatas, 0);
}

@end