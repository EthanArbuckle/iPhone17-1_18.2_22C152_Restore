@interface MAKGEntityFactory
- (MAGraphSpecification)specification;
- (MAKGEntityFactory)initWithSpecification:(id)a3;
- (id)edgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7;
- (id)nodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5;
@end

@implementation MAKGEntityFactory

- (void).cxx_destruct
{
}

- (MAGraphSpecification)specification
{
  return self->_specification;
}

- (id)edgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  unsigned __int16 v27 = 1;
  id v26 = 0;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  MALabelAndDomainFromKGLabels(a4, &v26, &v27);
  id v15 = v26;
  int v25 = 0;
  id v24 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:v14 maProperties:&v24 maWeight:&v25];

  specification = self->_specification;
  uint64_t v17 = v27;
  id v18 = v24;
  id v19 = objc_alloc([(MAGraphSpecification *)specification edgeClassWithLabel:v15 domain:v17]);
  LODWORD(v20) = v25;
  v21 = (void *)[v19 initWithLabel:v15 sourceNode:v13 targetNode:v12 domain:v27 weight:v18 properties:v20];

  [v21 setIdentifier:a3];
  v22 = [(MAGraphSpecification *)self->_specification rootGraphReference];

  [v21 setGraphReference:v22];
  return v21;
}

- (id)nodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  unsigned __int16 v20 = 1;
  id v19 = 0;
  id v8 = a5;
  MALabelAndDomainFromKGLabels(a4, &v19, &v20);
  id v9 = v19;
  v10 = [(MAGraphSpecification *)self->_specification nodeClassWithLabel:v9 domain:v20];
  int v18 = 0;
  id v17 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:v8 maProperties:&v17 maWeight:&v18];

  id v11 = v17;
  id v12 = [v10 alloc];
  LODWORD(v13) = v18;
  id v14 = (void *)[v12 initWithLabel:v9 domain:v20 weight:v11 properties:v13];
  [v14 setIdentifier:a3];
  id v15 = [(MAGraphSpecification *)self->_specification rootGraphReference];

  [v14 setGraphReference:v15];
  return v14;
}

- (MAKGEntityFactory)initWithSpecification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAKGEntityFactory;
  v6 = [(MAKGEntityFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specification, a3);
  }

  return v7;
}

@end