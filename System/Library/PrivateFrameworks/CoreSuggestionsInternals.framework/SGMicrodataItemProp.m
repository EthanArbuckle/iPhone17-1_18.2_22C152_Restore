@interface SGMicrodataItemProp
- (NSString)propertyName;
- (NSString)stringValue;
- (SGMicrodataItem)itemValue;
- (SGMicrodataItemProp)initWithName:(id)a3 value:(id)a4;
@end

@implementation SGMicrodataItemProp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

- (SGMicrodataItem)itemValue
{
  return self->_itemValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (SGMicrodataItemProp)initWithName:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGMicrodataItemProp;
  v9 = [(SGMicrodataItemProp *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyName, a3);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v12 = 24;
    if (isKindOfClass) {
      uint64_t v12 = 16;
    }
    objc_storeStrong((id *)((char *)&v10->super.isa + v12), a4);
  }

  return v10;
}

@end