@interface _HKEmergencyContactWrapper
- (BOOL)isEqual:(id)a3;
- (_HKEmergencyContact)contact;
- (unint64_t)hash;
- (void)setContact:(id)a3;
@end

@implementation _HKEmergencyContactWrapper

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_HKEmergencyContactWrapper *)self contact];
    v6 = [v5 phoneNumber];
    v7 = [v4 contact];
    v8 = [v7 phoneNumber];
    if (v6 == v8)
    {
      char v15 = 1;
    }
    else
    {
      v9 = [v4 contact];
      v10 = [v9 phoneNumber];
      if (v10)
      {
        v17 = [(_HKEmergencyContactWrapper *)self contact];
        v11 = [v17 phoneNumber];
        v12 = [v4 contact];
        [v12 phoneNumber];
        v18 = v5;
        v14 = v13 = v9;
        char v15 = [v11 isEqual:v14];

        v9 = v13;
        v5 = v18;
      }
      else
      {
        char v15 = 0;
      }
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(_HKEmergencyContact *)self->_contact phoneNumber];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HKEmergencyContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (void).cxx_destruct
{
}

@end