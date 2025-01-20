@interface _ICProactiveTrigger
+ (BOOL)isEquivalentDictionary:(id)a3 second:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProactiveTrigger:(id)a3;
- (NSDictionary)attributedString;
- (NSSet)availableApps;
- (NSString)contentType;
- (NSString)context;
- (TIInputContextHistory)inputContextHistory;
- (_ICProactiveTrigger)initWithCoder:(id)a3;
- (_ICProactiveTrigger)initWithContext:(id)a3 inputContextHistory:(id)a4 contentType:(id)a5;
- (_ICProactiveTrigger)initWithSource:(unsigned __int8)a3 attributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)triggerSourceType;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableApps:(id)a3;
@end

@implementation _ICProactiveTrigger

- (_ICProactiveTrigger)initWithSource:(unsigned __int8)a3 attributes:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ICProactiveTrigger;
  v8 = [(_ICProactiveTrigger *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_triggerSourceType = a3;
    objc_storeStrong((id *)&v8->_attributedString, a4);
    v10 = [v7 objectForKey:@"textContentTypeTag"];

    if (v10)
    {
      uint64_t v11 = [v7 objectForKey:@"textContentTypeTag"];
      contentType = v9->_contentType;
      v9->_contentType = (NSString *)v11;
    }
  }

  return v9;
}

- (_ICProactiveTrigger)initWithContext:(id)a3 inputContextHistory:(id)a4 contentType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ICProactiveTrigger;
  v12 = [(_ICProactiveTrigger *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_triggerSourceType = 3;
    objc_storeStrong((id *)&v12->_contentType, a5);
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v13->_inputContextHistory, a4);
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_ICProactiveTrigger type:%lu attr: %@>", self->_triggerSourceType, self->_attributedString];
}

- (unint64_t)hash
{
  uint64_t triggerSourceType = self->_triggerSourceType;
  NSUInteger v4 = [(NSDictionary *)self->_attributedString count] - triggerSourceType + 32 * triggerSourceType;
  NSUInteger v5 = [(NSString *)self->_context hash] - v4 + 32 * v4;
  uint64_t v6 = [(TIInputContextHistory *)self->_inputContextHistory hash] - v5 + 32 * v5;
  return [(NSString *)self->_contentType hash] - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ICProactiveTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_ICProactiveTrigger;
  NSUInteger v5 = [(_ICProactiveTrigger *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"attributedString"];
    uint64_t v10 = [v9 copy];
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSDictionary *)v10;

    v5->_uint64_t triggerSourceType = [v4 decodeInt64ForKey:@"triggerSourceType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v12;

    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    objc_super v14 = (void *)getTIInputContextHistoryClass_softClass;
    uint64_t v26 = getTIInputContextHistoryClass_softClass;
    if (!getTIInputContextHistoryClass_softClass)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __getTIInputContextHistoryClass_block_invoke;
      v22[3] = &unk_264C55F70;
      v22[4] = &v23;
      __getTIInputContextHistoryClass_block_invoke((uint64_t)v22);
      objc_super v14 = (void *)v24[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v23, 8);
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputContextHistory"];
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  attributedString = self->_attributedString;
  id v5 = a3;
  [v5 encodeObject:attributedString forKey:@"attributedString"];
  [v5 encodeInt64:self->_triggerSourceType forKey:@"triggerSourceType"];
  [v5 encodeObject:self->_context forKey:@"context"];
  [v5 encodeObject:self->_inputContextHistory forKey:@"inputContextHistory"];
  [v5 encodeObject:self->_contentType forKey:@"contentType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    uint64_t v6 = [(NSDictionary *)self->_attributedString copyWithZone:a3];
    uint64_t v7 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;

    *((unsigned char *)v5 + 8) = self->_triggerSourceType;
    objc_storeStrong((id *)v5 + 4, self->_context);
    objc_storeStrong((id *)v5 + 5, self->_inputContextHistory);
    objc_storeStrong((id *)v5 + 6, self->_contentType);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_ICProactiveTrigger *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ICProactiveTrigger *)self isEqualToProactiveTrigger:v5];

  return v6;
}

+ (BOOL)isEquivalentDictionary:(id)a3 second:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          objc_super v14 = objc_msgSend(v8, "objectForKey:", v13, (void)v18);
          id v15 = [v6 objectForKey:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || !+[_ICProactiveTrigger isEquivalentDictionary:v14 second:v15])
            {
              goto LABEL_18;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || ![v14 isEqualToString:v15])
            {
LABEL_18:

              BOOL v16 = 0;
              goto LABEL_20;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v16 = 1;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v16 = 1;
    }
LABEL_20:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isEqualToProactiveTrigger:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  int v6 = [v4 triggerSourceType];
  if (v6 != [(_ICProactiveTrigger *)self triggerSourceType]) {
    goto LABEL_10;
  }
  uint64_t v7 = [(_ICProactiveTrigger *)self attributedString];
  id v8 = [v5 attributedString];
  BOOL v9 = +[_ICProactiveTrigger isEquivalentDictionary:v7 second:v8];

  if (!v9) {
    goto LABEL_10;
  }
  if (self->_context != (NSString *)*((void *)v5 + 4))
  {
    uint64_t v10 = [(_ICProactiveTrigger *)self context];
    uint64_t v11 = [v5 context];
    int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_10;
    }
  }
  if (self->_inputContextHistory == (TIInputContextHistory *)*((void *)v5 + 5)
    || ([(_ICProactiveTrigger *)self inputContextHistory],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v5 inputContextHistory],
        objc_super v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v13 isEqual:v14],
        v14,
        v13,
        v15))
  {
    if (self->_contentType == (NSString *)*((void *)v5 + 6))
    {
      char v18 = 1;
    }
    else
    {
      BOOL v16 = [(_ICProactiveTrigger *)self contentType];
      v17 = [v5 contentType];
      char v18 = [v16 isEqualToString:v17];
    }
  }
  else
  {
LABEL_10:
    char v18 = 0;
  }

  return v18;
}

- (unsigned)triggerSourceType
{
  return self->_triggerSourceType;
}

- (NSSet)availableApps
{
  return self->_availableApps;
}

- (void)setAvailableApps:(id)a3
{
}

- (NSDictionary)attributedString
{
  return self->_attributedString;
}

- (NSString)context
{
  return self->_context;
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_availableApps, 0);
}

@end