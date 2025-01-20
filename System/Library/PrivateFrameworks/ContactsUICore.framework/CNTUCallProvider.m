@interface CNTUCallProvider
- (BOOL)doesContactHaveSupportedHandles:(id)a3;
- (BOOL)isEligibleDefaultApp;
- (BOOL)supportsAudio;
- (BOOL)supportsVideo;
- (CNTUCallProvider)initWithCallProvider:(id)a3;
- (NSSet)supportedHandleTypes;
- (NSString)bundleIdentifier;
- (NSString)localizedName;
- (TUCallProvider)callProvider;
- (id)dialRequestForHandle:(id)a3 contact:(id)a4 video:(BOOL)a5;
- (void)setCallProvider:(id)a3;
- (void)setIsEligibleDefaultApp:(BOOL)a3;
@end

@implementation CNTUCallProvider

- (CNTUCallProvider)initWithCallProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTUCallProvider;
  v5 = [(CNTUCallProvider *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    callProvider = v5->_callProvider;
    v5->_callProvider = (TUCallProvider *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)localizedName
{
  v2 = [(CNTUCallProvider *)self callProvider];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(CNTUCallProvider *)self callProvider];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (BOOL)supportsAudio
{
  v3 = [(CNTUCallProvider *)self callProvider];
  if ([v3 isTelephonyProvider])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [(CNTUCallProvider *)self callProvider];
    if ([v5 isFaceTimeProvider])
    {
      char v4 = 0;
    }
    else
    {
      uint64_t v6 = [(CNTUCallProvider *)self callProvider];
      char v4 = [v6 supportsAudioOnly];
    }
  }

  return v4;
}

- (BOOL)supportsVideo
{
  v3 = [(CNTUCallProvider *)self callProvider];
  if ([v3 isTelephonyProvider])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [(CNTUCallProvider *)self callProvider];
    if ([v5 isFaceTimeProvider])
    {
      char v4 = 0;
    }
    else
    {
      uint64_t v6 = [(CNTUCallProvider *)self callProvider];
      char v4 = [v6 supportsAudioAndVideo];
    }
  }

  return v4;
}

- (NSSet)supportedHandleTypes
{
  v2 = [(CNTUCallProvider *)self callProvider];
  v3 = [v2 supportedHandleTypes];

  return (NSSet *)v3;
}

- (BOOL)doesContactHaveSupportedHandles:(id)a3
{
  id v4 = a3;
  v5 = [v4 phoneNumbers];
  uint64_t v6 = [v5 count];

  v7 = [v4 emailAddresses];

  uint64_t v8 = [v7 count];
  if (!(v6 | v8)) {
    return 0;
  }
  v9 = [(CNTUCallProvider *)self supportedHandleTypes];
  int v10 = [v9 containsObject:&unk_26BFD9AF0];

  if (v10 && v6) {
    return 1;
  }
  v11 = [(CNTUCallProvider *)self supportedHandleTypes];
  int v12 = [v11 containsObject:&unk_26BFD9B08];

  if (v12)
  {
    if (v8) {
      return 1;
    }
  }
  v14 = [(CNTUCallProvider *)self supportedHandleTypes];
  char v15 = [v14 containsObject:&unk_26BFD9B20];

  return v15;
}

- (id)dialRequestForHandle:(id)a3 contact:(id)a4 video:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = (Class (__cdecl *)())getTUDialRequestClass_2;
  id v10 = a3;
  id v11 = objc_alloc(v9());
  int v12 = [(CNTUCallProvider *)self callProvider];
  v13 = objc_msgSend(v11, "cn_initWithProvider:", v12);

  v14 = +[CNHandle tuHandleForHandle:v10];
  [v13 setHandle:v14];

  char v15 = [v10 customIdentifier];

  [v13 setProviderCustomIdentifier:v15];
  if ([v8 hasBeenPersisted])
  {
    v16 = [v8 identifier];
    [v13 setContactIdentifier:v16];
  }
  [v13 setVideo:v5];

  return v13;
}

- (BOOL)isEligibleDefaultApp
{
  return self->isEligibleDefaultApp;
}

- (void)setIsEligibleDefaultApp:(BOOL)a3
{
  self->isEligibleDefaultApp = a3;
}

- (TUCallProvider)callProvider
{
  return self->_callProvider;
}

- (void)setCallProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end