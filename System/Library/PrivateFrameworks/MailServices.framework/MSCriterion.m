@interface MSCriterion
+ (BOOL)supportsSecureCoding;
- (MSCriterion)init;
- (MSCriterion)initWithCoder:(id)a3;
- (MSCriterion)initWithCriteria:(id)a3 allRequired:(BOOL)a4;
- (MSCriterion)initWithType:(id)a3 qualifier:(id)a4 expression:(id)a5;
- (id)_initWithType:(id)a3 qualifier:(id)a4 criteria:(id)a5;
- (id)criteria;
- (id)description;
- (id)qualifier;
- (id)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSCriterion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSCriterion)init
{
  return 0;
}

- (id)_initWithType:(id)a3 qualifier:(id)a4 criteria:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MSCriterion;
  v12 = [(MSCriterion *)&v22 init];
  v13 = v12;
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    p_type = (id *)&v12->_type;
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_qualifier, a4);
    p_criteria = (id *)&v13->_criteria;
    objc_storeStrong((id *)&v13->_criteria, a5);
    if ([p_isa[1] isEqual:@"_MSCriterionTypeComplex"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x263EFF940];
        uint64_t v18 = objc_opt_class();
        v19 = @"Expected array for complex type, but received %@";
LABEL_8:
        objc_msgSend(v17, "raise:format:", @"InvalidCriterionType", v19, v18);
      }
    }
    else
    {
      if (![*p_type isEqual:@"MSCriterionTypeReceivedDate"])
      {
        if ([*p_type isEqual:@"MSCriterionTypeReadStatus"])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (([*p_criteria isEqualToString:@"MSCriterionExpressionRead"] & 1) != 0
             || ([*p_criteria isEqualToString:@"MSCriterionExpressionUnread"] & 1) != 0))
          {
            goto LABEL_19;
          }
          v20 = @"Expected either MSCriterionExpressionRead or MSCriterionExpressionUnread for read status criteria type.";
        }
        else
        {
          if (([*p_type isEqual:@"MSCriterionTypeMessageReference"] & 1) == 0
            && ![*p_type isEqual:@"MSCriterionTypeConversationReference"])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_19;
            }
            v17 = (void *)MEMORY[0x263EFF940];
            uint64_t v18 = objc_opt_class();
            v19 = @"Expected string for criteria, but received %@";
            goto LABEL_8;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_19;
          }
          v20 = @"Expected a valid reference for reference criterion type";
        }
        [MEMORY[0x263EFF940] raise:@"InvalidCriterionType" format:v20];
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x263EFF940];
        uint64_t v18 = objc_opt_class();
        v19 = @"Expected date for date criteria type, but received %@";
        goto LABEL_8;
      }
    }
  }
LABEL_19:

  return p_isa;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%s:%p> { type:%@ qualifier:%@ criteria:%@ }", object_getClassName(self), self, self->_type, self->_qualifier, self->_criteria];
}

- (MSCriterion)initWithType:(id)a3 qualifier:(id)a4 expression:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[v10 copy];

  v12 = [(MSCriterion *)self _initWithType:v8 qualifier:v9 criteria:v11];
  return v12;
}

- (MSCriterion)initWithCriteria:(id)a3 allRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[v6 copy];

  if (v4) {
    id v8 = @"_MSCriterionQualifierAllRequired";
  }
  else {
    id v8 = @"_MSCriterionQualifierNotAllRequired";
  }
  id v9 = [(MSCriterion *)self _initWithType:@"_MSCriterionTypeComplex" qualifier:v8 criteria:v7];

  return v9;
}

- (MSCriterion)initWithCoder:(id)a3
{
  v21[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 allowsKeyedCoding]
    && [v4 containsValueForKey:@"_MSCodingKeyVersion"]
    && [v4 decodeInt32ForKey:@"_MSCodingKeyVersion"] == 1)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:5];
    v7 = [v5 setWithArray:v6];

    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_MSCodingKeyCriteria"];
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"MSCriterion requires the criterion criteria not be nil."];
    }
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_MSCodingKeyType"];
    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"MSCriterion requires the criterion type be a NSString."];
    }
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_MSCodingKeyQualifier"];
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"MSCriterion requires the criterion qualifier be a NSString."];
    }
    uint64_t v11 = 0;
    v20[2] = xmmword_264243340;
    v20[3] = *(_OWORD *)&off_264243350;
    v20[4] = xmmword_264243360;
    v20[0] = xmmword_264243320;
    v20[1] = *(_OWORD *)&off_264243330;
    v19[0] = xmmword_264243370;
    v19[1] = *(_OWORD *)&off_264243380;
    v19[2] = xmmword_264243390;
    while (1)
    {
      id v12 = *(id *)((char *)v20 + v11);
      if ([v12 isEqualToString:v9]) {
        break;
      }

      v11 += 8;
      if (v11 == 80)
      {
        id v12 = 0;
        break;
      }
    }
    uint64_t v13 = 0;
    while (1)
    {
      id v14 = *(id *)((char *)v19 + v13);
      if ([v14 isEqualToString:v10]) {
        break;
      }

      v13 += 8;
      if (v13 == 48)
      {
        id v14 = 0;
        goto LABEL_23;
      }
    }
    if (v12 && v14)
    {
      v15 = [(MSCriterion *)self _initWithType:v12 qualifier:v14 criteria:v8];
      goto LABEL_24;
    }
LABEL_23:

    v15 = 0;
LABEL_24:
    for (uint64_t i = 40; i != -8; i -= 8)

    for (uint64_t j = 72; j != -8; j -= 8)
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"A Keyed archiver is required for encoding MSCriterion."];
  }
  [v4 encodeInt32:1 forKey:@"_MSCodingKeyVersion"];
  [v4 encodeObject:self->_type forKey:@"_MSCodingKeyType"];
  [v4 encodeObject:self->_qualifier forKey:@"_MSCodingKeyQualifier"];
  [v4 encodeObject:self->_criteria forKey:@"_MSCodingKeyCriteria"];
}

- (id)type
{
  return self->_type;
}

- (id)qualifier
{
  return self->_qualifier;
}

- (id)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_qualifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end