@interface DNDSModeAssertionInvalidationDetailsRecord
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
+ (id)recordForInvalidationDetails:(id)a3;
- (NSString)identifier;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setIdentifier:(id)a3;
@end

@implementation DNDSModeAssertionInvalidationDetailsRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationDetailsRecord);
    v7 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var6.var0);

    [(DNDSModeAssertionInvalidationDetailsRecord *)v6 setIdentifier:v7];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  v7 = [(DNDSModeAssertionInvalidationDetailsRecord *)self identifier];
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v7, a3->var6.var0);

  return v6;
}

+ (id)recordForInvalidationDetails:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationDetailsRecord);
    id v5 = [v3 identifier];

    [(DNDSModeAssertionInvalidationDetailsRecord *)v4 setIdentifier:v5];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  v2 = [(DNDSModeAssertionInvalidationDetailsRecord *)self identifier];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F5F708]);
    [v3 setIdentifier:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end