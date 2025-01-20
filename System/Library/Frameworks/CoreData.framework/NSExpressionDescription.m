@interface NSExpressionDescription
+ (BOOL)supportsSecureCoding;
- (NSAttributeType)expressionResultType;
- (NSExpression)expression;
- (NSExpressionDescription)init;
- (NSExpressionDescription)initWithCoder:(id)a3;
- (NSString)attributeValueClassName;
- (NSString)valueTransformerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_propertyType;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setExpression:(NSExpression *)expression;
- (void)setExpressionResultType:(NSAttributeType)expressionResultType;
- (void)setUnderlyingAttribute:(void *)result;
@end

@implementation NSExpressionDescription

- (unint64_t)_propertyType
{
  return 5;
}

- (NSAttributeType)expressionResultType
{
  return self->_expressionResultType;
}

- (NSExpressionDescription)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSExpressionDescription;
  v2 = [(NSPropertyDescription *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NSPropertyDescription *)v2 _setEntitysReferenceID:-1];
    [(NSPropertyDescription *)v3 setReadOnly:1];
    v3->_reservedtype1_1 = 0;
    v3->_reservedtype1_2 = 0;
    v3->_reservedtype1_3 = 0;
    v3->_reservedtype1_4 = 0;
    v3->_reservedtype1_5 = 0;
    v3->_reservedtype1_6 = 0;
    v3->_reservedtype2_1 = 0;
    v3->_reservedtype2_2 = 0;
    v3->_underlyingAttribute = 0;
  }
  return v3;
}

- (void)setExpressionResultType:(NSAttributeType)expressionResultType
{
  self->_expressionResultType = expressionResultType;
}

- (void)setExpression:(NSExpression *)expression
{
  if (self->_expression != expression)
  {
    objc_super v5 = expression;

    self->_expression = expression;
  }
}

- (void)dealloc
{
  self->_expression = 0;
  self->_underlyingAttribute = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSExpressionDescription;
  [(NSPropertyDescription *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(<%@ : %p>), name %@, expression %@, resultType %lu, userInfo %@", objc_opt_class(), self, -[NSPropertyDescription name](self, "name"), -[NSExpressionDescription expression](self, "expression"), -[NSExpressionDescription expressionResultType](self, "expressionResultType"), -[NSPropertyDescription userInfo](self, "userInfo")];
}

- (NSExpression)expression
{
  return self->_expression;
}

- (void)setUnderlyingAttribute:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    v4 = (void *)result[18];
    if (v4 != a2)
    {

      result = a2;
      v3[18] = result;
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSExpressionDescription)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSExpressionDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_expression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"NSExpression");
    v4->_expressionResultType = [a3 decodeIntegerForKey:@"NSExpressionType"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSExpressionDescription;
  -[NSPropertyDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_expression forKey:@"NSExpression"];
  [a3 encodeInteger:self->_expressionResultType forKey:@"NSExpressionType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSExpressionDescription;
  v4 = [(NSPropertyDescription *)&v6 copyWithZone:a3];
  if (v4)
  {
    v4[19] = [(NSExpression *)self->_expression copy];
    v4[20] = self->_expressionResultType;
    v4[18] = self->_underlyingAttribute;
  }
  return v4;
}

- (NSString)attributeValueClassName
{
  if (self) {
    self = (NSExpressionDescription *)self->_underlyingAttribute;
  }
  return [(NSExpressionDescription *)self attributeValueClassName];
}

- (NSString)valueTransformerName
{
  if (self) {
    self = (NSExpressionDescription *)self->_underlyingAttribute;
  }
  return [(NSExpressionDescription *)self valueTransformerName];
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  _writeInt32IntoData(a3, 0);
  uint64_t v16 = [a3 length] - 4;
  v18.receiver = self;
  v18.super_class = (Class)NSExpressionDescription;
  [(NSPropertyDescription *)&v18 _appendPropertyFieldsToData:a3 propertiesDict:a4 uniquedPropertyNames:a5 uniquedStrings:a6 uniquedData:a7 entitiesSlots:a8];
  _writeInt32IntoData(a3, self->_expressionResultType);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", self->_expression), "unsignedIntegerValue"));
  unsigned int v17 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v16, 4, &v17);
}

@end