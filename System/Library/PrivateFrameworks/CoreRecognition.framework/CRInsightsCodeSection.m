@interface CRInsightsCodeSection
- (CRInsightsCodeSection)initWithName:(id)a3 andDescription:(id)a4;
- (id)description;
@end

@implementation CRInsightsCodeSection

- (CRInsightsCodeSection)initWithName:(id)a3 andDescription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRInsightsCodeSection;
  v9 = [(CRInsightsCodeSection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_description, a4);
  }

  return v10;
}

- (id)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end