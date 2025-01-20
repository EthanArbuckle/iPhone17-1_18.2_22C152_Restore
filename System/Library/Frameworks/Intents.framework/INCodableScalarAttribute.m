@interface INCodableScalarAttribute
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (Class)_relationshipValueTransformerClass;
- (Class)objectClass;
- (Class)resolutionResultClass;
- (INCodableScalarAttribute)initWithCoder:(id)a3;
- (INCodableScalarAttribute)initWithPropertyName:(id)a3 type:(int64_t)a4;
- (id)__INCodableDescriptionKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_attributeType;
- (int64_t)type;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableScalarAttribute

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableScalarAttribute *)self __INCodableDescriptionTypeKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  self->_type = INCodableScalarAttributeTypeFromString(v6, [(INCodableAttribute *)self modifier]);

  v7.receiver = self;
  v7.super_class = (Class)INCodableScalarAttribute;
  [(INCodableAttribute *)&v7 updateWithDictionary:v4];
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeTypeKey");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (v8.receiver = self,
        v8.super_class = (Class)INCodableScalarAttribute,
        [(INCodableAttribute *)&v8 isEqual:v4]))
  {
    int64_t v5 = [(INCodableScalarAttribute *)self type];
    BOOL v6 = v5 == [v4 type];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (INCodableScalarAttribute)initWithPropertyName:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INCodableScalarAttribute;
  objc_super v7 = [(INCodableScalarAttribute *)&v10 init];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    [(INCodableAttribute *)v7 setModifier:1];
    [(INCodableAttribute *)v8 setPropertyName:v6];
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableScalarAttribute type](self, "type"));
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)INCodableScalarAttribute;
  unint64_t v5 = [(INCodableAttribute *)&v7 hash] ^ v4;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (INCodableScalarAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodableScalarAttribute;
  unint64_t v5 = [(INCodableAttribute *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableScalarAttribute;
  id v4 = a3;
  [(INCodableAttribute *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableScalarAttribute;
  id v12 = 0;
  id v6 = [(INCodableAttribute *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  objc_super v8 = v7;
  if (v7)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, @"type");
    id v9 = v6;
  }

  return v9;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)INCodableScalarAttribute;
  id v4 = [(INCodableAttribute *)&v13 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableScalarAttribute *)self __INCodableDescriptionTypeKey];
  v14 = v5;
  unint64_t v6 = [(INCodableScalarAttribute *)self type];
  if (v6 <= 8 && ((0x1CDu >> v6) & 1) != 0)
  {
    int v8 = 0;
    id v7 = off_1E5519280[v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
    int v8 = 1;
  }
  v15[0] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  objc_super v10 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v9);

  if (v8) {
  objc_super v11 = objc_msgSend(v10, "if_dictionaryWithNonEmptyValues");
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INCodableScalarAttribute;
  id v4 = [(INCodableAttribute *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setType:", -[INCodableScalarAttribute type](self, "type"));
  return v4;
}

- (Class)_relationshipValueTransformerClass
{
  if ([(INCodableScalarAttribute *)self type] == 7)
  {
    v2 = objc_opt_class();
  }
  else
  {
    v2 = 0;
  }

  return (Class)v2;
}

- (Class)resolutionResultClass
{
  if ((unint64_t)[(INCodableScalarAttribute *)self type] > 8)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_opt_class();
  }

  return (Class)v2;
}

- (Class)objectClass
{
  if ((unint64_t)[(INCodableScalarAttribute *)self type] > 8)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_opt_class();
  }

  return (Class)v2;
}

- (int64_t)valueType
{
  unint64_t v2 = [(INCodableScalarAttribute *)self type];
  if (v2 > 7) {
    return 0;
  }
  else {
    return qword_18CFC48B0[v2];
  }
}

- (int64_t)_attributeType
{
  return 2;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodableScalarAttribute;
  id v13 = 0;
  id v7 = objc_msgSendSuper2(&v12, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v13);
  id v8 = v13;
  id v9 = v8;
  if (v8)
  {
    objc_super v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v7[19] = objc_msgSend(v6, "intents_intForKey:", @"type");
    objc_super v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  unint64_t v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  unint64_t v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  unint64_t v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  unint64_t v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  unint64_t v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeKey");

  return v3;
}

@end