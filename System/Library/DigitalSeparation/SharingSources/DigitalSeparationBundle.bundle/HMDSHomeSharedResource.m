@interface HMDSHomeSharedResource
- (HMDSHomeSharedResource)initWithDisplayName:(id)a3 displayDetail:(id)a4 participants:(id)a5 UUID:(id)a6;
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (NSUUID)UUID;
- (int64_t)visibility;
@end

@implementation HMDSHomeSharedResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_displayDetail, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSString)displayDetail
{
  return self->_displayDetail;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)visibility
{
  return 1;
}

- (HMDSHomeSharedResource)initWithDisplayName:(id)a3 displayDetail:(id)a4 participants:(id)a5 UUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSHomeSharedResource;
  v15 = [(HMDSHomeSharedResource *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    objc_storeStrong((id *)&v16->_displayDetail, a4);
    objc_storeStrong((id *)&v16->_participants, a5);
    objc_storeStrong((id *)&v16->_UUID, a6);
  }

  return v16;
}

@end