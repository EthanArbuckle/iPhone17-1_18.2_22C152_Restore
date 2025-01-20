@interface HMDCameraAccessModeChangedBulletin
+ (id)localizedMessageForCameraAccessModeChange:(unint64_t)a3 changeReason:(int64_t)a4 camera:(id)a5;
- (BOOL)isTimeSensitive;
- (HMDCameraAccessModeChangedBulletin)initWithAccessMode:(unint64_t)a3 camera:(id)a4 home:(id)a5 changeReason:(int64_t)a6 changeDate:(id)a7;
- (HMDCameraAccessModeChangedBulletin)initWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 dateOfOccurrence:(id)a6 userInfo:(id)a7 isTimeSensitive:(BOOL)a8;
- (NSDate)dateOfOccurrence;
- (NSDictionary)userInfo;
- (NSString)body;
- (NSString)threadIdentifier;
- (NSString)title;
- (id)attributeDescriptions;
@end

@implementation HMDCameraAccessModeChangedBulletin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)isTimeSensitive
{
  return self->_timeSensitive;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDCameraAccessModeChangedBulletin *)self title];
  v21 = (void *)[v3 initWithName:@"Title" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDCameraAccessModeChangedBulletin *)self body];
  v5 = (void *)[v4 initWithName:@"Body" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCameraAccessModeChangedBulletin *)self threadIdentifier];
  v8 = (void *)[v6 initWithName:@"Thread ID" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDCameraAccessModeChangedBulletin *)self dateOfOccurrence];
  v11 = (void *)[v9 initWithName:@"Date" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDCameraAccessModeChangedBulletin *)self userInfo];
  v14 = (void *)[v12 initWithName:@"User Info" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCameraAccessModeChangedBulletin *)self isTimeSensitive];
  v16 = HMFBooleanToString();
  v17 = (void *)[v15 initWithName:@"Time Sensitive" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (HMDCameraAccessModeChangedBulletin)initWithAccessMode:(unint64_t)a3 camera:(id)a4 home:(id)a5 changeReason:(int64_t)a6 changeDate:(id)a7
{
  v33[4] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  id v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  v16 = [(id)objc_opt_class() localizedMessageForCameraAccessModeChange:a3 changeReason:a6 camera:v12];
  if (v16)
  {
    v32[0] = *MEMORY[0x263F0BAA8];
    v30 = [v12 contextSPIUniqueIdentifier];
    v29 = [v30 UUIDString];
    v33[0] = v29;
    v32[1] = *MEMORY[0x263F0BAC8];
    v17 = [v13 contextSPIUniqueIdentifier];
    [v17 UUIDString];
    v18 = unint64_t v31 = a3;
    v33[1] = v18;
    v32[2] = @"home";
    v19 = [v13 contextID];
    v33[2] = v19;
    v32[3] = @"accessory";
    v20 = [v12 accessory];
    [v20 contextID];
    v22 = v21 = v15;
    v33[3] = v22;
    v28 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

    id v15 = v21;
    v23 = [v13 name];
    v24 = [v13 uuid];
    v25 = [v24 UUIDString];
    self = [(HMDCameraAccessModeChangedBulletin *)self initWithTitle:v23 body:v16 threadIdentifier:v25 dateOfOccurrence:v21 userInfo:v28 isTimeSensitive:v31 == 2];

    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (HMDCameraAccessModeChangedBulletin)initWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 dateOfOccurrence:(id)a6 userInfo:(id)a7 isTimeSensitive:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v19 = v18;
  if (!v18)
  {
LABEL_13:
    v23 = (void *)_HMFPreconditionFailure();
    return (HMDCameraAccessModeChangedBulletin *)+[HMDCameraAccessModeChangedBulletin localizedMessageForCameraAccessModeChange:v25 changeReason:v26 camera:v27];
  }
  v30.receiver = self;
  v30.super_class = (Class)HMDCameraAccessModeChangedBulletin;
  v20 = [(HMDCameraAccessModeChangedBulletin *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_title, a3);
    objc_storeStrong((id *)&v21->_body, a4);
    objc_storeStrong((id *)&v21->_threadIdentifier, a5);
    objc_storeStrong((id *)&v21->_dateOfOccurrence, a6);
    objc_storeStrong((id *)&v21->_userInfo, obj);
    v21->_timeSensitive = a8;
  }

  return v21;
}

+ (id)localizedMessageForCameraAccessModeChange:(unint64_t)a3 changeReason:(int64_t)a4 camera:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v8 = (__CFString *)a5;
  id v9 = [(__CFString *)v8 hapAccessory];
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v19;
      __int16 v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference was nil on camera: %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  if (a3 > 3 || (HMDLocalizedStringForKey(off_264A2E350[a3]), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v16;
      __int16 v45 = 2048;
      v46 = (__CFString *)a3;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown accessMode %lu, not posting notification", buf, 0x16u);
    }
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v11 = (void *)v10;
  if (a4 == 1)
  {
    id v12 = @"CAMERA_ACCESS_MODE_CHANGE_REASON_OCCUPIED";
  }
  else
  {
    if (a4 != 2)
    {
LABEL_24:
      v33 = NSString;
      v34 = HMDLocalizedStringForKey(@"CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION");
      id v41 = 0;
      v35 = [v9 name];
      v28 = [v33 localizedStringWithValidatedFormat:v34, @"%@ %@", &v41, v35, v11 validFormatSpecifiers error];
      v23 = (__CFString *)v41;

      v36 = v28;
      if (!v28)
      {
        v37 = (void *)MEMORY[0x230FBD990]();
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v44 = v39;
          __int16 v45 = 2112;
          v46 = @"CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION";
          __int16 v47 = 2112;
          v48 = @"%@ %@";
          __int16 v49 = 2112;
          v50 = v23;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
        }
        v36 = @"CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION";
      }
      v20 = v36;
      goto LABEL_29;
    }
    id v12 = @"CAMERA_ACCESS_MODE_CHANGE_REASON_UNOCCUPIED";
  }
  uint64_t v22 = HMDLocalizedStringForKey(v12);
  if (!v22) {
    goto LABEL_24;
  }
  v23 = (__CFString *)v22;
  SEL v24 = NSString;
  unint64_t v25 = HMDLocalizedStringForKey(@"CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION_WITH_REASON");
  id v42 = 0;
  int64_t v26 = [v9 name];
  id v27 = [v24 localizedStringWithValidatedFormat:v25, @"%@ %@ %@", &v42, v26, v11, v23 validFormatSpecifiers error];
  v28 = (__CFString *)v42;

  v29 = v27;
  if (!v27)
  {
    objc_super v30 = (void *)MEMORY[0x230FBD990]();
    unint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = v40 = v30;
      *(_DWORD *)buf = 138544130;
      v44 = v32;
      __int16 v45 = 2112;
      v46 = @"CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION_WITH_REASON";
      __int16 v47 = 2112;
      v48 = @"%@ %@ %@";
      __int16 v49 = 2112;
      v50 = v28;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      objc_super v30 = v40;
    }

    v29 = @"CAMERA_ACCESS_MODE_CHANGED_NOTIFICATION_WITH_REASON";
  }
  v20 = v29;

LABEL_29:
LABEL_14:

  return v20;
}

@end