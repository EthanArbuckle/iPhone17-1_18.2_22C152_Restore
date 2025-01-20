@interface AVCaptureSessionConfiguration
- (AVCaptureSessionConfiguration)initWithConfigurationID:(int64_t)a3 inputs:(id)a4 outputs:(id)a5 videoPreviewLayers:(id)a6 connections:(id)a7;
- (NSArray)connections;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSHashTable)videoPreviewLayers;
- (id)uniqueConnections:(id)a3;
- (id)uniqueInputs:(id)a3;
- (id)uniqueOutputs:(id)a3;
- (id)uniqueVideoPreviewLayers:(id)a3;
- (int64_t)configurationID;
- (void)dealloc;
@end

@implementation AVCaptureSessionConfiguration

- (AVCaptureSessionConfiguration)initWithConfigurationID:(int64_t)a3 inputs:(id)a4 outputs:(id)a5 videoPreviewLayers:(id)a6 connections:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureSessionConfiguration;
  v12 = [(AVCaptureSessionConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_configurationID = a3;
    v12->_inputs = (NSArray *)[a4 copy];
    v13->_outputs = (NSArray *)[a5 copy];
    v13->_videoPreviewLayers = (NSHashTable *)[a6 copy];
    v13->_connections = (NSArray *)[a7 copy];
  }
  return v13;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSessionConfiguration;
  [(AVCaptureSessionConfiguration *)&v3 dealloc];
}

- (id)uniqueVideoPreviewLayers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  videoPreviewLayers = self->_videoPreviewLayers;
  uint64_t v7 = [(NSHashTable *)videoPreviewLayers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(videoPreviewLayers);
        }
        [v5 addObject:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)videoPreviewLayers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  objc_msgSend(v5, "minusHashTable:", objc_msgSend(a3, "videoPreviewLayers"));
  return v5;
}

- (id)uniqueOutputs:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:self->_outputs];
  objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "outputs")));
  return v4;
}

- (id)uniqueInputs:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:self->_inputs];
  objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "inputs")));
  return v4;
}

- (id)uniqueConnections:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:self->_connections];
  objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "connections")));
  return v4;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSHashTable)videoPreviewLayers
{
  return self->_videoPreviewLayers;
}

- (NSArray)connections
{
  return self->_connections;
}

@end