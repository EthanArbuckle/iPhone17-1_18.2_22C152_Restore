@interface HFDemoModeFaceRecognitionRecentsData
- (HFDemoModeFaceRecognitionRecentsData)initWithPerson:(id)a3 faceCrop:(id)a4;
- (HMFaceCrop)faceCrop;
- (HMPerson)person;
- (NSUUID)uuid;
- (void)setFaceCrop:(id)a3;
- (void)setPerson:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation HFDemoModeFaceRecognitionRecentsData

- (HFDemoModeFaceRecognitionRecentsData)initWithPerson:(id)a3 faceCrop:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFDemoModeFaceRecognitionRecentsData;
  v9 = [(HFDemoModeFaceRecognitionRecentsData *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeStrong((id *)&v10->_faceCrop, a4);
    uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;
  }
  return v10;
}

- (HMPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (HMFaceCrop)faceCrop
{
  return self->_faceCrop;
}

- (void)setFaceCrop:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end