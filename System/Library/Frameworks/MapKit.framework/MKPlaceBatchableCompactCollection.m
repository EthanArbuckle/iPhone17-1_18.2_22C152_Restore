@interface MKPlaceBatchableCompactCollection
- (BOOL)isEqual:(id)a3;
- (MKMapItemIdentifier)guideLocationIdentifier;
- (MKPlaceBatchableCompactCollection)initWithIdentifier:(id)a3;
- (MKPlaceBatchableCompactCollection)initWithWorldwideViewModel:(id)a3;
- (MKPlaceCompactCollectionViewModel)viewModel;
- (id)description;
- (void)setViewModel:(id)a3;
@end

@implementation MKPlaceBatchableCompactCollection

- (MKPlaceBatchableCompactCollection)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceBatchableCompactCollection;
  v6 = [(MKPlaceBatchableCompactCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_guideLocationIdentifier, a3);
  }

  return v7;
}

- (MKPlaceBatchableCompactCollection)initWithWorldwideViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceBatchableCompactCollection;
  v6 = [(MKPlaceBatchableCompactCollection *)&v9 init];
  v7 = v6;
  if (v5) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MKPlaceBatchableCompactCollection *)self guideLocationIdentifier];
  uint64_t v5 = [v4 muid];
  v6 = [(MKPlaceCompactCollectionViewModel *)self->_viewModel title];
  v7 = [v6 string];
  v8 = [v3 stringWithFormat:@"%llu - %@", v5, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MKPlaceBatchableCompactCollection *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(MKPlaceBatchableCompactCollection *)self guideLocationIdentifier];
    v8 = [(MKPlaceBatchableCompactCollection *)v6 guideLocationIdentifier];
    if ([v7 isEqual:v8])
    {
      objc_super v9 = [(MKPlaceBatchableCompactCollection *)self viewModel];
      char v10 = [v9 isEqual:v6];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (MKMapItemIdentifier)guideLocationIdentifier
{
  return self->_guideLocationIdentifier;
}

- (MKPlaceCompactCollectionViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_guideLocationIdentifier, 0);
}

@end