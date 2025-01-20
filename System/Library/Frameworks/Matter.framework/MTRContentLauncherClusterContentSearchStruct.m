@interface MTRContentLauncherClusterContentSearchStruct
- (MTRContentLauncherClusterContentSearchStruct)init;
- (NSArray)parameterList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setParameterList:(NSArray *)parameterList;
@end

@implementation MTRContentLauncherClusterContentSearchStruct

- (MTRContentLauncherClusterContentSearchStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterContentSearchStruct;
  v4 = [(MTRContentLauncherClusterContentSearchStruct *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    parameterList = v4->_parameterList;
    v4->_parameterList = (NSArray *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterContentSearchStruct);
  v7 = objc_msgSend_parameterList(self, v5, v6);
  objc_msgSend_setParameterList_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: parameterList:%@ >", v5, self->_parameterList);;

  return v7;
}

- (NSArray)parameterList
{
  return self->_parameterList;
}

- (void)setParameterList:(NSArray *)parameterList
{
}

- (void).cxx_destruct
{
}

@end