@interface MLCDeviceGraph
+ (id)deviceGraphWithLayers:(id)a3 device:(id)a4;
- (MLCDevice)device;
- (NSMutableArray)graphLayerList;
- (NSMutableSet)liveInputs;
- (NSMutableSet)liveOutputs;
- (id)initDeviceGraphWithLayers:(id)a3 device:(id)a4;
- (void)setGraphLayerList:(id)a3;
- (void)setLiveInputs:(id)a3;
- (void)setLiveOutputs:(id)a3;
@end

@implementation MLCDeviceGraph

+ (id)deviceGraphWithLayers:(id)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initDeviceGraphWithLayers:v7 device:v6];

  return v8;
}

- (id)initDeviceGraphWithLayers:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLCDeviceGraph;
  v8 = [(MLCDeviceGraph *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a4);
    uint64_t v10 = [v6 mutableCopy];
    graphLayerList = v9->_graphLayerList;
    v9->_graphLayerList = (NSMutableArray *)v10;

    v12 = [MEMORY[0x1E4F1CA80] set];
    objc_storeWeak((id *)&v9->_liveOutputs, v12);

    v13 = [MEMORY[0x1E4F1CA80] set];
    objc_storeWeak((id *)&v9->_liveInputs, v13);
  }
  return v9;
}

- (MLCDevice)device
{
  return self->_device;
}

- (NSMutableArray)graphLayerList
{
  return self->_graphLayerList;
}

- (void)setGraphLayerList:(id)a3
{
}

- (NSMutableSet)liveOutputs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveOutputs);

  return (NSMutableSet *)WeakRetained;
}

- (void)setLiveOutputs:(id)a3
{
}

- (NSMutableSet)liveInputs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveInputs);

  return (NSMutableSet *)WeakRetained;
}

- (void)setLiveInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_liveInputs);
  objc_destroyWeak((id *)&self->_liveOutputs);
  objc_storeStrong((id *)&self->_graphLayerList, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end