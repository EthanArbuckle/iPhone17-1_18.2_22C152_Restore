@interface HUMatterConnectedHomeItem
- (HMCHIPAccessoryPairing)chipAccessoryPairing;
- (HMCHIPHome)connectedHome;
- (HUMatterConnectedHomeItem)initWithConnectedHome:(id)a3 accessoryPairing:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUMatterConnectedHomeItem

- (HUMatterConnectedHomeItem)initWithConnectedHome:(id)a3 accessoryPairing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterConnectedHomeItem;
  v9 = [(HUMatterConnectedHomeItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectedHome, a3);
    objc_storeStrong((id *)&v10->_chipAccessoryPairing, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F68980];
  v3 = [(HUMatterConnectedHomeItem *)self connectedHome];
  v4 = [v3 name];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  v6 = (void *)MEMORY[0x1E4F7A0D8];
  id v7 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
  id v8 = [v6 futureWithResult:v7];

  return v8;
}

- (HMCHIPHome)connectedHome
{
  return self->_connectedHome;
}

- (HMCHIPAccessoryPairing)chipAccessoryPairing
{
  return self->_chipAccessoryPairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipAccessoryPairing, 0);

  objc_storeStrong((id *)&self->_connectedHome, 0);
}

@end