@interface MTRBasicInformationClusterProductAppearanceStruct
- (MTRBasicInformationClusterProductAppearanceStruct)init;
- (NSNumber)finish;
- (NSNumber)primaryColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFinish:(NSNumber *)finish;
- (void)setPrimaryColor:(NSNumber *)primaryColor;
@end

@implementation MTRBasicInformationClusterProductAppearanceStruct

- (MTRBasicInformationClusterProductAppearanceStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRBasicInformationClusterProductAppearanceStruct;
  v2 = [(MTRBasicInformationClusterProductAppearanceStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    finish = v2->_finish;
    v2->_finish = (NSNumber *)&unk_26F9C8620;

    primaryColor = v3->_primaryColor;
    v3->_primaryColor = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBasicInformationClusterProductAppearanceStruct);
  objc_super v7 = objc_msgSend_finish(self, v5, v6);
  objc_msgSend_setFinish_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_primaryColor(self, v9, v10);
  objc_msgSend_setPrimaryColor_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: finish:%@; primaryColor:%@; >",
    v5,
    self->_finish,
  objc_super v7 = self->_primaryColor);

  return v7;
}

- (NSNumber)finish
{
  return self->_finish;
}

- (void)setFinish:(NSNumber *)finish
{
}

- (NSNumber)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(NSNumber *)primaryColor
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryColor, 0);

  objc_storeStrong((id *)&self->_finish, 0);
}

@end