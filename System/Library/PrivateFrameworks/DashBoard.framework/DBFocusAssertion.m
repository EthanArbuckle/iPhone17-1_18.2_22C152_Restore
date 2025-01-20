@interface DBFocusAssertion
- (DBFocusAssertion)initWithName:(id)a3 type:(int64_t)a4 priority:(double)a5 window:(id)a6 application:(id)a7 pid:(int)a8 scene:(id)a9;
- (FBScene)scene;
- (NSString)bundleID;
- (NSString)name;
- (UIWindow)window;
- (double)priority;
- (id)description;
- (int)pid;
- (int64_t)type;
@end

@implementation DBFocusAssertion

- (DBFocusAssertion)initWithName:(id)a3 type:(int64_t)a4 priority:(double)a5 window:(id)a6 application:(id)a7 pid:(int)a8 scene:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)DBFocusAssertion;
  v20 = [(DBFocusAssertion *)&v26 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v20->_type = a4;
    v20->_priority = a5;
    objc_storeWeak((id *)&v20->_window, v17);
    uint64_t v23 = [v18 copy];
    bundleID = v20->_bundleID;
    v20->_bundleID = (NSString *)v23;

    v20->_pid = a8;
    objc_storeStrong((id *)&v20->_scene, a9);
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  if (self->_type == 1) {
    v6 = @"suspend";
  }
  else {
    v6 = @"take";
  }
  double priority = self->_priority;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  v9 = [v3 stringWithFormat:@"<%@:%p type=%@ priority=%f name=%@ window=%@ bundleID=%@ pid=%d>", v4, self, v6, *(void *)&priority, name, WeakRetained, self->_bundleID, self->_pid];

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (double)priority
{
  return self->_priority;
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)pid
{
  return self->_pid;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_name, 0);
}

@end