@interface CRKClassroomInstallation
+ (BOOL)anyInstallationExists;
+ (CRKClassroomInstallation)iOSInstallation;
+ (CRKClassroomInstallation)installationWithClassroomBundleIdentifier:(id)a3 bundleHasContentsFolder:(BOOL)a4 instructordBundleIdentifier:(id)a5;
+ (CRKClassroomInstallation)macOSInstallation;
+ (CRKClassroomInstallation)preferredInstallation;
+ (id)instructorKitImagePathInBundle:(id)a3 hasContentsFolder:(BOOL)a4;
- (CRKClassroomInstallation)initWithClassroomURL:(id)a3 classroomBundleIdentifier:(id)a4 instructorKitImagePath:(id)a5 instructordBundleIdentifier:(id)a6;
- (NSString)classroomBundleIdentifier;
- (NSString)instructorKitImagePath;
- (NSString)instructordBundleIdentifier;
- (NSURL)classroomURL;
- (id)description;
@end

@implementation CRKClassroomInstallation

+ (CRKClassroomInstallation)iOSInstallation
{
  return (CRKClassroomInstallation *)[a1 installationWithClassroomBundleIdentifier:@"com.apple.classroom" bundleHasContentsFolder:0 instructordBundleIdentifier:@"com.apple.classroom.instructord"];
}

+ (CRKClassroomInstallation)macOSInstallation
{
  return (CRKClassroomInstallation *)[a1 installationWithClassroomBundleIdentifier:@"com.apple.macos.classroom" bundleHasContentsFolder:1 instructordBundleIdentifier:@"com.apple.macos.classroom.instructord"];
}

+ (CRKClassroomInstallation)installationWithClassroomBundleIdentifier:(id)a3 bundleHasContentsFolder:(BOOL)a4 instructordBundleIdentifier:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v17 = 0;
  v10 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v8 allowPlaceholder:0 error:&v17];
  id v11 = v17;
  if (!v10)
  {
    if (_CRKLogGeneral_onceToken_41 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_41, &__block_literal_global_116);
    }
    v12 = (void *)_CRKLogGeneral_logObj_41;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_41, OS_LOG_TYPE_ERROR)) {
      +[CRKClassroomInstallation installationWithClassroomBundleIdentifier:bundleHasContentsFolder:instructordBundleIdentifier:]((uint64_t)v8, v12, v11);
    }
  }
  v13 = [v10 URL];
  if (v13)
  {
    v14 = [a1 instructorKitImagePathInBundle:v13 hasContentsFolder:v6];
    v15 = (void *)[objc_alloc((Class)a1) initWithClassroomURL:v13 classroomBundleIdentifier:v8 instructorKitImagePath:v14 instructordBundleIdentifier:v9];
  }
  else
  {
    v15 = 0;
  }

  return (CRKClassroomInstallation *)v15;
}

+ (CRKClassroomInstallation)preferredInstallation
{
  if (CRKIsiOS()) {
    [a1 iOSInstallation];
  }
  else {
  v3 = [a1 macOSInstallation];
  }

  return (CRKClassroomInstallation *)v3;
}

+ (BOOL)anyInstallationExists
{
  v2 = [a1 preferredInstallation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CRKClassroomInstallation)initWithClassroomURL:(id)a3 classroomBundleIdentifier:(id)a4 instructorKitImagePath:(id)a5 instructordBundleIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CRKClassroomInstallation;
  v15 = [(CRKClassroomInstallation *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_classroomURL, a3);
    uint64_t v17 = [v12 copy];
    classroomBundleIdentifier = v16->_classroomBundleIdentifier;
    v16->_classroomBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    instructorKitImagePath = v16->_instructorKitImagePath;
    v16->_instructorKitImagePath = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    instructordBundleIdentifier = v16->_instructordBundleIdentifier;
    v16->_instructordBundleIdentifier = (NSString *)v21;
  }
  return v16;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKClassroomInstallation *)self classroomURL];
  BOOL v6 = [v5 absoluteString];
  v7 = [(CRKClassroomInstallation *)self classroomBundleIdentifier];
  id v8 = [(CRKClassroomInstallation *)self instructorKitImagePath];
  id v9 = [(CRKClassroomInstallation *)self instructordBundleIdentifier];
  v10 = [v3 stringWithFormat:@"<%@: %p { classroomURL = %@, classroomBundleIdentifier = %@, instructorKitImagePath = %@, instructordBundleIdentifier = %@ }>", v4, self, v6, v7, v8, v9];

  return v10;
}

+ (id)instructorKitImagePathInBundle:(id)a3 hasContentsFolder:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = objc_opt_new();
  v7 = [v5 path];

  [v6 addObject:v7];
  if (v4) {
    [v6 addObject:@"Contents"];
  }
  [v6 addObject:@"Frameworks"];
  [v6 addObject:@"InstructorKit.framework"];
  [v6 addObject:@"InstructorKit"];
  id v8 = [NSString pathWithComponents:v6];

  return v8;
}

- (NSURL)classroomURL
{
  return self->_classroomURL;
}

- (NSString)classroomBundleIdentifier
{
  return self->_classroomBundleIdentifier;
}

- (NSString)instructorKitImagePath
{
  return self->_instructorKitImagePath;
}

- (NSString)instructordBundleIdentifier
{
  return self->_instructordBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructordBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_instructorKitImagePath, 0);
  objc_storeStrong((id *)&self->_classroomBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_classroomURL, 0);
}

+ (void)installationWithClassroomBundleIdentifier:(uint64_t)a1 bundleHasContentsFolder:(void *)a2 instructordBundleIdentifier:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  BOOL v6 = [a3 verboseDescription];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_224C00000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch bundle record for %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end