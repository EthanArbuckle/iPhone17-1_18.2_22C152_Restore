@interface DNDSModeAssertionDetailsRecord
+ (id)recordForAssertionDetails:(id)a3;
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
- (DNDSModeAssertionLifetimeRecord)lifetime;
- (NSNumber)modeConfigurationModifiedDate;
- (NSNumber)userVisibleEndDate;
- (NSString)identifier;
- (NSString)modeIdentifier;
- (NSString)reason;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setIdentifier:(id)a3;
- (void)setLifetime:(id)a3;
- (void)setModeConfigurationModifiedDate:(id)a3;
- (void)setModeIdentifier:(id)a3;
- (void)setReason:(id)a3;
- (void)setUserVisibleEndDate:(id)a3;
@end

@implementation DNDSModeAssertionDetailsRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionDetailsRecord);
    v7 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var2.var0);
    [(DNDSModeAssertionDetailsRecord *)v6 setIdentifier:v7];

    v8 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var2.var1);
    [(DNDSModeAssertionDetailsRecord *)v6 setModeIdentifier:v8];

    v9 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var2.var2);
    [(DNDSModeAssertionDetailsRecord *)v6 setModeConfigurationModifiedDate:v9];

    v10 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var2.var3);
    [(DNDSModeAssertionDetailsRecord *)v6 setUserVisibleEndDate:v10];

    v11 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var2.var4);
    v12 = +[DNDSModeAssertionLifetimeRecord recordForDictionary:v11 keys:a4];
    [(DNDSModeAssertionDetailsRecord *)v6 setLifetime:v12];

    v13 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var2.var5);

    [(DNDSModeAssertionDetailsRecord *)v6 setReason:v13];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(DNDSModeAssertionDetailsRecord *)self identifier];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var2.var0);

  v9 = [(DNDSModeAssertionDetailsRecord *)self modeIdentifier];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var2.var1);

  v10 = [(DNDSModeAssertionDetailsRecord *)self modeConfigurationModifiedDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var2.var2);

  v11 = [(DNDSModeAssertionDetailsRecord *)self userVisibleEndDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var2.var3);

  v12 = [(DNDSModeAssertionDetailsRecord *)self lifetime];
  v13 = [v12 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var2.var4);

  v14 = [(DNDSModeAssertionDetailsRecord *)self reason];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var2.var5);

  if (a4)
  {
    v15 = [(DNDSModeAssertionDetailsRecord *)self userVisibleEndDate];
    v16 = [NSString stringWithFormat:@"%@Local", a3->var2.var3];
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v15, v16);
  }
  return v7;
}

+ (id)recordForAssertionDetails:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionDetailsRecord);
    id v5 = [v3 identifier];
    [(DNDSModeAssertionDetailsRecord *)v4 setIdentifier:v5];

    v6 = [v3 modeIdentifier];
    [(DNDSModeAssertionDetailsRecord *)v4 setModeIdentifier:v6];

    v7 = NSNumber;
    v8 = [v3 modeConfigurationModifiedDate];
    v9 = objc_msgSend(v7, "dnds_safeNumberWithDate:", v8);
    [(DNDSModeAssertionDetailsRecord *)v4 setModeConfigurationModifiedDate:v9];

    v10 = NSNumber;
    v11 = [v3 userVisibleEndDate];
    v12 = objc_msgSend(v10, "dnds_safeNumberWithDate:", v11);
    [(DNDSModeAssertionDetailsRecord *)v4 setUserVisibleEndDate:v12];

    v13 = [v3 lifetime];
    v14 = +[DNDSModeAssertionLifetimeRecord recordForAssertionLifetime:v13];
    [(DNDSModeAssertionDetailsRecord *)v4 setLifetime:v14];

    v15 = NSString;
    uint64_t v16 = [v3 reason];

    v17 = objc_msgSend(v15, "dnds_stringForAssertionReason:", v16);
    [(DNDSModeAssertionDetailsRecord *)v4 setReason:v17];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  id v3 = [(DNDSModeAssertionDetailsRecord *)self identifier];
  v4 = [(DNDSModeAssertionDetailsRecord *)self modeIdentifier];
  id v5 = [(DNDSModeAssertionDetailsRecord *)self lifetime];
  uint64_t v6 = [v5 object];
  v7 = (void *)v6;
  id v8 = 0;
  if (v3 && v4)
  {
    if (!v5 || v6)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      [v8 setIdentifier:v3];
      [v8 setModeIdentifier:v4];
      v9 = [(DNDSModeAssertionDetailsRecord *)self modeConfigurationModifiedDate];
      v10 = v9;
      if (v9)
      {
        v11 = (void *)MEMORY[0x1E4F1C9C8];
        [v9 doubleValue];
        v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        v12 = 0;
      }
      [v8 setModeConfigurationModifiedDate:v12];
      v13 = [(DNDSModeAssertionDetailsRecord *)self userVisibleEndDate];
      v14 = v13;
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E4F1C9C8];
        [v13 doubleValue];
        uint64_t v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        uint64_t v16 = 0;
      }
      [v8 setUserVisibleEndDate:v16];
      [v8 setLifetime:v7];
      v17 = [(DNDSModeAssertionDetailsRecord *)self reason];
      objc_msgSend(v8, "setReason:", objc_msgSend(v17, "dnds_assertionReasonValue"));
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
}

- (NSNumber)modeConfigurationModifiedDate
{
  return self->_modeConfigurationModifiedDate;
}

- (void)setModeConfigurationModifiedDate:(id)a3
{
}

- (NSNumber)userVisibleEndDate
{
  return self->_userVisibleEndDate;
}

- (void)setUserVisibleEndDate:(id)a3
{
}

- (DNDSModeAssertionLifetimeRecord)lifetime
{
  return self->_lifetime;
}

- (void)setLifetime:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_lifetime, 0);
  objc_storeStrong((id *)&self->_userVisibleEndDate, 0);
  objc_storeStrong((id *)&self->_modeConfigurationModifiedDate, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end