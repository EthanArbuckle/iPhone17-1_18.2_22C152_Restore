@interface DBFolderController
+ (Class)_contentViewClass;
+ (Class)listViewClass;
- (BOOL)hasDock;
- (DBEnvironment)environment;
- (void)setEnvironment:(id)a3;
- (void)setLayoutEngine:(id)a3;
@end

@implementation DBFolderController

- (void)setEnvironment:(id)a3
{
  p_environment = &self->_environment;
  id v5 = a3;
  objc_storeWeak((id *)p_environment, v5);
  id v6 = [(SBFolderController *)self contentView];
  [v6 setEnvironment:v5];
}

- (void)setLayoutEngine:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolderController *)self contentView];
  [v5 setLayoutEngine:v4];
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

+ (Class)listViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDock
{
  return 0;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end