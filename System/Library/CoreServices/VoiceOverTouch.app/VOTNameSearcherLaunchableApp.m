@interface VOTNameSearcherLaunchableApp
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)displayID;
- (NSString)name;
- (VOTNameSearcherLaunchableApp)initWithName:(id)a3 displayID:(id)a4;
- (void)select;
- (void)setDisplayID:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VOTNameSearcherLaunchableApp

- (VOTNameSearcherLaunchableApp)initWithName:(id)a3 displayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOTNameSearcherLaunchableApp;
  v8 = [(VOTNameSearcherLaunchableApp *)&v11 init];
  if (v8)
  {
    if (qword_1001EB8B8 != -1) {
      dispatch_once(&qword_1001EB8B8, &stru_1001B3F28);
    }
    v9 = [v6 stringByTrimmingCharactersInSet:qword_1001EB8B0];
    [(VOTNameSearcherLaunchableApp *)v8 setName:v9];

    [(VOTNameSearcherLaunchableApp *)v8 setDisplayID:v7];
  }

  return v8;
}

- (void)select
{
  v3 = +[VOTElement springBoardApplication];
  v4 = [(VOTNameSearcherLaunchableApp *)self displayID];
  [v3 launchAppWithDisplayID:v4];

  id v5 = [(id)VOTSharedWorkspace elementManager];
  [v5 deactivateGesturedTextInputIfNeeded:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 displayID];
    id v6 = [(VOTNameSearcherLaunchableApp *)self displayID];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v3 = [(VOTNameSearcherLaunchableApp *)self name];
  id v4 = [(VOTNameSearcherLaunchableApp *)self displayID];
  id v5 = +[NSString stringWithFormat:@"%@ : %@", v3, v4];

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end