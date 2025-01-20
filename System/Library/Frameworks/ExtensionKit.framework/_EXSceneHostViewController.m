@interface _EXSceneHostViewController
- (NSString)role;
- (NSUUID)sessionUUID;
- (_EXExtensionProcessHandle)extensionProcess;
- (_EXSceneHostViewController)initWithExtensionProcess:(id)a3 sessionUUID:(id)a4 role:(id)a5;
- (void)loadView;
- (void)setExtensionProcess:(id)a3;
- (void)setRole:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation _EXSceneHostViewController

- (_EXSceneHostViewController)initWithExtensionProcess:(id)a3 sessionUUID:(id)a4 role:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_EXSceneHostViewController;
  v12 = [(_EXSceneHostViewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionUUID, a4);
    objc_storeStrong((id *)&v13->_extensionProcess, a3);
    objc_storeStrong((id *)&v13->_role, a5);
  }

  return v13;
}

- (void)loadView
{
  v3 = [_EXSceneHostView alloc];
  v4 = [(_EXSceneHostViewController *)self extensionProcess];
  v5 = [(_EXSceneHostViewController *)self sessionUUID];
  v6 = [(_EXSceneHostView *)v3 initWithExtensionProcess:v4 sessionUUID:v5 role:self->_role];

  [(_EXSceneHostView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_EXSceneHostView *)v6 creatScene];
  [(_EXSceneHostViewController *)self setView:v6];
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return (_EXExtensionProcessHandle *)objc_getProperty(self, a2, 976, 1);
}

- (void)setExtensionProcess:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 984, 1);
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 992, 1);
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_extensionProcess, 0);
}

@end