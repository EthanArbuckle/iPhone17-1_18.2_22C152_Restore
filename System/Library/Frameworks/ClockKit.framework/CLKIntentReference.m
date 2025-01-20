@interface CLKIntentReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLKIntentReference)initWithCoder:(id)a3;
- (CLKIntentReference)initWithIntent:(id)a3;
- (INIntent)intent;
- (NSData)keyedArchiverEncodedData;
- (id)_lock_intent;
- (id)description;
- (int64_t)indexingHash;
- (unint64_t)hash;
- (void)_lock_intent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKIntentReference

- (CLKIntentReference)initWithIntent:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v13.receiver = self;
  v13.super_class = (Class)CLKIntentReference;
  self = [(CLKIntentReference *)&v13 init];
  if (self)
  {
    v5 = INIntentWithTypedIntent();
    objc_storeWeak((id *)&self->_inflatedIntent, v5);
    self->_indexingHash = [v4 _indexingHash];
    id v12 = 0;
    v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
    id v7 = v12;
    if (v6)
    {
      intentData = self->_intentData;
      self->_intentData = v6;

      self->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_5;
    }
    v10 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      [(CLKIntentReference *)(uint64_t)v4 initWithIntent:v10];
    }

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
LABEL_5:
  self = self;
  v9 = self;
LABEL_10:

  return v9;
}

- (INIntent)intent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(CLKIntentReference *)self _lock_intent];
  os_unfair_lock_unlock(p_lock);

  return (INIntent *)v4;
}

- (id)_lock_intent
{
  p_inflatedIntent = &self->_inflatedIntent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inflatedIntent);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F08928];
    uint64_t v8 = objc_opt_class();
    intentData = self->_intentData;
    id v14 = 0;
    id v6 = [v7 unarchivedObjectOfClass:v8 fromData:intentData error:&v14];
    id v10 = v14;
    if (v6)
    {
      objc_storeWeak((id *)p_inflatedIntent, v6);
      id v11 = v6;
    }
    else
    {
      id v12 = CLKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        [(CLKIntentReference *)(uint64_t)v10 _lock_intent];
      }
    }
  }

  return v6;
}

- (NSData)keyedArchiverEncodedData
{
  return self->_intentData;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInt64:self->_indexingHash withName:@"indexingHash"];
  v5 = [v3 description];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_indexingHash == v4[4];

  return v5;
}

- (unint64_t)hash
{
  return self->_indexingHash;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t indexingHash = self->_indexingHash;
  uint64_t v5 = _CLKIntentReferenceIndexingHashKey;
  id v6 = a3;
  [v6 encodeInt64:indexingHash forKey:v5];
  [v6 encodeObject:self->_intentData forKey:_CLKIntentReferenceIntentDataKey];
}

- (CLKIntentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKIntentReference;
  uint64_t v5 = [(CLKIntentReference *)&v9 init];
  if (v5)
  {
    v5->_int64_t indexingHash = [v4 decodeInt64ForKey:_CLKIntentReferenceIndexingHashKey];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:_CLKIntentReferenceIntentDataKey];
    intentData = v5->_intentData;
    v5->_intentData = (NSData *)v6;
  }
  return v5;
}

- (int64_t)indexingHash
{
  return self->_indexingHash;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inflatedIntent);

  objc_storeStrong((id *)&self->_intentData, 0);
}

- (void)initWithIntent:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_21C599000, log, OS_LOG_TYPE_FAULT, "Failed to encode intent %@, error %@", (uint8_t *)&v3, 0x16u);
}

- (void)_lock_intent
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Failed to decode intent: %@", (uint8_t *)&v2, 0xCu);
}

@end