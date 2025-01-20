@interface BNPresentableIdentification
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)genericIdentificationForPresentable:(id)a3;
+ (id)identificationWithRequesterIdentifier:(id)a3;
+ (id)identificationWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4;
+ (id)identificationWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5;
+ (id)requesterIdentificationForPresentable:(id)a3;
+ (id)uniqueIdentificationForPresentable:(id)a3;
- (BNPresentableIdentification)initWithBSXPCCoder:(id)a3;
- (BNPresentableIdentification)initWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5;
- (NSString)description;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSUUID)uniquePresentableIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation BNPresentableIdentification

+ (id)identificationWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithRequesterIdentifier:v10 requestIdentifier:v9 uniqueIdentifier:v8];

  return v11;
}

+ (id)identificationWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRequesterIdentifier:v7 requestIdentifier:v6 uniqueIdentifier:0];

  return v8;
}

+ (id)identificationWithRequesterIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRequesterIdentifier:v4 requestIdentifier:0 uniqueIdentifier:0];

  return v5;
}

+ (id)uniqueIdentificationForPresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 requesterIdentifier];
  }
  else
  {
    v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 requestIdentifier];
  }
  else
  {
    id v6 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v4 uniquePresentableIdentifier];
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {
    id v7 = 0;
    if (v5) {
      goto LABEL_14;
    }
  }
  if (!v6 && !v7)
  {
    id v8 = 0;
    goto LABEL_15;
  }
LABEL_14:
  id v8 = (void *)[objc_alloc((Class)a1) initWithRequesterIdentifier:v5 requestIdentifier:v6 uniqueIdentifier:v7];
LABEL_15:

  return v8;
}

+ (id)genericIdentificationForPresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 requesterIdentifier];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v4 requestIdentifier];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v5 | v6) {
    id v7 = (void *)[objc_alloc((Class)a1) initWithRequesterIdentifier:v5 requestIdentifier:v6 uniqueIdentifier:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)requesterIdentificationForPresentable:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 requesterIdentifier], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (void *)v5;
    id v7 = (void *)[objc_alloc((Class)a1) initWithRequesterIdentifier:v5 requestIdentifier:0 uniqueIdentifier:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BNPresentableIdentification)initWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BNPresentableIdentification.m", 68, @"Invalid parameter not satisfying: %@", @"requesterID" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)BNPresentableIdentification;
  v12 = [(BNPresentableIdentification *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    requesterIdentifier = v12->_requesterIdentifier;
    v12->_requesterIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    requestIdentifier = v12->_requestIdentifier;
    v12->_requestIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    uniquePresentableIdentifier = v12->_uniquePresentableIdentifier;
    v12->_uniquePresentableIdentifier = (NSUUID *)v17;
  }
  return v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  requesterIdentifier = self->_requesterIdentifier;
  id v5 = a3;
  [v5 encodeObject:requesterIdentifier forKey:@"requesterIdentifier"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeObject:self->_uniquePresentableIdentifier forKey:@"uniquePresentableIdentifier"];
}

- (BNPresentableIdentification)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BNPresentableIdentification;
  id v5 = [(BNPresentableIdentification *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requesterIdentifier"];
    requesterIdentifier = v5->_requesterIdentifier;
    v5->_requesterIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniquePresentableIdentifier"];
    uniquePresentableIdentifier = v5->_uniquePresentableIdentifier;
    v5->_uniquePresentableIdentifier = (NSUUID *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  requesterIdentifier = self->_requesterIdentifier;
  requestIdentifier = self->_requestIdentifier;
  uniquePresentableIdentifier = self->_uniquePresentableIdentifier;
  return (id)[v4 initWithRequesterIdentifier:requesterIdentifier requestIdentifier:requestIdentifier uniqueIdentifier:uniquePresentableIdentifier];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; requesterIdentifier: %@; requestIdentifier: %@; uniquePresentableIdentifier: %@>",
                       objc_opt_class(),
                       self,
                       self->_requesterIdentifier,
                       self->_requestIdentifier,
                       self->_uniquePresentableIdentifier);
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSUUID)uniquePresentableIdentifier
{
  return self->_uniquePresentableIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniquePresentableIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
}

@end