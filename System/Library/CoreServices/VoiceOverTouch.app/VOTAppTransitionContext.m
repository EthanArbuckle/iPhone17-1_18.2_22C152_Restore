@interface VOTAppTransitionContext
+ (VOTAppTransitionContext)contextWithPID:(int)a3 bundleID:(id)a4 displayName:(id)a5;
- (NSString)announcableName;
- (NSString)bundleID;
- (NSString)displayName;
- (id)description;
- (int)pid;
- (void)setBundleID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation VOTAppTransitionContext

+ (VOTAppTransitionContext)contextWithPID:(int)a3 bundleID:(id)a4 displayName:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  v9 = objc_alloc_init(VOTAppTransitionContext);
  [(VOTAppTransitionContext *)v9 setPid:v6];
  [(VOTAppTransitionContext *)v9 setBundleID:v8];

  [(VOTAppTransitionContext *)v9 setDisplayName:v7];

  return v9;
}

- (id)description
{
  v3 = +[NSNumber numberWithInt:[(VOTAppTransitionContext *)self pid]];
  v4 = [(VOTAppTransitionContext *)self displayName];
  v5 = [(VOTAppTransitionContext *)self bundleID];
  uint64_t v6 = [(VOTAppTransitionContext *)self announcableName];
  id v7 = +[NSString stringWithFormat:@"_VOTAppTransitionContext<%p>. pid:%@ displayName:%@ bundleID:%@ announcableName:%@", self, v3, v4, v5, v6];

  return v7;
}

- (NSString)announcableName
{
  v3 = [(VOTAppTransitionContext *)self bundleID];
  if ([v3 isEqualToString:@"com.apple.HeadBoard"])
  {
    v4 = off_1001EA9E8;
    v5 = @"app.replacement.name.headboard";
  }
  else
  {
    if (([v3 isEqualToString:@"com.apple.TVScreenSaver"] & 1) == 0)
    {
      uint64_t v6 = [(VOTAppTransitionContext *)self bundleID];
      unsigned int v7 = [v6 isEqualToString:@"com.apple.TVIdleScreen"];

      if (!v7)
      {
        if (([v3 isEqualToString:@"com.apple.TVAirPlay"] & 1) != 0
          || ([v3 isEqualToString:@"com.apple.TVPeripheralAgent"] & 1) != 0
          || ([v3 isEqualToString:@"com.apple.PineBoard"] & 1) != 0
          || ([v3 isEqualToString:@"com.apple.TVConferenceRoomDisplay"] & 1) != 0)
        {
          v9 = &stru_1001B7888;
          id v8 = &stru_1001B7888;
        }
        else
        {
          v11 = [(VOTAppTransitionContext *)self displayName];

          if (v11)
          {
            v12 = [(VOTAppTransitionContext *)self displayName];
          }
          else
          {
            v12 = &stru_1001B7888;
          }
          v9 = v12;
          id v8 = v9;
        }
        goto LABEL_7;
      }
    }
    v4 = off_1001EA9E8;
    v5 = @"app.replacement.name.tvscreensaver";
  }
  sub_100051804(v4, v5, 0);
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = &stru_1001B7888;
LABEL_7:

  return (NSString *)v8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end