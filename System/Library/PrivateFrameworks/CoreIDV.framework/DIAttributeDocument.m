@interface DIAttributeDocument
+ (BOOL)supportsSecureCoding;
- (DIAttributeDocument)initWithAcceptableDocs:(id)a3;
- (DIAttributeDocument)initWithCoder:(id)a3;
- (NSArray)acceptableDocs;
- (NSArray)getCurrentValue;
- (NSString)idDocType;
- (id)defaultValue;
- (id)description;
- (unint64_t)acceptableDocTypes;
- (unint64_t)docType;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptableDocTypes:(unint64_t)a3;
- (void)setAcceptableDocs:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDocType:(unint64_t)a3;
- (void)setIdDocType:(id)a3;
@end

@implementation DIAttributeDocument

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDocument;
  id v4 = a3;
  [(DIAttribute *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_docType, @"docType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_idDocType forKey:@"idDocType"];
  [v4 encodeInteger:self->_acceptableDocTypes forKey:@"acceptableDocTypes"];
  [v4 encodeObject:self->_acceptableDocs forKey:@"acceptableDocs"];

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DIAttributeDocument;
  objc_super v5 = [(DIAttribute *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_docType = [v4 decodeIntegerForKey:@"docType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idDocType"];
    idDocType = v5->_idDocType;
    v5->_idDocType = (NSString *)v6;

    v5->_acceptableDocTypes = [v4 decodeIntegerForKey:@"acceptableDocTypes"];
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"acceptableDocs"];
    acceptableDocs = v5->_acceptableDocs;
    v5->_acceptableDocs = (NSArray *)v11;
  }
  return v5;
}

- (DIAttributeDocument)initWithAcceptableDocs:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DIAttributeDocument;
  uint64_t v6 = [(DIAttribute *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(DIAttribute *)v6 setAttributeType:4];
    [(DIAttribute *)v7 setIdentifier:@"identityDocument"];
    v7->_acceptableDocTypes = 1;
    objc_storeStrong((id *)&v7->_acceptableDocs, a3);
    v7->_docType = 1;
    idDocType = v7->_idDocType;
    v7->_idDocType = (NSString *)@"unknown";
  }
  return v7;
}

- (void)setDocType:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_docType = a3;
  os_unfair_lock_unlock(p_lock);
  if (a3 - 2 > 6) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_26421C780[a3 - 2];
  }

  [(DIAttributeDocument *)self setIdDocType:v6];
}

- (void)setCurrentValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDocument;
  [(DIAttribute *)&v3 setCurrentValue:a3];
}

- (void)setIdDocType:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_idDocType != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    idDocType = self->_idDocType;
    self->_idDocType = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setAcceptableDocs:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_acceptableDocs != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    acceptableDocs = self->_acceptableDocs;
    self->_acceptableDocs = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setAcceptableDocTypes:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_acceptableDocTypes = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeDocument;
  v2 = [(DIAttribute *)&v4 getCurrentValue];

  return (NSArray *)v2;
}

- (id)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeDocument;
  v2 = [(DIAttribute *)&v4 defaultValue];

  return v2;
}

- (NSString)idDocType
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_idDocType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)docType
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t docType = self->_docType;
  os_unfair_lock_unlock(p_lock);
  return docType;
}

- (NSArray)acceptableDocs
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_acceptableDocs;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)acceptableDocTypes
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t acceptableDocTypes = self->_acceptableDocTypes;
  os_unfair_lock_unlock(p_lock);
  return acceptableDocTypes;
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_26C5761E0];
  v27.receiver = self;
  v27.super_class = (Class)DIAttributeDocument;
  objc_super v4 = [(DIAttribute *)&v27 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", @"docType: '%lu'; ", self->_docType);
  [v3 appendFormat:@"idDocType: '%@'; ", self->_idDocType];
  objc_msgSend(v3, "appendFormat:", @"acceptableDocTypes: '%lu'; ", self->_acceptableDocTypes);
  [v3 appendFormat:@"acceptableDocs: [ \n"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_acceptableDocs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) description];
        [v3 appendFormat:@"    acceptableDoc: '%@'\n", v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->super._lock);
  [v3 appendFormat:@"]; "];
  uint64_t v11 = [(DIAttributeDocument *)self defaultValue];
  [v3 appendFormat:@"defaultValue: '%@'; ", v11];

  [v3 appendFormat:@"currentValue: [ \n"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [(DIAttributeDocument *)self getCurrentValue];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) description];
        [v3 appendFormat:@"    image: '%@'\n", v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v14);
  }

  [v3 appendFormat:@"]; "];
  [v3 appendFormat:@">"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptableDocs, 0);

  objc_storeStrong((id *)&self->_idDocType, 0);
}

@end