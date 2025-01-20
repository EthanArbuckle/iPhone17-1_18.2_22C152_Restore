@interface MCMContainerStagingPath
+ (Class)_containerClassPathClass;
+ (id)stagingContainerPathForDestinationContainerPath:(id)a3 stagingPathIdentifier:(id)a4;
- (MCMContainerPath)destinationContainerPath;
- (void)setDestinationContainerPath:(id)a3;
@end

@implementation MCMContainerStagingPath

- (void).cxx_destruct
{
  p_destinationContainerPath = &self->_destinationContainerPath;

  objc_storeStrong((id *)p_destinationContainerPath, 0);
}

- (void)setDestinationContainerPath:(id)a3
{
  p_destinationContainerPath = &self->_destinationContainerPath;

  objc_storeStrong((id *)p_destinationContainerPath, a3);
}

- (MCMContainerPath)destinationContainerPath
{
  return self->_destinationContainerPath;
}

+ (id)stagingContainerPathForDestinationContainerPath:(id)a3 stagingPathIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 containerClassPath];
  v8 = [v7 userIdentity];
  v9 = +[MCMContainerPath containerPathForUserIdentity:containerClass:containerPathIdentifier:](MCMContainerStagingPath, "containerPathForUserIdentity:containerClass:containerPathIdentifier:", v8, [v7 containerClass], v5);

  [v9 setDestinationContainerPath:v6];

  return v9;
}

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

@end