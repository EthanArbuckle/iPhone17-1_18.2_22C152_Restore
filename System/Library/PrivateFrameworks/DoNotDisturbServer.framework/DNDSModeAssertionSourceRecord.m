@interface DNDSModeAssertionSourceRecord
+ (id)recordForAssertionSource:(id)a3;
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
- (NSString)clientIdentifier;
- (NSString)deviceIdentifier;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setClientIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
@end

@implementation DNDSModeAssertionSourceRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionSourceRecord);
    v7 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var4.var0);
    [(DNDSModeAssertionSourceRecord *)v6 setClientIdentifier:v7];

    v8 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var4.var1);

    [(DNDSModeAssertionSourceRecord *)v6 setDeviceIdentifier:v8];
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
  v7 = [(DNDSModeAssertionSourceRecord *)self clientIdentifier];
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v7, a3->var4.var0);

  v8 = [(DNDSModeAssertionSourceRecord *)self deviceIdentifier];
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v8, a3->var4.var1);

  return v6;
}

+ (id)recordForAssertionSource:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionSourceRecord);
    id v5 = [v3 clientIdentifier];
    [(DNDSModeAssertionSourceRecord *)v4 setClientIdentifier:v5];

    v6 = [v3 deviceIdentifier];

    [(DNDSModeAssertionSourceRecord *)v4 setDeviceIdentifier:v6];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  id v3 = [(DNDSModeAssertionSourceRecord *)self clientIdentifier];
  v4 = [(DNDSModeAssertionSourceRecord *)self deviceIdentifier];
  if (v3) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:v3 deviceIdentifier:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end