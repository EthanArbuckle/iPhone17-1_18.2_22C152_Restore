@interface IDSPreflightStack
- (BOOL)containsMechanisms;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesIMSI:(id)a3 PLMN:(id)a4;
- (IDSPreflightStack)initWithIMSI:(id)a3 PLMN:(id)a4 validationMechanisms:(id)a5;
- (NSArray)validationMechanisms;
- (NSString)IMSI;
- (NSString)PLMN;
- (id)description;
- (id)preflightStackByPoppingMechanism;
- (id)topMechanism;
- (unint64_t)hash;
@end

@implementation IDSPreflightStack

- (IDSPreflightStack)initWithIMSI:(id)a3 PLMN:(id)a4 validationMechanisms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IDSPreflightStack;
  v11 = [(IDSPreflightStack *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    IMSI = v11->_IMSI;
    v11->_IMSI = v12;

    v14 = (NSString *)[v9 copy];
    PLMN = v11->_PLMN;
    v11->_PLMN = v14;

    v16 = (NSArray *)[v10 copy];
    validationMechanisms = v11->_validationMechanisms;
    v11->_validationMechanisms = v16;
  }
  return v11;
}

- (BOOL)matchesIMSI:(id)a3 PLMN:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSPreflightStack *)self IMSI];
  unsigned int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    id v10 = [(IDSPreflightStack *)self PLMN];
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)containsMechanisms
{
  v2 = [(IDSPreflightStack *)self validationMechanisms];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)topMechanism
{
  v2 = [(IDSPreflightStack *)self validationMechanisms];
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (id)preflightStackByPoppingMechanism
{
  BOOL v3 = [(IDSPreflightStack *)self validationMechanisms];
  id v4 = [v3 mutableCopy];

  if ([v4 count]) {
    [v4 removeFirstObject];
  }
  v5 = [IDSPreflightStack alloc];
  id v6 = [(IDSPreflightStack *)self IMSI];
  id v7 = [(IDSPreflightStack *)self PLMN];
  id v8 = [(IDSPreflightStack *)v5 initWithIMSI:v6 PLMN:v7 validationMechanisms:v4];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(IDSPreflightStack *)self IMSI];
    id v7 = [v5 IMSI];
    if (v6 == v7)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      id v8 = [(IDSPreflightStack *)self IMSI];
      unsigned int v9 = [v5 IMSI];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    v12 = [(IDSPreflightStack *)self PLMN];
    v13 = [v5 PLMN];
    if (v12 == v13)
    {
      unsigned __int8 v16 = 1;
    }
    else
    {
      v14 = [(IDSPreflightStack *)self PLMN];
      v15 = [v5 PLMN];
      unsigned __int8 v16 = [v14 isEqual:v15];
    }
    v17 = [(IDSPreflightStack *)self validationMechanisms];
    v18 = [v5 validationMechanisms];
    if (v17 == v18)
    {
      unsigned __int8 v21 = 1;
    }
    else
    {
      objc_super v19 = [(IDSPreflightStack *)self validationMechanisms];
      v20 = [v5 validationMechanisms];
      unsigned __int8 v21 = [v19 isEqual:v20];
    }
    char v11 = v10 & v16 & v21;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  BOOL v3 = [(IDSPreflightStack *)self IMSI];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(IDSPreflightStack *)self PLMN];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  id v7 = [(IDSPreflightStack *)self validationMechanisms];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  BOOL v3 = [(IDSPreflightStack *)self IMSI];
  unint64_t v4 = [(IDSPreflightStack *)self PLMN];
  id v5 = [(IDSPreflightStack *)self validationMechanisms];
  unint64_t v6 = +[NSString stringWithFormat:@"IDSPreflightStack { IMSI: %@, PLMN: %@, mechanisms: %@ }", v3, v4, v5];

  return v6;
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (NSString)PLMN
{
  return self->_PLMN;
}

- (NSArray)validationMechanisms
{
  return self->_validationMechanisms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationMechanisms, 0);
  objc_storeStrong((id *)&self->_PLMN, 0);

  objc_storeStrong((id *)&self->_IMSI, 0);
}

@end