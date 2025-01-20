@interface AVAudioSessionRouteDescription
- (AVAudioSessionRouteDescription)init;
- (AVAudioSessionRouteDescription)initWithRawDescription:(id)a3 owningSession:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoute:(id)a3;
- (BOOL)supportsDoAP;
- (BOOL)supportsSoftwareVolume;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSString)siriRemoteInputIdentifier;
- (RouteDescriptionImpl)privateGetImplementation;
- (id)description;
- (unint64_t)siriInputSource;
- (void)dealloc;
- (void)updateOutputPortsWithSpatialAudioStatus:(BOOL)a3;
@end

@implementation AVAudioSessionRouteDescription

- (AVAudioSessionRouteDescription)initWithRawDescription:(id)a3 owningSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSessionRouteDescription;
  if ([(AVAudioSessionRouteDescription *)&v9 init]) {
    operator new();
  }

  return 0;
}

- (void)updateOutputPortsWithSpatialAudioStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = (id)[(AVAudioSessionRouteDescription *)self privateGetImplementation][8];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setSupportsSpatialAudio:", v3, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (RouteDescriptionImpl)privateGetImplementation
{
  return (RouteDescriptionImpl *)self->_impl;
}

- (NSArray)outputs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *((id *)v2->_impl + 1);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)dealloc
{
  impl = (id *)self->_impl;
  if (impl)
  {

    MEMORY[0x1A6235030](impl, 0x1080C40F59D5452);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionRouteDescription;
  [(AVAudioSessionRouteDescription *)&v4 dealloc];
}

- (AVAudioSessionRouteDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioSessionRouteDescription;
  if ([(AVAudioSessionRouteDescription *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AVAudioSessionRouteDescription *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(AVAudioSessionRouteDescription *)self isEqualToRoute:v5];

  return v6;
}

- (BOOL)isEqualToRoute:(id)a3
{
  objc_super v4 = (AVAudioSessionRouteDescription *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = [(AVAudioSessionRouteDescription *)self inputs];
    BOOL v6 = [(AVAudioSessionRouteDescription *)v4 inputs];
    char v7 = [v5 isEqualToArray:v6];

    if (v7)
    {
      long long v8 = [(AVAudioSessionRouteDescription *)self outputs];
      long long v9 = [(AVAudioSessionRouteDescription *)v4 outputs];
      char v10 = [v8 isEqualToArray:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSArray)inputs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *(id *)v2->_impl;
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)description
{
  impl = self->_impl;
  objc_super v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  char v7 = [v4 stringWithFormat:@"<%@: %p, \ninputs = %@ \noutputs = %@>", v6, self, *impl, impl[1]];;

  return v7;
}

- (NSString)siriRemoteInputIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *((id *)v2->_impl + 2);
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (unint64_t)siriInputSource
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = *((void *)v2->_impl + 3);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)supportsDoAP
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = *((unsigned char *)v2->_impl + 33);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)supportsSoftwareVolume
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = *((unsigned char *)v2->_impl + 32);
  objc_sync_exit(v2);

  return v3;
}

@end