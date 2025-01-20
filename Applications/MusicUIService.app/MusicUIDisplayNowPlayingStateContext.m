@interface MusicUIDisplayNowPlayingStateContext
+ (id)stateContextForNowPlaying;
- (MusicUIDisplayNowPlayingStateContext)initWithStateContext:(id)a3;
- (NSString)associatedBundleID;
- (NSString)stateName;
- (id)description;
- (void)setAssociatedBundleID:(id)a3;
- (void)setStateName:(id)a3;
@end

@implementation MusicUIDisplayNowPlayingStateContext

- (MusicUIDisplayNowPlayingStateContext)initWithStateContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MusicUIDisplayNowPlayingStateContext;
  v5 = [(MusicUIDisplayNowPlayingStateContext *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MusicUIDisplayNowPlayingStateContext *)v5 setStateName:v4];
  }

  return v6;
}

+ (id)stateContextForNowPlaying
{
  id v2 = [objc_alloc((Class)a1) initWithStateContext:@"nowplaying"];

  return v2;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@:%p - state: %@, associatedBundleID: %@>", v4, self, self->_stateName, self->_associatedBundleID];

  return v5;
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)setStateName:(id)a3
{
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setAssociatedBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedBundleID, 0);

  objc_storeStrong((id *)&self->_stateName, 0);
}

@end