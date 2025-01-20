@interface AVTMemojiWrapDeformerDriverInfo
- (AVTMemojiWrapDeformerDriverInfo)init;
@end

@implementation AVTMemojiWrapDeformerDriverInfo

- (AVTMemojiWrapDeformerDriverInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVTMemojiWrapDeformerDriverInfo;
  v2 = [(AVTMemojiWrapDeformerDriverInfo *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    driverNodes = v2->_driverNodes;
    v2->_driverNodes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    driverStates = v2->_driverStates;
    v2->_driverStates = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverStates, 0);
  objc_storeStrong((id *)&self->_driverNodes, 0);
}

@end