@interface HMMMMessageDestination
- (HMMMMessageDestination)initWithIDSIdentifier:(id)a3 idsTokenURI:(id)a4;
- (NSString)idsIdentifier;
- (NSString)idsTokenURI;
- (id)attributeDescriptions;
@end

@implementation HMMMMessageDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTokenURI, 0);

  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (NSString)idsTokenURI
{
  return self->_idsTokenURI;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMMMessageDestination *)self idsIdentifier];
  v5 = (void *)[v3 initWithName:@"IDS Identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMMMMessageDestination *)self idsTokenURI];
  v8 = (void *)[v6 initWithName:@"IDS Token" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMMMMessageDestination)initWithIDSIdentifier:(id)a3 idsTokenURI:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMMMessageDestination;
  v9 = [(HMMMMessageDestination *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idsIdentifier, a3);
    objc_storeStrong((id *)&v10->_idsTokenURI, a4);
  }

  return v10;
}

@end