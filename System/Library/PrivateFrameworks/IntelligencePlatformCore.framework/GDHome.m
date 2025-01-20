@interface GDHome
- (CLLocation)location;
- (GDHome)initWithHMHome:(id)a3;
- (HMHome)hmHome;
- (NSArray)allUsers;
- (NSArray)users;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)persons;
@end

@implementation GDHome

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUsers, 0);
  objc_storeStrong((id *)&self->_inner, 0);
}

- (NSArray)allUsers
{
  return self->_allUsers;
}

- (CLLocation)location
{
  return (CLLocation *)((uint64_t (*)(HMHome *, char *))MEMORY[0x1F4181798])(self->_inner, sel_location);
}

- (id)persons
{
  v3 = objc_opt_new();
  v7 = objc_msgSend_personManagerSettings(self->_inner, v4, v5, v6);
  char isFaceClassificationEnabled = objc_msgSend_isFaceClassificationEnabled(v7, v8, v9, v10);

  if (isFaceClassificationEnabled)
  {
    v15 = objc_msgSend_personManager(self->_inner, v12, v13, v14);
    if (v15)
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1C791B6E8;
      v24[3] = &unk_1E6536FB8;
      id v17 = v3;
      id v25 = v17;
      v18 = v16;
      v26 = v18;
      objc_msgSend_fetchAllPersonsWithCompletion_(v15, v19, (uint64_t)v24, v20);
      dispatch_time_t v21 = dispatch_time(0, 10000000000);
      if (dispatch_group_wait(v18, v21)) {
        id v22 = (id)MEMORY[0x1E4F1CBF0];
      }
      else {
        id v22 = v17;
      }
    }
    else
    {
      id v22 = v3;
    }
  }
  else
  {
    id v22 = v3;
  }

  return v22;
}

- (NSArray)users
{
  v3 = (void *)MEMORY[0x1C87B9E80](self, a2);
  v7 = objc_msgSend_users(self->_inner, v4, v5, v6);
  v11 = objc_msgSend_currentUser(self->_inner, v8, v9, v10);
  uint64_t v14 = objc_msgSend_arrayByAddingObject_(v7, v12, (uint64_t)v11, v13);

  id v17 = objc_msgSend__pas_mappedArrayWithTransform_(v14, v15, (uint64_t)&unk_1F220AB98, v16);

  return (NSArray *)v17;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_msgSend_uniqueIdentifier(self->_inner, a2, v2, v3);
}

- (NSString)name
{
  return (NSString *)objc_msgSend_name(self->_inner, a2, v2, v3);
}

- (HMHome)hmHome
{
  return self->_inner;
}

- (GDHome)initWithHMHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDHome;
  uint64_t v6 = [(GDHome *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inner, a3);
  }

  return v7;
}

@end