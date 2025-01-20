@interface PHASETapRegistry
+ (PHASETapRegistry)new;
- (BOOL)registerTapReceiverForDescription:(id)a3 block:(id)a4;
- (BOOL)registerTapReceiverWithIdentifier:(id)a3 block:(id)a4;
- (PHASETapRegistry)init;
- (PHASETapRegistry)initWithEngine:(id)a3;
- (id)tapReceiverFormatForDescription:(id)a3;
- (id)tapReceiverFormatForIdentifier:(id)a3;
- (void)reset;
- (void)unregisterTapReceiverForDescription:(id)a3;
- (void)unregisterTapReceiverWithIdentifier:(id)a3;
@end

@implementation PHASETapRegistry

- (PHASETapRegistry)init
{
  return 0;
}

+ (PHASETapRegistry)new
{
  return 0;
}

- (PHASETapRegistry)initWithEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASETapRegistry;
  v5 = [(PHASETapRegistry *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakEngine, v4);
    uint64_t v7 = objc_opt_new();
    descriptions = v6->_descriptions;
    v6->_descriptions = (NSMutableSet *)v7;
  }
  return v6;
}

- (void)reset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    v2 = (std::mutex *)Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)([WeakRetained implementation] + 48), 16);
    if (!v2) {
      std::terminate();
    }
    Phase::Controller::ClientTapRegistryProxy::Reset(v2);
  }
}

- (BOOL)registerTapReceiverWithIdentifier:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)([WeakRetained implementation] + 48), 16);
    if (!v10) {
      std::terminate();
    }
    Phase::Controller::ClientTapRegistryProxy::RegisterTapReceiver(v10, v6, v7);
  }

  return 1;
}

- (void)unregisterTapReceiverWithIdentifier:(id)a3
{
  id v7 = (NSString *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (Phase::Controller::ClientTapRegistryProxy *)Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)([WeakRetained implementation]+ 48), 16);
    if (!v6) {
      std::terminate();
    }
    Phase::Controller::ClientTapRegistryProxy::UnregisterTapReceiver(v6, v7);
  }
}

- (id)tapReceiverFormatForIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = (std::mutex *)Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)([WeakRetained implementation] + 48), 16);
    if (!v7) {
      std::terminate();
    }
    v8 = Phase::Controller::ClientTapRegistryProxy::GetTapReceiverFormat(v7, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)registerTapReceiverForDescription:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSMutableSet *)self->_descriptions addObject:v6];
  v8 = [v6 uidString];
  LOBYTE(self) = [(PHASETapRegistry *)self registerTapReceiverWithIdentifier:v8 block:v7];

  return (char)self;
}

- (void)unregisterTapReceiverForDescription:(id)a3
{
  id v5 = a3;
  id v4 = [v5 uidString];
  [(PHASETapRegistry *)self unregisterTapReceiverWithIdentifier:v4];

  [(NSMutableSet *)self->_descriptions removeObject:v5];
}

- (id)tapReceiverFormatForDescription:(id)a3
{
  id v4 = [a3 uidString];
  id v5 = [(PHASETapRegistry *)self tapReceiverFormatForIdentifier:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptions, 0);

  objc_destroyWeak((id *)&self->_weakEngine);
}

@end