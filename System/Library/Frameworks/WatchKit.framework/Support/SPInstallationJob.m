@interface SPInstallationJob
+ (id)newDataInstallationJobFromIconsInstallationJob:(id)a3;
+ (id)newIcondsInstallationJobForApplicationID:(id)a3 installerID:(id)a4 idsPriority:(int64_t)a5;
- (NSDictionary)applicationInstallationInfo;
- (NSString)applicationID;
- (NSString)installer;
- (SPInstallationJob)init;
- (id)_initWithApplicationID:(id)a3 installerID:(id)a4 idsPriority:(int64_t)a5 jobType:(int64_t)a6;
- (id)completion;
- (id)description;
- (int64_t)idsPriority;
- (int64_t)jobType;
- (void)setApplicationInstallationInfo:(id)a3;
- (void)setCompletion:(id)a3;
@end

@implementation SPInstallationJob

+ (id)newIcondsInstallationJobForApplicationID:(id)a3 installerID:(id)a4 idsPriority:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[SPInstallationJob alloc] _initWithApplicationID:v8 installerID:v7 idsPriority:a5 jobType:0];

  return v9;
}

+ (id)newDataInstallationJobFromIconsInstallationJob:(id)a3
{
  id v3 = a3;
  v4 = [SPInstallationJob alloc];
  v5 = [v3 applicationID];
  v6 = [v3 installer];
  id v7 = -[SPInstallationJob _initWithApplicationID:installerID:idsPriority:jobType:](v4, "_initWithApplicationID:installerID:idsPriority:jobType:", v5, v6, [v3 idsPriority], 1);

  id v8 = [v3 applicationInstallationInfo];
  [v7 setApplicationInstallationInfo:v8];

  id v9 = [v3 completion];

  [v7 setCompletion:v9];
  return v7;
}

- (SPInstallationJob)init
{
  return 0;
}

- (id)_initWithApplicationID:(id)a3 installerID:(id)a4 idsPriority:(int64_t)a5 jobType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPInstallationJob;
  v13 = [(SPInstallationJob *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_applicationID, a3);
    objc_storeStrong((id *)&v14->_installer, a4);
    v14->_idsPriority = a5;
    v14->_jobType = a6;
  }

  return v14;
}

- (id)description
{
  id v3 = [(SPInstallationJob *)self applicationID];
  v4 = [(SPInstallationJob *)self installer];
  int64_t v5 = [(SPInstallationJob *)self jobType];
  CFStringRef v6 = @"application data";
  if (!v5) {
    CFStringRef v6 = @"placeholder";
  }
  id v7 = +[NSString stringWithFormat:@"Job [%p] for applicationID: %@, installer: %@, type: %@", self, v3, v4, v6];

  return v7;
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)installer
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)idsPriority
{
  return self->_idsPriority;
}

- (NSDictionary)applicationInstallationInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplicationInstallationInfo:(id)a3
{
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (id)completion
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_applicationInstallationInfo, 0);
  objc_storeStrong((id *)&self->_installer, 0);

  objc_storeStrong((id *)&self->_applicationID, 0);
}

@end