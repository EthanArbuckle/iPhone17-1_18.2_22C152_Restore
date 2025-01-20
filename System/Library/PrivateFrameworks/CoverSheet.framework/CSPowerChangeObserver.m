@interface CSPowerChangeObserver
- (BOOL)isConnectedToPower;
- (BOOL)isConnectedToQiPower;
- (BOOL)isConnectedToWirelessInternalCharger;
- (BOOL)isConnectedToWirelessInternalChargingAccessory;
- (CSPowerChangeObserver)initWithStatusProvider:(id)a3 notificationName:(id)a4 updateBlock:(id)a5;
- (id)block;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setConnectedToPower:(BOOL)a3;
- (void)setIsConnectedToPower:(BOOL)a3;
- (void)setIsConnectedToQiPower:(BOOL)a3;
- (void)setIsConnectedToWirelessInternalCharger:(BOOL)a3;
- (void)setIsConnectedToWirelessInternalChargingAccessory:(BOOL)a3;
- (void)update;
@end

@implementation CSPowerChangeObserver

- (CSPowerChangeObserver)initWithStatusProvider:(id)a3 notificationName:(id)a4 updateBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CSPowerChangeObserver;
  v12 = [(CSPowerChangeObserver *)&v23 init];
  v13 = v12;
  if (v12)
  {
    [(CSPowerChangeObserver *)v12 setBlock:v11];
    objc_storeStrong((id *)&v13->_statusProvider, a3);
    v13->_connectedToPower = [(CSPowerStatusProviding *)v13->_statusProvider isConnectedToExternalChargingSource];
    v13->_isConnectedToQiPower = [(CSPowerStatusProviding *)v13->_statusProvider isConnectedToQiPower];
    v13->_isConnectedToWirelessInternalCharger = [(CSPowerStatusProviding *)v13->_statusProvider isConnectedToWirelessInternalCharger];
    v13->_isConnectedToWirelessInternalChargingAccessory = [(CSPowerStatusProviding *)v13->_statusProvider isConnectedToWirelessInternalChargingAccessory];
    objc_initWeak(&location, v13);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__CSPowerChangeObserver_initWithStatusProvider_notificationName_updateBlock___block_invoke;
    v19[3] = &unk_1E6AD89F8;
    objc_copyWeak(&v21, &location);
    v15 = v13;
    v20 = v15;
    uint64_t v16 = [v14 addObserverForName:v10 object:0 queue:0 usingBlock:v19];
    notificationToken = v15->_notificationToken;
    v15->_notificationToken = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __77__CSPowerChangeObserver_initWithStatusProvider_notificationName_updateBlock___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsConnectedToPower:", objc_msgSend(WeakRetained[2], "isConnectedToExternalChargingSource"));
  objc_msgSend(WeakRetained, "setIsConnectedToQiPower:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "isConnectedToQiPower"));
  objc_msgSend(WeakRetained, "setIsConnectedToWirelessInternalCharger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "isConnectedToWirelessInternalCharger"));
  objc_msgSend(WeakRetained, "setIsConnectedToWirelessInternalChargingAccessory:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "isConnectedToWirelessInternalChargingAccessory"));
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationToken];

  v4.receiver = self;
  v4.super_class = (Class)CSPowerChangeObserver;
  [(CSPowerChangeObserver *)&v4 dealloc];
}

- (void)update
{
  [(CSPowerChangeObserver *)self setIsConnectedToPower:[(CSPowerStatusProviding *)self->_statusProvider isConnectedToExternalChargingSource]];
  [(CSPowerChangeObserver *)self setIsConnectedToWirelessInternalCharger:[(CSPowerStatusProviding *)self->_statusProvider isConnectedToWirelessInternalCharger]];
  [(CSPowerChangeObserver *)self setIsConnectedToWirelessInternalChargingAccessory:[(CSPowerStatusProviding *)self->_statusProvider isConnectedToWirelessInternalChargingAccessory]];
  uint64_t v3 = [(CSPowerStatusProviding *)self->_statusProvider isConnectedToQiPower];

  [(CSPowerChangeObserver *)self setIsConnectedToQiPower:v3];
}

- (void)setIsConnectedToPower:(BOOL)a3
{
  if (self->_connectedToPower != a3)
  {
    BOOL v3 = a3;
    self->_connectedToPower = a3;
    objc_super v4 = [(CSPowerChangeObserver *)self block];
    v4[2](v4, v3);
  }
}

- (BOOL)isConnectedToPower
{
  return self->_connectedToPower;
}

- (void)setConnectedToPower:(BOOL)a3
{
  self->_connectedToPower = a3;
}

- (BOOL)isConnectedToQiPower
{
  return self->_isConnectedToQiPower;
}

- (void)setIsConnectedToQiPower:(BOOL)a3
{
  self->_isConnectedToQiPower = a3;
}

- (BOOL)isConnectedToWirelessInternalCharger
{
  return self->_isConnectedToWirelessInternalCharger;
}

- (void)setIsConnectedToWirelessInternalCharger:(BOOL)a3
{
  self->_isConnectedToWirelessInternalCharger = a3;
}

- (BOOL)isConnectedToWirelessInternalChargingAccessory
{
  return self->_isConnectedToWirelessInternalChargingAccessory;
}

- (void)setIsConnectedToWirelessInternalChargingAccessory:(BOOL)a3
{
  self->_isConnectedToWirelessInternalChargingAccessory = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);

  objc_storeStrong((id *)&self->_notificationToken, 0);
}

@end