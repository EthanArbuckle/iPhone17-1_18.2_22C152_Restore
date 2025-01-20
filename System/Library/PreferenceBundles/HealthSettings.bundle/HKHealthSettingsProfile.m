@interface HKHealthSettingsProfile
+ (id)sharedProfile;
- (HKHealthSettingsProfile)initWithProfileIdentifier:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)localizedName;
- (id)fetchMedicalIDDataSynchronously;
- (id)getNameComponents;
- (id)presentationContext;
- (id)profileStore;
- (id)userActivityManager;
- (void)getProfilesOfType:(int64_t)a3 completion:(id)a4;
- (void)setLocalizedName:(id)a3;
- (void)setNameComponents:(id)a3;
@end

@implementation HKHealthSettingsProfile

+ (id)sharedProfile
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4638;
  block[3] = &unk_103B8;
  block[4] = a1;
  if (qword_165E0 != -1) {
    dispatch_once(&qword_165E0, block);
  }
  v2 = (void *)qword_165D8;

  return v2;
}

- (HKHealthSettingsProfile)initWithProfileIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)HKHealthStore);
  [v5 setProfileIdentifier:v4];

  [v5 resume];
  v10.receiver = self;
  v10.super_class = (Class)HKHealthSettingsProfile;
  v6 = [(HKHealthSettingsProfile *)&v10 initWithHealthStore:v5];
  v7 = [(HKHealthSettingsProfile *)v6 getNameComponents];
  [(HKHealthSettingsProfile *)v6 setNameComponents:v7];

  v8 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v6->_nameComponents style:2 options:0];
  [(HKHealthSettingsProfile *)v6 setLocalizedName:v8];

  return v6;
}

- (void)getProfilesOfType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(HKHealthSettingsProfile *)self profileStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4854;
  v9[3] = &unk_103E0;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 fetchAllProfilesWithCompletion:v9];
}

- (id)getNameComponents
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_4AD8;
  v16 = sub_4AE8;
  id v17 = objc_alloc_init((Class)NSPersonNameComponents);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [(HKHealthSettingsProfile *)self profileStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4AF0;
  v9[3] = &unk_10408;
  int64_t v11 = &v12;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 fetchDisplayName:v9];

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)profileStore
{
  id v3 = objc_alloc((Class)HKProfileStore);
  id v4 = [(HKHealthSettingsProfile *)self healthStore];
  id v5 = [v3 initWithHealthStore:v4];

  return v5;
}

- (id)userActivityManager
{
  return 0;
}

- (id)fetchMedicalIDDataSynchronously
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_4AD8;
  v18 = sub_4AE8;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = objc_alloc((Class)HKMedicalIDStore);
  id v5 = [(HKHealthSettingsProfile *)self healthStore];
  id v6 = [v4 initWithHealthStore:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4DA0;
  v11[3] = &unk_10430;
  v13 = &v14;
  id v7 = v3;
  uint64_t v12 = v7;
  [v6 fetchMedicalIDDataWithCompletion:v11];

  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v8);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)presentationContext
{
  return WDProfilePresentationContextSettings;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end