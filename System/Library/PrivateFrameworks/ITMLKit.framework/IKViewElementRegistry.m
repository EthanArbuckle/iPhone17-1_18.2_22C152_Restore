@interface IKViewElementRegistry
- (BOOL)isDependentByTagName:(id)a3;
- (Class)elementClassByTagName:(id)a3;
- (IKViewElementRegistry)init;
- (unint64_t)elementTypeByTagName:(id)a3;
- (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5;
- (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5 dependent:(BOOL)a6;
@end

@implementation IKViewElementRegistry

- (IKViewElementRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)IKViewElementRegistry;
  v2 = [(IKViewElementRegistry *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    classMap = v2->_classMap;
    v2->_classMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    typeMap = v2->_typeMap;
    v2->_typeMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dependentMap = v2->_dependentMap;
    v2->_dependentMap = v7;
  }
  return v2;
}

- (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5
{
}

- (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5 dependent:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = v10;
  if (a3)
  {
    v17 = v10;
    id v10 = (id)[v10 length];
    id v11 = v17;
    if (v10)
    {
      v12 = objc_msgSend(v17, "ik_sharedInstance");
      [(NSMutableDictionary *)self->_classMap setObject:a3 forKey:v12];
      typeMap = self->_typeMap;
      v14 = [NSNumber numberWithUnsignedInteger:a5];
      [(NSMutableDictionary *)typeMap setObject:v14 forKey:v12];

      dependentMap = self->_dependentMap;
      v16 = [NSNumber numberWithBool:v6];
      [(NSMutableDictionary *)dependentMap setObject:v16 forKey:v12];

      id v11 = v17;
    }
  }
  MEMORY[0x1F41817F8](v10, v11);
}

- (Class)elementClassByTagName:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->_classMap objectForKeyedSubscript:a3];
}

- (unint64_t)elementTypeByTagName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_typeMap objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)isDependentByTagName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_dependentMap objectForKeyedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentMap, 0);
  objc_storeStrong((id *)&self->_typeMap, 0);
  objc_storeStrong((id *)&self->_classMap, 0);
}

@end