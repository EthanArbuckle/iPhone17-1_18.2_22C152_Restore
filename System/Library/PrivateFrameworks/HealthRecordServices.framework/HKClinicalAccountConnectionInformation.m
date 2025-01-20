@interface HKClinicalAccountConnectionInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalAccountConnectionInformation)init;
- (HKClinicalAccountConnectionInformation)initWithAccountIdentifier:(id)a3 gateway:(id)a4 authorization:(id)a5 authentication:(id)a6 authSchemaDefinitions:(id)a7 resourceSchemaDefinitions:(id)a8;
- (HKClinicalAccountConnectionInformation)initWithCoder:(id)a3;
- (HKClinicalGateway)gateway;
- (HKFHIRCredential)authorization;
- (HKFHIRServerAuthenticationInformation)authentication;
- (NSArray)authSchemaDefinitions;
- (NSArray)resourceSchemaDefinitions;
- (NSUUID)accountIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalAccountConnectionInformation

- (HKClinicalAccountConnectionInformation)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAccountConnectionInformation)initWithAccountIdentifier:(id)a3 gateway:(id)a4 authorization:(id)a5 authentication:(id)a6 authSchemaDefinitions:(id)a7 resourceSchemaDefinitions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HKClinicalAccountConnectionInformation;
  v20 = [(HKClinicalAccountConnectionInformation *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    accountIdentifier = v20->_accountIdentifier;
    v20->_accountIdentifier = (NSUUID *)v21;

    uint64_t v23 = [v15 copy];
    gateway = v20->_gateway;
    v20->_gateway = (HKClinicalGateway *)v23;

    uint64_t v25 = [v16 copy];
    authorization = v20->_authorization;
    v20->_authorization = (HKFHIRCredential *)v25;

    uint64_t v27 = [v17 copy];
    authentication = v20->_authentication;
    v20->_authentication = (HKFHIRServerAuthenticationInformation *)v27;

    uint64_t v29 = [v18 copy];
    authSchemaDefinitions = v20->_authSchemaDefinitions;
    v20->_authSchemaDefinitions = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    resourceSchemaDefinitions = v20->_resourceSchemaDefinitions;
    v20->_resourceSchemaDefinitions = (NSArray *)v31;
  }
  return v20;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_accountIdentifier hash];
  unint64_t v4 = [(HKClinicalGateway *)self->_gateway hash] ^ v3;
  unint64_t v5 = [(HKFHIRCredential *)self->_authorization hash];
  uint64_t v6 = v4 ^ v5 ^ [(HKFHIRServerAuthenticationInformation *)self->_authentication hash];
  uint64_t v7 = [(NSArray *)self->_authSchemaDefinitions hash];
  return v6 ^ v7 ^ [(NSArray *)self->_resourceSchemaDefinitions hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (HKClinicalAccountConnectionInformation *)a3;
  uint64_t v7 = v6;
  if (v6 != self)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v3) = 0;
LABEL_77:

      goto LABEL_78;
    }
    accountIdentifier = self->_accountIdentifier;
    v10 = [(HKClinicalAccountConnectionInformation *)v8 accountIdentifier];
    if (accountIdentifier != v10)
    {
      uint64_t v11 = [(HKClinicalAccountConnectionInformation *)v8 accountIdentifier];
      if (!v11)
      {
        LOBYTE(v3) = 0;
        goto LABEL_76;
      }
      v12 = (void *)v11;
      v13 = self->_accountIdentifier;
      unint64_t v4 = [(HKClinicalAccountConnectionInformation *)v8 accountIdentifier];
      if (![(NSUUID *)v13 isEqual:v4])
      {
        LOBYTE(v3) = 0;
LABEL_75:

        goto LABEL_76;
      }
      v70 = v12;
    }
    gateway = self->_gateway;
    id v15 = [(HKClinicalAccountConnectionInformation *)v8 gateway];
    if (gateway == v15)
    {
      v69 = v4;
    }
    else
    {
      uint64_t v3 = [(HKClinicalAccountConnectionInformation *)v8 gateway];
      if (!v3)
      {

        BOOL v30 = accountIdentifier == v10;
        goto LABEL_59;
      }
      v66 = v10;
      id v16 = accountIdentifier;
      id v17 = gateway;
      id v18 = self->_gateway;
      id v19 = [(HKClinicalAccountConnectionInformation *)v8 gateway];
      if (![(HKClinicalGateway *)v18 isEqual:v19])
      {

        LOBYTE(v3) = 0;
        BOOL v30 = v16 == v66;
        v10 = v66;
        goto LABEL_59;
      }
      v64 = v19;
      v69 = v4;
      gateway = v17;
      accountIdentifier = v16;
      v10 = v66;
    }
    authorization = self->_authorization;
    uint64_t v21 = [(HKClinicalAccountConnectionInformation *)v8 authorization];
    v22 = (HKFHIRCredential *)v21;
    if (authorization == (HKFHIRCredential *)v21)
    {
      v63 = accountIdentifier;
      uint64_t v29 = (HKFHIRCredential *)v21;
LABEL_22:
      authentication = self->_authentication;
      [(HKClinicalAccountConnectionInformation *)v8 authentication];
      v61 = authentication;
      v65 = (HKFHIRServerAuthenticationInformation *)objc_claimAutoreleasedReturnValue();
      if (authentication == v65)
      {
        v60 = authorization;
        v36 = v29;
      }
      else
      {
        uint64_t v32 = [(HKClinicalAccountConnectionInformation *)v8 authentication];
        if (!v32)
        {
          v68 = v3;
          LOBYTE(v3) = 0;
          v36 = v29;
          accountIdentifier = v63;
          v40 = v64;
          goto LABEL_67;
        }
        v57 = (void *)v32;
        v60 = authorization;
        v33 = self->_authentication;
        uint64_t v34 = [(HKClinicalAccountConnectionInformation *)v8 authentication];
        v35 = v33;
        authorization = (HKFHIRCredential *)v34;
        v36 = v29;
        if (![(HKFHIRServerAuthenticationInformation *)v35 isEqual:v34])
        {

          if (v60 == v29)
          {
          }
          else
          {
          }
          unint64_t v4 = v69;
          if (gateway != v15)
          {
          }
          LOBYTE(v3) = 0;
          BOOL v30 = v63 == v10;
LABEL_59:
          v12 = v70;
          if (v30) {
            goto LABEL_76;
          }
          goto LABEL_75;
        }
      }
      authSchemaDefinitions = self->_authSchemaDefinitions;
      v59 = [(HKClinicalAccountConnectionInformation *)v8 authSchemaDefinitions];
      v55 = authSchemaDefinitions;
      v56 = authorization;
      v68 = v3;
      if (authSchemaDefinitions != v59)
      {
        uint64_t v38 = [(HKClinicalAccountConnectionInformation *)v8 authSchemaDefinitions];
        if (!v38)
        {
          LOBYTE(v3) = 0;
          goto LABEL_48;
        }
        v54 = (void *)v38;
        v39 = self->_authSchemaDefinitions;
        authSchemaDefinitions = [(HKClinicalAccountConnectionInformation *)v8 authSchemaDefinitions];
        if (![(NSArray *)v39 isEqualToArray:authSchemaDefinitions])
        {

          LOBYTE(v3) = 0;
LABEL_65:
          v40 = v64;
          v51 = v65;
          authorization = v60;
          accountIdentifier = v63;
          if (v61 == v65)
          {
LABEL_68:

            if (authorization != v36)
            {
            }
            if (gateway != v15)
            {
            }
            goto LABEL_73;
          }

LABEL_67:
          v51 = v65;
          goto LABEL_68;
        }
      }
      resourceSchemaDefinitions = self->_resourceSchemaDefinitions;
      uint64_t v42 = [(HKClinicalAccountConnectionInformation *)v8 resourceSchemaDefinitions];
      LOBYTE(v3) = resourceSchemaDefinitions == (NSArray *)v42;
      if (resourceSchemaDefinitions != (NSArray *)v42)
      {
        resourceSchemaDefinitions = (NSArray *)v42;
        uint64_t v43 = [(HKClinicalAccountConnectionInformation *)v8 resourceSchemaDefinitions];
        if (v43)
        {
          v53 = authSchemaDefinitions;
          uint64_t v3 = self->_resourceSchemaDefinitions;
          v44 = (void *)v43;
          v45 = [(HKClinicalAccountConnectionInformation *)v8 resourceSchemaDefinitions];
          LOBYTE(v3) = [v3 isEqualToArray:v45];

          if (v55 == v59)
          {
          }
          else
          {
          }
          goto LABEL_65;
        }
      }

      if (v55 == v59)
      {

        v46 = v64;
        v48 = v65;
        v47 = v60;
        if (v61 == v65) {
          goto LABEL_50;
        }
        goto LABEL_49;
      }

LABEL_48:
      v46 = v64;
      v47 = v60;

      v48 = v65;
      if (v61 == v65)
      {
LABEL_50:

        if (v47 != v36)
        {
        }
        if (gateway != v15)
        {
        }
        BOOL v50 = v63 == v10;
LABEL_74:
        unint64_t v4 = v69;
        v12 = v70;
        if (!v50) {
          goto LABEL_75;
        }
LABEL_76:

        goto LABEL_77;
      }
LABEL_49:
      v49 = v48;

      v48 = v49;
      goto LABEL_50;
    }
    uint64_t v23 = [(HKClinicalAccountConnectionInformation *)v8 authorization];
    if (v23)
    {
      v67 = v3;
      v24 = authorization;
      v62 = (void *)v23;
      uint64_t v25 = self->_authorization;
      uint64_t v26 = [(HKClinicalAccountConnectionInformation *)v8 authorization];
      uint64_t v27 = v25;
      v28 = (void *)v26;
      if ([(HKOAuth2Credential *)v27 isEqual:v26])
      {
        v63 = accountIdentifier;
        v58 = v28;
        authorization = v24;
        uint64_t v29 = v22;
        uint64_t v3 = v67;
        goto LABEL_22;
      }

      if (gateway != v15)
      {

        goto LABEL_37;
      }
    }
    else
    {

      if (gateway != v15)
      {

LABEL_37:
LABEL_39:
        LOBYTE(v3) = 0;
LABEL_73:
        BOOL v50 = accountIdentifier == v10;
        goto LABEL_74;
      }
    }

    goto LABEL_39;
  }
  LOBYTE(v3) = 1;
LABEL_78:

  return (char)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_gateway forKey:@"gateway"];
  [v5 encodeObject:self->_authorization forKey:@"authorization"];
  [v5 encodeObject:self->_authentication forKey:@"authentication"];
  [v5 encodeObject:self->_authSchemaDefinitions forKey:@"authSchemaDefinitions"];
  [v5 encodeObject:self->_resourceSchemaDefinitions forKey:@"resourceSchemaDefinitions"];
}

- (HKClinicalAccountConnectionInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gateway"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorization"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authentication"];
  v9 = objc_msgSend(MEMORY[0x263F08900], "hk_JSONObjectSecureCodingClasses");
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"authSchemaDefinitions"];

  uint64_t v11 = objc_msgSend(MEMORY[0x263F08900], "hk_JSONObjectSecureCodingClasses");
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"resourceSchemaDefinitions"];

  if (v5 && v6 && v10 && v12)
  {
    self = [(HKClinicalAccountConnectionInformation *)self initWithAccountIdentifier:v5 gateway:v6 authorization:v7 authentication:v8 authSchemaDefinitions:v10 resourceSchemaDefinitions:v12];
    v13 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v13 = 0;
  }

  return v13;
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (HKClinicalGateway)gateway
{
  return self->_gateway;
}

- (HKFHIRCredential)authorization
{
  return self->_authorization;
}

- (HKFHIRServerAuthenticationInformation)authentication
{
  return self->_authentication;
}

- (NSArray)authSchemaDefinitions
{
  return self->_authSchemaDefinitions;
}

- (NSArray)resourceSchemaDefinitions
{
  return self->_resourceSchemaDefinitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceSchemaDefinitions, 0);
  objc_storeStrong((id *)&self->_authSchemaDefinitions, 0);
  objc_storeStrong((id *)&self->_authentication, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_gateway, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end