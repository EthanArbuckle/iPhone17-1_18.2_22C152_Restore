@interface MRUEndpointController
+ (id)localEndpointController;
+ (id)proactiveEndpointController;
+ (id)proactiveRecommendedEndpointController;
+ (id)proactiveUserSelectedEndpointController;
+ (id)userSelectedEndpointController;
- (BOOL)containsOutputDeviceWithRouteUID:(id)a3;
- (BOOL)isAirPlaying;
- (BOOL)isDeviceSystemRoute;
- (BOOL)isEndpointDiscovered;
- (BOOL)updatesActiveEndpointInPlace;
- (MPAVEndpointRoute)route;
- (MPCPlayerResponse)response;
- (MRUEndpointController)initWithEndpointController:(id)a3;
- (MRUEndpointController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5;
- (MediaControlsEndpointController)endpointController;
- (NSHashTable)observers;
- (NSString)routeUID;
- (int64_t)state;
- (void)addObserver:(id)a3;
- (void)connectAllowingAuthenticationWithCompletion:(id)a3;
- (void)endpointController:(id)a3 didLoadNewResponse:(id)a4;
- (void)endpointControllerDidChangeState:(id)a3;
- (void)launchNowPlayingApp;
- (void)notifyObserversRouteDidUpdate;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MRUEndpointController

+ (id)localEndpointController
{
  v3 = [MediaControlsEndpointController alloc];
  v4 = [MEMORY[0x1E4F31850] systemRoute];
  v5 = [(MediaControlsEndpointController *)v3 initWithEndpoint:v4];

  v6 = (void *)[objc_alloc((Class)a1) initWithEndpointController:v5];

  return v6;
}

+ (id)userSelectedEndpointController
{
  v3 = [[MediaControlsActiveEndpointController alloc] initWithActiveEndpointType:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithEndpointController:v3];

  return v4;
}

+ (id)proactiveEndpointController
{
  v3 = [[MediaControlsActiveEndpointController alloc] initWithActiveEndpointType:1];
  v4 = (void *)[objc_alloc((Class)a1) initWithEndpointController:v3];

  return v4;
}

+ (id)proactiveUserSelectedEndpointController
{
  v3 = [MEMORY[0x1E4F77108] currentSettings];
  int v4 = [v3 supportManyRecommendationsPlatters];

  if (v4) {
    [a1 userSelectedEndpointController];
  }
  else {
  v5 = [a1 proactiveEndpointController];
  }

  return v5;
}

+ (id)proactiveRecommendedEndpointController
{
  v3 = [[MediaControlsActiveEndpointController alloc] initWithActiveEndpointType:3];
  int v4 = (void *)[objc_alloc((Class)a1) initWithEndpointController:v3];

  return v4;
}

- (MRUEndpointController)initWithEndpointController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUEndpointController;
  v6 = [(MRUEndpointController *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_endpointController, a3);
    [(MediaControlsEndpointController *)v6->_endpointController setDelegate:v6];
  }

  return v6;
}

- (MRUEndpointController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[MediaControlsStandaloneEndpointController alloc] initWithRouteUID:v10 client:v9 player:v8];

  v12 = [(MRUEndpointController *)self initWithEndpointController:v11];
  return v12;
}

- (MPCPlayerResponse)response
{
  return [(MediaControlsEndpointController *)self->_endpointController response];
}

- (NSString)routeUID
{
  v2 = [(MediaControlsEndpointController *)self->_endpointController route];
  v3 = [v2 routeUID];

  return (NSString *)v3;
}

- (MPAVEndpointRoute)route
{
  return [(MediaControlsEndpointController *)self->_endpointController route];
}

- (int64_t)state
{
  int64_t result = [(MediaControlsEndpointController *)self->_endpointController state];
  if ((unint64_t)result >= 4) {
    return -1;
  }
  return result;
}

- (BOOL)isEndpointDiscovered
{
  v3 = [(MRUEndpointController *)self endpointController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  id v5 = [(MRUEndpointController *)self endpointController];
  char v6 = [v5 isEndpointDiscovered];

  return v6;
}

- (BOOL)isAirPlaying
{
  return [(MediaControlsEndpointController *)self->_endpointController isAirPlaying];
}

- (BOOL)isDeviceSystemRoute
{
  return [(MediaControlsEndpointController *)self->_endpointController isDeviceSystemRoute];
}

- (BOOL)updatesActiveEndpointInPlace
{
  endpointController = self->_endpointController;
  uint64_t v3 = objc_opt_class();

  return [(MediaControlsEndpointController *)endpointController isMemberOfClass:v3];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)containsOutputDeviceWithRouteUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(MediaControlsEndpointController *)self->_endpointController route];
  char v6 = objc_msgSend((id)objc_msgSend(v5, "endpoint"), "outputDevices");

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) containsUID:v4])
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)connectAllowingAuthenticationWithCompletion:(id)a3
{
}

- (void)launchNowPlayingApp
{
}

- (void)endpointController:(id)a3 didLoadNewResponse:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 endpointController:self didChangeResponse:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)endpointControllerDidChangeState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "endpointController:didChangeState:", self, -[MRUEndpointController state](self, "state"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)notifyObserversRouteDidUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [(MRUEndpointController *)self route];
          [v8 endpointController:self didChangeRoute:v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MediaControlsEndpointController)endpointController
{
  return self->_endpointController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointController, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end