@interface EMFAnchoredSearchAnchorCollection
- (EMFAnchoredSearchAnchorCollection)initWithLocaleIdentifier:(id)a3;
- (EMFAnchoredSearchAnchorCollection)initWithLocaleIdentifier:(id)a3 leftHandAnchors:(id)a4 rightHandAnchors:(id)a5;
- (NSArray)leftHandAnchors;
- (NSArray)rightHandAnchors;
- (NSString)localeIdentifier;
- (id)description;
- (void)setLeftHandAnchors:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setRightHandAnchors:(id)a3;
@end

@implementation EMFAnchoredSearchAnchorCollection

- (EMFAnchoredSearchAnchorCollection)initWithLocaleIdentifier:(id)a3 leftHandAnchors:(id)a4 rightHandAnchors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMFAnchoredSearchAnchorCollection;
  v11 = [(EMFAnchoredSearchAnchorCollection *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    localeIdentifier = v11->_localeIdentifier;
    v11->_localeIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    leftHandAnchors = v11->_leftHandAnchors;
    v11->_leftHandAnchors = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    rightHandAnchors = v11->_rightHandAnchors;
    v11->_rightHandAnchors = (NSArray *)v16;
  }
  return v11;
}

- (EMFAnchoredSearchAnchorCollection)initWithLocaleIdentifier:(id)a3
{
  return [(EMFAnchoredSearchAnchorCollection *)self initWithLocaleIdentifier:a3 leftHandAnchors:0 rightHandAnchors:0];
}

- (void)setLeftHandAnchors:(id)a3
{
  self->_leftHandAnchors = [a3 sortedArrayUsingComparator:&__block_literal_global_1];
  MEMORY[0x1F41817F8]();
}

- (void)setRightHandAnchors:(id)a3
{
  self->_rightHandAnchors = [a3 sortedArrayUsingComparator:&__block_literal_global_1];
  MEMORY[0x1F41817F8]();
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(EMFAnchoredSearchAnchorCollection *)self leftHandAnchors];
  v7 = [v6 componentsJoinedByString:@","];
  id v8 = [(EMFAnchoredSearchAnchorCollection *)self rightHandAnchors];
  id v9 = [v8 componentsJoinedByString:@","];
  id v10 = [v3 stringWithFormat:@"<%@:leftHandAnchors:'%@', rightHandAnchors:'%@'>", v5, v7, v9];

  return v10;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSArray)leftHandAnchors
{
  return self->_leftHandAnchors;
}

- (NSArray)rightHandAnchors
{
  return self->_rightHandAnchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHandAnchors, 0);
  objc_storeStrong((id *)&self->_leftHandAnchors, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end