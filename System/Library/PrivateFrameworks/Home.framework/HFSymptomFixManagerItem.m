@interface HFSymptomFixManagerItem
- (HFSymptomFixManagerItem)initWithSymptom:(id)a3 fixSession:(id)a4 accessory:(id)a5;
- (HMAccessory)accessory;
- (HMSymptom)symptom;
- (HMSymptomFixSession)fixSession;
- (NSUUID)identifier;
- (id)description;
@end

@implementation HFSymptomFixManagerItem

- (HFSymptomFixManagerItem)initWithSymptom:(id)a3 fixSession:(id)a4 accessory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFSymptomFixManagerItem;
  v12 = [(HFSymptomFixManagerItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_symptom, a3);
    objc_storeStrong((id *)&v13->_fixSession, a4);
    objc_storeStrong((id *)&v13->_accessory, a5);
    uint64_t v14 = [MEMORY[0x263F08C38] UUID];
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;
  }
  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFSymptomFixManagerItem *)self symptom];
  id v5 = (id)[v3 appendObject:v4 withName:@"symptom"];

  v6 = [(HFSymptomFixManagerItem *)self fixSession];
  id v7 = (id)[v3 appendObject:v6 withName:@"fixSession"];

  v8 = [(HFSymptomFixManagerItem *)self accessory];
  id v9 = (id)[v3 appendObject:v8 withName:@"accessory"];

  id v10 = [(HFSymptomFixManagerItem *)self identifier];
  id v11 = (id)[v3 appendObject:v10 withName:@"identifier"];

  v12 = [v3 build];

  return v12;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMSymptom)symptom
{
  return self->_symptom;
}

- (HMSymptomFixSession)fixSession
{
  return self->_fixSession;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_fixSession, 0);
  objc_storeStrong((id *)&self->_symptom, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end