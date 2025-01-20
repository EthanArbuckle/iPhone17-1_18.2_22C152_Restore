@interface AVTCompositorPipelineCache
+ (id)pipelineForPropertyName:(id)a3 device:(id)a4;
- (AVTCompositorPipelineCache)initWithMetalHelper:(id)a3;
- (id)pipelineForPropertyName:(id)a3;
@end

@implementation AVTCompositorPipelineCache

- (AVTCompositorPipelineCache)initWithMetalHelper:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTCompositorPipelineCache;
  v6 = [(AVTCompositorPipelineCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_helper, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pipelines = v7->_pipelines;
    v7->_pipelines = v8;
  }
  return v7;
}

- (id)pipelineForPropertyName:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_pipelines objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = [NSString stringWithFormat:@"compositor_%@", v4];
    v7 = -[AVTMetalHelper functionNamed:](self->_helper, v6);
    id v5 = [[AVTCompositorPipeline alloc] initWithFunction:v7];
    [(NSMutableDictionary *)self->_pipelines setObject:v5 forKeyedSubscript:v4];
  }
  return v5;
}

+ (id)pipelineForPropertyName:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&pipelineForPropertyName_device__lock);
  if (!pipelineForPropertyName_device__cachePerDevice)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = (void *)pipelineForPropertyName_device__cachePerDevice;
    pipelineForPropertyName_device__cachePerDevice = (uint64_t)v7;
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "registryID"));
  v10 = [(id)pipelineForPropertyName_device__cachePerDevice objectForKeyedSubscript:v9];
  if (!v10)
  {
    objc_super v11 = +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v6);
    v10 = [[AVTCompositorPipelineCache alloc] initWithMetalHelper:v11];
    [(id)pipelineForPropertyName_device__cachePerDevice setObject:v10 forKeyedSubscript:v9];
  }
  v12 = [(AVTCompositorPipelineCache *)v10 pipelineForPropertyName:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&pipelineForPropertyName_device__lock);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end