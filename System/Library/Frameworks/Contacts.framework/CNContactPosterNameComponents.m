@interface CNContactPosterNameComponents
- (CNContactPosterNameComponents)init;
- (NSString)firstNameComponent;
- (NSString)secondNameComponent;
- (id)debugDescription;
- (int64_t)emphasizedNameComponentIndex;
- (int64_t)singleNameComponentIndex;
- (void)setEmphasizedNameComponentIndex:(int64_t)a3;
- (void)setFirstNameComponent:(id)a3;
- (void)setSecondNameComponent:(id)a3;
- (void)setSingleNameComponentIndex:(int64_t)a3;
@end

@implementation CNContactPosterNameComponents

- (CNContactPosterNameComponents)init
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactPosterNameComponents;
  v2 = [(CNContactPosterNameComponents *)&v8 init];
  v3 = v2;
  if (v2)
  {
    firstNameComponent = v2->_firstNameComponent;
    v2->_firstNameComponent = (NSString *)&stru_1EE052B80;

    secondNameComponent = v3->_secondNameComponent;
    v3->_secondNameComponent = 0;

    *(_OWORD *)&v3->_emphasizedNameComponentIndex = xmmword_190B90420;
    v6 = v3;
  }

  return v3;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"first" object:self->_firstNameComponent];
  id v5 = (id)[v3 appendName:@"second" object:self->_secondNameComponent];
  id v6 = (id)[v3 appendName:@"emphasis" integerValue:self->_emphasizedNameComponentIndex];
  id v7 = (id)[v3 appendName:@"singleNameComponentIndex" integerValue:self->_singleNameComponentIndex];
  objc_super v8 = [v3 build];

  return v8;
}

- (NSString)firstNameComponent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirstNameComponent:(id)a3
{
}

- (NSString)secondNameComponent
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSecondNameComponent:(id)a3
{
}

- (int64_t)emphasizedNameComponentIndex
{
  return self->_emphasizedNameComponentIndex;
}

- (void)setEmphasizedNameComponentIndex:(int64_t)a3
{
  self->_emphasizedNameComponentIndex = a3;
}

- (int64_t)singleNameComponentIndex
{
  return self->_singleNameComponentIndex;
}

- (void)setSingleNameComponentIndex:(int64_t)a3
{
  self->_singleNameComponentIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondNameComponent, 0);

  objc_storeStrong((id *)&self->_firstNameComponent, 0);
}

@end