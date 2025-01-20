@interface GBDTLabeledFeatureVectors
- (GBDTLabeledFeatureVectors)initWithLabeledVector:(id)a3 orderedFeatureNames:(id)a4 numberOfEntityTypes:(int64_t)a5;
- (NSArray)labeledVectors;
- (NSArray)orderedFeatureNames;
- (id)debugDescription;
- (int64_t)numberOfEntityTypes;
@end

@implementation GBDTLabeledFeatureVectors

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFeatureNames, 0);
  objc_storeStrong((id *)&self->_labeledVectors, 0);
}

- (int64_t)numberOfEntityTypes
{
  return self->_numberOfEntityTypes;
}

- (NSArray)orderedFeatureNames
{
  return self->_orderedFeatureNames;
}

- (NSArray)labeledVectors
{
  return self->_labeledVectors;
}

- (id)debugDescription
{
  v3 = objc_opt_new();
  [v3 appendString:@"["];
  if ([(NSArray *)self->_labeledVectors count])
  {
    v4 = 0;
    do
    {
      v5 = [(NSArray *)self->_labeledVectors objectAtIndexedSubscript:v4];
      v6 = [v5 debugDescription];
      [v3 appendFormat:@"%@", v6];

      if ((char *)[(NSArray *)self->_labeledVectors count] - 1 > v4) {
        [v3 appendString:@", "];
      }
      ++v4;
    }
    while ((char *)[(NSArray *)self->_labeledVectors count] > v4);
  }
  [v3 appendString:@"]"];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"labeledVectors:%@, orderedFeatureNames:%@", v3, self->_orderedFeatureNames];

  return v7;
}

- (GBDTLabeledFeatureVectors)initWithLabeledVector:(id)a3 orderedFeatureNames:(id)a4 numberOfEntityTypes:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GBDTLabeledFeatureVectors;
  v11 = [(GBDTLabeledFeatureVectors *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_labeledVectors, a3);
    objc_storeStrong((id *)&v12->_orderedFeatureNames, a4);
    v12->_numberOfEntityTypes = a5;
  }

  return v12;
}

@end