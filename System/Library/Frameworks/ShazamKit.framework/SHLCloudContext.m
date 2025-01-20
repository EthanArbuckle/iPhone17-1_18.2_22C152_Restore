@interface SHLCloudContext
+ (SHLCloudContext)sharedContext;
- (CKContainer)debugContainer;
- (CKContainer)defaultContainer;
- (CKContainer)manateeContainer;
- (CKRecordZone)shazamLibraryZone;
- (id)containerWithScope:(int64_t)a3;
@end

@implementation SHLCloudContext

+ (SHLCloudContext)sharedContext
{
  if (qword_100090AA8 != -1) {
    dispatch_once(&qword_100090AA8, &stru_100075A38);
  }
  v2 = (void *)qword_100090AA0;

  return (SHLCloudContext *)v2;
}

- (CKContainer)defaultContainer
{
  defaultContainer = self->_defaultContainer;
  if (!defaultContainer)
  {
    v4 = +[CKContainer containerWithIdentifier:@"com.apple.shazam"];
    v5 = self->_defaultContainer;
    self->_defaultContainer = v4;

    defaultContainer = self->_defaultContainer;
  }

  return defaultContainer;
}

- (CKContainer)manateeContainer
{
  manateeContainer = self->_manateeContainer;
  if (!manateeContainer)
  {
    v4 = +[CKContainer containerWithIdentifier:@"com.apple.shazam.secure"];
    v5 = self->_manateeContainer;
    self->_manateeContainer = v4;

    manateeContainer = self->_manateeContainer;
  }

  return manateeContainer;
}

- (CKContainer)debugContainer
{
  debugContainer = self->_debugContainer;
  if (!debugContainer)
  {
    v4 = +[CKContainer containerWithIdentifier:@"iCloud.com.shazam.Shazam"];
    v5 = self->_debugContainer;
    self->_debugContainer = v4;

    debugContainer = self->_debugContainer;
  }

  return debugContainer;
}

- (CKRecordZone)shazamLibraryZone
{
  shazamLibraryZone = self->_shazamLibraryZone;
  if (!shazamLibraryZone)
  {
    id v4 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"shazam-library" ownerName:CKCurrentUserDefaultName];
    v5 = (CKRecordZone *)[objc_alloc((Class)CKRecordZone) initWithZoneID:v4];
    v6 = self->_shazamLibraryZone;
    self->_shazamLibraryZone = v5;

    shazamLibraryZone = self->_shazamLibraryZone;
  }

  return shazamLibraryZone;
}

- (id)containerWithScope:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(SHLCloudContext *)self debugContainer];
  }
  else if (a3 == 1)
  {
    v3 = [(SHLCloudContext *)self manateeContainer];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    v3 = [(SHLCloudContext *)self defaultContainer];
  }
  a2 = v3;
LABEL_8:

  return (id)(id)a2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shazamLibraryZone, 0);
  objc_storeStrong((id *)&self->_debugContainer, 0);
  objc_storeStrong((id *)&self->_manateeContainer, 0);

  objc_storeStrong((id *)&self->_defaultContainer, 0);
}

@end