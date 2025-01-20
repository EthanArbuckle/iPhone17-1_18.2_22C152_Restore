@interface HMDCoordinationLocalElectionMeshNode
- (BOOL)isEqual:(id)a3;
- (COMeshNode)meshNode;
- (HMDCoordinationLocalElectionMeshNode)initWithMeshNode:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)idsIdentifier;
- (unint64_t)hash;
- (void)setIdsIdentifier:(id)a3;
@end

@implementation HMDCoordinationLocalElectionMeshNode

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_meshNode);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (COMeshNode)meshNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_meshNode);
  return (COMeshNode *)WeakRetained;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)debugDescription
{
  v2 = NSString;
  v3 = [(HMDCoordinationLocalElectionMeshNode *)self meshNode];
  v4 = [v3 debugDescription];
  v5 = [v2 stringWithFormat:@"[HMDLocalElectionMeshNode wrapping:%@]", v4];

  return (NSString *)v5;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HMDCoordinationLocalElectionMeshNode *)self meshNode];
  v4 = [v3 description];
  v5 = [v2 stringWithFormat:@"[HMDLocalElectionMeshNode wrapping:%@]", v4];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v2 = [(HMDCoordinationLocalElectionMeshNode *)self idsIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDCoordinationLocalElectionMeshNode *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDCoordinationLocalElectionMeshNode *)self idsIdentifier];
      v8 = [(HMDCoordinationLocalElectionMeshNode *)v6 idsIdentifier];
      char v9 = HMFEqualObjects();
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMDCoordinationLocalElectionMeshNode)initWithMeshNode:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDCoordinationLocalElectionMeshNode;
  v5 = [(HMDCoordinationLocalElectionMeshNode *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_meshNode, v4);
    uint64_t v7 = [v4 IDSIdentifier];
    idsIdentifier = v6->_idsIdentifier;
    v6->_idsIdentifier = (NSString *)v7;
  }
  return v6;
}

@end