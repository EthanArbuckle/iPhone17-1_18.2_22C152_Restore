@interface MUPlaceUserAttributionViewModel
- (BOOL)showFullAttributionName;
- (MUPlaceUserAttributionViewModel)initWithAttributionName:(id)a3;
- (NSString)attributionName;
- (void)setAttributionName:(id)a3;
@end

@implementation MUPlaceUserAttributionViewModel

- (MUPlaceUserAttributionViewModel)initWithAttributionName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceUserAttributionViewModel;
  v6 = [(MUPlaceUserAttributionViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributionName, a3);
  }

  return v7;
}

- (BOOL)showFullAttributionName
{
  return [(NSString *)self->_attributionName length] != 0;
}

- (NSString)attributionName
{
  return self->_attributionName;
}

- (void)setAttributionName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end