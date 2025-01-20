@interface HMIPersonsModel
- (BOOL)isExternalLibrary;
- (HMIPersonsModel)initWithPersonsModel:(id)a3 homeUUID:(id)a4 sourceUUID:(id)a5 externalLibrary:(BOOL)a6;
- (HMIPersonsModelSummary)summary;
- (NSUUID)homeUUID;
- (NSUUID)sourceUUID;
- (VNPersonsModel)visionPersonsModel;
@end

@implementation HMIPersonsModel

- (HMIPersonsModel)initWithPersonsModel:(id)a3 homeUUID:(id)a4 sourceUUID:(id)a5 externalLibrary:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIPersonsModel;
  v14 = [(HMIPersonsModel *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_visionPersonsModel, a3);
    objc_storeStrong((id *)&v15->_homeUUID, a4);
    objc_storeStrong((id *)&v15->_sourceUUID, a5);
    v15->_externalLibrary = a6;
  }

  return v15;
}

- (HMIPersonsModelSummary)summary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMIPersonsModel *)self visionPersonsModel];
  v5 = [v4 personUniqueIdentifiers];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __26__HMIPersonsModel_summary__block_invoke;
  v16 = &unk_26477D5E0;
  objc_super v17 = self;
  id v18 = v3;
  id v6 = v3;
  objc_msgSend(v5, "na_each:", &v13);

  v7 = [HMIPersonsModelSummary alloc];
  v8 = [(HMIPersonsModel *)self sourceUUID];
  BOOL v9 = [(HMIPersonsModel *)self isExternalLibrary];
  v10 = (void *)[v6 copy];
  id v11 = [(HMIPersonsModelSummary *)v7 initWithSourceUUID:v8 externalLibrary:v9 faceCountsByPerson:v10];

  return v11;
}

void __26__HMIPersonsModel_summary__block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 visionPersonsModel];
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v6, "faceCountForPersonWithUniqueIdentifier:", v5));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];
}

- (VNPersonsModel)visionPersonsModel
{
  return (VNPersonsModel *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isExternalLibrary
{
  return self->_externalLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_visionPersonsModel, 0);
}

@end