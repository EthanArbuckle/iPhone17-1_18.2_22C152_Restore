@interface CRKASMCourseCreateProperties
- (BOOL)areFulfilledByCourse:(id)a3;
- (CRKASMCourseUpdateProperties)updateProperties;
- (CRKASMLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLocation:(id)a3;
- (void)setUpdateProperties:(id)a3;
@end

@implementation CRKASMCourseCreateProperties

- (CRKASMCourseUpdateProperties)updateProperties
{
  updateProperties = self->_updateProperties;
  if (!updateProperties)
  {
    v4 = (CRKASMCourseUpdateProperties *)objc_opt_new();
    v5 = self->_updateProperties;
    self->_updateProperties = v4;

    updateProperties = self->_updateProperties;
  }

  return updateProperties;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CRKASMCourseCreateProperties *)self location];
  [v4 setLocation:v5];

  v6 = [(CRKASMCourseCreateProperties *)self updateProperties];
  [v4 setUpdateProperties:v6];

  return v4;
}

- (BOOL)areFulfilledByCourse:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMCourseCreateProperties *)self location];
  v6 = [v5 identifier];
  v7 = [v4 location];
  v8 = [v7 identifier];
  if ([v6 isEqual:v8])
  {
    v9 = [(CRKASMCourseCreateProperties *)self updateProperties];
    char v10 = [v9 areFulfilledByCourse:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (CRKASMLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void)setUpdateProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateProperties, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end